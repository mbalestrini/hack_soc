#include "Vhack_soc_with_screen.h"
#include "Vhack_soc_with_screen_hack_soc_with_screen.h"
#include "Vhack_soc_with_screen_hack_soc.h"
#include "Vhack_soc_with_screen_hack_cpu.h"

#include "verilated.h"

#include "verilated_vcd_c.h"

#include "screen.h"

#include "SDL.h"

#include <iostream>
#include <string>
#include <iomanip>


#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480


#define TRACE_FILE 	"traces/hack_soc_with_screen.vcd"

#define CONSOLE_OUTPUT_RED "\033[0;31m"
#define CONSOLE_OUTPUT_LIGHT_BLUE "\033[1;34m"
#define CONSOLE_NO_COLOR "\033[0m"

Vhack_soc_with_screen* top;
VerilatedVcdC *tracer = NULL;
int tick_count = 0;
Screen screen;

double sc_time_stamp() { return 0; }

void tick(void) {
	// Increment our own internal time reference
	tick_count++;

	// Make sure any combinatorial logic depending upon
	// inputs that may have changed before we called tick()
	// has settled before the rising edge of the clock.
	top->clk = 0;
	top->eval();

	if(tracer) tracer->dump(10*tick_count-2);


	// Toggle the clock

	// Rising edge
	top->clk = 1;
	top->eval();
	if(tracer) tracer->dump(10*tick_count);


	// Falling edge
	top->clk = 0;
	top->eval();
	if (tracer) {
		// This portion, though, is a touch different.
		// After dumping our values as they exist on the
		// negative clock edge ...
		tracer->dump(10*tick_count+5);
		//
		// We'll also need to make sure we flush any I/O to
		// the trace file, so that we can use the assert()
		// function between now and the next tick if we want to.
		tracer->flush();
	}
}


void process_screen(Uint32 *pixels) {


	bool vsync_happened = false;
	bool hsync_happened = false;

	for(int i=0;i<450000;i++) {			
		tick();  
		
		if(top->display_vsync==0) {
			if(!screen.in_vsync)
				screen.in_vsync=true;
		}
		if(top->display_vsync==1 && screen.in_vsync) {
			// Finish vsync
			screen.in_vsync = false;
			std::cout << "VYSNC" << "  PC:" << std::setw(10) << top->hack_soc_with_screen->soc->cpu->get_pc() << "    DREG:" << std::setw(10) << top->hack_soc_with_screen->soc->cpu->get_dreg() << " --- \r" << std::flush;

			
			vsync_happened  = true;
			break;
		}
	}	

	if(!vsync_happened ) {
		std::cout << "VSYNC didn't happen" << std::endl;
		return;
	}


	// Start Frame
	for (int line = 0; line <= SCREEN; line++)
	{
		for(int i=0;i<1000;i++) {			
			if(top->display_hsync==0) {
				if(!screen.in_hsync)
					screen.in_hsync=true;
			}
			if(top->display_hsync==1 && screen.in_hsync) {
				// Finish hsync
				screen.in_hsync = false;
				// std::cout << "HYSNC" << line << std::endl;
				hsync_happened  = true;
				break;
			}
			tick();  
		}



		for (int pixel_clk = 0; pixel_clk <= (H_BACK_PORCH_CLOCKS); pixel_clk++)
		{
			tick();
		}

		// Start Active Line
		for (int pixel_clk = 0; pixel_clk <= H_PIXELS; pixel_clk++)	{
			int active_line = line - V_BACK_PORCH_LINES;
			if(active_line>=0 && active_line < SCREEN_HEIGHT && pixel_clk < SCREEN_WIDTH)
				pixels[active_line * SCREEN_WIDTH + pixel_clk] = top->display_rgb ? 0xffffffff : 0 ;

			tick();
		}

	}
	



	

	
	
}

int main(int argc, char ** argv)
{

	bool quit = false;
	bool leftMouseButtonDown = false;
	SDL_Event event;

 	SDL_Init(SDL_INIT_VIDEO);

    SDL_Window * window = SDL_CreateWindow("SDL2 Pixel Drawing",
    SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, 0); 

	SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, 0);
    SDL_Texture * texture = SDL_CreateTexture(renderer,
        SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, SCREEN_WIDTH, SCREEN_HEIGHT);
    Uint32 * pixels = new Uint32[SCREEN_WIDTH * SCREEN_HEIGHT];

    memset(pixels, 255, SCREEN_WIDTH * SCREEN_HEIGHT * sizeof(Uint32));


	
	Verilated::commandArgs(argc, argv);
	top = new Vhack_soc_with_screen;

	/*
	Verilated::traceEverOn(true);
	tracer = new VerilatedVcdC;
	top->trace(tracer, 99); 
	tracer->open(TRACE_FILE);
	//*/

	top->reset = 1;
	tick();	
	tick();	
	tick();	
	tick();	
	tick();	
	top->reset = 0;
	tick();	


/*
	for (int i = 0; i < 100; ++i) {
		std::cout << "10000 clocks simulated" << std::endl;
		for (int i = 0; i < 10000; ++i) {		
			tick();
			if(top->display_vsync==0) {
				std::cout << "VSYNC" << std::endl;
			}		
		}		
	}
*/	

	while (!quit)
    {
    	SDL_Delay(10);
    	SDL_UpdateTexture(texture, NULL, pixels, SCREEN_WIDTH * sizeof(Uint32));
    	/*for(int i=0;i<10000;i++) {
			toggle_clk;  	
		}*/		
		

		process_screen(pixels);
		
		
		

    	while(SDL_PollEvent(&event)) {
			switch (event.type)
	        {
	            case SDL_QUIT:
	                quit = true;
	                break;
	            case SDL_MOUSEBUTTONUP:
	                if (event.button.button == SDL_BUTTON_LEFT)
	                    leftMouseButtonDown = false;
	                break;
	            case SDL_MOUSEBUTTONDOWN:
	                if (event.button.button == SDL_BUTTON_LEFT)
	                    leftMouseButtonDown = true;
					break;
					
			    case SDL_KEYDOWN:
					// top->keyboardCode = event.key.keysym.sym;
					top->keycode =event.key.keysym.sym;
			        std::cout << "Key press detected: " << top->keycode << std::endl;
			        break;

				case SDL_KEYUP:
					top->keycode = 0;
					// top->keyboardCode = 0;
			    	// printf( "Key release detected\n" );
			        break;	
					
	            case SDL_MOUSEMOTION:
					//std::cout << "module out:" << ((unsigned int) top->out) << "\n";
					//printf("module out:%d\n", top->out);
	                if (leftMouseButtonDown) {
	                     int mouseX = event.motion.x;
	                     int mouseY = event.motion.y;
	                     pixels[mouseY * SCREEN_WIDTH + mouseX] = 0;
	                }
	                break;
	        }
		}

		SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, texture, NULL, NULL);
        SDL_RenderPresent(renderer);

    }

 	delete[] pixels;
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);

 	SDL_DestroyWindow(window);
	SDL_Quit();			
	



	tracer->close();
	tracer = NULL;

	delete top;

    return 0;
}

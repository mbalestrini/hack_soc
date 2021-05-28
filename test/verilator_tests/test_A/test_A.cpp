#define SCREEN_WIDTH 512
#define SCREEN_HEIGHT 256

#include <iostream>
#include "SDL.h"

#include "Vtest_A.h"
#include "verilated.h"

#include "verilated_vcd_c.h"

#define TRACE_FILE 	"traces/test_A.vcd"

Vtest_A* top;
VerilatedVcdC *tracer = NULL;
int tick_count = 0;


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


int main(int argc, char ** argv)
{
	
	Verilated::commandArgs(argc, argv);
	top = new Vtest_A;

	
	Verilated::traceEverOn(true);
	tracer = new VerilatedVcdC;
	top->trace(tracer, 99); 
	tracer->open(TRACE_FILE);


	top->reset = 1;
	tick();	
	tick();	
	top->reset = 0;
	tick();	


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

	
	while (!quit)
    {

    	SDL_Delay(10);
    	SDL_UpdateTexture(texture, NULL, pixels, SCREEN_WIDTH * sizeof(Uint32));

    	/*for(int i=0;i<10000;i++) {
			toggle_clk;  	
		}*/
		
		if(leftMouseButtonDown)
			top->data_in=1;
		else 
			top->data_in=0;

		tick();  
		
		

    	while(SDL_PollEvent(&event)) {
//		if(res){
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
					
//			        printf( "Key press detected\n" );
			        break;

				case SDL_KEYUP:
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

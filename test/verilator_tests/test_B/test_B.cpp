#include "Vtest_B.h"
#include "verilated.h"

#include "verilated_vcd_c.h"

#include <iostream>
#include <string>


#define TRACE_FILE 	"traces/test_B.vcd"



#define CONSOLE_OUTPUT_RED "\033[0;31m"
#define CONSOLE_OUTPUT_LIGHT_BLUE "\033[1;34m"
#define CONSOLE_NO_COLOR "\033[0m"

Vtest_B* top;
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
	top = new Vtest_B;

	
	Verilated::traceEverOn(true);
	tracer = new VerilatedVcdC;
	top->trace(tracer, 99); 
	tracer->open(TRACE_FILE);


	top->reset = 1;
	tick();	
	tick();	
	top->reset = 0;
	tick();	

	for (int i = 0; i < 30; ++i) {
		std::cout << "1000 clocks simulated" << std::endl;
		for (int i = 0; i < 1000; ++i) {		
			tick();
			
		}		
	}
	

	tracer->close();
	tracer = NULL;

	delete top;

    return 0;
}

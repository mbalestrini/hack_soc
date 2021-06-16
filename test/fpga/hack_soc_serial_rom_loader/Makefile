PROJECT = hack_soc_serial_rom_loader
PROJECT_SOURCES = ../../../src
SOURCES = src/*.v $(PROJECT_SOURCES)/*.v 
ICEBREAKER_DEVICE = up5k
ICEBREAKER_PIN_DEF = icebreaker.pcf
ICEBREAKER_PACKAGE = sg48
ICEBREAKER_FREQUENCY_TEST = 25
ICEBREAKER_PREPACK_FILE = constraints.py
BUILD_PATH = build
SEED = 1


show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

%.json: $(SOURCES)
	rm -rf build/
	mkdir build/ 
	yosys -l $(BUILD_PATH)/yosys.log -p 'synth_ice40 -dsp -abc2 -top hack_soc_serial_rom_loader -json $(BUILD_PATH)/$(PROJECT).json' $(SOURCES)
#	yosys -l $(BUILD_PATH)/yosys.log -p 'synth_ice40 -top hack_soc_serial_rom_loader -json $(BUILD_PATH)/$(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICEBREAKER_PIN_DEF) 
#--pre-pack $(ICEBREAKER_PREPACK_FILE)
	nextpnr-ice40 -l $(BUILD_PATH)/nextpnr.log --seed $(SEED) --pre-pack $(ICEBREAKER_PREPACK_FILE) --freq $(ICEBREAKER_FREQUENCY_TEST) --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc $(BUILD_PATH)/$@ --pcf $(ICEBREAKER_PIN_DEF) --json $(BUILD_PATH)/$<  
#	nextpnr-ice40 -l $(BUILD_PATH)/nextpnr.log --randomize-seed --pre-pack $(ICEBREAKER_PREPACK_FILE) --freq $(ICEBREAKER_FREQUENCY_TEST) --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc $(BUILD_PATH)/$@ --pcf $(ICEBREAKER_PIN_DEF) --json $(BUILD_PATH)/$<  

%.bin: %.asc
	icepack $(BUILD_PATH)/$< $(BUILD_PATH)/$@

build: $(PROJECT).bin
	
prog: $(PROJECT).bin
	iceprog.exe $(BUILD_PATH)/$<

lint:
	verilator --Wall --lint-only src/*v
#	 verible-verilog-lint src/*v --rules_config verible.rules 

clean:
	rm -rf build/*bin build/*log build/*json build/*asc
# 	rm -rf *vcd sim_build fpga/*log fpga/*bin test/__pycache__



formal:
	sby -f hack_soc_serial_rom_loader.sby
formal_cover:
	sby -f hack_soc_serial_rom_loader.sby task_cover
formal_prove:
	sby -f hack_soc_serial_rom_loader.sby task_prove




test_hack_soc_serial_rom_loader_tb:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s hack_soc_serial_rom_loader_tb -s dump -g2012 -I $(PROJECT_SOURCES) $(PROJECT_SOURCES)/*.v cocotb/hack_soc_serial_rom_loader_tb.v cocotb/23LC1024.v cocotb/dump_hack_soc_serial_rom_loader.v src/hack_soc_serial_rom_loader.v src/debounce.v cocotb/uart.v cocotb/pll_12___25_125.v 
	MODULE=hack_soc_serial_rom_loader_tb vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

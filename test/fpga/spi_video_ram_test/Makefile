PROJECT = spi_video_ram_test
PROJECT_SOURCES = ../../../src
SOURCES = src/*.v $(PROJECT_SOURCES)/*.v
ICEBREAKER_DEVICE = up5k
ICEBREAKER_PIN_DEF = icebreaker.pcf
ICEBREAKER_PACKAGE = sg48
ICEBREAKER_FREQUENCY_TEST = 20
BUILD_PATH = build
SEED = 1


show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

%.json: $(SOURCES)
	yosys -l $(BUILD_PATH)/yosys.log -p 'synth_ice40 -top spi_video_ram_test -json $(BUILD_PATH)/$(PROJECT).json' $(SOURCES)

%.asc: %.json $(ICEBREAKER_PIN_DEF) 
	nextpnr-ice40 -l $(BUILD_PATH)/nextpnr.log --seed $(SEED) --freq $(ICEBREAKER_FREQUENCY_TEST) --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc $(BUILD_PATH)/$@ --pcf $(ICEBREAKER_PIN_DEF) --json $(BUILD_PATH)/$<

%.bin: %.asc
	icepack $(BUILD_PATH)/$< $(BUILD_PATH)/$@

build: $(PROJECT).bin

prog: $(PROJECT).bin
	iceprog.exe $(BUILD_PATH)/$<

lint:
	verible-verilog-lint src/*v --rules_config verible.rules 

clean:
	rm -rf build/*bin build/*log build/*json build/*asc
# 	rm -rf *vcd sim_build fpga/*log fpga/*bin test/__pycache__


sim:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -DSIM -s spi_video_ram_test -s dump -g2012 -I $(PROJECT_SOURCES) $(PROJECT_SOURCES)/*.v src/*.v
	MODULE=spi_video_ram_test vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp



show_sim:
	gtkwave spi_video_ram_test.vcd spi_video_ram_test.gtwk

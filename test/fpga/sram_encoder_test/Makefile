PROJECT = sram_encoder_test
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
	yosys -l $(BUILD_PATH)/yosys.log -p 'synth_ice40 -top sram_encoder_test -json $(BUILD_PATH)/$(PROJECT).json' $(SOURCES)

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
	rm -rf build/*bin build/*log
# 	rm -rf *vcd sim_build fpga/*log fpga/*bin test/__pycache__






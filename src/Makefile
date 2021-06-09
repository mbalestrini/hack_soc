lint_all:
	verilator --Wall --lint-only *.v -I. --top-module hack_soc

lint_%: %.v
	verilator --Wall --lint-only $^

show_synth_%: %.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"


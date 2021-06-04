lint_all:
	verilator --Wall --lint-only *.v -I. --top-module hack_soc

lint_%: %.v
	verilator --Wall --lint-only $^



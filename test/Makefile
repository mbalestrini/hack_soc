
formal_sram_encoder:
	sby -f formal/spi_sram_encoder.sby

formal_sram_encoder_cover:
	sby -f formal/spi_sram_encoder.sby task_cover

formal_sram_encoder_prove:
	sby -f formal/spi_sram_encoder.sby task_prove

# test_sram_encoder:
# 	rm -rf cocotb_tests/sim_build/
# 	mkdir cocotb_tests/sim_build/
# 	iverilog -Pspi_sram_encoder.ADDRESS_WIDTH=24 -Pspi_sram_encoder.WORD_WIDTH=16  -o cocotb_tests/sim_build/sim.vvp -s spi_sram_encoder -s dump -g2012 ../src/spi_sram_encoder.v cocotb_tests/dump_spi_sram_encoder.v 
# 	MODULE=cocotb_tests.test_spi_sram_encoder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus cocotb_tests/sim_build/sim.vvp


test_sram_encoder:
	cd cocotb_tests && make -f Makefile test_sram_encoder

show_sram_encoder:
	cd cocotb_tests && make -f Makefile show_sram_encoder


test_encoder_with_23LC2014_tb:
	cd cocotb_tests && make -f Makefile test_encoder_with_23LC2014_tb

show_encoder_with_23LC2014_tb:
	cd cocotb_tests && make -f Makefile show_encoder_with_23LC2014_tb

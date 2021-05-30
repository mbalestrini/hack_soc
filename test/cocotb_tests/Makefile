PROJECT_SOURCE_PATH = ../../src


test_encoder_with_23LC2014_tb:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s encoder_with_23LC2014_tb -s spi_sram_encoder -s dump -s M23LC1024 -g2012 $(PROJECT_SOURCE_PATH)/spi_sram_encoder.v test_encoder_with_23LC2014_tb.v dump_encoder_with_23LC2014_tb.v ../imported_modules/23LC1024.v
	MODULE=test_encoder_with_23LC2014_tb vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp

test_sram_encoder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s spi_sram_encoder -s dump -g2012 $(PROJECT_SOURCE_PATH)/spi_sram_encoder.v dump_spi_sram_encoder.v 
	MODULE=test_spi_sram_encoder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp

test_hack_soc_1:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s hack_soc -s dump -g2012 -I $(PROJECT_SOURCE_PATH) $(PROJECT_SOURCE_PATH)/*.v dump_test_hack_sock_1.v
	MODULE=test_hack_soc_1 vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp


test_hack_soc_with_rom:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s test_hack_soc_with_rom -s dump -g2012 -I $(PROJECT_SOURCE_PATH) $(PROJECT_SOURCE_PATH)/*.v dump_test_hack_soc_with_rom.v test_hack_soc_with_rom.v rom_23LC1024.v ../imported_modules/23LC1024.v 
# 	iverilog -Pspi_sram_encoder.ADDRESS_WIDTH=24 -Pspi_sram_encoder.WORD_WIDTH=16  -o sim_build/sim.vvp -s spi_sram_encoder -s dump -g2012 $(PROJECT_SOURCE_PATH)/spi_sram_encoder.v dump_spi_sram_encoder.v 
	MODULE=test_hack_soc_with_rom vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp


test_rom_loader_with_spi_encoder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s test_rom_loader_with_spi_encoder -s dump -g2012 -I $(PROJECT_SOURCE_PATH) $(PROJECT_SOURCE_PATH)/*.v dump_test_rom_loader_with_spi_encoder.v test_rom_loader_with_spi_encoder.v load_file_to_rom.v rom_23LC1024.v ../imported_modules/23LC1024.v 
	MODULE=test_rom_loader_with_spi_encoder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp


test_hack_soc_plus_rom_loader:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s test_hack_soc_plus_rom_loader -s dump -g2012 -I $(PROJECT_SOURCE_PATH) $(PROJECT_SOURCE_PATH)/*.v dump_test_hack_soc_plus_rom_loader.v test_hack_soc_plus_rom_loader.v load_file_to_rom.v rom_23LC1024.v ../imported_modules/23LC1024.v 
	MODULE=test_hack_soc_plus_rom_loader vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp




show_sram_encoder:
	gtkwave test_spi_sram_encoder.vcd test_spi_sram_encoder.gtwk


show_encoder_with_23LC2014_tb:
	gtkwave test_encoder_with_23LC2014_tb.vcd test_encoder_with_23LC2014_tb.gtkw 

show_hack_soc_1:
	gtkwave test_hack_soc_1.vcd test_hack_soc_1.gtwk	


show_hack_soc_with_rom:
	gtkwave test_hack_soc_with_rom.vcd test_hack_soc_with_rom.gtwk	

show_rom_loader_with_spi_encoder:
	gtkwave test_rom_loader_with_spi_encoder.vcd test_rom_loader_with_spi_encoder.gtwk	

show_hack_soc_plus_rom_loader:
	gtkwave test_hack_soc_plus_rom_loader.vcd test_hack_soc_plus_rom_loader.gtwk	
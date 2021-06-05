PROJECT_SOURCE_PATH = ../src


define colorecho
      @tput setaf 6
      @echo $1
      @tput sgr0
endef

all: all_formal all_cocotb
	$(call colorecho,"\n***** ALL TESTS DONE ****\n") 

all_formal:
	$(call colorecho,"\n***** FORMAL TESTS STARTING ****\n") 
	$(call colorecho,"\n\n\n***** TEST: formal_sram_encoder ****\n") 
	make formal_sram_encoder 	
	$(call colorecho,"\n\n\n***** TEST: formal_rom_stream_loader ****"\n)
	make formal_rom_stream_loader 	
	$(call colorecho,"\n\n\n***** TEST: formal_hack_soc ****\n")
	make formal_hack_soc
	$(call colorecho,"\n\n\n***** TEST: formal_spi_video_ram_prove ****\n")
	make formal_spi_video_ram_prove
	$(call colorecho,"\n***** FORMAL TESTS FINISHED ****\n") 
	

all_cocotb:
	$(call colorecho,"\n***** COCOTB SIM TESTS STARTING ****\n") 
	$(call colorecho,"\n\n\n***** TEST: test_sram_encoder ****\n") 
	make test_sram_encoder 	
	$(call colorecho,"\n\n\n***** TEST: test_encoder_with_23LC2014_tb ****"\n)
	make test_encoder_with_23LC2014_tb 	
	$(call colorecho,"\n\n\n***** TEST: test_hack_soc_1 ****\n")
	make test_hack_soc_1
	$(call colorecho,"\n\n\n***** TEST: test_hack_soc_with_rom ****\n")
	make test_hack_soc_with_rom
	$(call colorecho,"\n\n\n***** TEST: test_rom_loader_with_spi_encoder ****\n")
	make test_rom_loader_with_spi_encoder
	$(call colorecho,"\n\n\n***** TEST: test_hack_soc_plus_rom_loader ****\n")
	make test_hack_soc_plus_rom_loader	
	$(call colorecho,"\n***** COCOTB SIM TESTS FINISH ****\n") 




verilator_lint_all:
	verilator --Wall --lint-only $(PROJECT_SOURCE_PATH)/*.v  -I$(PROJECT_SOURCE_PATH)
	

# FORMAL

formal_sram_encoder:
	sby -f formal/spi_sram_encoder.sby
formal_sram_encoder_cover:
	sby -f formal/spi_sram_encoder.sby task_cover
formal_sram_encoder_prove:
	sby -f formal/spi_sram_encoder.sby task_prove


formal_rom_stream_loader:
	sby -f formal/rom_stream_loader.sby
formal_rom_stream_loader_cover:
	sby -f formal/rom_stream_loader.sby task_cover
formal_rom_stream_loader_prove:
	sby -f formal/rom_stream_loader.sby task_prove


formal_hack_soc:
	sby -f formal/hack_soc.sby
formal_hack_soc_cover:
	sby -f formal/hack_soc.sby task_cover
formal_hack_soc_prove:
	sby -f formal/hack_soc.sby task_prove


formal_spi_video_ram:
	sby -f formal/spi_video_ram.sby
formal_spi_video_ram_cover:
	sby -f formal/spi_video_ram.sby task_cover
formal_spi_video_ram_prove:
	sby -f formal/spi_video_ram.sby task_prove


# FORMAL but just for analyzing signals, not to proove because it takes too many steps
formal_video_generator:
	sby -f formal/video_signal_generator_640x480.sby
formal_video_generator_cover:
	sby -f formal/video_signal_generator_640x480.sby task_cover
formal_video_generator_prove:
	sby -f formal/video_signal_generator_640x480.sby task_prove



formal_vram_write_fifo:
	sby -f formal/vram_write_fifo.sby
formal_vram_write_fifo_cover:
	sby -f formal/vram_write_fifo.sby task_cover
formal_vram_write_fifo_prove:
	sby -f formal/vram_write_fifo.sby task_prove



formal_spi_video_ram_2:
	sby -f formal/spi_video_ram_2.sby
formal_spi_video_ram_2_cover:
	sby -f formal/spi_video_ram_2.sby task_cover
formal_spi_video_ram_2_prove:
	sby -f formal/spi_video_ram_2.sby task_prove


formal_spi_video_ram_2_with_video_generator:
	sby -f formal/spi_video_ram_2_with_video_generator.sby
formal_spi_video_ram_2_with_video_generator_cover:
	sby -f formal/spi_video_ram_2_with_video_generator.sby task_cover
formal_spi_video_ram_2_with_video_generator_prove:
	sby -f formal/spi_video_ram_2_with_video_generator.sby task_prove








# COCOTB SIMULATION

test_sram_encoder:
	cd cocotb_tests && make -f Makefile test_sram_encoder
show_sram_encoder:
	cd cocotb_tests && make -f Makefile show_sram_encoder


test_encoder_with_23LC2014_tb:
	cd cocotb_tests && make -f Makefile test_encoder_with_23LC2014_tb
show_encoder_with_23LC2014_tb:
	cd cocotb_tests && make -f Makefile show_encoder_with_23LC2014_tb


test_hack_soc_1:
	cd cocotb_tests && make -f Makefile test_encoder_with_23LC2014_tb
show_hack_soc_1:
	cd cocotb_tests && make -f Makefile show_encoder_with_23LC2014_tb


test_hack_soc_with_rom:
	cd cocotb_tests && make -f Makefile test_hack_soc_with_rom
show_hack_soc_with_rom:
	cd cocotb_tests && make -f Makefile show_hack_soc_with_rom


test_rom_loader_with_spi_encoder:
	cd cocotb_tests && make -f Makefile test_rom_loader_with_spi_encoder
show_rom_loader_with_spi_encoder:
	cd cocotb_tests && make -f Makefile show_rom_loader_with_spi_encoder
	
test_hack_soc_plus_rom_loader:
	cd cocotb_tests && make -f Makefile test_hack_soc_plus_rom_loader
show_hack_soc_plus_rom_loader:
	cd cocotb_tests && make -f Makefile show_hack_soc_plus_rom_loader

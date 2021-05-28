#CC = g++
#CFLAGS = -Wall -std=c++14


# INCLUDES = -I/usr/include/SDL2
# INCLUDES = -I. -I./include -I/usr/include/SDL2
#INCLUDES = -I. -I./include -I/Library/Frameworks/SDL2.framework/Headers

#LFLAGS = -L/usr/local/lib


# LIBS = -lSDL2
#LIBS = -llua


PROJECT = test_B
PROJECT_SOURCES = ../../../src


define colorecho
      @tput setaf 6
      @echo $1
      @tput sgr0
endef

all:

# sim: Vtest

$(PROJECT): $(PROJECT).v $(PROJECT).cpp
	$(call colorecho,"Generating verilator files")  
	verilator -Wall -cc $@.v -I$(PROJECT_SOURCES) --exe $@.cpp --trace 
	$(call colorecho,"Compiling verilator files") 
	make -j -C obj_dir -f V$@.mk V$@ && \
	mv obj_dir/V$@ ./ && \
	./V$@

lint: 
	verilator --lint-only -Wall -cc $(PROJECT).v -I$(PROJECT_SOURCES) 

show_$(PROJECT): traces/$(PROJECT).vcd
	gtkwave $< traces/$(PROJECT).gtkw

# 	cd ./obj_dir; \
# 	make -f Vtest.mk; 	\
# 	cd ..
# 	$(call colorecho,"Compiling with g++") ;\
# 	g++ -I obj_dir -I/usr/share/verilator/include test.cpp /usr/share/verilator/include/verilated.cpp -o test; \

#verilator -Wall -Wno-UNUSED -cc test.v app.cpp
# verilator -cc test.v app.cpp
# cd obj_dir
# make -f VtestWithSDL.mk
# cd ..

 
clean:
	rm V$(PROJECT)
	rm obj_dir/V$(PROJECT)*
	rm obj_dir/$(PROJECT)*


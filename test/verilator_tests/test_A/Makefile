#CC = g++
#CFLAGS = -Wall -std=c++14


# INCLUDES = -I/usr/include/SDL2
# INCLUDES = -I. -I./include -I/usr/include/SDL2
#INCLUDES = -I. -I./include -I/Library/Frameworks/SDL2.framework/Headers

#LFLAGS = -L/usr/local/lib


# LIBS = -lSDL2
#LIBS = -llua

define colorecho
      @tput setaf 6
      @echo $1
      @tput sgr0
endef

all:

# sim: Vtest

test_A: test_A.v test_A.cpp 
	$(call colorecho,"Generating verilator files")  
	verilator -Wall -cc $@.v --exe $@.cpp -CFLAGS "-I/usr/include/SDL2/" -LDFLAGS "-L/usr/local/lib -lSDL2" --trace 
	$(call colorecho,"Compiling verilator files") 
	make -j -C obj_dir -f V$@.mk V$@ ; \
	mv obj_dir/V$@ . ;\


show_test_A: traces/test_A.vcd
	gtkwave $< traces/test_A.gtkw

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
	rm Vtest_A
	rm obj_dir/Vtest_A*
	rm obj_dir/test_A*


import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random 

async def reset(dut):
    dut.reset  <= 1
    await ClockCycles(dut.clk, 5)
    dut.reset <= 0
    
    await ClockCycles(dut.clk, 1)
    
    
    # dut.video_generator_1.h_count <= 0
    # dut.video_generator_1.v_count <= 100

@cocotb.test()
async def test_spi_video_2_with_23LC1024(dut):	
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    random.seed(0)

    # Fill VRAM memory with random numbers
    video_ram_data = []
    for i in range(0,16384):
        video_ram_data.append(random.randint(0,255))
        dut.ram.MemoryBlock[i].value = video_ram_data[i]

    await reset(dut)



    # y = 0
    for y in range(0,530):
        print("y", y, "dut.video_generator_1.v_count ", int(dut.video_generator_1.v_count), "line_read_address", int(dut.spi_video_ram_1.line_read_address))
        await RisingEdge(dut.display_active)
        await ClockCycles(dut.clk, 1)
        for x in range(0,511):
            if(y<256):
                # print(x,y, y*64 + (x//8), ( 7- (x%8) ), bin(video_ram_data[y*64 + (x//8)]), dut.pixel_value)
                assert(   (video_ram_data[y*64 + (x//8)]>>( 7- (x%8) )&1)  == dut.pixel_value)
            await ClockCycles(dut.clk, 1)

    await ClockCycles(dut.clk, 2000)
    

    


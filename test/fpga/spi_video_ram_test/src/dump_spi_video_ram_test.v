module dump();
    initial begin
        $dumpfile ("spi_video_ram_test.vcd");
        $dumpvars (0, spi_video_ram_test);
        #1;
    end
endmodule

module dump();
    initial begin
        $dumpfile ("test_hack_soc_with_spi_video.vcd");
        $dumpvars (0, test_hack_soc_with_spi_video);
        #1;
    end
endmodule

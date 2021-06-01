module dump();
    initial begin
        $dumpfile ("test_spi_video_with_23LC1024.vcd");
        $dumpvars (0, test_spi_video_with_23LC1024);
        #1;
    end
endmodule

module dump();
    initial begin
        $dumpfile ("test_spi_sram_encoder.vcd");
        $dumpvars (0, spi_sram_encoder);
        #1;
    end
endmodule

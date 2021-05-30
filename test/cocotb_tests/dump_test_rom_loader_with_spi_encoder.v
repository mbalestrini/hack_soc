module dump();
    initial begin
        $dumpfile ("test_rom_loader_with_spi_encoder.vcd");
        $dumpvars (0, test_rom_loader_with_spi_encoder);
        #1;
    end
endmodule

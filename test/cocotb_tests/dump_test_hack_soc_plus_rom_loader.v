module dump();
    initial begin
        $dumpfile ("test_hack_soc_plus_rom_loader.vcd");
        $dumpvars (0, test_hack_soc_plus_rom_loader);
        #1;
    end
endmodule

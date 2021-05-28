module dump();
    initial begin
        $dumpfile ("test_hack_soc_with_rom.vcd");
        $dumpvars (0, test_hack_soc_with_rom);
        #1;
    end
endmodule

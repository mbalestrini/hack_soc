module dump();
    initial begin
        $dumpfile ("hack_soc_serial_rom_loader_tb.vcd");
        $dumpvars (0, hack_soc_serial_rom_loader_tb);
        #1;
    end
endmodule

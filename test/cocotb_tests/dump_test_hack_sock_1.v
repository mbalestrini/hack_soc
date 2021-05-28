module dump();
    initial begin
        $dumpfile ("test_hack_soc_1.vcd");
        $dumpvars (0, hack_soc);
        #1;
    end
endmodule

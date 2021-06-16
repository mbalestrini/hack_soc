module dump();
    initial begin
        $dumpfile ("test_hack_soc_bug_instructions.vcd");
        $dumpvars (0, test_hack_soc_bug_instructions);
        #1;
    end
endmodule

module dump();
    initial begin
        $dumpfile ("test_hack_soc_program.vcd");
        $dumpvars (0, test_hack_soc_program);
        #1;
    end
endmodule

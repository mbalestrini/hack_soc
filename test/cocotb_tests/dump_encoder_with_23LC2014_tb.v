module dump();
    initial begin
        $dumpfile ("test_encoder_with_23LC2014_tb.vcd");
        $dumpvars (0, encoder_with_23LC2014_tb);
        #1;
    end
endmodule

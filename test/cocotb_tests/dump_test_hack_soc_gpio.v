module dump();
    initial begin
        $dumpfile ("test_hack_soc_gpio.vcd");
        $dumpvars (0, test_hack_soc_gpio);
        #1;
    end
endmodule

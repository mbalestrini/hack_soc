`default_nettype none
`timescale 1ns/10ps


module pll_12___25_125 (
        input  clock_in,
        output clock_out,
        output locked
        );

assign clock_out = clock_in;
reg locked;

always @(posedge clock_in) begin
    locked <= 1;    
end

endmodule
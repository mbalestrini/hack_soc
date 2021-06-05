`default_nettype none
`timescale 1ns/10ps

/**
 * PLL configuration
 *
 * This Verilog module was generated automatically
 * using the icepll tool from the IceStorm project.
 * Use at your own risk.
 *
 * Given input frequency:        12.000 MHz
 * Requested output frequency:   25.175 MHz
 * Achieved output frequency:    25.125 MHz
 */

 
module pll_12___25_125 (
        input  clock_in,
        output clock_out,
        output locked
        );

SB_PLL40_PAD #(
                .FEEDBACK_PATH("SIMPLE"),
                .PLLOUT_SELECT("GENCLK"),

                .FEEDBACK_PATH("SIMPLE"),
                .DIVR(4'b0000),         // DIVR =  0
                .DIVF(7'b1000010),      // DIVF = 66
                .DIVQ(3'b101),          // DIVQ =  5
                .FILTER_RANGE(3'b001)   // FILTER_RANGE = 1

        ) uut (
                .LOCK(locked),
                .PACKAGEPIN(clock_in),
                .PLLOUTCORE(clock_out),
                .RESETB(1'b1),
                .BYPASS(1'b0)

                //.REFERENCECLK(clock_in),

                );

endmodule

                

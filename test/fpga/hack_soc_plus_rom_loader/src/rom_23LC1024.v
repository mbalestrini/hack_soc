// *******************************************************************************************************
// **                                                                                                   **
// **   23LC1024.v - 23LC1024 1 MBIT SPI SERIAL SRAM (VCC = +2.5V TO +5.5V)                             **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2014 YOUNG ENGINEERING                                 **
// **                                      ALL RIGHTS RESERVED                                          **
// **                                                                                                   **
// **                                                                                                   **
// **   Young Engineering provides design expertise for the digital world                               **
// **   Started in 1990, Young Engineering offers products and services for your electronic design      **
// **   project.  We have the expertise in PCB, FPGA, ASIC, firmware, and software design.              **
// **   From concept to prototype to production, we can help you.                                       **
// **                                                                                                   **
// **   http://www.young-engineering.com/                                                               **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **   This information is provided to you for your convenience and use with Microchip products only.  **
// **   Microchip disclaims all liability arising from this information and its use.                    **
// **                                                                                                   **
// **   THIS INFORMATION IS PROVIDED "AS IS." MICROCHIP MAKES NO REPRESENTATION OR WARRANTIES OF        **
// **   ANY KIND WHETHER EXPRESS OR IMPLIED, WRITTEN OR ORAL, STATUTORY OR OTHERWISE, RELATED TO        **
// **   THE INFORMATION PROVIDED TO YOU, INCLUDING BUT NOT LIMITED TO ITS CONDITION, QUALITY,           **
// **   PERFORMANCE, MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR PURPOSE.                         **
// **   MICROCHIP IS NOT LIABLE, UNDER ANY CIRCUMSTANCES, FOR SPECIAL, INCIDENTAL OR CONSEQUENTIAL      **
// **   DAMAGES, FOR ANY REASON WHATSOEVER.                                                             **
// **                                                                                                   **
// **   It is your responsibility to ensure that your application meets with your specifications.       **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **   Revision       : 1.0                                                                            **
// **   Modified Date  : 04/23/2014                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   04/23/2014:  Initial design                                                                     **
// **                                                                                                   **
// *******************************************************************************************************
// **                                       TABLE OF CONTENTS                                           **
// *******************************************************************************************************
// **---------------------------------------------------------------------------------------------------**
// **   DECLARATIONS                                                                                    **
// **---------------------------------------------------------------------------------------------------**
// **---------------------------------------------------------------------------------------------------**
// **   INITIALIZATION                                                                                  **
// **---------------------------------------------------------------------------------------------------**
// **---------------------------------------------------------------------------------------------------**
// **   CORE LOGIC                                                                                      **
// **---------------------------------------------------------------------------------------------------**
// **   1.01:  Internal Reset Logic                                                                     **
// **   1.02:  Input Data Shifter                                                                       **
// **   1.03:  Clock Cycle Counter                                                                      **
// **   1.04:  Instruction Register                                                                     **
// **   1.05:  Address Register                                                                         **
// **   1.06:  Status Register Write                                                                    **
// **   1.07:  I/O Mode Instructions                                                                    **
// **   1.08:  Array Write                                                                              **
// **   1.09:  Output Data Shifter                                                                      **
// **   1.10:  Output Data Buffer                                                                       **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   DEBUG LOGIC                                                                                     **
// **---------------------------------------------------------------------------------------------------**
// **   2.01:  Memory Data Bytes                                                                        **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   TIMING CHECKS                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **                                                                                                   **
// *******************************************************************************************************

`default_nettype none
`timescale 1ns/10ps

module rom_M23LC1024 #(parameter ROM_FILE="")(SI_SIO0, SO_SIO1, SCK, CS_N, SIO2, HOLD_N_SIO3, RESET);

   inout                SI_SIO0;                        // serial data input/output
   input                SCK;                            // serial data clock

   input                CS_N;                           // chip select - active low

   inout                SIO2;                           // serial data input/output 		
   
   inout                HOLD_N_SIO3;                    // interface suspend - active low/
                                                        //   serial data input/output

   input                RESET;                          // model reset/power-on reset

   inout                SO_SIO1;                        // serial data input/output

  

// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   reg  [07:00]         DataShifterI;                   // serial input data shifter
   reg  [07:00]         DataShifterO;                   // serial output data shifter
   reg  [31:00]         ClockCounter;                   // serial input clock counter
   reg  [07:00]         InstRegister;                   // instruction register
   reg  [16:00]         AddrRegister;                   // address register

   wire                 InstructionREAD;                // decoded instruction byte
   wire                 InstructionRDMR;                // decoded instruction byte
   wire                 InstructionWRMR;                // decoded instruction byte
   wire                 InstructionWRITE;               // decoded instruction byte
   wire                 InstructionEDIO;                // decoded instruction byte
   wire                 InstructionEQIO;                // decoded instruction byte
   wire                 InstructionRSTIO;               // decoded instruction byte

   reg  [01:00]         OpMode;                         // operation mode

   reg  [01:00]         IOMode;                         // I/O mode
   
   wire                 Hold;                           // hold function

   // reg  [07:00]         MemoryBlock [0:131071];         // SRAM data memory array (131072x8)
   reg  [07:00]         MemoryBlock [0:100];         // SRAM data memory array (131072x8)

   reg  [03:00]         SO_DO;                          // serial output data - data
   wire                 SO_OE;                          // serial output data - output enable

   reg                  SO_Enable;                      // serial data output enable

   

`define READ      8'b0000_0011                          // Read instruction
`define WRMR      8'b0000_0001                          // Write Mode Register instruction
`define WRITE     8'b0000_0010                          // Write instruction
`define RDMR      8'b0000_0101                          // Read Mode Register instruction
`define EDIO      8'b0011_1011                          // Enter Dual I/O instruction
`define EQIO      8'b0011_1000                          // Enter Quad I/O instruction
`define RSTIO     8'b1111_1111                          // Reset Dual and Quad I/O instruction

`define BYTEMODE  2'b00                                 // Byte operation mode
`define PAGEMODE  2'b10                                 // Page operation mode
`define SEQMODE   2'b01                                 // Sequential operation mode

`define SPIMODE   2'b00                                 // SPI I/O mode
`define SDIMODE   2'b01                                 // SDI I/O mode
`define SQIMODE   2'b10                                 // SQI I/O mode


// *******************************************************************************************************
// **   Memory Init for simulation                                                                      **
// *******************************************************************************************************
   initial begin
      if(ROM_FILE!="")
         $readmemb(ROM_FILE, MemoryBlock);           
   end


// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

  

   initial begin
      OpMode = `SEQMODE;

      IOMode = `SPIMODE;
   end
   
   assign Hold = (HOLD_N_SIO3 == 0) & (IOMode == `SPIMODE);


// *******************************************************************************************************
// **   CORE LOGIC                                                                                      **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Internal Reset Logic
// -------------------------------------------------------------------------------------------------------

   always @(negedge CS_N) ClockCounter <= 0;
   always @(negedge CS_N) SO_Enable    <= 0;

// -------------------------------------------------------------------------------------------------------
//      1.02:  Input Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         if (CS_N == 0) begin
            case (IOMode)
               `SPIMODE: DataShifterI <= {DataShifterI[06:00],SI_SIO0};
               `SDIMODE: DataShifterI <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
               `SQIMODE: DataShifterI <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
               
            endcase
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.03:  Clock Cycle Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         if (CS_N == 0)         ClockCounter <= ClockCounter + 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.04:  Instruction Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         case (IOMode)
            `SPIMODE: begin
               if (ClockCounter == 7) InstRegister <= {DataShifterI[06:00],SI_SIO0};
            end
            `SDIMODE: begin
               if (ClockCounter == 3) InstRegister <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
            end
            `SQIMODE: begin
               if (ClockCounter == 1) InstRegister <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
            end
            
         endcase
      end
   end

   assign InstructionREAD  = (InstRegister[7:0] == `READ);
   assign InstructionRDMR  = (InstRegister[7:0] == `RDMR);
   assign InstructionWRMR  = (InstRegister[7:0] == `WRMR);
   assign InstructionWRITE = (InstRegister[7:0] == `WRITE);
   assign InstructionEDIO  = (InstRegister[7:0] == `EDIO);
   assign InstructionEQIO  = (InstRegister[7:0] == `EQIO);
   assign InstructionRSTIO = (InstRegister[7:0] == `RSTIO);

// -------------------------------------------------------------------------------------------------------
//      1.05:  Address Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & (InstructionREAD | InstructionWRITE)) begin
         case (IOMode)
            `SPIMODE: begin
               if (ClockCounter == 15) AddrRegister[16] <= SI_SIO0;
               else if (ClockCounter == 23) AddrRegister[15:08] <= {DataShifterI[06:00],SI_SIO0};
               else if (ClockCounter == 31) AddrRegister[07:00] <= {DataShifterI[06:00],SI_SIO0};
            end
            `SDIMODE: begin
               if (ClockCounter == 7) AddrRegister[16] <= SI_SIO0;
               else if (ClockCounter == 11) AddrRegister[15:08] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
               else if (ClockCounter == 15) AddrRegister[07:00] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
            end
            `SQIMODE: begin
               if (ClockCounter == 3) AddrRegister[16] <= SI_SIO0;
               else if (ClockCounter == 5) AddrRegister[15:08] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
               else if (ClockCounter == 7) AddrRegister[07:00] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
            end
            
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.06:  Status Register Write
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & InstructionWRMR) begin
         case (IOMode)
            `SPIMODE: begin
               if (ClockCounter == 15) OpMode <= DataShifterI[06:05];
            end
            `SDIMODE: begin
               if (ClockCounter == 7) OpMode <= DataShifterI[05:04];
            end
            `SQIMODE: begin
               if (ClockCounter == 3) OpMode <= DataShifterI[03:02];
            end
            
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.07:  I/O Mode Instructions
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      case (IOMode)
         `SPIMODE: begin
            if (ClockCounter == 7) begin
               if ({DataShifterI[06:00],SI_SIO0} == `EDIO) IOMode <= `SDIMODE;
               else if ({DataShifterI[06:00],SI_SIO0} == `EQIO) IOMode <= `SQIMODE;
            end
         end
         `SDIMODE: begin
            if (ClockCounter == 3) begin
               if ({DataShifterI[05:00],SO_SIO1,SI_SIO0} == `EQIO) IOMode <= `SQIMODE;
               else if ({DataShifterI[05:00],SO_SIO1,SI_SIO0} == `RSTIO) IOMode <= `SPIMODE;
            end
         end
         `SQIMODE: begin
            if (ClockCounter == 1) begin
               if ({DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0} == `EDIO) IOMode <= `SDIMODE;
               else if ({DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0} == `RSTIO) IOMode <= `SPIMODE;
            end
         end
      endcase
   end

// -------------------------------------------------------------------------------------------------------
//      1.08:  Array Write
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & InstructionWRITE) begin
         case (IOMode)
            `SPIMODE: begin
               if ((ClockCounter >= 39) & (ClockCounter[2:0] == 3'b111)) begin
                  MemoryBlock[AddrRegister[16:00]] <= {DataShifterI[06:00],SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                  endcase
               end
            end
            `SDIMODE: begin
               if ((ClockCounter >= 19) & (ClockCounter[1:0] == 2'b11)) begin
                  MemoryBlock[AddrRegister[16:00]] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                  endcase
               end
            end
            `SQIMODE: begin
               if ((ClockCounter >= 9) & (ClockCounter[0] == 1'b1)) begin
                  MemoryBlock[AddrRegister[16:00]] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                  endcase
               end
            end
            
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.09:  Output Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCK) begin
      if (Hold == 0) begin
         if (InstructionREAD) begin
            case (IOMode)
               `SPIMODE: begin
                  if ((ClockCounter >= 32) & (ClockCounter[2:0] == 3'b000)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[16:00]];
                     SO_Enable    <= 1;
                     
                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 1;
               end
               `SDIMODE: begin
                  if ((ClockCounter >= 20) & (ClockCounter[1:0] == 2'b00)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[16:00]];
                     SO_Enable    <= 1;
                     
                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 2;
               end
               `SQIMODE: begin
                  if ((ClockCounter >= 10) & (ClockCounter[0] == 1'b0)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[16:00]];
                     SO_Enable    <= 1;
                     
                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[16:00] <= AddrRegister[16:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 4;
               end
               
            endcase
         end
         else if (InstructionRDMR) begin
            case (IOMode)
               `SPIMODE: begin
                  if ((ClockCounter > 7) & (ClockCounter[2:0] == 3'b000)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 1;
               end
               `SDIMODE: begin
                  if ((ClockCounter > 3) & (ClockCounter[1:0] == 2'b00)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 2;
               end
               `SQIMODE: begin
                  if ((ClockCounter > 1) & (ClockCounter[0] == 1'b0)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 4;
               end
               
            endcase
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.10:  Output Data Buffer
// -------------------------------------------------------------------------------------------------------

   // assign SO_SIO1 = (SO_OE & (IOMode == `SPIMODE)) ? SO_DO[0] : 
   //                  (SO_OE && (IOMode == `SDIMODE || IOMode == `SQIMODE)) ? SO_DO[1] :
   //                  1'bz;

   // assign SI_SIO0 = SO_OE && ((IOMode == `SDIMODE) || (IOMode == `SQIMODE)) ? SO_DO[0] : 1'bz;
   // assign SIO2 = SO_OE && ((IOMode == `SDIMODE) || (IOMode == `SQIMODE)) ? SO_DO[2] : 1'bz;
   // assign HOLD_N_SIO3 = SO_OE && ((IOMode == `SDIMODE) || (IOMode == `SQIMODE)) ? SO_DO[3] : 1'bz;

   // Buffer for SPI mode
   bufif1 (SO_SIO1, SO_DO[0], SO_OE & (IOMode == `SPIMODE));

   // Buffers for SDI mode
   bufif1 (SI_SIO0, SO_DO[0], SO_OE & (IOMode == `SDIMODE));
   bufif1 (SO_SIO1, SO_DO[1], SO_OE & (IOMode == `SDIMODE));

   // Buffers for SQI Mode
   bufif1 (SI_SIO0, SO_DO[0], SO_OE & (IOMode == `SQIMODE));
   bufif1 (SO_SIO1, SO_DO[1], SO_OE & (IOMode == `SQIMODE));
   bufif1 (SIO2, SO_DO[2], SO_OE & (IOMode == `SQIMODE));
   bufif1 (HOLD_N_SIO3, SO_DO[3], SO_OE & (IOMode == `SQIMODE));

   always @(DataShifterO) begin
      case (IOMode)
        `SPIMODE: begin
           SO_DO[0] <= DataShifterO[07];
        end
        `SDIMODE: begin
           SO_DO[1] <= DataShifterO[07];
           SO_DO[0] <= DataShifterO[06];
        end
        `SQIMODE: begin
           SO_DO[3] <= DataShifterO[07];
           SO_DO[2] <= DataShifterO[06];
           SO_DO[1] <= DataShifterO[05];
           SO_DO[0] <= DataShifterO[04];
        end
      endcase
   end

   // bufif1 #(tV)     (OutputEnable1, SO_Enable, 1);
   // bufif1 #(tV,0)     (OutputEnable1, SO_Enable, 1);
   // notif1 #(tDIS)    (OutputEnable2, CS_N,   1);
   // bufif1 #(tHV,tHZ) (OutputEnable3, HOLD_N_SIO3 | !(IOMode == `SPIMODE), 1);
   // bufif1 #(tHV) (OutputEnable3, HOLD_N_SIO3 | !(IOMode == `SPIMODE), 1);

   // assign SO_OE = OutputEnable1 & OutputEnable2 & OutputEnable3;
   assign SO_OE = SO_Enable & CS_N & ( HOLD_N_SIO3 | !(IOMode == `SPIMODE));





endmodule

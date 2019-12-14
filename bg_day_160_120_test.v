`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:05:47 12/14/2019
// Design Name:   bg_day_160_120
// Module Name:   Z:/Documents/Xilinx/FlappyBird/bg_day_160_120_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bg_day_160_120
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bg_day_160_120_test;

    // Inputs
    reg [14:0] a;
    reg [15:0] d;
    reg clk;
    reg we;

    // Outputs
    wire [15:0] spo;

    // Instantiate the Unit Under Test (UUT)
    bg_day_160_120 uut (
        .a(a), 
        .d(d), 
        .clk(clk), 
        .we(we), 
        .spo(spo)
    );

    integer i = 0;
    initial begin
        a = 0; d = 0; clk = 0; we = 0;
        for(i = 0; 1; i = i + 1) begin
            #2; a = a + 1;
        end
    end
    always #1 clk = ~clk;
      
endmodule


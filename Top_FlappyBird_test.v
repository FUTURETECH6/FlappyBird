`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:12:23 12/26/2019
// Design Name:   Top_FlappyBird
// Module Name:   Z:/Documents/Xilinx/FlappyBird/Top_FlappyBird_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_FlappyBird
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_FlappyBird_test;

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] SW;
    
    
    reg up_button;

    // Outputs
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    wire VGA_hs;
    wire VGA_vs;
    wire SEGLED_CLK;
    wire SEGLED_CLR;
    wire SEGLED_DO;
    wire SEGLED_PEN;
    wire LED_CLK;
    wire LED_CLR;
    wire LED_DO;
    wire LED_PEN;

    // Bidirs
    wire [4:0] BTN_X;
    wire [3:0] BTN_Y;

    // Instantiate the Unit Under Test (UUT)
    Top_FlappyBird uut (
        .clk(clk), 
        .rst(rst), 
        .SW(SW), 
        .VGA_R(VGA_R), 
        .VGA_G(VGA_G), 
        .VGA_B(VGA_B), 
        .VGA_hs(VGA_hs), 
        .VGA_vs(VGA_vs), 
        .SEGLED_CLK(SEGLED_CLK), 
        .SEGLED_CLR(SEGLED_CLR), 
        .SEGLED_DO(SEGLED_DO), 
        .SEGLED_PEN(SEGLED_PEN), 
        .LED_CLK(LED_CLK), 
        .LED_CLR(LED_CLR), 
        .LED_DO(LED_DO), 
        .LED_PEN(LED_PEN), 
        .BTN_X(BTN_X), 
        .BTN_Y(BTN_Y)
    );

    integer i = 0;
    initial begin
        SW = 0;
        up_button = 0;
        SW[0] = 1;
        #100;
        
        for(i = 0; i < 30; i = i + 1) begin
            up_button = 1;
            #2000;
            up_button = 0;
            #1000000;
        end

    end
    always #1 clk = ~clk;
      
endmodule


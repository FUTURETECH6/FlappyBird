`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:18:04 12/13/2019
// Design Name:   Bird_Convert2Display
// Module Name:   Z:/Documents/Xilinx/FlappyBird/BC2D_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Bird_Convert2Display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BC2D_test;

    // Inputs
    reg clk;
    reg clk_ms;
    reg up_button;
    reg [1:0] state;
    reg [1:0] pipeInfo;

    // Outputs
    wire [3:0] RGB_R;
    wire [3:0] RGB_G;
    wire [3:0] RGB_B;
    wire isDead;

    // Instantiate the Unit Under Test (UUT)
    Bird_Convert2Display uut (
        .clk(clk), 
        .clk_ms(clk_ms), 
        .up_button(up_button), 
        .state(state), 
        .pipeInfo(pipeInfo), 
        .RGB_R(RGB_R), 
        .RGB_G(RGB_G), 
        .RGB_B(RGB_B), 
        .isDead(isDead)
    );

    initial begin
        
    end
      
endmodule


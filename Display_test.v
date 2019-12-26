`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:18:28 12/26/2019
// Design Name:   Display
// Module Name:   Z:/Documents/Xilinx/FlappyBird/Display_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Display_test;

    // Inputs
    reg [1:0] state;
    reg [31:0] clkdiv;
    reg [15:0] SW_OK;
    reg up_button;

    // Outputs
    wire VGA_hs;
    wire VGA_vs;
    wire isDead;
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    wire [7:0] score;

    // Instantiate the Unit Under Test (UUT)
    Display uut (
        .state(state), 
        .clkdiv(clkdiv), 
        .SW_OK(SW_OK), 
        .up_button(up_button), 
        .VGA_hs(VGA_hs), 
        .VGA_vs(VGA_vs), 
        .isDead(isDead), 
        .VGA_R(VGA_R), 
        .VGA_G(VGA_G), 
        .VGA_B(VGA_B), 
        .score(score)
    );
    
    integer i = 0;
    initial begin
        state = 0;
        clkdiv = 0;
        SW_OK = 0;
        up_button = 0;
        SW_OK[0] = 1;
        #100;
        
        for(i = 0; i < 30; i = i + 1) begin
            up_button = 1;
            #2000;
            up_button = 0;
            #1000000;
        end

    end
    always #1 clkdiv = clkdiv + 1;
      
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:44 12/13/2019 
// Design Name: 
// Module Name:    Top_FlappyBird 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top_FlappyBird(
    input clk,
    input rst,
    input [15:0]SW,
    output [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_hs, VGA_vs,
    output SEGLED_CLK, SEGLED_CLR, SEGLED_DO, SEGLED_PEN,
    output LED_CLK, LED_CLR, LED_DO, LED_PEN,
    inout [4:0]BTN_X,
    inout [3:0]BTN_Y
);
    /* Global Variables*/
    reg [1:0] state = 0;  // 0 is waitForStart; 1 is flying; 2 is dead
    wire [7:0] score;
    reg [31:0]clkdiv;
    wire isDead;
    wire up_button; 

    always@(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
    end

    wire [15:0] SW_OK;
    AntiJitter #(4) Top_AJ_SW[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK) );

    wire [4:0] keyCode;
    wire keyReady;
    Keypad Top_KP(.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady) );

    assign up_button = keyReady;    // Use any button to fly the bird up

    wire [31:0] segTestData;
    //wire [3:0] sout;
    Seg7Device Top_S7Device(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
        .data({24'b0,score}), .point(8'h0), .LES(8'h0), .sout({SEGLED_CLK,SEGLED_DO,SEGLED_PEN,SEGLED_CLR}) );

    always @* begin
        if(rst)
            state <= 0;
        if(up_button)
            state <= 1;
        if(isDead)
            state <= 2;
    end
    Display DP_m0(.state(state), .clkdiv(clkdiv), .SW_OK(SW_OK),
        .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .VGA_hs(VGA_hs), .VGA_vs(VGA_vs) ,.score(score), .isDead(isDead) );
endmodule

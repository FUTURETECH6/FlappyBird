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
    wire [10:0] score;
    wire [11:0] score_BCD;
    reg [31:0]clkdiv;
    wire isDead;
    wire up_button;
    wire SW_pause;
    reg [1:0] rstState;

    always@(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
    end

    always @(posedge clkdiv[20]) begin
        rstState[1] = rstState[0];
        rstState[0] = keyCode == 5'h0;
    end

    assign up_button = keyReady && rstState == 2'b00;  // Use any button to boost the bird up
    assign SW_pause = SW_OK[15];

    /* Switch */
    wire [15:0] SW_OK;
    AntiJitter #(4) Top_AJ_SW[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK) );

    /* Keypad */
    wire [4:0] keyCode;
    wire keyReady;
    Keypad Top_KP(.clk(clkdiv[15]), .keyX(BTN_Y), .keyY(BTN_X), .keyCode(keyCode), .ready(keyReady) );

    /* Segments */
    assign score_BCD[11:8] = score / 100;
    assign score_BCD[7:4]  = (score - score_BCD[11:8] * 100) / 10;
    assign score_BCD[3:0]  = score % 10;

    Seg7Device Top_S7Device(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
        .data({20'b0,score_BCD}), .point(8'h0), .LES(8'h0), .sout({SEGLED_CLK,SEGLED_DO,SEGLED_PEN,SEGLED_CLR}) );

    
    ShiftReg #(.WIDTH(16)) LED_m0 (.clk(clkdiv[3]), .pdata(~SW_OK), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));

    /* Switch state */
    always @(posedge clk) begin
        if(rstState == 2'b01)
            state <= 0;
        else if(isDead)
            state <= 2;
        else if(SW_pause)
            state <= 3;
        else if(state == 0 && up_button || state == 3 && !SW_pause)
            state <= 1;
    end

    /* VGA Display */
    Display DP_m0(.state(state), .clkdiv(clkdiv), .SW_OK(SW_OK), .up_button(up_button),
        .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .VGA_hs(VGA_hs), .VGA_vs(VGA_vs) ,.score(score), .isDead(isDead) );
endmodule

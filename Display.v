`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:27:07 12/13/2019 
// Design Name: 
// Module Name:    Display 
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
// Use clk_Ctrl for module concerning the movement of bird and pipe
//////////////////////////////////////////////////////////////////////////////////
module Display(
    input [1:0] state,
    input [31:0] clkdiv,
    input [15:0] SW_OK,
    output reg [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_hs, VGA_vs
);

    parameter pip_COLOR   = 12'h0C0;
    parameter bird_HPos   = 320;
    parameter bird_Xwidth = 34;
    parameter bird_Ywidth = 24;
    parameter pip_width   = 100;
    parameter pip_height  = 100;
    parameter land_height = 100;

    wire clk_Ctrl, clk_VGA;
    reg [8:0]  bird_VPos = 240;
    reg [3:0]  RGB_R,RGB_G,RGB_B;
    reg [11:0] RGB_Bird, RGB_BG, RGB_Land;

    assign clk_Ctrl = clkdiv[15];
    assign clk_VGA  = clkdiv[1];
    /*always @(posedge clk) begin
        case(state)
            0: Ready2Go R2G_m0()
            1: Bird_Convert2Display BC2D_m0
            2: Show_Score SS_m0()
    end*/

    Bird_Convert2Display BC2D_m0(.clk_ms(clkdiv[10]), .state(state), .pipeInfo(),
        .V_Pos(bird_VPos), .RGB_R(RGB_Bird[11:8]), .RGB_G(RGB_Bird[7:4]), .RGB_B(RGB_Bird[3:0]) );
    
    wire [3:0] bg_abondon;
    wire [14:0] bg_addr;
    assign bg_addr = ((479 - Y_Addr) * 640 + X_Addr) / 4;
    bg_day_160_120 BG_day_m0(.a(bg_addr), .spo({bg_abondon, RGB_Land) );

    /* Right-Up Side */
    reg [9:0] pip1_X;
    reg [8:0] pip1_Y;
    Pipe_Generator PG_m0(.clk_2ms(clkdiv[11]), .state(state),
        .pip_X(pip1_X), .pip_Y(pip1_Y) );

    wire [9:0] X_Addr;
    wire [8:0] Y_Addr;

    // Procedure: bird > land > pipe > bg, skip the bird
    always @(posedge clk_VGA) begin
        if(RGB_Bird != 12'hFFF && X_Addr >= bird_HPos - bird_Xwidth/2 && X_Addr <= bird_HPos + bird_Xwidth/2
            && Y_Addr >= bird_VPos - bird_Ywidth/2 && Y_Addr <= bird_VPos + bird_Ywidth/2)
            {RGB_R,RGB_G,RGB_B} <= RGB_Bird;
        else if(Y_Addr < land_height)
            {RGB_R,RGB_G,RGB_B} <= RGB_Land;
        else if(X_Addr > pip1_X-pip_width && X_Addr < pip1_X && !(Y_Addr > pip1_Y-pip_height && Y_Addr < pip1_Y))
            {RGB_R,RGB_G,RGB_B} <= pip_COLOR;
        else
            {RGB_R,RGB_G,RGB_B} <= RGB_BG;
    end
    
    vgac vgac_m0(
        .vga_clk(clk_VGA), .clrn(SW_OK[0]), .d_in_BGR({RGB_B,RGB_G,RGB_R}),
        .row_addr(Y_Addr), .col_addr(X_Addr),
        .r(VGA_R), .g(VGA_G), .b(VGA_B), .hs(VGA_hs), .vs(VGA_vs)
    );

endmodule

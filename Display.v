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
    output VGA_hs, VGA_vs,
    output reg [7:0] score
);

    parameter pip_COLOR   = 12'h0C0;
    parameter bird_HPos   = 320;
    parameter bird_Xwidth = 34;
    parameter bird_Ywidth = 24;
    parameter pip_width   = 100;
    parameter pip_height  = 100;
    parameter land_height = 100;
    parameter SW_Bird     = 1;
    parameter SW_BG       = 2;

    wire clk_Ctrl, clk_VGA;
    reg [8:0]  bird_VPos = 240;
    reg [3:0]  RGB_R,RGB_G,RGB_B;
    reg [11:0] RGB_Bird, RGB_Pipe;
    wire [11:0] RGB_BG, RGB_Land;
    reg isValid_Bird, isValid_Land;
    wire [9:0] X_Addr;
    wire [8:0] Y_Addr;

    assign clk_Ctrl = clkdiv[15];
    assign clk_VGA  = clkdiv[1];
    /*always @(posedge clk) begin
        case(state)
            0: Ready2Go R2G_m0()
            1: Bird_Convert2Display BC2D_m0
            2: Show_Score SS_m0()
    end*/

    Bird_Convert2Display BC2D_m0(.clk_ms(clkdiv[10]), .state(state), .pipeInfo(),
        .isValidPixel(isValid_Bird), 
        .V_Pos(bird_VPos), .RGB_R(RGB_Bird[11:8]), .RGB_G(RGB_Bird[7:4]), .RGB_B(RGB_Bird[3:0]) );
    
    /* BackGround */
    wire [3:0] bg_abondon;
    wire [14:0] bg_addr;
    wire [11:0] RGB_Day, RGB_Night;
    assign bg_addr = ((479 - Y_Addr) * 640 + X_Addr) / 4;
    bg_day_160_120 BG_day_m0(.a(bg_addr), .spo({bg_abondon, RGB_Day}) );
    bg_night_160_120 BG_night_m0(.a(bg_addr), .spo({bg_abondon, RGB_Night}) );
    assign RGB_BG = SW_OK[SW_BG] ? RGB_Night : RGB_Day;

    /* Land */
    wire [11:0] land_addr;
    assign land_addr = ((100 - Y_Addr) * 640 + X_Addr) / 4;
    land_160_25 Land_m0(.a(land_addr), .spo(RGB_Land));

    /* Bird Display */
    reg [3:0] bird_valid_00, bird_valid_01, bird_valid_02, bird_valid_10, bird_valid_11, bird_valid_12;
    reg [11:0] bird_RGB_00, bird_valid_01, bird_valid_02, bird_valid_10, bird_valid_11, bird_valid_12;
    wire [9:0] bird_addr;
    assign bird_addr = 34 * (bird_VPos + 23 - Y_Addr) + (bird_HPos - X_Addr);
    bird0_0 BG_B00_m0(.a(bird_addr), .spo({bird_valid_00, bird_RGB_00}));
    bird0_1 BG_B01_m0(.a(bird_addr), .spo({bird_valid_01, bird_RGB_01}));
    bird0_2 BG_B02_m0(.a(bird_addr), .spo({bird_valid_02, bird_RGB_02}));
    bird1_0 BG_B10_m0(.a(bird_addr), .spo({bird_valid_10, bird_RGB_10}));
    bird1_1 BG_B11_m0(.a(bird_addr), .spo({bird_valid_11, bird_RGB_11}));
    bird1_2 BG_B12_m0(.a(bird_addr), .spo({bird_valid_12, bird_RGB_12}));
    always @* begin
        case(clk_bird)
            0: begin
                isValid_Bird <= SW_OK[SW_Bird] ? (bird_valid_10 == 1'hF ? 1 : 0) : (bird_valid_00 == 1'hF ? 1 : 0);
                RGB_Bird <= SW_OK[SW_Bird] ? bire_RGB_10 : bire_RGB_00;
            end
            1: begin
                isValid_Bird <= SW_OK[SW_Bird] ? (bird_valid_11 == 1'hF ? 1 : 0) : (bird_valid_01 == 1'hF ? 1 : 0);
                RGB_Bird <= SW_OK[SW_Bird] ? bire_RGB_10 : bire_RGB_00;
            end
            2: begin
                isValid_Bird <= SW_OK[SW_Bird] ? (bird_valid_12 == 1'hF ? 1 : 0) : (bird_valid_02 == 1'hF ? 1 : 0);
                RGB_Bird <= SW_OK[SW_Bird] ? bire_RGB_10 : bire_RGB_00;
            end
        endcase
    end

    /* Right-Up Side */
    reg [9:0] pip1_X;
    reg [8:0] pip1_Y;
    Pipe_Generator PG_m0(.clk_2ms(clkdiv[11]), .state(state),
        .pip_X(pip1_X), .pip_Y(pip1_Y) );

    wire [7:0] pip_addr_up, pip_addr_down;
    reg [11:0] RGB_upPip, RGB_downPip;
    wire [4:0] up_abondon, down_abondon;

    assign pip_addr_up = (Y_Addr - pip1_Y) > 12 ? (pip1_X - X_Addr) : (Y_Addr - pip1_Y) * 20 + (pip1_X - X_Addr);
    assign pip_addr_down = (pip1_Y - pip_height - Y_Addr) > 12 ? (pip1_X - X_Addr + 200) : (pip1_Y - pip_height - Y_Addr) * 20 + (pip1_X - X_Addr);

    pipe_up_20_12   PU_m0(.a(pip_addr_up),   .spo({up_abondon, RGB_upPip}));
    pipe_down_20_12 PD_m0(.a(pip_addr_down), .spo({down_abondon, RGB_downPip}));

    // Procedure: bird > land > pipe > bg, skip the bird
    always @(posedge clk_VGA) begin
        if(isValid_Bird && X_Addr >= bird_HPos - bird_Xwidth/2 && X_Addr <= bird_HPos + bird_Xwidth/2
            && Y_Addr >= bird_VPos - bird_Ywidth/2 && Y_Addr <= bird_VPos + bird_Ywidth/2)
            {RGB_R,RGB_G,RGB_B} <= RGB_Bird;
        else if(isValid_Land/* && Y_Addr < land_height*/)
            {RGB_R,RGB_G,RGB_B} <= RGB_Land;
        else if(isValid_Bird && X_Addr > pip1_X-pip_width && X_Addr < pip1_X && !(Y_Addr > pip1_Y-pip_height && Y_Addr < pip1_Y))
            if(Y_Addr > pip1_Y)
                {RGB_R,RGB_G,RGB_B} <= RGB_upPip;
            if(Y_Addr < pip1_Y - pip_height)
                {RGB_R,RGB_G,RGB_B} <= RGB_downPip;
        else
            {RGB_R,RGB_G,RGB_B} <= RGB_BG;
    end

    vgac vgac_m0(
        .vga_clk(clk_VGA), .clrn(SW_OK[0]), .d_in_BGR({RGB_B,RGB_G,RGB_R}),
        .row_addr(Y_Addr), .col_addr(X_Addr),
        .r(VGA_R), .g(VGA_G), .b(VGA_B), .hs(VGA_hs), .vs(VGA_vs)
    );

endmodule

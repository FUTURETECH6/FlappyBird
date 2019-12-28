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
    input up_button,
    output VGA_hs, VGA_vs,
    output isDead,
    output [3:0] VGA_R, VGA_G, VGA_B,
    output [7:0] score
    );

    parameter pip_COLOR   = 12'h0C0;
    parameter bird_HPos   = 320;
    parameter bird_Xwidth = 34;
    parameter bird_Ywidth = 24;
    parameter slot_width  = 60;
    parameter slot_height = 100;
    parameter land_height = 100;
    parameter SW_Bird     = 1;
    parameter SW_BG       = 2;

    wire clk_Ctrl, clk_VGA;
    wire [8:0]  bird_VPos;
    reg [3:0]  BGR_R,BGR_G,BGR_B;
    reg [11:0] BGR_Bird;
    wire [11:0] BGR_Land;
    reg Opacity_Bird;;
    wire [9:0] X_Addr;
    wire [8:0] Y_Addr;
    wire [9:0] pip1_X;
    wire [8:0] pip1_Y;
    wire inBird, inLand, inPipe;

    assign clk_Ctrl = clkdiv[15];
    assign clk_VGA  = clkdiv[1];

    /* Core Control Part */
    Bird_Ctrl BC_m0(.clk_ms(clkdiv[10]), .up_button(up_button), .state(state), .pip1_X(pip1_X), .pip1_Y(pip1_Y),
        .V_pos(bird_VPos), .isDead(isDead) );
    //Pipe_Generator PG_m0(.clk_2ms(clkdiv[11]), .state(state),
    //    .pip_X(pip1_X), .pip_Y(pip1_Y), .score(score) );
	 assign pip1_X = 150;
	 assign pip1_Y = 300;
    
    /* BackGround */
    wire [14:0] bg_addr;
    wire [11:0] BGR_Day, BGR_Night;
    wire [3:0] day_abondon, night_abondon;
    assign bg_addr = (119 - Y_Addr / 4) * 160 + X_Addr / 4;
    bg_day_160_120 BG_day_m0(.a(bg_addr), .spo({day_abondon, BGR_Day}) );
    bg_night_160_120 BG_night_m0(.a(bg_addr), .spo({night_abondon, BGR_Night}) );

    /* Land */
    wire [11:0] land_addr;
    wire [3:0] land_abandon;
    assign inLand = Y_Addr < 100;
    assign land_addr = inLand ? (24 - Y_Addr / 4) * 160 + X_Addr / 4 : 0;
    bg_land_160_25 Land_m0(.a(land_addr), .spo({land_abandon, BGR_Land}));

    /* Pipe: Right-Up Side */
    wire [7:0] pip_addr_up, pip_addr_down;
    wire [11:0] BGR_upPip, BGR_downPip;
    wire [3:0] pU_abandon, pD_abandon;
	 wire Opacity_up, Opacity_down;

    assign inPipe = (Y_Addr >= pip1_Y || Y_Addr <= pip1_Y - slot_height) && X_Addr > pip1_X - slot_width && X_Addr <= pip1_X;
    assign pip_addr_down = (Y_Addr - pip1_Y) > 12 ? (pip1_X - X_Addr / 3) : (Y_Addr - pip1_Y) * 20 + (pip1_X - X_Addr / 3);
    assign pip_addr_up = (pip1_Y - slot_height - Y_Addr) > 12 ? (pip1_X - X_Addr / 3 + 200) : (pip1_Y - slot_height - Y_Addr) * 20 + (pip1_X - X_Addr / 3);

    pipe_down_20_12 PD_m0(.a(pip_addr_down), .spo({pD_abandon, BGR_downPip}));
    pipe_up_20_12   PU_m0(.a(pip_addr_up),   .spo({pU_abandon, BGR_upPip}));
	 assign Opacity_up = pU_abandon == 4'hF;
	 assign Opacity_down = pD_abandon == 4'hF;

    /* Bird: Right_Down Side */
    wire [3:0] bird_opacity_00, bird_opacity_01, bird_opacity_02, bird_opacity_10, bird_opacity_11, bird_opacity_12;
    wire [11:0] bird_BGR_00, bird_BGR_01, bird_BGR_02, bird_BGR_10, bird_BGR_11, bird_BGR_12;
    wire [9:0] bird_addr;
    assign inBird = Y_Addr >= bird_VPos && Y_Addr < bird_VPos + bird_Ywidth && X_Addr <= bird_HPos && X_Addr > bird_HPos - bird_Xwidth;
    assign bird_addr = inBird ? bird_Xwidth * (bird_VPos + bird_Ywidth - 1 - Y_Addr) + (X_Addr - (bird_HPos - bird_Xwidth + 1)) : 0;
    bird0_0 BG_B00_m0(.a(bird_addr), .spo({bird_opacity_00, bird_BGR_00}));
    bird0_1 BG_B01_m0(.a(bird_addr), .spo({bird_opacity_01, bird_BGR_01}));
    bird0_2 BG_B02_m0(.a(bird_addr), .spo({bird_opacity_02, bird_BGR_02}));
    bird1_0 BG_B10_m0(.a(bird_addr), .spo({bird_opacity_10, bird_BGR_10}));
    bird1_1 BG_B11_m0(.a(bird_addr), .spo({bird_opacity_11, bird_BGR_11}));
    bird1_2 BG_B12_m0(.a(bird_addr), .spo({bird_opacity_12, bird_BGR_12}));
    reg [1:0] clk_bird = 0;    // For wing shaking
    always @(posedge clkdiv[23])
        clk_bird = clk_bird == 3 ? 0 : clk_bird + 1;
    always @(clk_bird) begin
        case(clk_bird)
            0: begin
                Opacity_Bird <= SW_OK[SW_Bird] ? bird_opacity_10 : bird_opacity_00;
                BGR_Bird <= SW_OK[SW_Bird] ? bird_BGR_10 : bird_BGR_00;
            end
            1: begin
                Opacity_Bird <= SW_OK[SW_Bird] ? bird_opacity_11 : bird_opacity_01;
                BGR_Bird <= SW_OK[SW_Bird] ? bird_BGR_11 : bird_BGR_01;
            end
            2: begin
                Opacity_Bird <= SW_OK[SW_Bird] ? bird_opacity_12 : bird_opacity_02;
                BGR_Bird <= SW_OK[SW_Bird] ? bird_BGR_12 : bird_BGR_02;
            end
            3: begin
                Opacity_Bird <= SW_OK[SW_Bird] ? bird_opacity_11 : bird_opacity_01;
                BGR_Bird <= SW_OK[SW_Bird] ? bird_BGR_10 : bird_BGR_00;
            end
            default: ;
        endcase
    end



    // Procedure: bird > land > pipe > bg, skip the bird
    always @(posedge clk_VGA) begin
        if(inBird && Opacity_Bird)
            {BGR_B,BGR_G,BGR_R} <= BGR_Bird;
        else if(inLand)
            {BGR_B,BGR_G,BGR_R} <= BGR_Land;
        else if(inPipe && (Opacity_up || Opacity_down)) begin
            if(Y_Addr > pip1_Y && Opacity_down)
                {BGR_B,BGR_G,BGR_R} <= BGR_downPip;
            if(Y_Addr < pip1_Y - slot_height && Opacity_up)
                {BGR_B,BGR_G,BGR_R} <= BGR_upPip;
        end
        else
            {BGR_B,BGR_G,BGR_R} <= SW_OK[SW_BG] ? BGR_Night : BGR_Day;
    end

    vgac vgac_m0(
        .vga_clk(clk_VGA), .clrn(~SW_OK[0]), .d_in_BGR({BGR_B,BGR_G,BGR_R}),
        .Y_Addr(Y_Addr), .X_Addr(X_Addr),
        .r(VGA_R), .g(VGA_G), .b(VGA_B), .hs(VGA_hs), .vs(VGA_vs)
    );

endmodule

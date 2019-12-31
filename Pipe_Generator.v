`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:19 12/13/2019 
// Design Name: 
// Module Name:    Pipe_Generator 
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
module Pipe_Generator(
    input clk_2ms,
    input [1:0] state,
    output reg [9:0] pip_X,  // [0, 640+slot_width]
    output reg [8:0] pip_Y,  // [slot_height, 480]
    output reg [7:0] score
    );

    parameter slot_width   = 60;
    parameter slot_height  = 100;
    parameter bird_HPos    = 320;
    parameter bird_Xwidth  = 34;
    // parameter pip_Vpos_buf = 20;
    parameter rand0 = 281;  // Generated using C
    parameter rand1 = 307;
    parameter rand2 = 374;
    parameter rand3 = 340;
    parameter rand4 = 409;
    parameter rand5 = 364;
    parameter rand6 = 318;
    parameter rand7 = 398;
    parameter rand8 = 402;
    parameter rand9 = 304;
    parameter rand10 = 345;
    parameter rand11 = 385;
    parameter rand12 = 321;
    parameter rand13 = 267;
    parameter rand14 = 401;
    parameter rand15 = 331;
    

    reg [3:0] rand_state = 0;

    always @(posedge clk_2ms) begin
        case(state)
            0: begin
                    pip_X <= 0;
                    score <= 0;
            end
            1: begin
                if(pip_X == bird_HPos - bird_Xwidth)
                    score <= score + 1;
                if(pip_X == 0) begin
                    pip_X <= 639 + slot_width + 24;  // The land width is 11x4 pixels
                    case(rand_state)
                        0: pip_Y <= rand0;
                        1: pip_Y <= rand1;
                        2: pip_Y <= rand2;
                        3: pip_Y <= rand3;
                        4: pip_Y <= rand4;
                        5: pip_Y <= rand5;
                        6: pip_Y <= rand6;
                        7: pip_Y <= rand7;
                        8: pip_Y <= rand8;
                        9: pip_Y <= rand9;
                        10: pip_Y <= rand10;
                        11: pip_Y <= rand11;
                        12: pip_Y <= rand12;
                        13: pip_Y <= rand13;
                        14: pip_Y <= rand14;
                        15: pip_Y <= rand15;
                        default: ;
                    endcase
                    //pip_Y <= slot_height + pip_Vpos_buf + {$random} % (480 - slot_height - pip_Vpos_buf);
                    //pip_Y <= 300;
                    rand_state <= (& rand_state) ? 0 : rand_state + 1;
                end
                else
                    pip_X <= pip_X - 1;
            end
            default:begin
                pip_X <= pip_X; pip_Y <= pip_Y;
            end
        endcase
    end
endmodule

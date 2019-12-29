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

    parameter slot_width  = 60;
    parameter slot_height = 100;
    parameter bird_HPos   = 320;
    parameter bird_Xwidth = 34;

    /*reg clk_2ms;
    initial clk_2ms = 0;
    forever #2 clk_2ms = ~clk_2ms;*/

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
                    pip_X <= 639 + slot_width;
                    //pip_Y <= slot_height + {$random} % (480 - slot_height);
                    pip_Y <= 300;
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

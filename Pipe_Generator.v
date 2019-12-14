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
    output reg [9:0] pip_X,  // [0, 640+pip_width]
    output reg [8:0] pip_Y  // [pip_height, 480]
    );

    parameter pip_width  = 100;
    parameter pip_height = 100;

    /*reg clk_2ms;
    initial clk_2ms = 0;
    forever #2 clk_2ms = ~clk_2ms;*/

    always @(posedge clk_2ms) begin
        case(state)
            0:  pip_X <= 0;
            1:  begin
                    if(pip_X == 0) begin
                       pip_X <= 640 + pip_width;
                        pip_Y <= pip_height + {$random} % (480 - pip_height);
                    end else
                        pip_Y <= pip_Y - 1;
                end
            default:begin
                        pip_X <= pip_X; pip_Y <= pip_Y;
                    end
        endcase
    end
endmodule

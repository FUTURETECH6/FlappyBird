`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:35 12/12/2019 
// Design Name: 
// Module Name:    Bird_Convert2Display 
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
module Bird_Convert2Display(
    input clk, clk_ms, up_button,
    input [1:0] state, pipeInfo,
    output reg [8:0] V_pos,
    output reg [3:0] RGB_R,RGB_G,RGB_B,
    output reg isDead
    );

    parameter initialVelocity = 20;  // Velocity after button

    reg [12:0] time_from = 0;       // Unit: ms, max 8*1024 ms
    reg [5:0] velocity = 0;         // Unit: pixels/ms, max 64 pixels/ms
    reg velocityDire = 0;           // 1:up 0:down

    reg [3:0] angle;

    always @(posedge clk_ms) begin
        if(state == 0 && !isDead) begin
            V_pos <= 240;
            isDead <= 0;
        end
        if(state == 1 && !isDead) begin
            if(up_button)begin
                velocity <= initialVelocity;
                velocityDire <= 1;
            end
            else if(velocity == 0 && velocityDire == 1)
                velocityDire <= 0;
            velocity <= velocityDire ? velocity - 1 : velocity + 1;
            V_pos <= velocityDire ? V_pos + velocity : V_pos - velocity;
        end

        //if()

    end

endmodule

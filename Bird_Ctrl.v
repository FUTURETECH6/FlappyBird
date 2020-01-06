`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:02 12/12/2019 
// Design Name: 
// Module Name:    Bird_Ctrl 
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
module Bird_Ctrl(
    input clk_ms, up_button,
    input [1:0] state,
    input [9:0] pip1_X,
    input [8:0] pip1_Y,
    output isDead,
    output reg [12:0] V_pos
    );

    parameter initialVelocity = 9;  // Velocity after up_button, MIST BE THE MULTIPLE OF `acceleration`
    parameter acceleration    = 1;   // Acceleration of gravity
    parameter H_pos       = 320;
    parameter slot_width  = 60;
    parameter slot_height = 100;
    parameter land_height = 100;
    parameter bird_Xwidth = 34;
    parameter bird_Ywidth = 24;

    reg [12:0] time_from = 0;       // Unit: clk_fly, max 8*1024 clk_fly
    reg [5:0] velocity = 0;         // Unit: pixels/ms, max 64 pixels/clk_fly
    reg velocityDire = 0;           // 1:up 0:down

    reg [3:0] angle;
    reg [1:0] button_state = 2'b00;
    reg [8:0] V_pos_tmp = 0;

    assign isDead = state && (V_pos < land_height || H_pos - 2 > pip1_X - slot_width + 1 && H_pos - bird_Xwidth + 4 < pip1_X && (V_pos + bird_Ywidth - 2 > pip1_Y || V_pos + 2 < pip1_Y - slot_height));

    always @(posedge clk_ms) begin
        // button_state = {button_state[0], up_button};
        button_state[1] = button_state[0];
        button_state[0] = up_button;
        case(state)
            0: begin
                V_pos  = 240;
                velocity = 0;
                velocityDire = 0;
            end
            1: begin
                if(button_state == 2'b01) begin
                    velocity = initialVelocity;
                    velocityDire = 1;
                end
                /*@(posedge up_button) begin
                    velocity = initialVelocity;
                    velocityDire = 1;
                end*/

                if(velocity == 0 && velocityDire == 1)
                    velocityDire = 0;

                velocity = velocityDire ? velocity - acceleration : velocity + acceleration;
                V_pos_tmp = velocityDire ? V_pos + velocity : V_pos - velocity;
                V_pos = V_pos_tmp < land_height ? land_height - 1 : V_pos_tmp;
            end
            2: begin  // Falling down to ground
                velocity = velocityDire ? 0 : velocity + acceleration * 2;
                velocityDire = 0;
                V_pos_tmp = V_pos - velocity;
                V_pos = V_pos_tmp < land_height ? land_height - 1 : V_pos_tmp;
            end
            default: ;
        endcase
    end

endmodule

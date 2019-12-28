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
    output reg [8:0] V_pos
    );

    parameter initialVelocity = 20;  // Velocity after up_button
    parameter H_pos       = 320;
    parameter slot_width  = 60;
    parameter slot_height = 100;
    parameter land_height = 100;

    reg [12:0] time_from = 0;       // Unit: ms, max 8*1024 ms
    reg [5:0] velocity = 0;         // Unit: pixels/ms, max 64 pixels/ms
    reg velocityDire = 0;           // 1:up 0:down

    reg [3:0] angle;
    reg [1:0] button_state = 00;

    assign isDead = state && (V_pos < land_height || H_pos > pip1_X - slot_width && H_pos < pip1_X && V_pos > pip1_Y && V_pos < pip1_Y - slot_height);


    always @(posedge clk_ms) begin
        button_state <= {button_state[0], up_button};
        if(state == 0) begin
            V_pos  <= 240;
        end
        else if (state == 1) begin
            if(button_state == 2'b01) begin
                velocity <= initialVelocity;
                velocityDire <= 1;
            end
            if(velocity == 0 && velocityDire == 1)
                velocityDire <= 0;

            velocity <= velocityDire ? velocity - 1 : velocity + 1;
            V_pos <= velocityDire ? V_pos + velocity : V_pos - velocity;
        end
    end

endmodule

    // input clk, up_button, output reg [8:0] V_pos, output reg [3:0] angle);
    
//     parameter initialVelocity = 5; // Velocity after button

//     reg [12:0] time_from = 0;   // Unit: ms, max 8*1024 ms
//     reg [5:0] velocity = 0;     // Unit: pixels/ms, max 64 pixels/ms
//     reg velocityDire = 0;       // 1:up 0:down

//     always @ (posedge clk) begin
//         if(up_button)begin
//             velocity <= initialVelocity;
//             velocityDire <= 1;
//         end

//         else if(velocity == 0 && velocityDire == 1)
//             velocityDire <= 0;
//         velocity <= velocityDire ? velocity - 1 : velocity + 1;
//         V_pos <= velocityDire ? V_pos + velocity : V_pos - velocity;
//     end

// endmodule

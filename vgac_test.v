`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:58 12/26/2019
// Design Name:   vgac
// Module Name:   Z:/Documents/Xilinx/FlappyBird/vgac_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vgac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vgac_test;

    // Inputs
    reg vga_clk;
    reg clrn;
    reg [11:0] d_in_BGR;

    // Outputs
    wire [8:0] row_addr;
    wire [9:0] col_addr;
    wire read;
    wire [3:0] r;
    wire [3:0] g;
    wire [3:0] b;
    wire hs;
    wire vs;

    // Instantiate the Unit Under Test (UUT)
    vgac uut (
        .vga_clk(vga_clk), 
        .clrn(clrn), 
        .d_in_BGR(d_in_BGR), 
        .row_addr(row_addr), 
        .col_addr(col_addr), 
        .read(read), 
        .r(r), 
        .g(g), 
        .b(b), 
        .hs(hs), 
        .vs(vs)
    );

    initial begin
        vga_clk = 0;
        clrn = 0;
        clrn = 1;
        d_in_BGR = 0;
        #100;
        clrn = 0;
        for(d_in_BGR = 0; 1; d_in_BGR = d_in_BGR + 1) begin
            #20;
        end
    end
    always #1 vga_clk = ~vga_clk;
      
endmodule


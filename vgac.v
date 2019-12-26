`timescale 1ns / 1ps

module vgac(input     [11:0] d_in_BGR,   // bbbb_gggg_rrrr, pixel
            input            vga_clk,    // 25MHz
            input            clrn,       // Clear the screen
            output reg [8:0] row_addr,   // pixel ram row address, 480 (512) lines
            output reg [9:0] col_addr,   // pixel ram col address, 640 (1024) pixels
            output reg [3:0] r,g,b,      // red, green, blue colors
            output           read,       // read pixel RAM (active_high)
            output reg       hs,vs       // horizontal and vertical synchronization
            );

    // h_count: VGA horizontal counter (0-799)
    reg [9:0] h_count = 143;           // VGA horizontal counter (0-799): pixels
    always @ (posedge vga_clk) begin
        if (clrn) begin
            h_count <= 10'h0;
        end else if (h_count == 10'd799) begin
            h_count <= 10'h0;
        end else begin 
            h_count <= h_count + 10'h1;
        end
    end

    // v_count: VGA vertical counter (0-524)
    reg [8:0] v_count = 35; // VGA vertical   counter (0-524): lines
    always @ (posedge vga_clk or negedge clrn) begin
        if (clrn) begin
            v_count <= 10'h0;
        end else if (h_count == 10'd799) begin
            if (v_count == 10'd524) begin
                v_count <= 10'h0;
            end else begin
                v_count <= v_count + 10'h1;
            end
        end
    end

    // signals, will be latched for outputs
    wire  [8:0] row_tmp =  v_count - 10'd35;     // pixel ram row addr 
    wire  [9:0] col_tmp =  h_count - 10'd143;    // pixel ram col addr 
    wire         h_sync = (h_count > 10'd95);    //  96 -> 799
    wire         v_sync = (v_count > 10'd1);     //   2 -> 524
    assign       read   = (h_count > 10'd142) && // 143 -> 782
                          (h_count < 10'd783) && //        640 pixels
                          (v_count > 10'd34)  && //  35 -> 514
                          (v_count < 10'd515);   //        480 lines
    // vga signals
    always @ (posedge vga_clk) begin
        row_addr <=  row_tmp;      // pixel ram row address
        col_addr <=  col_tmp;      // pixel ram col address
        // rdn      <= ~read;         // read pixel (active low)
        hs       <=  h_sync;       // horizontal synchronization
        vs       <=  v_sync;       // vertical   synchronization
        r        <=  read ? d_in_BGR[3:0]  : 4'b0;  // 3-bit red
        g        <=  read ? d_in_BGR[7:4]  : 4'b0;  // 3-bit green
        b        <=  read ? d_in_BGR[11:8] : 4'b0;  // 2-bit blue
    end
endmodule

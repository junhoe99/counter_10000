`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 17:06:35
// Design Name: 
// Module Name: counter_10000
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_10000(
    input clk,
    input rst,
    output [13:0] o_counter
    );

    parameter F_COUNT = 10_000;
    reg [$clog2(F_COUNT)-1:0] counter_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_reg <= 14'b0;
        end
        else if(counter_reg == F_COUNT -1) begin
            counter_reg <= 14'b0;
        end else begin
            counter_reg <= counter_reg + 1;
        end
    end

    assign o_counter = counter_reg;

endmodule

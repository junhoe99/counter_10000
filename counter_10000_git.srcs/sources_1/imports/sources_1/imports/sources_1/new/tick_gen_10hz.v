`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 15:09:18
// Design Name: 
// Module Name: tick_gen_10hz
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


module tick_gen_10hz(
    input clk,
    input rst,
    output clk_out
    );

    parameter F_COUNT = 10_000_000;
    reg [$clog2(F_COUNT)-1:0] tick_counter;
    reg tick_reg;

    always@(posedge clk or posedge rst)begin
        if(rst)begin
            tick_counter <= 0;
            tick_reg <= 1'b0;
        end
        else if(tick_counter == F_COUNT - 1)begin
            tick_counter <= 0;
            tick_reg <= 1'b1;
        end
        else begin
            tick_counter <= tick_counter + 1'b1;
            tick_reg <= 1'b0;
        end
    end

    assign clk_out = tick_reg;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:22:01
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    input rst,
    output o_1khz
    );

    parameter F_COUNT = 100_000;
    reg [$clog2(F_COUNT)-1:0] counter;
    reg r_1khz;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            r_1khz <= 0;
        end
        else if (counter == F_COUNT - 1) begin
            counter <= 0;
            r_1khz <= 1;
            // r_1khz <= ~r_1khz;
        end
        else begin
            counter <= counter + 1;
            r_1khz <= 0;
        end
    end

    //Output logic
    assign o_1khz = r_1khz;

endmodule

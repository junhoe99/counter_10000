`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/03 14:37:55
// Design Name: 
// Module Name: counter_4
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


module counter_4(
    input clk,
    input rst,
    output [1:0] digit_sel
    );

    reg [1:0] r_counter;


    always@(posedge clk or posedge rst)begin
        if(rst) begin
            r_counter <= 2'b00;
        end
        else begin
            r_counter <= r_counter + 1'b1;
        end
    end
    
    assign digit_sel = r_counter;

endmodule

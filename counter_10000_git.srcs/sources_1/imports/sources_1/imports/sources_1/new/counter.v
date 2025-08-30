`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 14:30:00
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    output reg [3:0] counter
);
   always@(posedge clk or posedge rst) begin
       if(rst)begin
           counter <= 4'b0000;
       end
       else if(counter == 4'b1001) begin
           counter <= 4'b0000;
       end
       else begin
           counter <= counter + 1;
       end
    end

endmodule



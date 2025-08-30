`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:45:57
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input [3:0] digit_data_1,
    input [3:0] digit_data_10,
    input [3:0] digit_data_100,
    input [3:0] digit_data_1000,
    input [1:0] sel,
    output reg [3:0] bcd_data
    );

    always @(*) begin
        case(sel)
            2'b00 : bcd_data = digit_data_1;
            2'b01 : bcd_data = digit_data_10;
            2'b10 : bcd_data = digit_data_100;
            2'b11 : bcd_data = digit_data_1000;
            default : bcd_data = digit_data_1;
        endcase
     end    
endmodule


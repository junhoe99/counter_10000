`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:41:20
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4(
    input [1:0] sel,
    output reg [3:0] fnd_com
    );

always @(sel) begin
        case(sel)
            2'b00 : fnd_com = 4'b1110;
            2'b01 : fnd_com = 4'b1101;
            2'b10 : fnd_com = 4'b1011;
            2'b11 : fnd_com = 4'b0111;
            default : fnd_com = 4'b1111;
        endcase
    end


endmodule

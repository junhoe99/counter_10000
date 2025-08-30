`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 14:38:00
// Design Name: 
// Module Name: bcd_decoder
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


module bcd_decoder(
    input [3:0] bcd,
    output reg [7:0] fnd_data
    );

    always@(bcd) begin
        case(bcd)
            4'h0 : fnd_data =  8'hc0;
            4'h1 : fnd_data =  8'hf9;
            4'h2 : fnd_data =  8'ha4;
            4'h3 : fnd_data =  8'hb0;
            4'h4 : fnd_data =  8'h99;
            4'h5 : fnd_data =  8'h92;
            4'h6 : fnd_data =  8'h82;
            4'h7 : fnd_data =  8'hf8;
            4'h8 : fnd_data =  8'h80;
            4'h9 : fnd_data =  8'h90;
            4'hE : fnd_data =  8'hFF; // 9
            4'hF : fnd_data =  8'h7F; // 9
            default: fnd_data = 8'hFF; // Preventing latch
        endcase
    end

endmodule

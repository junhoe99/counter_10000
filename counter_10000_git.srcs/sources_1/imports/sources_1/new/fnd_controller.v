`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:19:10
// Design Name: 
// Module Name: datapath_10000
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

module fnd_controller(
    input clk,
    input rst,
    input [13:0] i_counter,
    output [3:0] fnd_com,
    output [7:0] fnd_data
);

    wire w_1khz;
    
    // mux_4x1 & decoder 2x4
    wire [1:0] w_digit_sel;
    
    // MUX 4x1 -> BCD Decoder
    wire [3:0] w_bcd;

    // Digit Spliter -> mux_4x1
    wire [3:0] w_digit_1;
    wire [3:0] w_digit_10;
    wire [3:0] w_digit_100;
    wire [3:0] w_digit_1000;

    clk_div CLK_DIV(
        .clk(clk),
        .rst(rst),
        .o_1khz(w_1khz)
    );

    counter_4 CNT_4(
        .clk(w_1khz),
        .rst(rst),
        .digit_sel(w_digit_sel)
    );

    decoder_2x4 DECODER_2X4(
        .sel(w_digit_sel),
        .fnd_com(fnd_com)
    );

    digit_spliter DIGIT_SPLITER(
        .i_data(i_counter),
        .digit_data_1(w_digit_1),
        .digit_data_10(w_digit_10),
        .digit_data_100(w_digit_100),
        .digit_data_1000(w_digit_1000)
    );

    mux_4x1 MUX_4X1(
        .sel(w_digit_sel),  
        .digit_data_1(w_digit_1),
        .digit_data_10(w_digit_10),
        .digit_data_100(w_digit_100),
        .digit_data_1000(w_digit_1000),
        .bcd_data(w_bcd)
    );

    bcd_decoder BCD_DECODER(
        .bcd(w_bcd),
        .fnd_data(fnd_data)
    );

endmodule
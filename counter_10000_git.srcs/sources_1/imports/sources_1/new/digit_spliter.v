`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:48:53
// Design Name: 
// Module Name: digit_spliter
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


module digit_spliter(
    input [13:0] i_data,
    output [3:0] digit_data_1,
    output [3:0] digit_data_10,
    output [3:0] digit_data_100,
    output [3:0] digit_data_1000
    );

    assign digit_data_1 = i_data % 10;   
    assign digit_data_10 = i_data/10 %10;  
    assign digit_data_100 = i_data/100 %10; 
    assign digit_data_1000 = i_data/1000 %10; 

endmodule


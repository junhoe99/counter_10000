`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 16:25:07
// Design Name: 
// Module Name: tb
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


module tb(
    );

    reg clk;
    reg rst;

    counter_10000_top dut(
        .clk(clk),
        .rst(rst),
        .fnd_com(fnd_com),
        .fnd_data(fnd_data)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #100 $finish;
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/29 14:31:09
// Design Name: 
// Module Name: counter_10000_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top module for 10000 counter system. Connects datapath and FND controller.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_10000_top(
    // INPUT
    input clk,
    input rst,

    //OUTPUT
    output [3:0] fnd_com,
    output [7:0] fnd_data
    );

    // ---------------------
    // Debugging
    // wire [3:0] w_counter;
    // ---------------------
    
    wire [13:0] w_counter;


    fnd_controller FND_CONTROLLER(
        .clk(clk),
        .rst(rst),
        .i_counter(w_counter),
        .fnd_com(fnd_com),
        .fnd_data(fnd_data)
    );

    datapath_10000 U_DATAPATH(
        .clk(clk),
        .rst(rst),
        .o_counter(w_counter)
    );

    

endmodule

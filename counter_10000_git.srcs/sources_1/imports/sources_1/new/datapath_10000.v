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
// Description: Datapath module that generates 10Hz tick and drives the 10000 counter.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath_10000(
    input clk,
    input rst,
    output [13:0] o_counter
    );

    wire w_10hz;

    tick_gen_10hz TICK_GEN_10HZ(
        .clk(clk),
        .rst(rst),
        .clk_out(w_10hz)
    );

    counter_10000 CNT_10000(
        .clk(w_10hz),
        .rst(rst),
        .o_counter(o_counter)
    );

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 03:15:00 PM
// Design Name: 
// Module Name: top
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


module top (
    input  wire [7:0] sw,
    input  wire       btnC,
    output wire [4:0] led
);

wire [3:0] a;
wire [3:0] b;
wire [3:0] sum;
wire       cout;

assign a = sw[3:0];
assign b = sw[7:4];

ripple_carry_adder uut (
    .a(a),
    .b(b),
    .cin(btnC),
    .sum(sum),
    .cout(cout)
);

assign led[3:0] = sum;
assign led[4]   = cout;

endmodule
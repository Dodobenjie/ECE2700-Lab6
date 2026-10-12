`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 03:42:02 PM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);

wire [3:0] sum0;
wire [3:0] sum1;
wire       cout0;
wire       cout1;

ripple_carry_adder rca0 (
    .a(a),
    .b(b),
    .cin(1'b0),
    .sum(sum0),
    .cout(cout0)
);

ripple_carry_adder rca1 (
    .a(a),
    .b(b),
    .cin(1'b1),
    .sum(sum1),
    .cout(cout1)
);

assign sum  = cin ? sum1 : sum0;
assign cout = cin ? cout1 : cout0;

endmodule

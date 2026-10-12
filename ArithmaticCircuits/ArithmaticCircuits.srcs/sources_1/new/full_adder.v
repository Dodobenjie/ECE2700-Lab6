`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:41:01 PM
// Design Name: 
// Module Name: mux2to1
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

module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

wire s1;
wire c1;
wire c2;

half_adder ha1 (
    .a(a),
    .b(b),
    .sum(s1),
    .carry(c1)
);

half_adder ha2 (
    .a(s1),
    .b(cin),
    .sum(sum),
    .carry(c2)
);

assign cout = c1 | c2;

endmodule
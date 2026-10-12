`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 04:14:33 PM
// Design Name: 
// Module Name: carry_select_adder_16bit
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


module carry_select_adder_16bit (
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire        cin,
    output wire [15:0] sum,
    output wire        cout
);

    wire c1, c2, c3;


    ripple_carry_adder rca0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c1)
    );


    wire [3:0] sum10, sum11;
    wire cout10, cout11;

    ripple_carry_adder rca10 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(1'b0),
        .sum(sum10),
        .cout(cout10)
    );

    ripple_carry_adder rca11 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(1'b1),
        .sum(sum11),
        .cout(cout11)
    );

    assign sum[7:4] = c1 ? sum11 : sum10;
    assign c2       = c1 ? cout11 : cout10;


    wire [3:0] sum20, sum21;
    wire cout20, cout21;

    ripple_carry_adder rca20 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(1'b0),
        .sum(sum20),
        .cout(cout20)
    );

    ripple_carry_adder rca21 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(1'b1),
        .sum(sum21),
        .cout(cout21)
    );

    assign sum[11:8] = c2 ? sum21 : sum20;
    assign c3        = c2 ? cout21 : cout20;


    wire [3:0] sum30, sum31;
    wire cout30, cout31;

    ripple_carry_adder rca30 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(1'b0),
        .sum(sum30),
        .cout(cout30)
    );

    ripple_carry_adder rca31 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(1'b1),
        .sum(sum31),
        .cout(cout31)
    );

    assign sum[15:12] = c3 ? sum31 : sum30;
    assign cout       = c3 ? cout31 : cout30;

endmodule
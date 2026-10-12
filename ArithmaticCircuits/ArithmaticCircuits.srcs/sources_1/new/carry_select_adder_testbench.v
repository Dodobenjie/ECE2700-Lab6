`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 03:43:28 PM
// Design Name: 
// Module Name: carry_select_adder_testbench
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


module carry_select_adder_testbench;

reg  [3:0] a;
reg  [3:0] b;
reg        cin;
wire [3:0] sum;
wire       cout;

carry_select_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    a = 4'b0011; b = 4'b0101; cin = 0; #10; // 3+5=8
    a = 4'b1111; b = 4'b0001; cin = 0; #10; // 15+1=16
    a = 4'b0010; b = 4'b0011; cin = 1; #10; // 2+3+1=6
    a = 4'b0111; b = 4'b0110; cin = 0; #10; // 7+6=13
    a = 4'b1001; b = 4'b0011; cin = 1; #10; // 9+3+1=13
    $finish;
end

endmodule

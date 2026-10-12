`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 03:00:30 PM
// Design Name: 
// Module Name: ripple_carry_adder
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

`timescale 1ns / 1ps

module ripple_carry_adder_testbench;

reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout;

ripple_carry_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    a = 4'b0011; b = 4'b0001; cin = 0; #10;
    a = 4'b0101; b = 4'b0011; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1010; b = 4'b0101; cin = 1; #10;
    a = 4'b1111; b = 4'b1111; cin = 1; #10;
    $finish;
end

endmodule
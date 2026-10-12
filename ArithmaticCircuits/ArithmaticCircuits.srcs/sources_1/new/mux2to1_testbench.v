`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:42:01 PM
// Design Name: 
// Module Name: mux2to1_testbench
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

module mux2to1_testbench;

reg i0;
reg i1;
reg sel;
wire out;

mux2to1 uut (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .out(out)
);

initial begin
    i0 = 0; i1 = 0; sel = 0; #10;
    i0 = 0; i1 = 0; sel = 1; #10;
    i0 = 0; i1 = 1; sel = 0; #10;
    i0 = 0; i1 = 1; sel = 1; #10;
    i0 = 1; i1 = 0; sel = 0; #10;
    i0 = 1; i1 = 0; sel = 1; #10;
    i0 = 1; i1 = 1; sel = 0; #10;
    i0 = 1; i1 = 1; sel = 1; #10;
    $finish;
end

endmodule

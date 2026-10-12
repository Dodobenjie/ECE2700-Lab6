`timescale 1ns / 1ps

module adder_16bit_testbench;

    reg  [15:0] a;
    reg  [15:0] b;
    reg         cin;

    wire [15:0] sum_rca;
    wire        cout_rca;

    wire [15:0] sum_csla;
    wire        cout_csla;

    reg  [16:0] expected;

    ripple_carry_adder_16bit uut_rca (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum_rca),
        .cout(cout_rca)
    );

    carry_select_adder_16bit uut_csla (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum_csla),
        .cout(cout_csla)
    );

    task test_case;
        input [15:0] ta;
        input [15:0] tb;
        input        tcin;
        begin
            a = ta;
            b = tb;
            cin = tcin;
            #10;

            expected = ta + tb + tcin;

            if ({cout_rca, sum_rca} == expected)
                $display("RCA PASS  : a=%h b=%h cin=%b result=%h", a, b, cin, {cout_rca, sum_rca});
            else
                $display("RCA FAIL  : a=%h b=%h cin=%b got=%h expected=%h", a, b, cin, {cout_rca, sum_rca}, expected);

            if ({cout_csla, sum_csla} == expected)
                $display("CSLA PASS : a=%h b=%h cin=%b result=%h", a, b, cin, {cout_csla, sum_csla});
            else
                $display("CSLA FAIL : a=%h b=%h cin=%b got=%h expected=%h", a, b, cin, {cout_csla, sum_csla}, expected);

            $display("----------------------------------------");
        end
    endtask

    initial begin
        test_case(16'h0000, 16'h0000, 1'b0);
        test_case(16'h0001, 16'h0001, 1'b0);
        test_case(16'h000F, 16'h0001, 1'b0);
        test_case(16'h00FF, 16'h0001, 1'b0);
        test_case(16'h0FFF, 16'h0001, 1'b0);
        test_case(16'hFFFF, 16'h0001, 1'b0);
        test_case(16'hAAAA, 16'h5555, 1'b0);
        test_case(16'h1234, 16'h4321, 1'b1);
        test_case(16'h8000, 16'h8000, 1'b0);
        test_case(16'hFFFF, 16'hFFFF, 1'b1);

        $finish;
    end

endmodule
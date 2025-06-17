`timescale 1ns/1ns
`include "q2_a.v"

module CLA4_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg carry_in;
    wire carry_out;
    wire [3:0] sum;

    CLA4 dut(.A(A), .B(B), .carry_in(carry_in), .carry_out(carry_out), .sum(sum));

    initial begin
        $dumpfile("CLA4_tb.vcd");
        $dumpvars(0, CLA4_tb);

        // Test case 1
        A = 4'b0001; B = 4'b0010; carry_in = 1'b0; 
        #10;
        $display("Input           A=1 (4'b%b), B=2 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=3 (4'b0011), Carry_out=1'b0");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd3 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 2
        A = 4'b1111; B = 4'b0001; carry_in = 1'b0;
        #10;
        $display("Input           A=15 (4'b%b), B=1 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=0 (4'b0000), Carry_out=1'b1");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd0 && carry_out == 1'b1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 3
        A = 4'b1010; B = 4'b0101; carry_in = 1'b1;
        #10;
        $display("Input           A=10 (4'b%b), B=5 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=16 (4'b0000), Carry_out=1'b1");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd0 && carry_out == 1'b1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 4
        A = 4'b0110; B = 4'b1001; carry_in = 1'b0;
        #10;
        $display("Input           A=6 (4'b%b), B=9 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=15 (4'b1111), Carry_out=1'b0");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd15 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 5
        A = 4'b1100; B = 4'b0011; carry_in = 1'b1;
        #10;
        $display("Input           A=12 (4'b%b), B=3 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=0 (4'b0000), Carry_out=1'b1");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd0 && carry_out == 1'b1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 6
        A = 4'b0111; B = 4'b0011; carry_in = 1'b1;
        #10;
        $display("Input           A=7 (4'b%b), B=3 (4'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=11 (4'b0000), Carry_out=1'b0");
        $display("Actual output   Sum=%d (4'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 4'd11 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

    end

endmodule

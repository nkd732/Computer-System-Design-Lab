`timescale 1ns / 1ns
`include "q2_b.v"

module CLA16_tb;

    reg [15:0] A;
    reg [15:0] B;
    reg carry_in;
    wire carry_out;
    wire [15:0] sum;

    CLA16 dut(.A(A), .B(B), .carry_in(carry_in), .carry_out(carry_out), .sum(sum));

    initial begin
        $dumpfile("CLA16_tb.vcd");
        $dumpvars(0, CLA16_tb);

        // Test case 1
        A = 16'b0000000000001010; B = 16'b0000000000000101; carry_in = 1'b0; 
        #10;
        $display("Input           A=10 (16'b%b), B=5 (16'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=15 (16'b0000000000001111), Carry_out=1'b0");
        $display("Actual output   Sum=%d (16'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 16'd15 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 2
        A = 16'b1111111111111111; B = 16'b0000000000000001; carry_in = 1'b0;
        #10;
        $display("Input           A=65535 (16'b%b), B=1 (16'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=0 (16'b0000000000000000), Carry_out=1'b1");
        $display("Actual output   Sum=%d (16'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 16'd0 && carry_out == 1'b1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 3
        A = 16'b0000010011010010; B = 16'b0001011000011110; carry_in = 1'b0;
        #10;
        $display("Input           A=1234 (16'b%b), B=5662 (16'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=6896 (16'b0001101101110001), Carry_out=1'b0");
        $display("Actual output   Sum=%d (16'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 16'd6896 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 4
        A = 16'b1000000000000000; B = 16'b1000000000000000; carry_in = 1'b0;
        #10;
        $display("Input           A=32768 (16'b%b), B=32768 (16'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=0 (16'b0000000000000000), Carry_out=1'b1");
        $display("Actual output   Sum=%d (16'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 16'd0 && carry_out == 1'b1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 5
        A = 16'b0111111111111111; B = 16'b0111111111111111; carry_in = 1'b1;
        #10;
        $display("Input           A=32767 (16'b%b), B=32767 (16'b%b), Carry_in=1'b%b", A, B, carry_in);
        $display("Expected output Sum=65535 (16'b1111111111111111), Carry_out=1'b0");
        $display("Actual output   Sum=%d (16'b%b), Carry_out=1'b%b", sum, sum, carry_out);
        if (sum == 16'd65535 && carry_out == 1'b0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

    end

endmodule



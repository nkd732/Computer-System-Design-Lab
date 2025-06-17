`timescale 1ns/1ns
`include "q3.v"

module Adder4_tb;

    reg [3:0] x1, x2, x3, x4;
    wire [3:0] sum;
    wire [1:0] count;

    // Instantiate the Adder4 module
    Adder4 dut(
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .sum(sum),
        .count(count)
    );

    initial begin
        $dumpfile("Adder4_tb.vcd");
        $dumpvars(0, Adder4_tb);

        // Test case 1
        x1 = 4'b0001; x2 = 4'b0010; x3 = 4'b0011; x4 = 4'b0100; 
        #10;
        $display("Input           X1=1 (4'b%b), X2=2 (4'b%b), X3=3 (4'b%b), X4=4 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 10 (4'b1010), Count=2'b11");
        $display("Actual output   Sum= %d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd10 && count == 2'b11) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 2
        x1 = 4'b1111; x2 = 4'b0001; x3 = 4'b0010; x4 = 4'b0011;
        #10;
        $display("Input           X1=15 (4'b%b), X2=1 (4'b%b), X3=2 (4'b%b), X4=3 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 0 (4'b0000), Count=2'b00");
        $display("Actual output   Sum=%d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd0 && count == 2'b00) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 3
        x1 = 4'b0100; x2 = 4'b0100; x3 = 4'b1000; x4 = 4'b0001;
        #10;
        $display("Input           X1=4 (4'b%b), X2=4 (4'b%b), X3=8 (4'b%b), X4=1 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 8 (4'b1000), Count=2'b01");
        $display("Actual output   Sum=%d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd8 && count == 2'b01) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 4
        x1 = 4'b0011; x2 = 4'b0011; x3 = 4'b0011; x4 = 4'b0011;
        #10;
        $display("Input           X1=3 (4'b%b), X2=3 (4'b%b), X3=3 (4'b%b), X4=3 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 12 (4'b1100), Count=2'b11");
        $display("Actual output   Sum= %d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd12 && count == 2'b11) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 5
        x1 = 4'b1110; x2 = 4'b0011; x3 = 4'b0101; x4 = 4'b0110;
        #10;
        $display("Input           X1= 14 (4'b%b), X2=3 (4'b%b), X3=5 (4'b%b), X4=6 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 0 (4'b0000), Count=2'b00");
        $display("Actual output   Sum=%d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd0 && count == 2'b00) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        // Test case 6
        x1 = 4'b0010; x2 = 4'b1001; x3 = 4'b0011; x4 = 4'b0101;
        #10;
        $display("Input           X1=2 (4'b%b), X2=9 (4'b%b), X3=3 (4'b%b), X4=5 (4'b%b)", x1, x2, x3, x4);
        $display("Expected output Sum= 14 (4'b1110), Count=2'b10"); // X1 + X2 + X3 = 2 + 9 + 3 = 14
        $display("Actual output   Sum= %d (4'b%b), Count=2'b%b", sum, sum, count);
        if (sum == 4'd14 && count == 2'b10) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");


    end

endmodule

module FA(
    input a, input b, input cin,
    output cout, output sum);

    wire xor1, and1, and2;

    xor (xor1, a, b);
    xor (sum, xor1, cin);

    and (and1, a, b);
    and (and2, xor1, cin);
    or  (cout, and1, and2);
endmodule


module RCA4 (input [3:0] A, input [3:0] B, input carry_in, output carry_out, output [3:0] sum);

wire [2:0] cou;
FA fa1(A[0], B[0], carry_in, cou[0], sum[0]);
FA fa2(A[1], B[1], cou[0], cou[1], sum[1]);
FA fa3(A[2], B[2], cou[1], cou[2], sum[2]);
FA fa4(A[3], B[3], cou[2], carry_out, sum[3]);

endmodule

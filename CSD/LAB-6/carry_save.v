module  full_adder(
    input a, input b, input cin,
    output cout, output sum);

    wire xor1, and1, and2;

    xor (xor1, a, b);
    xor (sum, xor1, cin);

    and (and1, a, b);
    and (and2, xor1, cin);
    or  (cout, and1, and2);
endmodule


module carry_save(
    input [3:0] A, B,   
    output [7:0] P      
);
    wire [3:0] pp0, pp1, pp2, pp3;

    and(pp0[0], A[0], B[0]);
    and(pp0[1], A[1], B[0]);
    and(pp0[2], A[2], B[0]);
    and(pp0[3], A[3], B[0]);

    and(pp1[0], A[0], B[1]);
    and(pp1[1], A[1], B[1]);
    and(pp1[2], A[2], B[1]);
    and(pp1[3], A[3], B[1]);

    and(pp2[0], A[0], B[2]);
    and(pp2[1], A[1], B[2]);
    and(pp2[2], A[2], B[2]);
    and(pp2[3], A[3], B[2]);

    and(pp3[0], A[0], B[3]);
    and(pp3[1], A[1], B[3]);
    and(pp3[2], A[2], B[3]);
    and(pp3[3], A[3], B[3]);


    wire c1_1, c1_2, c1_3, c1_4;
    wire s1_1, s1_2, s1_3, s1_4;
    
    full_adder fa1_0 (.a(pp0[1]), .b(pp1[0]), .cin(1'b0), .sum(s1_1), .cout(c1_1));
    full_adder fa1_1 (.a(pp0[2]), .b(pp1[1]), .cin(pp2[0]), .sum(s1_2), .cout(c1_2));
    full_adder fa1_2 (.a(pp0[3]), .b(pp1[2]), .cin(pp2[1]), .sum(s1_3), .cout(c1_3));
    full_adder fa1_3 (.a(1'b0), .b(pp1[3]), .cin(pp2[2]), .sum(s1_4), .cout(c1_4));

    wire c2_1, c2_2, c2_3, c2_4;
    wire s2_1, s2_2, s2_3, s2_4;

    full_adder fa2_0 (.a(s1_2), .b(1'b0), .cin(c1_1), .sum(s2_1), .cout(c2_1));
    full_adder fa2_1 (.a(s1_3), .b(pp3[0]), .cin(c1_2), .sum(s2_2), .cout(c2_2));
    full_adder fa2_2 (.a(s1_4), .b(pp3[1]), .cin(c1_3), .sum(s2_3), .cout(c2_3));
    full_adder fa2_3 (.a(pp2[3]), .b(pp3[2]), .cin(c1_4), .sum(s2_4), .cout(c2_4));

    wire c3_1, c3_2, c3_3, c3_4;
    wire s3_1, s3_2, s3_3, s3_4;

    full_adder fa3_0 (.a(s2_2), .b(c2_1), .cin(1'b0), .sum(s3_1), .cout(c3_1));
    full_adder fa3_1 (.a(s2_3), .b(c2_2), .cin(c3_1), .sum(s3_2), .cout(c3_2));
    full_adder fa3_2 (.a(s2_4), .b(c2_3), .cin(c3_2), .sum(s3_3), .cout(c3_3));
    full_adder fa3_3 (.a(pp3[3]), .b(c2_4), .cin(c3_3), .sum(s3_4), .cout(c3_4));

    
    buf(P[0], pp0[0]);
    buf(P[1], s1_1);
    buf(P[2], s2_1);
    buf(P[3], s3_1);
    buf(P[4], s3_2);
    buf(P[5], s3_3);
    buf(P[6], s3_4);
    buf(P[7], c3_4);

endmodule

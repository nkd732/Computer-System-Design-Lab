module half_adder(output s, output c, input a, input b);

    and (c,a,b);
    xor(s,a,b);

endmodule
module full_adder(output s, output c1, input a, input b, input c0);
    
    half_adder h1(s1,c,a,b);
    xor(s,s1,c0);
    and(t1,s1,c0);
    or(c1,t1,c);
    // and(g,a,b);
    // xor(p,a,b);
    // and(t1,p,c0);
    // or(c1,t1,g);
    // xor(s,p,c0);

endmodule

module CLA4 (input [3:0]A,input [3:0]B,input carry_in, output carry_out, output [3:0] sum);

    wire [3:0]p;
    wire [3:0]g;
    wire [3:0]c;

    xor(p[0],A[0],B[0]);
    xor(p[1],A[1],B[1]);
    xor(p[2],A[2],B[2]);
    xor(p[3],A[3],B[3]);

    and(g[0],A[0],B[0]);
    and(g[1],A[1],B[1]);
    and(g[2],A[2],B[2]);
    and(g[3],A[3],B[3]);

    and(e,p[0],carry_in);
    or(c[0],e,g[0]);

    and(f1,p[1],p[0],carry_in);
    and(f2,p[1],g[0]);
    or(c[1],f1,f2,g[1]);

    and(g1,p[2],p[1],p[0],carry_in);
    and(g2,p[2],p[1],g[0]);
    and(g3,p[2],g[1]);
    or(c[2],g1,g2,g3,g[2]);

    and(h1,p[3],p[2],p[1],p[0],carry_in);
    and(h2,p[3],p[2],p[1],g[0]);
    and(h3,p[3],p[2],g[1]);
    and(h4,p[3],g[2]);
    or(c[3],h1,h2,h3,h4,g[3]);
    or(carry_out,h1,h2,h3,h4,g[3]);
        
    xor(sum[0],p[0],carry_in);
    xor(sum[1],p[1],c[0]);
    xor(sum[2],p[2],c[1]);
    xor(sum[3],p[3],c[2]);
endmodule
module  wallace_tree(input [3:0] op1,op2, output [7:0] res);

    wire [3:0] pp0, pp1, pp2, pp3;
wire finalc;

    and(pp0[0], op1[0], op2[0]);
    and(pp0[1], op1[1], op2[0]);
    and(pp0[2], op1[2], op2[0]);
    and(pp0[3], op1[3], op2[0]);

    and(pp1[0], op1[0], op2[1]);
    and(pp1[1], op1[1], op2[1]);
    and(pp1[2], op1[2], op2[1]);
    and(pp1[3], op1[3], op2[1]);

    and(pp2[0], op1[0], op2[2]);
    and(pp2[1], op1[1], op2[2]);
    and(pp2[2], op1[2], op2[2]);
    and(pp2[3], op1[3], op2[2]);

    and(pp3[0], op1[0], op2[3]);
    and(pp3[1], op1[1], op2[3]);
    and(pp3[2], op1[2], op2[3]);
    and(pp3[3], op1[3], op2[3]);
    wire c3_1,c4_1,c2_1;//carrys of the 3 half-adders
    wire hs1,hs2,hs3;//sum of the first 3 half-adders
wire c1,c2;//for the last ahlf-adder and full-adder
wire fc1,fc2,fc3;
wire fs1,fs2,fs3;

wire [3:0] S,C;

assign res[0]=pp0[0];
//4th full-adder and full-adder
half_adder ha4(res[1],c1,pp1[0],pp0[1]);
full_adder fa4(res[2],c2,pp0[2],c1,hs3);
//lvl1
    half_adder ha1(C[0],c3_1,pp3[0],pp2[1]);
    half_adder ha2(hs2,c4_1,pp3[1],pp2[2]);

//lvl2
    half_adder ha3(hs3,c2_1,pp2[0],pp1[1]);
    full_adder fa1(S[0],C[1],pp0[3],pp1[2],hs1);
    full_adder fa2(S[1],C[2],pp1[3],c3_1,hs2);
    full_adder fa3(S[2],C[3],pp2[3],pp3[2],c4_1);

assign S[3] = pp3[3];

CLA4 clafinal(C,S,c2,res[7],res[6:3]);
    
endmodule

module priority_encoder( input [3:0] i, output [1:0] o);

    wire [3:0] n;
    wire and1, and2, and3;

    not (n[0], i[0]);
    not (n[1], i[1]);
    not (n[2], i[2]);
    not (n[3], i[3]);

    and(and1, n[0], n[1]);
    and(o[1], n[2], and1);

    and(and2, and1, i[2]);
    and(and3, and1, n[3]);
    or(o[0], and2, and3);


endmodule


module mux(output Y, input[3:0] A, input[1:0] sel);

    wire [1:0] nsel;
    wire [3:0] an;

    not nt[1:0] (nsel, sel);

    and (an[0], nsel[1], nsel[0], A[0]);
    and (an[1], nsel[1], sel[0], A[1]);
    and (an[2], sel[1], nsel[0], A[2]);
    and (an[3], sel[1], sel[0], A[3]);

    or (Y, an[0], an[1], an[2], an[3]);
    
    
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


module Adder4 (input [3:0] x1,x2,x3,x4, output [3:0] sum, output [1:0] count);

    wire [3:0] c;
    buf(c[0], 0);
    wire [3:0] s1, s2, s3;


    CLA4 cla1 (x1, x2, c[0], c[1], s1);
    CLA4 cla2 (x3, s1, c[0], c[2], s2);
    CLA4 cla3 (x4, s2, c[0], c[3], s3);
    
    wire [3:0] i0, i1, i2, i3;

    buf(i0[0], 0);
    buf(i0[1], s1[0]);
    buf(i0[2], s2[0]);
    buf(i0[3], s3[0]);

    buf(i1[0], 0);
    buf(i1[1], s1[1]);
    buf(i1[2], s2[1]);
    buf(i1[3], s3[1]);

    buf(i2[0], 0);
    buf(i2[1], s1[2]);
    buf(i2[2], s2[2]);
    buf(i2[3], s3[2]);

    buf(i3[0], 0);
    buf(i3[1], s1[3]);
    buf(i3[2], s2[3]);
    buf(i3[3], s3[3]);


    priority_encoder pe1 (c, count);

    mux m0(sum[0], i0, count);
    mux m1(sum[1], i1, count);
    mux m2(sum[2], i2, count);
    mux m3(sum[3], i3, count);

endmodule
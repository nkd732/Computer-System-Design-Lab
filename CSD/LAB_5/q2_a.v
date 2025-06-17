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
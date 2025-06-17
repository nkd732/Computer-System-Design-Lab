module q1b( output f, input x, input y, input z)

    wire or1, or2, or3;
    wire xc, yc, zc;
    wire t1, t2, t3;

    not( xc, x);
    not( yc, y);
    not( zc, z);


    or( or1, x, y);
    or( or2, xc, yc);
    or( or3, yc, z);

    not ( t1, or1);
    not ( t2, or2);
    not ( t3, or3);
    or(f, t1, t2, t3);
    
endmodule
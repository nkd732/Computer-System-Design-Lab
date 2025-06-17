module q1c(output f, input x, input y, input z)

    wire and1, and2, and3;
    wire xc, yc, zc;
    wire t1, t2, t3;
    
    not( xc, x);
    not( yc, y);
    not( zc, z);


    and( and1, x, y);
    not( t1, and1);
    and( and2, xc, yc);
    not( t2, and2);
    and( and3, yc, z);
    not( t3, and3);

    not( f, t1, t2, t3);


endmodule
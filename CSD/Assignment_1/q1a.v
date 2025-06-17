module q1a( output f, input x, input y, input z);
    wire and1, and2, and3;
    wire xc, yc, zc;
    
    not( xc, x);
    not( yc, y);
    not( zc, z);

    and (and1, x, y);
    and (and2, xc, yc);
    and (and3, yc, z);

    or (f, and1, and2, and3);

endmodule





module F_nand(output f, input x, input y, input z, input w)

    wire xnot, ynot, wnot, znot;

    nand( xnot, x, x);
    nand( ynot, y, y);
    nand( znot, z, z);
    nand( wnot, w, w);

    wire t1, t2, t3, t4;
    wire and1, and2, and3, and4;

    nand( t1, x, y);
    nand( and1, t1, t1);

    nand( t2, xnot, ynot);
    nand( and2, t2, t2);

    nand( t3, wnot, z);
    nand( and3, t3, t3);

    nand( t4, w, znot);
    nand( and4, t4, t4);

    or( f, and1, and2, and3, and4);

endmodule
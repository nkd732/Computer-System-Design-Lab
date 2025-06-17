module q2a( output f, input a, input b, input c, input d);

    wire and1, and2, and3, and4, and5, and6, and7, and8;
    wire ac, bc, cc, dc;

    not( ac, a);
    not( bc, b);
    not( cc, c);
    not( dc, d);

    and( and1, ac, bc, cc, dc);
    and( and2, ac, bc, cc, d);
    and( and3, ac, b, cc, dc);
    and( and0, ac, b, cc, d);
    and( and5, a, b, c, d);
    and( and6, a, b, c, dc);
    and( and7, a, bc, c, dc);
    and( and8, a, bc, c, d);

    or ( f, and1, and2, and3, and0, and5, and6, and7, and8);

endmodule
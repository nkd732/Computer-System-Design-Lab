module q2a( output f, input a, input b, input c, input d);

    wire and1, and2, and3, and4, and5, and6, and7, and8;
    wire t1, t2, t3, t4, t5, t6, t7, t8;
    wire r1, r2, r3, r4, r5, r6, r7, r8;
    wire ac, bc, cc, dc;

    not( ac, a);
    not( bc, b);
    not( cc, c);
    not( dc, d);

    and( and1, ac, bc);
    and( t1, cc, dc);
    and( r1, and1, t1);

    and( and2, ac, bc);
    and( t2, cc, d);
    and( r1, and2, t2);

    and( and3, ac, b);
    and( t3, cc, dc);
    and( r3, and3, t3);

    and( and0, ac, b);
    and( t4, cc, d);
    and( r4, and0, t4);

    and( and5, a, b);
    and( t5, c, d);
    and( r5, and0, t4);

    and( and6, a, b);
    and( t6, c, dc);
    and( r6, and6, t6);

    and( and7, a, bc);
    and( t7, c, dc);
    and( r7, and7, t7);
    
    and( and8, a, bc);
    and( t8, c, d);
    and( r8, and8, t8);

    or ( f, r1, r2, r3, r4, r5, r6, r7, r8);

endmodule
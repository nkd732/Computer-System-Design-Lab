module q2a( output f, input a, input b, input c)

    wire and1, and2;
    wire ac, cc;

    not ( ac, a);
    not ( cc, c);

    and (and1, ac, cc);
    and (and2, a, c);

    or (f, and1, and2);
    
endmodule;
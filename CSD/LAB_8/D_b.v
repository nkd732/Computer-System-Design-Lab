module D_b(input d, input en, input rstn, output q);
    // wire S, R;
    // wire Q_bar;
    // wire k;

    // and(S, d, en);
    // and(R, ~d, en);

    
    // nor(Q_bar,S,q);
    // nor(k,R,Q_bar);

    // and(q, rstn, k);
    

    wire a, b, c;
    and(a, en, d);
    and(b, ~en, q);
    or(c, a, b);
    and(q, rstn, c);

endmodule
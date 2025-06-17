module SR_b(output Q, output Q_bar, input S, input R);
    wire A;
    wire B;

    nor(Q_bar,S,Q);
    nor(Q,R,Q_bar);

endmodule

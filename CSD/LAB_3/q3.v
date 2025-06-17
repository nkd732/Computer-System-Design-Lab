`include "q2.v"

module row_col_encoder (input [8:0] d, output [1:0] row, output[1:0] col, output v);

    wire [3:0] r;
    wire [3:0] c;
    wire i0 = 1'b0;
    wire v;

    or (vr, r[0], r[1], r[2], r[3]);
    or (vc, c[0], c[1], c[2], c[3]);

    and (v, vr, vc);

    buf(r[0], i0);
    or(r[1], d[0], d[1], d[2]);
    or(r[2], d[3], d[4], d[5]);
    or(r[3], d[6], d[7], d[8]);
    
    buf(c[0], i0);
    or(c[1], d[0], d[3], d[6]);
    or(c[2], d[1], d[4], d[7]);
    or(c[3], d[2], d[5], d[8]);


    priority_encoder i_one(.i(r), .o(row), .v(v));
    priority_encoder i_two(.i(c), .o(col), .v(v));


endmodule
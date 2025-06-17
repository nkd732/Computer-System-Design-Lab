module dmux2(output [1:0] Y, input A, input sel);
    wire nsel;

    not (nsel, sel);
    and (Y[0], nsel, A);
    and (Y[1], sel, A);

endmodule

module dmux4 (output [3:0] Y, input A, input[1:0] sel);

    wire [1:0] nsel;
    wire [3:0] an;

    not nt[1:0] (nsel, sel);

    and (Y[0], nsel[1], nsel[0], A);
    and (Y[1], nsel[1], sel[0], A);
    and (Y[2], sel[1], nsel[0], A);
    and (Y[3], sel[1], sel[0], A);
        
endmodule

module demux_1x8 (output [7:0] out, input in, input [2:0] sel);

    wire [1:0] lev;

    dmux2 amux (.Y(lev), .A(in), .sel(sel[2]));
    dmux4 bmux (.Y(out[3:0]), .A(lev[0]), .sel(sel[1:0]));
    dmux4 cmux (.Y(out[7:4]), .A(lev[1]), .sel(sel[1:0]));


endmodule

module mux(output Y, input[3:0] A, input[1:0] sel);

    wire [1:0] nsel;
    wire [3:0] an;

    not nt[1:0] (nsel, sel);

    and (an[0], nsel[1], nsel[0], A[0]);
    and (an[1], nsel[1], sel[0], A[1]);
    and (an[2], sel[1], nsel[0], A[2]);
    and (an[3], sel[1], sel[0], A[3]);

    or (Y, an[0], an[1], an[2], an[3]);
    
    
endmodule

module mux_16x1 (output out, input [15:0] in, input [3:0] sel);

    wire [3:0] lev1;

    mux mux1 (.Y(lev1[0]), .A(in[3:0]), .sel(sel[1:0]));
    mux mux2 (.Y(lev1[1]), .A(in[7:4]), .sel(sel[1:0]));
    mux mux3 (.Y(lev1[2]), .A(in[11:8]), .sel(sel[1:0]));
    mux mux4 (.Y(lev1[3]), .A(in[15:12]), .sel(sel[1:0]));

    mux mux5 (.Y(out), .A(lev1), .sel(sel[3:2]));


endmodule
module mux (output [3:0] O, input [3:0] A, input [3:0] B, input [3:0] C, input [3:0] D, input [1:0] sel);

    assign O[0] = (~sel[1] & ~sel[0] & A[0]) | (~sel[1] & sel[0] & B[0]) | (sel[1] & ~sel[0] & C[0]) | (sel[1] & sel[0] & D[0]);
    assign O[1] = (~sel[1] & ~sel[0] & A[1]) | (~sel[1] & sel[0] & B[1]) | (sel[1] & ~sel[0] & C[1]) | (sel[1] & sel[0] & D[1]);
    assign O[2] = (~sel[1] & ~sel[0] & A[2]) | (~sel[1] & sel[0] & B[2]) | (sel[1] & ~sel[0] & C[2]) | (sel[1] & sel[0] & D[2]);
    assign O[3] = (~sel[1] & ~sel[0] & A[3]) | (~sel[1] & sel[0] & B[3]) | (sel[1] & ~sel[0] & C[3]) | (sel[1] & sel[0] & D[3]);

endmodule 

module dmux (output [3:0] Y, input A, input[1:0] sel);

    wire [1:0] nsel;
    wire [3:0] an;

    not nt[1:0] (nsel, sel);

    and (Y[0], nsel[1], nsel[0], A);
    and (Y[1], nsel[1], sel[0], A);
    and (Y[2], sel[1], nsel[0], A);
    and (Y[3], sel[1], sel[0], A);
        
endmodule

module decoder (output [6:0] Y, input [3:0] O);
    wire z = o[0];
    wire y = o[1];
    wire x = o[2];
    wire w = o[3];
    wire nx, ny, nz;
    wire and1, and2, and3, and4, and5, and6, and7, and8, and9, and10;

    not(nx, x);
    not(ny, y);
    not(nz, z);
    not(nw,w);

    xnor(xnor1, x,z);
    or (Y[6], w, y, xnor1);

    and(and1, y, z);
    and(and2, ny, nz);
    or(Y[5], nx, and1, and2);

    or (Y[4], x, ny, z);

    and(and3, nw, ny, z);
    and(and4, nz, y);
    and(and5, nx, y);
    or(Y[3], w, and3, and4, and5);

    and(and6, ny, nx, nz);
    and(and7, w, nz);
    or(Y[2], and4, and6, and7);

    and(and8, x, nz);
    and(and9, x, ny);
    and(and10, ny, nz);
    or(Y[1], and8, and9, and10, w);


    or(Y[0], and4, and9, w, nx);

endmodule

module top(output[6:0] Y,output en_a,en_b,en_c,en_d, input[3:0] a,b,c,d, input[1:0] sel,input en); 
    wire [3:0] O;
    wire [3:0] enn;
    buf (enn[0], en_a);
    buf (enn[1], en_b);
    buf (enn[2], en_c);
    buf (enn[3], en_d);


    mux mux1(.O(O), .A(a), .B(b), .C(c), .D(d), .sel(sel));

    decoder deco(.Y(Y), .O(O));
    dmux dem(.A(enn), .sel(sel));

endmodule
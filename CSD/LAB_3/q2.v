module priority_encoder( input [3:0] i, output [1:0] o, output v);

    wire i0c, i1c, i3c;
    wire and1, or1, or2;

    not (i0c, i[0]);
    not (i1c, i[1]);
    not (i2c, i[2]);

    and (and1, i0c, i1c);
    or (or1, i[2], i[3]);
    
    or( or2, i[1], i2c);


    and (o[1], and1, or1);
    and (o[0], or2, i0c);
    or (v, i[0], i[1], i[2], i[3]);


endmodule
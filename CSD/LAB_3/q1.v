module decoder( input [1:0] i, output [3:0] o);

    wire i0c, i1c;
    
    not (i0c, i[0]);
    not (i1c, i[1]);

    and (o[0], i1c, i0c);
    and (o[1], i1c, i[0]);
    and (o[2], i[1], i0c);
    and (o[3], i[1], i[0]);

endmodule
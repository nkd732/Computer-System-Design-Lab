module D_a(input d, input en, input rstn, output reg q);

always @(en, rstn)
if(rstn == 1)
    begin
        q<=1'b0;
    end
else 
    begin
        if(en == 1) q<= d;
    end

endmodule

module D_FF_ED (input D, input CLK, input RESET, output Q);

wire nclk;
not(nclk, CLK);
and(en, nclk, CLK);
D_a D1(D, en, RESET, Q);


endmodule
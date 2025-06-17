module D_l(input d, input en, input rstn, output reg q);

always @(en, rstn,d)
if(rstn == 1)
    begin
        q<=1'b0;
    end
else 
    begin
        if(en == 1) q<= d;
    end

endmodule

module D_FF_MS (input D, input CLK, input RESET, output Q);

wire d1;
wire nclk;

not(nclk, CLK);

D_l D1(D,CLK, RESET, d1);
D_l D2(d1,nclk, RESET, Q);


endmodule
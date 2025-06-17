module D_a(input d, input en, input rstn, output reg q);

always @(en, rstn)
if(rstn == 0)
    begin
        q<=1'b0;
    end
else 
    begin
        if(en == 1) q<= d;
    end

endmodule

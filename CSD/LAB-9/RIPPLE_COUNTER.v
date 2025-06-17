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

// Ripple Counter Module
module RIPPLE_COUNTER (
    input CLK,            
    input RESET,          
    output [3:0] COUNT    
);
    wire [3:0] q; 
    
    not(q[0], COUNT[0]);
    not(q[1], COUNT[1]);
    not(q[2], COUNT[2]);
    not(q[3], COUNT[3]);

    // Connect the flip-flops to form a ripple counter
    D_FF_ED ff0 (q[0], CLK, RESET, COUNT[0]);  // LSB flip-flop
    D_FF_ED ff1 (q[1], q[0], RESET, COUNT[1]);  // Second flip-flop
    D_FF_ED ff2 (q[2], q[1], RESET, COUNT[2]);  // Third flip-flop
    D_FF_ED ff3 (q[3], q[2], RESET, COUNT[3]);  // MSB flip-flop

    
endmodule
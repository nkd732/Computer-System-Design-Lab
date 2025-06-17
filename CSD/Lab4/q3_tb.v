`timescale 1ns / 1ns
`include "q3-2bit.v"

module top_tb;

    reg [1:0] a, b, c, d;
    reg [1:0] sel;
    reg en;
    wire[6:0] y;
    wire en_a, en_b, en_c, en_d;

    reg[6:0] seg [0:15];
    reg [1:0] bcd;

top dut(.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y), 
        .en_a(en_a), .en_b(en_b), .en_c(en_c), .en_d(en_d));

    integer i,s;
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
       

        for(s=0; s < (1 << 2); s+=1) begin
            for (i=0; i < 1 << 8; i+=1) begin
                sel = s; en = 1;
                {d,c,b,a} = i;
                bcd = {d,c,a,b};
                bcd = i[s*2 +: 2];
                seg [0] = 7'b111_1110;
                seg [1] = 7'b011_0000;
                seg [2] = 7'b110_1101;
                seg [3] = 7'b111_1001;
                #10

                if ( y != seg[bcd]) begin
                    $display("\n------------------------ Test case failed !!! ------------------------");
                    $display("Input: %0d ; Select: %2b ;\nExpected output: %7b \nReceived output %7b ", bcd,sel,seg[bcd],y);
                    if(i == (1<<5))
                    $finish;
                end

                else if ((i+s) == (1 << 16)) begin
                    $display("\n------------------------ All tests passed !!! ------------------------");
                end
            end
            
        end
        $display("\n------------------------ Simulation Done !!! ------------------------\n");
    end

endmodule
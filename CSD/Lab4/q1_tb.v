`timescale 1ns / 1ns
`include "mux.v"

module mux_16x1_tb;

    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    mux_16x1 dut(.in(in), .sel(sel), .out(out));

    integer i,s;

    initial begin
        $dumpfile("mux_16x1_tb.vcd");
        $dumpvars(0, mux_16x1_tb);
    end

    initial begin

        for (s=0; s < (1 << 4); s+=1)begin
            sel = s;

            for(i=0; i < (1 << 16); i+=1) begin
                in = i; #10

                if ( out != ((in >> sel) & 1)) begin
                    $display("\n------------------------ Test case failed !!! ------------------------");
                    $display("Input: %16b ; Select: %4b ;\nExpected output: %1b \nReceived output %1b ", in,sel,(in[sel]),out);
                end

                else if ((i+1)*(s+1) == (1 << 20)) begin
                    $display("\n------------------------ All tests passed !!! ------------------------");
                end
                
            end
        end

        $display("\n------------------------ Simulation Done !!! ------------------------\n");
    end

endmodule

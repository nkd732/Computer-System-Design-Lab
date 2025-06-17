`timescale 1ns / 1ns
`include "demux.v"

module demux_1x8_tb;

    reg in;
    reg [2:0] sel;
    wire [7:0] out;

    demux_1x8 dut(.in(in), .sel(sel), .out(out));

    integer o,s;
    initial begin
        $dumpfile("demux_1x8_tb.vcd");
        $dumpvars(0, demux_1x8_tb);
    end

    initial begin

        in = 1'b1;
        for(s=0; s < (1 << 3); s+=1) begin
            sel = s; #10

            if ( out != (in << sel)) begin
                $display("\n------------------------ Test case failed !!! ------------------------");
                $display("Input: %1b ; Select: %4b ;\nExpected output: %08b \nReceived output %8b ", in,sel,(in << sel),out);
            end

            else if ((s+1) == (1 << 3)) begin
                $display("\n------------------------ All tests passed !!! ------------------------");
            end
            
        end
        $display("\n------------------------ Simulation Done !!! ------------------------\n");
    end

endmodule

`timescale 1ns / 1ns
`include "q1.v"

module decoder_tb;

    reg [1:0] i;
    wire [3:0] o;

    decoder dut(.i(i), .o(o));

    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, decoder_tb);

        i=2'b00; 
        #10;
        $display("Input           i=2'b00 \nExpected output o=4'b0001 \nActual output   o=4'b%b ", o);
        if (o==4'b0001) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=2'b01; 
        #10;
        $display("Input           i=2'b01 \nExpected output o=4'b0010 \nActual output   o=4'b%b ", o);
        if (o==4'b0010) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=2'b10; 
        #10;
        $display("Input           i=2'b10 \nExpected output o=4'b0100 \nActual output   o=4'b%b ", o);
        if (o==4'b0100) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=2'b11; 
        #10;
        $display("Input           i=2'b11 \nExpected output o=4'b1000 \nActual output   o=4'b%b ", o);
        if (o==4'b1000) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");


    end

endmodule

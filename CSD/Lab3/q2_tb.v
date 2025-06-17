`timescale 1ns / 1ns
`include "q2.v"

module priority_encoder_tb;

    reg [3:0] i;
    wire [1:0] o;
    wire v;

    priority_encoder dut(.i(i), .o(o), .v(v));

    initial begin
        $dumpfile("priority_encoder_tb.vcd");
        $dumpvars(0, priority_encoder_tb);

        i=4'b0000; 
        #10;
        $display("Input           i=4'b0000 \nExpected output v=0 \nActual output   v=%b ", v);
        if (v==0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b0001; 
        #10;
        $display("Input           i=4'b0001 \nExpected output o=2'b00 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b00 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b0010; 
        #10;
        $display("Input           i=4'b0010 \nExpected output o=2'b01 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b01 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b0100; 
        #10;
        $display("Input           i=4'b0100 \nExpected output o=2'b10 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b10 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b1000; 
        #10;
        $display("Input           i=4'b1000 \nExpected output o=2'b11 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b11 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b1111; 
        #10;
        $display("Input           i=4'b1111 \nExpected output o=2'b00 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b00 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b1100; 
        #10;
        $display("Input           i=4'b1100 \nExpected output o=2'b10 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b10 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b1011; 
        #10;
        $display("Input           i=4'b1011 \nExpected output o=2'b00 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b00 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        i=4'b0110; 
        #10;
        $display("Input           i=4'b0110 \nExpected output o=2'b01 v=1 \nActual output   o=2'b%b v=%b ", o, v);
        if (o==2'b01 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");


    end

endmodule

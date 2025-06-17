`timescale 1ns / 1ns
`include "q3.v"

module row_col_encoder_tb;

    reg [8:0] d;
    wire [1:0] row;
    wire [1:0] col;
    wire v;

    row_col_encoder dut(.d(d), .row(row), .col(col), .v(v));

    initial begin
        $dumpfile("row_col_encoder_tb.vcd");
        $dumpvars(0, row_col_encoder_tb);

        d=9'b000000000; 
        #10;
        $display("Input           d=9'b000000000 \nExpected output v=0 \nActual output   v=%b ", v);
        if (v==0) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000000001; 
        #10;
        $display("Input           d=9'b000000001 \nExpected output row=2'b01 col=2'b01 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b01 && col==2'b01 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000000010; 
        #10;
        $display("Input           d=9'b000000010 \nExpected output row=2'b01 col=2'b10 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b01 && col==2'b10 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000000100; 
        #10;
        $display("Input           d=9'b000000100 \nExpected output row=2'b01 col=2'b11 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b01 && col==2'b11 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000001000; 
        #10;
        $display("Input           d=9'b000001000 \nExpected output row=2'b10 col=2'b01 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b10 && col==2'b01 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000010000; 
        #10;
        $display("Input           d=9'b000010000 \nExpected output row=2'b10 col=2'b10 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b10 && col==2'b10 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b000100000; 
        #10;
        $display("Input           d=9'b000100000 \nExpected output row=2'b10 col=2'b11 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b10 && col==2'b11 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b001000000; 
        #10;
        $display("Input           d=9'b001000000 \nExpected output row=2'b11 col=2'b01 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b11 && col==2'b01 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b010000000; 
        #10;
        $display("Input           d=9'b010000000 \nExpected output row=2'b11 col=2'b10 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b11 && col==2'b10 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");

        d=9'b100000000; 
        #10;
        $display("Input           d=9'b100000000 \nExpected output row=2'b11 col=2'b11 v=1 \nActual output   row=2'b%b col=2'b%b v=%b ", row, col, v);
        if (row==2'b11 && col==2'b11 && v==1) $display("Testcase Passed\n");
        else $display("Testcase Failed\n");


    end

endmodule

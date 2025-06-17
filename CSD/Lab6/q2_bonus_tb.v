`timescale 1ns/1ps
`include "wallace_tree_6.v"

module tb_wallace;
    reg[5:0] op1,op2;
    wire[11:0] res;
    reg[11:0] temp;
    integer i,j;

    wallace_tree_6 dut(op1,op2,res);

    initial begin
        $dumpfile("wallace_mul.vcd");
        $dumpvars(0, tb_wallace);
    end

    initial begin
       for ( i=0 ; i < (1<<6) ; i=i+1 ) begin
            op1 = i;
           for ( j=0 ; j < (1<<6) ; j=j+1 ) begin
               op2 = j; #10
               temp = op1*op2;
               if(res != (temp)) begin
                    $display("\n--------------------------- Test case failed !!! ---------------------------");
                    $display("Operand-1: %d; Operand-2: %d; \nExpected Output: %d \nReceived Output: %d",op1,op2,temp,res);
               end
               else if((i+1)*(j+1) == (1 << 12)) begin
                    $display("\n--------------------------- All tests passed !!! ---------------------------");
               end 
           end
       end

        $display("\n--------------------------- Simulation Done !!! ---------------------------\n");
        $finish;
    end

endmodule
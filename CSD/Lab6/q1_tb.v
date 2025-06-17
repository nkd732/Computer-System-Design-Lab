`timescale 1ns / 1ns
`include "carry_save.v"

module tb_carry_save;

    reg [3:0] op1,op2;
    wire [7:0] res;
    reg [7:0] temp;
    integer j;

    carry_save dut(op1,op2,res);

    integer i,s;

    initial begin
        $dumpfile("carry_save.vcd");
        $dumpvars(0, tb_carry_save);
    end

    initial begin
        for (s = 0; s < (1 << 4); s+=1)begin
            op1 = s;

            for(i=0; i < (1 << 4); i+=1) begin
                op2 = i; #10
                temp = op1*op2;
                if ( res != (temp) ) begin
                    $display("\n------------------------ Test case failed !!! ------------------------");
                    $display("Operand-1: %d ; Operand-2: %d ;\nExpected output: %d \nReceived output %d ", op1,op2,temp,res);
                end

                else if ((i+1)*(s+1) == (1 << 8)) begin
                    $display("\n------------------------ All tests passed !!! ------------------------");
                end
                
            end
        end

        $display("\n------------------------ Simulation Done !!! ------------------------\n");
        $finish;
    end

endmodule

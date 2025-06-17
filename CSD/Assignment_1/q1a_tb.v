`timescale 1ns / 1ns  
`include "q1a.v"

module q1a_tb;

    reg x, y, z;  
    wire w;  

    q1a dut(.x(x), .y(y), .z(z), .f(w));

    initial begin        
        
        
        x = 0; y = 0; z = 0;  
        #1 
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);
    
        x=0; y=0; z=1;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=0; y=1; z=0;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=0; y=1; z=1;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=1; y=0; z=0;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=1; y=0; z=1;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=1; y=1; z=0;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);

        x=1; y=1; z=1;
        #1
        $display("Time: %d---x: %b; y: %b; z: %b; Output: %b", $time, x, y, z, w);
    
        $finish;

    end

endmodule
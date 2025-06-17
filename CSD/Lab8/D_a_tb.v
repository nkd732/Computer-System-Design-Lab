    `include "D_a.v"
    module D_a_tb;  
       
       reg d;  
       reg en;  
       reg rstn;  
       reg [2:0] delay;  
       reg [1:0] delay2;  
       integer i;  
      
        
       D_a  uut ( .d (d),  
                  .en (en),  
                  .rstn (rstn),  
                  .q (q));  
      
        
       initial begin  
           // Monitor the output
          $monitor("Time = %0d, D = %b, en = %b, rstn = %b, Q = %b", $time, d, en, rstn, q);
      
          // 1. Initialize testbench variables  
          d <= 0;  
          en <= 0;  
          rstn <= 0;  
      
          // 2. Release reset  
          #10 rstn <= 1;  
      
          // 3. Randomly change d and enable  
          for (i = 0; i < 5; i=i+1) begin  
             delay = $random;  
             delay2 = $random;  
             #(delay2) en <= ~en;  
             #(delay) d <= i;  
          end  
          #10 rstn <= 0;
          #10 rstn <= 1;
          #10 $finish;
       end  
    endmodule  
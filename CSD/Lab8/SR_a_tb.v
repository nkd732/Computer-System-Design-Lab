`include "SR_a.v"

module SR_a_tb;

    // Inputs
    reg S;
    reg R;

    // Outputs
    wire Q;
    wire Q_bar;

    // Instantiate the SR latch
    SR_a uut (
        .Q(Q),
        .Q_bar(Q_bar),
        .S(S),
        .R(R)
    );

    // Test procedure
    initial begin
        // Monitor the output
        $monitor("Time = %0d, S = %b, R = %b, Q = %b, Q_bar = %b", $time, S, R, Q, Q_bar);

        // Initialize inputs
        S = 0;
        R = 0;
        #10;  // Wait 10 time units

        // Test Case 0: Set the initial value
        S = 1;
        R = 0;
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Set condition failed");

        // Test Case 1: Hold condition (S = 0, R = 0)
        S = 0;
        R = 0;
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Hold condition failed");

        // Test Case 2: Set condition (S = 1, R = 0)
        S = 1;
        R = 0;
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Set condition failed");

        // Test Case 3: Reset condition (S = 0, R = 1)
        S = 0;
        R = 1;
        #10;
        if(Q == 0 && Q_bar == 1) ; else $fatal(1, "Reset condition failed");

        // Test Case 5: Transition from Set to Hold (S = 1 -> S = 0)
        S = 1;
        R = 0;
        #10;  // Set the latch
        S = 0;
        R = 0;
        #10;  // Hold the latch
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Hold after Set failed");

        // Test Case 6: Transition from Reset to Hold (R = 1 -> R = 0)
        S = 0;
        R = 1;
        #10;  // Reset the latch
        S = 0;
        R = 0;
        #10;  // Hold the latch
        if(Q == 0 && Q_bar == 1) ; else $fatal(1, "Hold after Reset failed");

        $finish;  // End simulation
    end

endmodule

`include "SR_c.v"

module SR_c_tb;

    // Inputs
    reg S;
    reg R;
    reg E;

    // Outputs
    wire Q;
    wire Q_bar;

    // Instantiate the SR latch
    SR_c uut (
        .Q(Q),
        .Q_bar(Q_bar),
        .S(S),
        .R(R),
        .E(E)
    );

    // Test procedure
    initial begin
        // Monitor the outputs
        $monitor("Time = %0d, E = %b, S = %b, R = %b, Q = %b, Q_bar = %b", $time, E, S, R, Q, Q_bar);

        // Initialize inputs and outputs
        S = 1;
        R = 0;
        E = 1;
        #10;
        S = 0;
        #10

        // Test Case 1: Enable off (E = 0), No change to outputs
        S = 1;
        R = 0;
        E = 0;
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Enable off, output changed unexpectedly");

        // Test Case 2: Enable on (E = 1), Set condition (S = 1, R = 0)
        E = 1;
        S = 1;
        R = 0;
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Set condition failed when enabled");

        // Test Case 3: Enable on (E = 1), Reset condition (S = 0, R = 1)
        E = 1;
        S = 0;
        R = 1;
        #10;
        if(Q == 0 && Q_bar == 1) ; else $fatal(1, "Reset condition failed when enabled");

        // Test Case 4: Enable off (E = 0), Hold previous state
        E = 0;
        S = 1;
        R = 0;
        #10;
        if(Q == 0 && Q_bar == 1) ; else $fatal(1, "Enable off, output changed unexpectedly");

        // Test Case 6: Transition from Set to Hold, with Enable toggling
        E = 1;
        S = 1;
        R = 0;
        #10;  // Set the latch
        E = 0;  // Disable the latch
        #10;
        if(Q == 1 && Q_bar == 0) ; else $fatal(1, "Hold after Set failed");

        // Test Case 7: Transition from Reset to Hold, with Enable toggling
        E = 1;
        S = 0;
        R = 1;
        #10;  // Reset the latch
        E = 0;  // Disable the latch
        #10;
        if(Q == 0 && Q_bar == 1) ; else $fatal(1, "Hold after Reset failed");

        $finish;  // End the simulation
    end

endmodule

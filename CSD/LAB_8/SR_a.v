module SR_a(output reg Q, output reg Q_bar, input S, input R);

    always @(S, R)
        begin
            case ({S, R})
            2'b01: begin
                    Q <= 1'b0;
                    Q_bar <= 1'b1;
                   end
            2'b10: begin
                    Q <= 1'b1;
                    Q_bar <= 1'b0;
                   end
            endcase
    end

endmodule
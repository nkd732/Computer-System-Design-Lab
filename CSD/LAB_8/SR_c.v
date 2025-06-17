module SR_c(output reg Q, output reg Q_bar, input S, input R, input E);
    always @(E, S, R)
    if (E == 1)
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
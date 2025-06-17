module RowColumnDecoder(
    input [1:0] row,
    input [1:0] col,
    output [8:0] cell_select
);

    // Generate cell_select bits based on row and col inputs
    assign cell_select[0] = (row == 2'b01 && col == 2'b01); // Cell (1, 1)
    assign cell_select[1] = (row == 2'b01 && col == 2'b10); // Cell (1, 2)
    assign cell_select[2] = (row == 2'b01 && col == 2'b11); // Cell (1, 3)
    assign cell_select[3] = (row == 2'b10 && col == 2'b01); // Cell (2, 1)
    assign cell_select[4] = (row == 2'b10 && col == 2'b10); // Cell (2, 2)
    assign cell_select[5] = (row == 2'b10 && col == 2'b11); // Cell (2, 3)
    assign cell_select[6] = (row == 2'b11 && col == 2'b01); // Cell (3, 1)
    assign cell_select[7] = (row == 2'b11 && col == 2'b10); // Cell (3, 2)
    assign cell_select[8] = (row == 2'b11 && col == 2'b11); // Cell (3, 3)

endmodule


module setCell(
    input [8:0] cell_select, 
    input [1:0] game_state, 
    input set, 
    output [8:0] set_cell
);

    // Generate set_cell outputs based on game_state and the selected cells
    assign set_cell[0] = (game_state == 2'b00) ? (set & cell_select[0]) : 1'b0;
    assign set_cell[1] = (game_state == 2'b00) ? (set & cell_select[1]) : 1'b0;
    assign set_cell[2] = (game_state == 2'b00) ? (set & cell_select[2]) : 1'b0;
    assign set_cell[3] = (game_state == 2'b00) ? (set & cell_select[3]) : 1'b0;
    assign set_cell[4] = (game_state == 2'b00) ? (set & cell_select[4]) : 1'b0;
    assign set_cell[5] = (game_state == 2'b00) ? (set & cell_select[5]) : 1'b0;
    assign set_cell[6] = (game_state == 2'b00) ? (set & cell_select[6]) : 1'b0;
    assign set_cell[7] = (game_state == 2'b00) ? (set & cell_select[7]) : 1'b0;
    assign set_cell[8] = (game_state == 2'b00) ? (set & cell_select[8]) : 1'b0;

endmodule


module SymCal(
    input clk,
    input reset,
    input [8:0] valid,
    output reg set_symbol
);
    integer i;
    integer move_count;

    initial begin
        set_symbol <= 1;
    end

    always @(posedge clk) begin
        if (reset) begin
            set_symbol <= 1;
        end else begin
            move_count = 0;
            for (i = 0; i < 9; i = i + 1) begin
                if (valid[i] == 1) begin
                    move_count = move_count + 1;
                end
            end
            set_symbol <= (move_count % 2 == 0) ? 1 : 0;
        end
    end
endmodule

module TCell(input clk, set, reset, set_symbol, output reg valid, symbol);
initial begin
    valid <= 0;
end
always @(posedge clk)
begin
    if(valid == 0) symbol <= set_symbol;

    if(set == 1 && valid==0) 
    begin
        valid <= 1;
        symbol <= set_symbol;
    end
    if(reset == 1) valid <= 0;

end
endmodule


module CheckWin(
    input [8:0] valid,          // 1 if cell is occupied
    input [8:0] symbol,         // 1 for X, 0 for O
    output reg [1:0] game_state // 00: Game on, 01: X won, 10: O won, 11: Draw
);
    always @(*) begin
        game_state = 2'b00; // Default state: Game on

        // Winning conditions
        if (valid[0] && valid[1] && valid[2] && (symbol[0] == symbol[1]) && (symbol[1] == symbol[2])) begin
            game_state = symbol[0] ? 2'b01 : 2'b10; // X or O won
        end else if (valid[3] && valid[4] && valid[5] && (symbol[3] == symbol[4]) && (symbol[4] == symbol[5])) begin
            game_state = symbol[3] ? 2'b01 : 2'b10;
        end else if (valid[6] && valid[7] && valid[8] && (symbol[6] == symbol[7]) && (symbol[7] == symbol[8])) begin
            game_state = symbol[6] ? 2'b01 : 2'b10;
        end else if (valid[0] && valid[3] && valid[6] && (symbol[0] == symbol[3]) && (symbol[3] == symbol[6])) begin
            game_state = symbol[0] ? 2'b01 : 2'b10;
        end else if (valid[1] && valid[4] && valid[7] && (symbol[1] == symbol[4]) && (symbol[4] == symbol[7])) begin
            game_state = symbol[1] ? 2'b01 : 2'b10;
        end else if (valid[2] && valid[5] && valid[8] && (symbol[2] == symbol[5]) && (symbol[5] == symbol[8])) begin
            game_state = symbol[2] ? 2'b01 : 2'b10;
        end else if (valid[0] && valid[4] && valid[8] && (symbol[0] == symbol[4]) && (symbol[4] == symbol[8])) begin
            game_state = symbol[0] ? 2'b01 : 2'b10;
        end else if (valid[2] && valid[4] && valid[6] && (symbol[2] == symbol[4]) && (symbol[4] == symbol[6])) begin
            game_state = symbol[2] ? 2'b01 : 2'b10;
        end else if (&valid) begin
            game_state = 2'b11; // Draw if all cells are occupied and no winner
        end
    end
endmodule



module TBox(
    input clk,
    input set,
    input reset,
    input [1:0] row,
    input [1:0] col,
    output [8:0] valid,
    output [8:0] symbol,
    output [1:0] game_state
);
    wire [8:0] cell_valid;
    wire [8:0] cell_symbol;
    wire [8:0] cell_select;
    wire [8:0] set_cell;
    wire set_symbol;


    // Row and column decoder instance
    RowColumnDecoder decoder (
        .row(row),
        .col(col),
        .cell_select(cell_select)
    );

    // Set cell logic instance
    setCell setCell1 (
        .cell_select(cell_select),
        .game_state(game_state),
        .set(set),
        .set_cell(set_cell)
    );

    // Symbol calculator instance
    SymCal symbol_calculator (
        .clk(clk),
        .reset(reset),
        .valid(cell_valid),
        .set_symbol(set_symbol)
    );

    // Cell instances
    TCell cell0 (.clk(clk), .set(set_cell[0]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[0]), .symbol(cell_symbol[0]));
    TCell cell1 (.clk(clk), .set(set_cell[1]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[1]), .symbol(cell_symbol[1]));
    TCell cell2 (.clk(clk), .set(set_cell[2]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[2]), .symbol(cell_symbol[2]));
    TCell cell3 (.clk(clk), .set(set_cell[3]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[3]), .symbol(cell_symbol[3]));
    TCell cell4 (.clk(clk), .set(set_cell[4]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[4]), .symbol(cell_symbol[4]));
    TCell cell5 (.clk(clk), .set(set_cell[5]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[5]), .symbol(cell_symbol[5]));
    TCell cell6 (.clk(clk), .set(set_cell[6]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[6]), .symbol(cell_symbol[6]));
    TCell cell7 (.clk(clk), .set(set_cell[7]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[7]), .symbol(cell_symbol[7]));
    TCell cell8 (.clk(clk), .set(set_cell[8]), .reset(reset), .set_symbol(set_symbol), .valid(cell_valid[8]), .symbol(cell_symbol[8]));

    // Check win condition instance
    CheckWin checker (
        .valid(cell_valid),
        .symbol(cell_symbol),
        .game_state(game_state)
    );

    // Output connections
    assign valid = cell_valid;
    assign symbol = cell_symbol;
endmodule

module FSMpuzzle(
    input clk,
    input rst,
    input [3:0] in_pattern,   // 4-bit input pattern
    output reg [6:0] seg,     // 7-segment output (a–g only)
    output reg green_led,
    output reg red_led,
    output reg [3:0] state
);

// FSM states
localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

reg [3:0] next_state;
reg [3:0] correct_pattern [0:3];  // Expected input pattern

// Common Anode Segment Patterns (active-low)
// Bit order: seg[6] = g, ... seg[0] = a
localparam SEG_Y = ~7'b0110110; // Y = gfedcba = 0 1 1 0 1 1 0
localparam SEG_N = ~7'b1010100; // Approx. "N"
localparam SEG_U = ~7'b0011111; // U = gfedcba = 0 0 1 1 1 1 1
localparam SEG_BLANK = 7'b1111111;

initial begin
    correct_pattern[0] = 4'b0001;
    correct_pattern[1] = 4'b0010;
    correct_pattern[2] = 4'b0011;
    correct_pattern[3] = 4'b0100;
end

// Sequential logic: state transitions on clock
always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

// Combinational logic: state machine
always @(*) begin
    green_led = 0;
    red_led = 0;
    seg = SEG_BLANK;
    next_state = state;

    case (state)
        S0: begin
            if (in_pattern == correct_pattern[0]) begin
                green_led = 1;
                seg = SEG_Y;
                next_state = S1;
            end else begin
                red_led = 1;
                seg = SEG_N;
                next_state = S0;
            end
        end

        S1: begin
            if (in_pattern == correct_pattern[1]) begin
                green_led = 1;
                seg = SEG_Y;
                next_state = S2;
            end else begin
                red_led = 1;
                seg = SEG_N;
                next_state = S0;
            end
        end

        S2: begin
            if (in_pattern == correct_pattern[2]) begin
                green_led = 1;
                seg = SEG_Y;
                next_state = S3;
            end else begin
                red_led = 1;
                seg = SEG_N;
                next_state = S0;
            end
        end

        S3: begin
            if (in_pattern == correct_pattern[3]) begin
                green_led = 1;
                seg = SEG_Y;
                next_state = S4;
            end else begin
                red_led = 1;
                seg = SEG_N;
                next_state = S0;
            end
        end

        S4: begin
            green_led = 1;
            seg = SEG_U;
            next_state = S0;
        end

        default: begin
            seg = SEG_BLANK;
            next_state = S0;
        end
    endcase
end

endmodule
module fsmlock_tb();
    reg clk;
    reg rst;
    reg [3:0] in_pattern;
    wire [6:0] seg;
    wire green_led;
    wire red_led;
    wire [3:0] state;

    FSMpuzzle uut (
        .clk(clk),
        .rst(rst),
        .in_pattern(in_pattern),
        .seg(seg),
        .green_led(green_led),
        .red_led(red_led),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        rst = 1; in_pattern = 4'b0000;
        #20;
        rst = 0;

        // Correct pattern sequence
        in_pattern = 4'b0001; #10; // S0 -> S1
        in_pattern = 4'b0010; #10; // S1 -> S2
        in_pattern = 4'b0011; #10; // S2 -> S3
        in_pattern = 4'b0100; #10; // S3 -> S4 -> S0

        // Wrong pattern - reset
        in_pattern = 4'b1111; #10; // S0 remains in S0
        in_pattern = 4'b0001; #10; // S0 -> S1
        in_pattern = 4'b1111; #10; // S1 -> S0

        $finish;
    end
endmodule

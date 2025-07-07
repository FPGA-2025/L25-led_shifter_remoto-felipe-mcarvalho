module LedShifter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output  reg [7:0] leds
);

    localparam ONE_SECOND = CLK_FREQ;
    reg [31:0] counter = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            leds <= 8'b00011111; 
            counter <= 0;
        end 
        else begin
            if (counter >= ONE_SECOND - 1) begin
                leds <= {leds[6:0], leds[7]}; 
                counter <= 0;
            end 
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
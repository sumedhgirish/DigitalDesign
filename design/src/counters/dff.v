module dff #(
    parameter bool INIT = 1'b0
) (
    input clk,
    input rst,
    input d,
    output reg q
);
  always @(posedge clk) begin
    if (rst) begin
      q = INIT;
    end else begin
      q = d;
    end
  end
endmodule

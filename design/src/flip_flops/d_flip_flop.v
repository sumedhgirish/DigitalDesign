module d_flip_flop (
    input clk,
    input rst,
    input data,
    output reg q
);
  always @(posedge clk or rst) begin
    q = (rst) ? ~rst : data;
  end
endmodule

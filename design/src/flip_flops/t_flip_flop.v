module t_flip_flop (
    input clk,
    input rst,
    input t,
    output reg q
);
  always @(posedge clk or rst) begin
    q = (rst) ? ~rst : ((t) ? ~q : q);
  end
endmodule

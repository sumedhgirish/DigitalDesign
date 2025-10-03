module d_flip_flop (
    input clk,
    input rst,
    input data,
    output reg q
);
  always @(posedge clk or rst) begin
    #1 q = (rst) ? ~rst : data;
  end
endmodule

module vending_machine (
    input coin_type,
    input clk,
    input rst,
    output is_dispensed,
    output [1:0] state
);
  d_flip_flop U0 (
      .clk(clk),
      .rst(rst),
      .data(state[1] | coin_type & state[0]),
      .q(is_dispensed)
  );
  d_flip_flop U1 (
      .clk(clk),
      .rst(rst),
      .data(~coin_type & ~state[1]),
      .q(state[0])
  );
  d_flip_flop U2 (
      .clk(clk),
      .rst(rst),
      .data((~coin_type & ~state[1] & state[0]) + (coin_type & ~state[0])),
      .q(state[1])
  );
endmodule

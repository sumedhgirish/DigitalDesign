module sr_flip_flop (
    input clk,
    input set,
    input rst,
    output reg q
);
  always @(posedge clk) begin
    case ({
      set, rst
    })
      2'b00: q = q;
      2'b01: q = 1'b0;
      2'b10: q = 1'b1;
      2'b11: q = 1'bx;
      default q = q;
    endcase
  end
endmodule

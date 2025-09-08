module jk_flip_flop (
    input j,
    input k,
    input clk,
    input rst,
    output reg q
);
  always @(posedge clk or rst) begin
    if (rst) begin
      q = 0;
    end else begin
      case ({
        j, k
      })
        2'b00:   q = q;
        2'b01:   q = 0;
        2'b10:   q = 1;
        2'b11:   q = ~q;
        default: q = q;
      endcase
    end
  end
endmodule

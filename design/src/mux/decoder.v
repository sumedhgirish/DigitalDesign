module decoder (
    output [1:0] out,
    input sel,
    input enable
);
  wire [1:0] med;
  and (med[0], ~sel);
  and (med[1], sel);
  bufif1 (out[0], med[0], enable);
  bufif1 (out[1], med[1], enable);
endmodule

module decoder4 (
    output [3:0] out,
    input [1:0] sel,
    input enable
);
  wire [3:0] med;
  and (med[0], ~sel[0], ~sel[1]);
  and (med[1], sel[0], ~sel[1]);
  and (med[2], ~sel[0], sel[1]);
  and (med[3], sel[0], sel[1]);
  bufif1 (out[0], med[0], enable);
  bufif1 (out[1], med[1], enable);
  bufif1 (out[2], med[2], enable);
  bufif1 (out[3], med[3], enable);
endmodule

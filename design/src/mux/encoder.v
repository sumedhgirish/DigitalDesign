module encoder (
    output out,
    input [1:0] in,
    input enable
);
  assign out = enable ? in[1] : 1'bZ;
endmodule

module encoder4 (
    output [1:0] out,
    input [3:0] in,
    input enable
);
  assign out[0] = enable ? in[1] | in[3] : 1'bZ;
  assign out[1] = enable ? ~in[1] & ~in[0] : 1'bZ;
endmodule

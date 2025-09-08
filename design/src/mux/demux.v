module demux (
    output [1:0] out,
    input in,
    input sel
);
  assign out = in << sel;
endmodule

module demux4 (
    output [3:0] out,
    input in,
    input [1:0] sel
);
  assign out = in << ((sel[1] * 2) + sel[0]);
endmodule

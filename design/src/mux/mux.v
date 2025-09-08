
module mux (
    output out,
    input [1:0] in,
    input sel
);
  assign out = in[sel];
endmodule


module mux4 (
    output out,
    input [3:0] in,
    input [1:0] sel
);
  wire med1, med2;
  mux U0 (
      .out(med1),
      .in (in[1:0]),
      .sel(sel[0])
  );
  mux U1 (
      .out(med2),
      .in (in[3:2]),
      .sel(sel[0])
  );
  mux U3 (
      .out(out),
      .in ({med2, med1}),
      .sel(sel[1])
  );
endmodule

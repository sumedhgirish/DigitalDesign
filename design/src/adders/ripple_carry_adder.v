module ripple_carry_adder (
    output [3:0] out,
    output cout,
    input [3:0] in1,
    input [3:0] in2
);
  wire c0, c1, c2;
  full_adder U0 (
      .out(out[0]),
      .x(in1[0]),
      .y(in2[0]),
      .cout(c0),
      .cin(1'b0)
  );
  full_adder U1 (
      .out(out[1]),
      .x(in1[1]),
      .y(in2[1]),
      .cout(c1),
      .cin(c0)
  );
  full_adder U2 (
      .out(out[2]),
      .x(in1[2]),
      .y(in2[2]),
      .cout(c2),
      .cin(c1)
  );
  full_adder U3 (
      .out(out[3]),
      .x(in1[3]),
      .y(in2[3]),
      .cout(cout),
      .cin(c2)
  );
endmodule

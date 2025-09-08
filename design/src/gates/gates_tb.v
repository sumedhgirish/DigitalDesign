
module gates_tb ();

  reg in1, in2, in3;
  wire oand, oor, inv1, inv2;
  wire result;

  initial begin
    $monitor("input 1: %b input2: %b -> and: %b or: %b inv1: %b inv2: %b circuit: %b", in1, in2,
             oand, oor, inv1, inv2, result);
    in1 = 0;
    in2 = 0;
    in3 = 0;

    #5{in1, in2, in3} = 3'b100;
    #5{in1, in2, in3} = 3'b110;
    #5{in1, in2, in3} = 3'b010;
    #5{in1, in2, in3} = 3'b001;
    #5{in1, in2, in3} = 3'b101;
    #5{in1, in2, in3} = 3'b111;
    #5{in1, in2, in3} = 3'b011;
  end

  and2 U0 (
      .out(oand),
      .x  (in1),
      .y  (in2)
  );
  or2 U1 (
      .out(oor),
      .x  (in1),
      .y  (in2)
  );
  inv U2 (
      .out(inv1),
      .x  (in1)
  );
  inv U3 (
      .out(inv2),
      .x  (in2)
  );
  gates U4 (
      .out(result),
      .x  (in1),
      .y  (in2),
      .z  (in3)
  );


initial begin
    $dumpfile("gates.vcd");
    $dumpvars(0, gates_tb);
end

endmodule

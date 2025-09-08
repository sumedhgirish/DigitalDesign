
module arbiter (
    input clk,
    input reset,
    input req_0,
    input req_1,
    output reg grt_0,
    output reg grt_1
);
  always @(posedge clk or posedge reset)
    if (reset) begin
      // Idle
      grt_0 <= 0;
      grt_1 <= 0;
    end else if (req_0) begin
      // select 0
      grt_0 <= 1;
      grt_1 <= 0;
    end else if (req_1) begin
      // select 1
      grt_0 <= 0;
      grt_1 <= 1;
    end else begin
      // Idle
      grt_0 <= 0;
      grt_1 <= 0;
    end
endmodule

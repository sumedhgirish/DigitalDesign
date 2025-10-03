
module orange_tb();
    initial begin
        $dumpfile("orange_tb.vcd");
        $dumpvars(0, orange_tb);
    end

    reg coin, clk, rst;
    wire [1:0] state;
    wire dispenser_output;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        coin = 1'bz;
        $display("----RESET----");
	#10 coin=1'b0;
        #10 rst = 1'b0;
        $display("----RESET----");
	#10 coin=1'b1;
	#10 coin=1'b0;
	#10 coin=1'b1;
	#10 coin=1'b0;
	#10 coin=1'b1;
	#10 coin=1'b0;
	#10 coin=1'b0;
	#10 coin=1'b0;
	#10 coin=1'b0;
	#10 coin=1'b0;
	#10 coin=1'b0;
        #10 $finish(0);
    end

    always forever begin
        #5 clk = ~clk;
        if (clk) begin
            $display("inp: %b :: out: %b :: state: %2b :: rst: %b", coin, dispenser_output, state, rst);
        end
    end

    vending_machine U0 (
        .coin_type(coin),
        .clk(clk),
        .rst(rst),
        .is_dispensed(dispenser_output),
        .state(state)
    );
endmodule


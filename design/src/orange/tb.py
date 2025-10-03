import random

code_template = (
    lambda start, test_cases: f"""
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
{start}
        #10 rst = 1'b0;
        $display("----RESET----");
{test_cases}
        #11 $finish(0);
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
"""
)

# Coin Sequence Length
N = 5
valid_values = [[0, 1], [1, 0], [0, 0, 0]]
numbers = []
for _ in range(N):
    numbers.extend(random.choice(valid_values))
print(numbers)

tests = [f"\t#10 coin=1'b{x};" for x in numbers]

with open("orange_tb.v", "w") as testbench:
    print(code_template(tests[0], "\n".join(tests[1:])), file=testbench)

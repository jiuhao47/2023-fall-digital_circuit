module lfsr4(
    input clk,
    output [3:0] q
);

    reg [3:0] q;
    always @(posedge clk) begin
        q<={q[2:0],q[3]^q[2]};
    end
endmodule
//4位伪随机数发生器
module adder4(
    input [3:0] a,b,
    output [3:0] s,
    output co
);
    assign {co,s}={1'b0,a}+{1'b0,b};
endmodule
module counter(
    input clk,
    output [3:0] q,
    output c
);
    reg [3:0] q;
    always@(posedge clk)
        q<=q+1;
    assign c=&q;
endmodule

//时序逻辑计数器实现
//上溢出循环，8循环
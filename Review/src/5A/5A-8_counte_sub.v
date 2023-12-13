module counter(
    input clk,
    output [3:0] q,
    output b
);
    reg [3:0] q;
    always@(posedge clk)
        q<=q-1;
    assign b=&(~q);
endmodule

//时序逻辑计数器实现
//下溢出8循环
//bw为溢出位，1为溢出
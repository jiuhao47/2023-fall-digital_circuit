module counter(
    input clk,
    output [3:0] q,
    output b
);
    reg [3:0] q;
    always @(negedge clk)
        if(q>0) q<=q-1;
        else q<=4'd9;
    assign b=q==4'd0;
endmodule
//下降沿触发，十进制减法计数器
//b为溢出位，1表溢出
module counter(
    input clk,
    output [3:0] q,
    output c
);
    reg [3:0] q;
    always @(negedge clk)
        if(q<4'd9) q<=q+1;
        else q<=0;
    assign c=q==4'd9;
endmodule
//下降沿触发，十进制加法计数器
//c为溢出位，1表溢出
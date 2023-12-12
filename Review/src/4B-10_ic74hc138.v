module ic74hc138(
    input [2:0] a,s,
    output [7:0] y
);
    reg [7:0] m;
    always @(a,s) begin
        m=8'b1111_1111;
        if(s==3'b001)
            m[a]=1'b0;  
    end
    assign y=m;
endmodule
//二进制译码器
//a为数据端
//y为输出端，低有效
//s为使能端
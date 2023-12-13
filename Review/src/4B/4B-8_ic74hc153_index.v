module ic74hc153(
    input [1:0] d1,d2,d3,d4,
    input a,s,
    output [1:0] y
);
    wire [1:0] m;
    assign m ={d2[a],d1[a]};

    assign  y=(~s)&m;
endmodule
//双4选1数据选择器
//a为选择端
//s为使能端
//使用变量下标
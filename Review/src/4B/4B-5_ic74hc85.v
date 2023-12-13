module ic74hc85(
    input [3:0] a,b,
    input [2:0] i,
    output [2:0] y
);
    reg [2:0] m;
    always @(a,b,i) begin
        if(a>b)         m=3'b100;
        else if(a<b)    m=3'b001;
        else            m=i;
    end
    assign y=m;
endmodule
//4位数值比较器
//a>b y=0b100
//a<b y=0b001
//a=b y为上一级结果

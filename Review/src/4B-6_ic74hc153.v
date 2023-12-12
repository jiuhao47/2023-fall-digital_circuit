module ic74hc153(
    input [1:0] d1,d2,d3,d4,
    input a,s,
    output [1:0] y
);
    reg [1:0] m;

    always @(d1,d2,d3,d4,a) begin
        if(a==2'd0)         m=d1;
        else if(a==2'd1)    m=d2;
        else if(a==2'd2)    m=d3;
        else                m=d4;
    end

    assign  y=(~s)&m;
endmodule
//双4选1数据选择器
//a为选择端
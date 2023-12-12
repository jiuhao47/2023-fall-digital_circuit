module ic74hc153(
    input [1:0] d1,d2,d3,d4,
    input a,s,
    output [1:0] y
);
    reg [1:0] m;

    always @(d1,d2,d3,d4,a) begin
        case(a)
            2'd0:       m=d1;
            2'd1:       m=d2;
            2'd2:       m=d3;
            default:    m=d4;
        endcase
    end

    assign  y=(~s)&m;
endmodule
//双4选1数据选择器
//a为选择端
//case版本
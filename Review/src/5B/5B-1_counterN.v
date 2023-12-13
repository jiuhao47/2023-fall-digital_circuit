module counterN(
    input clk,
    input [3:0] num,
    output [3:0] q,
    output c
);
    reg [3:0] q;
    always @(negedge clk) begin
        if(c) q<=0;
        else q<=q+1;
    end
    assign c=q==num-1;
endmodule
//PPT 第四页，缺省N

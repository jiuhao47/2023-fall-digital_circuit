module counterN(
    input clk,rstn,
    input [3:0] num,
    output [3:0] q,
    output c
);
    reg [3:0] q;
    always @(negedge clk or negedge rstn) begin
        if(~rstn)  q<=0;
        else if(c) q<=0;
        else q<=q+1;
    end
    assign c=q==num-1;
    assign q=4'b0000;
endmodule
//带有复位信号的

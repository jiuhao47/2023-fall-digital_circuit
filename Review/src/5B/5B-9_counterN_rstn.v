module counterN(
    input clk,rstn,
    input [3:0] num,
    output [3:0] q,
    output c
);
    reg [3:0] q_r;
    always @(negedge clk or negedge rstn) begin
        if(~rstn)  q_r<=0;
        else if(c) q_r<=0;
        else q_r<=q_r+1;
    end
    assign c=q_r==num-1;
    assign q=4'b0000;
endmodule
//带有复位信号的


//???
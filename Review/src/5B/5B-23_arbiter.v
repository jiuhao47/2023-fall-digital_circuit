module arbiter
(
    input clk,rstn,
    input [2:0] req_in,
    output [2:0] ack_in,
    output req_out,
    input ack_out
);
    wire [2:0] fire;
    assign fire =ack_out?(req_in&ack_in):3'b0;
    reg [2:0][5:0] weight_pre;
    wire [2:0][5:0] weight;//?

    reg[1:0] sel;

    assign weight[0]=req_in[0]?weight_pre[0]+4:weight_pre[0];
    assign weight[1]=req_in[1]?weight_pre[1]+2:weight_pre[1];
    assign weight[2]=req_in[2]?weight_pre[2]+1:weight_pre[2];
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) weight_pre<=0;//PPT 错误
        else begin
            weight_pre[0]<=fire[0]?0:weight[0];
            weight_pre[1]<=fire[1]?0:weight[1];
            weight_pre[2]<=fire[2]?0:weight[2]; 
        end
    end
    always @(weight) begin
        sel=0;
        if(weight[1]>weight[sel]) sel=1;
        if(weight[2]>weight[sel]) sel=2;
    end

    assign ack_in=(req_out&&ack_out)?(3'b001<<sel):3'd0;
    assign req_out=|req_in;

endmodule
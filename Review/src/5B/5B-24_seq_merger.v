module seq_merger #(parameter dw=8,L=16)
(
    input clk,rstn,
    input [dw-1:0] data_a,
    input reg_a,
    output ack_a,
    input [dw-1:0] data_b,
    input reg_b,
    output ack_b,
    input [dw-1:0] data_o,
    input reg_o,
    output ack_o
);
    wire [dw-1:0] A,B;
    wire Areq,Aack,Breq,Back,sel;
    fifo #(.L(16),.dw(dw))fifoA(clk,rstn,data_a,req_a,ack_a,A,Areq,Aack);
    fifo #(.L(16),.dw(dw))fifoA(clk,rstn,data_b,req_b,ack_b,B,Breq,Back);

    assign sel=A>B;
    assign data_o=sel?B:A;
    assign req_o=Areq|Breq;
    assign Aack=Areq&ack_o&!sel;
    assign Back=Breq&ack_o&sel;

endmodule
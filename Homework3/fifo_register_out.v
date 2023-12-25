module fifo_register_out #(parameter dw=4,L=8)
(
    input clk,rstn,
    input [dw-1:0] d_in,
    input req_in,
    output ack_in,
    output [dw-1:0] d_out,
    output req_out,
    input ack_out
);
    reg [dw-1:0] data [L-1:0];
    reg [L-1:0] wp;
    reg [dw-1:0]out;


    assign req_out=|wp;
    assign ack_in=(wp==L)?0:1;
    assign d_out=out;

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            wp<=0;
        end
        else begin
            if(req_in&ack_in&(~(req_out&ack_out))) begin
                wp<=(wp==L)?L:wp+1;
                data[wp]<=d_in;
            end
            else if(req_out&ack_out&(~(req_in&ack_in))) begin
                wp<=(wp==0)?0:wp-1;
                data[3]<=0;
                data[2]<=data[3];
                data[1]<=data[2];
                data[0]<=data[1];
                out<=data[0];
            end
            else if(req_in&ack_in&req_out&ack_out)begin
                data[2]<=data[3];
                data[1]<=data[2];
                data[0]<=data[1];
                out<=data[0];
                data[wp-1]<=d_in;
            end
            else begin
                ;
            end
        end
    end
endmodule


//深度为L的FIFO缓冲
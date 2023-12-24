module ArbPriority #(parameter N=8)
(
    input clk,rstn,
    input [N-1:0] req_i,
    input [N-1:0] prio,
    output [N-1:0] ack_i,
    output req_o,
    input ack_o
);
    genvar i;
    wire token[2*N-1:0];

    assign req_o = |req_i;
    generate
        for (i = 0; i<N; i=i+1) begin
            if(i==0)begin
              assign ack_i[0]=(token[N-1]|prio[0])&req_i[0]&ack_o;
              assign token[0]=(token[N-1]|prio[0])&~req_i[0];
              assign token[N]=token[N-1]&~req_i[0];
              
            end
            else begin
                assign ack_i[i]=(token[i-1]|prio[i]|token[N+i-1])&req_i[i]&ack_o;
                assign token[i]=(token[i]|prio[i])&~req_i[i];
                assign token[N+i]=token[N+i-1]&~req_i[i];
            end
        end
    endgenerate
endmodule //5B-13_ArbPriority_noroute
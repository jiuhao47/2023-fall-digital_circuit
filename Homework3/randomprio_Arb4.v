module randomprio_Arb4 #(parameter N=4)
(
    input clk,rstn,
    input [N-1:0] req_i,
    output [N-1:0] ack_i,
    output req_o,
    input ack_o
);
    genvar i;
    wire token[2*N-1:0];
    wire [N-1:0] prio;
    wire [N-1:0] q;
    assign req_o = |req_i;

    lfsrN #(N)random (.clk(clk),.rstn(rstn),.q(q));
    transfrom transfrom(.q(q),.prio(prio));
    
    reg [N-1:0] ack_i_reg;

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


module lfsrN #(parameter N=4)(
    input clk,rstn,
    output [N-1:0] q
);
    reg [N-1:0] q;
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q<=4;
        end
        else begin
        q[N-1:1]<=q[N-2:0];
            if(N==3) q[0]<=q[2]^q[1];
            if(N==4) q[0]<=q[3]^q[2];
            if(N==5) q[0]<=q[4]^q[2];
            if(N==6) q[0]<=q[5]^q[4];
            if(N==7) q[0]<=q[6]^q[5];
            if(N==8) q[0]<=q[7]^q[5]^q[4]^q[3];
        end
    end
endmodule

module transfrom
(
    input [3:0] q,
    output [3:0] prio
);
    reg [3:0]prio_reg;
    always @(q) begin
        if(q>=1&q<=3) begin
            prio_reg=4'b0001;
        end
        else if(q>=5&q<=7) begin
            prio_reg=4'b0010;
        end
        else if(q>=9&q<=11) begin
            prio_reg=4'b0100;
        end
        else if(q>=13&q<=15) begin
            prio_reg=4'b1000;
        end
        else begin
            prio_reg=4'b0000;
        end
    end
    assign prio=prio_reg;
endmodule
module BM #(parameter LP=3,dw=8,dir=0)
(
    input [2**LP-1:0][dw-1:0] d_in,
    output [2**LP-1:0][dw-1:0] d_out
);
    localparam PN=2**LP;
    localparam HPN=PN/2;
    wire [PN-1:0][dw-1:0] data;
    wire [HPN-1:0] swap;
    
    genvar i;
    generate
        if(LP==1)
            BM2 #(dw,dir) B(d_in,d_out);
        else begin
            for (i = 0;i<HPN ;i=i+1 ) begin
                assign swap[i]=dir^(d_in[i]>d_in[HPN+i]);
                assign data[i]=swap[i]?d_in[HPN+i]:d_in[i];
                assign data[HPN+i]=swap[i]?d_in[i]:d_in[HPN+i];
            end
            BM #(LP-1,dw,dir) M0 (data[HPN-1:0],d_out[HPN-1:0]);
            BM #(LP-1,dw,dir) M0 (data[PN-1:HPN],d_out[PN-1:HPN]);
            
        end
    endgenerate

endmodule
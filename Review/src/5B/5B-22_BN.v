module BN #(parameter LP=3,dw=8,dir=0)
(
    input [2**LP-1:0][dw-1:0] d_in,
    output [2**LP-1:0][dw-1:0] d_out
);
    localparam PN=2**LP;
    localparam HPN=PN/2;
    wire [PN-1:0][dw-1:0] data;

    genvar i;

    generate
        if(LP==1)
            BM2 #(dw,dir) B(d_in,d_out);
        else begin
            BN #(LP-1,dw,0) BN0 (d_in[HPN-1:0],data[HPN-1:0]);
            BN #(LP-1,dw,1) BN1 (d_in[PN-1:HPN],data[PN-1:HPN]);
            BM #(LP,dw,dir) BMOUT (data,d_out);
        end
    endgenerate

endmodule
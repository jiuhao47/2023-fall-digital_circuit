module BM2 #(parameter dw=8,dir=0)
(
    input [1:0][dw-1:0] d_in,
    output [1:0][dw-1:0] d_out
);
    wire swap;
    assign swap=dir^(d_in[0]>d_in[1]);
    assign d_out=swap?{d_in[0],d_in[1]}:d_in;
endmodule

module BM4 #(parameter dw=8,dir=0)
(
    input [3:0] [dw-1:0] d_in,
    output [3:0] [dw-1:0] d_out
);
    wire [3:0][dw-1:0] data;
    wire [1:0] swap;
    genvar i;
    generate
        for (i = 0;i<2 ;i=i+1 ) begin
            assign swap[i]=dir^(d_in[i]>d_in[2+i]);
            assign data[i]=swap[i]?d_in[2+i]:d_in[i];
            assign data[2+i]=swap[i]?d_in[i]:d_in[2+i];
        end
    endgenerate
    BM2 #(dw,dir) M0(data[1:0],d_out[1:0]);
    BM2 #(dw,dir) M1(data[3:2],d_out[3:2]);
endmodule
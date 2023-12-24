module sorter #(parameter N=8,dw=7)
(
    input [N-1:0][dw-1:0] d_in,
    output [N-1:0][dw-1:0] d_out
);
    reg [N-1:0][dw-1:0] data;
    reg [dw-1:0] m;
    integer  i,j;
    always @(d_in) begin
        data=d_in;
        for (i = N-1 ; i>0 ; i>i-1) begin
            for (j = 0;j<i ;j=j+1 ) begin
                m=data[j];
                data[j]=data[j+1];
                data[j+1]=m;
            end
        end
    end

    assign d_out=data;
endmodule

//排序器 System Verilog
module burst_detect3(
    input clk,
    input x,
    output y
);
    reg [1:0] cnt;
    always @(posedge clk) begin
        if(x==0) cnt<=0;
        else if (cnt!=2) cnt<=cnt +1;
    end
    assign y=(cnt==2)&x;
endmodule

//PPT 12页，程序第8行，分号缺省
//两个之后再有1，输出跳1；
//3位簇发检测器
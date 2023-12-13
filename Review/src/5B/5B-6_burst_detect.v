module burst_detect #(parameter N=3)(
    input clk,
    input x,
    output y
);
    reg [N-1:0] cnt;
    always @(posedge clk) begin
        if(x==0)    cnt<=0;
        else if(cnt!=N-1)   cnt<=cnt+1;
    end
    assign y=x&(cnt==N-1);
endmodule

//N位簇发检测器
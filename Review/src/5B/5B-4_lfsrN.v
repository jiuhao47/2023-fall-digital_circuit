module lfsrN #(parameter N=4)(
    input clk,
    output [N-1:0] q
);
    reg [N-1:0] q;
    always @(posedge clk) begin
        q[N-1:1]<=q[N-2:0];
        if(N==3) q[0]<=q[2]^q[1];
        if(N==4) q[0]<=q[3]^q[2];
        if(N==5) q[0]<=q[4]^q[2];
        if(N==6) q[0]<=q[5]^q[4];
        if(N==7) q[0]<=q[6]^q[5];
        if(N==8) q[0]<=q[7]^q[5]^q[4]^q[3];
    end
endmodule
//N位伪随机数发生器，使用parameter实现
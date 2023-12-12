module TFF_edge_ar(
    input t,clk,rst,
    output q,qb
);
    reg q,qb;

    always @(posedge clk or negedge rst) begin
        if(~rst)begin
          q<=0;
          qb<=1;
        end
        else begin
            if(t) begin
              q<=qb;
              qb<=q;
            end
        end
    end
endmodule

//带异步复位的沿触发T触发器
//T为toggle，翻转
//T=1时翻转输出状态
module TFF_edge_ar2(
    input t,clk,rst,
    output q,qb
);
    reg q,qb;
    always @(posedge clk or negedge rst) begin
        if(~rst)
        begin
          q<=0;
          qb<=1;
        end
        else begin
            q=t^q;
            q=!q;
        end
    end
endmodule
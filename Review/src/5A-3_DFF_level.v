module DFF_level(
    input d,clk,
    output q,qb
);
    reg q,qb;
    always @(clk,d) begin
        if(clk==1) begin
          q=d;
          qb=~d;
        end
    end

endmodule

//电平触发的D触发器
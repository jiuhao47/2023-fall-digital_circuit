module DFF_edge(
    input d,clk,
    output q,qb
);
    reg q,qb;
    always @(posedge clk)begin
        q<=d;
        qb<=~d;
    end
endmodule
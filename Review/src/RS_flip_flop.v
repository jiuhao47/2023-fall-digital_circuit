module RS_flip_flop (input s,input r,input clk,output q,output qb);
    reg q, qb; 
    always @(clk, r, s, q, qb)
        if(clk == 1) begin
            if(s == 1) qb = 0;
            else qb = ~q;
            if(r == 1) q = 0;
            else q = ~qb;
        end else begin
            qb = ~q;
            q = ~qb;
        end
endmodule
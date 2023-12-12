module DFF_edge_asar(
    input d,clk,ss,sr,as,ar,
    output q,qb
);
    reg q,qb;
    wire d;
    wire clk;
    wire as,ar;
    wire ss,sr;

    always @(posedge clk or negedge as or negedge ar) begin
      if(~ar)begin
        q<=0;
        qb<=1;
      end
      else if(~as) begin
        q<=1;
        qb<=0;
      end
      else begin
        if(sr) begin
          q<=0;
          qb<=-1;
        end
        else if(ss) begin
          q<=1;
          qb<=0;
        end
        else begin
            q<=d;
            qb<=~d;
        end
      end
    end     
endmodule

//带同步异步复位的DFF
//as,ar，异步复位&置位
//ss,sr，同步复位&置位
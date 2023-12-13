module RS(
    input r,s,
    output  q,qb
);
    reg q,qb;
    always @(r,s,qb,q) begin
        if(s==1)    qb=0;
        else        qb=~q;
        if(r==1)    q=0;
        else        q=~qb;
    end
endmodule

//RS锁存器

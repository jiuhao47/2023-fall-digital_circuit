module highnum(
    input [7:0] d,
    output [2:0] s
);
    reg [3:0] mid;
    always @(d) begin
        mid=3'b000;
        if (d[0]==1'b1) 
            mid=mid+3'b001;
        if(d[1]==1'b1)
            mid=mid+3'b001;
        if(d[2]==1'b1)
            mid=mid+3'b001;
        if(d[3]==1'b1)
            mid=mid+3'b001;
        if(d[4]==1'b1)
            mid=mid+3'b001;
        if(d[5]==1'b1)
            mid=mid+3'b001;
        if(d[6]==1'b1)
            mid=mid+3'b001;
        if(d[7]==1'b1)
            mid=mid+3'b001;
    end
    assign s=mid;
endmodule
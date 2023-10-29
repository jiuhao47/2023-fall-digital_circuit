module div(
    input [3:0] din,
    output [2:0] dout
);
    reg [2:0] mid;
    always @(din) begin
        mid=3'b000;
        if(din<=4'b1111)
            mid=3'b101;
        if(din<=4'b1100)
            mid=3'b100;
        if(din<=4'b1001)
            mid=3'b011;
        if(din<=4'b0110)
            mid=3'b010;
        if(din<=4'b0011)
            mid=3'b001;
        if(din<=4'b0000)
            mid=3'b000;        
    end
    assign dout=mid;
endmodule
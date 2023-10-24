module unsignadd(
    input [3:0] a,
    input [3:0] b,
    output [4:0] y
);
    assign {y}={1'b0,a}+{1'b0,b};
endmodule

module calculate(
    input [3:0] A,
    input [3:0] B,
    input [2:0] S,
    output [4:0] Y
);
    reg [5:0] out;
    always @(A,B,S) begin
        case (S)
        3'd0:   out={1'b0,A}+{1'b0,B};
        3'd1:   out={1'b0,A}-{1'b0,B};
        3'd2:   out=({1'b0,A}+16)+({1'b0,B}+16)-32;
        3'd3:   out=({1'b0,A}+16)-({1'b0,B}+16)-32;
        3'd4:   out={2'b0,A>B,A==B,A<B};
        3'd5:   out={2'b0,({1'b0,A}+16)>({1'b0,B}+16),A==B,({1'b0,A}+16)<({1'b0,B}+16)};
        default : out=5'd0;
        endcase
    end
    
    assign y=out;
endmodule



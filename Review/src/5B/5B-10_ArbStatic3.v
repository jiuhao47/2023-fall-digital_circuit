module ArbStatic3(
    input clk,rstn,
    input [2:0] req,
    output [2:0] ack
);
    reg [2:0] ack;
    always @(req) begin
        casez(req)
        3'b??1:     ack=3'b001;
        3'b?10:     ack=3'b010;
        3'b100:     ack=3'b100;
        default     ack=3'b000;
        endcase
    end
endmodule
//3路静态优先级仲裁器
module ArbStatic3(
    input clk,rstn,
    input [2:0] req_i,
    output [2:0] ack_i,
    output req_o,
    input ack_o
);
    reg [2:0] ack_i;

    assign  req_o=|req_i;

    always @(req_i,ack_o) begin
        if(ack_o)    
            casez(req_i)
            3'b??1:     ack_i=3'b001;
            3'b?10:     ack_i=3'b010;
            3'b100:     ack_i=3'b100;
            default     ack_i=3'b000;
            endcase
        else
            ack_i=3'b000;
    end
endmodule
//3路静态优先级仲裁器

//考虑输出端暂时可能不相应
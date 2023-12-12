module vending_machine(
    input clk,rstn,
    input a,b,
    output y,z
);
    reg [1:0] state;
    always @(posedge clk or negedge rstn) begin
        if(!rstn) state<=0;
        else case(state)
        0: state<=a?2:(b?1:0);
        1: state<=a?0:(b?2:1);
        2: state<=a?0:(b?0:2);
        default:state<=0;
        endcase
    end
    assign y=((state==1)&a)|((state==2)&(a|b));
    assign z=(state==2)&a;
endmodule

//状态机描述贩卖机
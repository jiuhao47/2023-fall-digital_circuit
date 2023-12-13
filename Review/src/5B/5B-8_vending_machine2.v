module vending_machine2(
    input clk,rstn,
    input a,b,
    output y,z
);
    reg [1:0] paid_pre;
    wire [2:0] paid;
    assign paid ={1'b0,paid_pre} +{1'b0,a,1'b0}+{2'b00,b};
    assign y=paid>=3;
    assign z=paid==4;
    always @(posedge clk or negedge rstn) begin
        if(!rstn) paid_pre <=0;
        else if(y==0) paid_pre <= paid;
        else paid_pre <=0;
    end
endmodule

//行为描述贩卖机
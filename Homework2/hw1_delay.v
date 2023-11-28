module mydelay(input CLK,input r,output [2:0] q);
reg [2:0] a;
reg [1:0] b;

always@(r)begin
    if(~r) begin a<=0; end
end

always@(posedge CLK) begin 
    if(r)begin    
        a<=a+1;
        end
    end

assign q=a;
endmodule
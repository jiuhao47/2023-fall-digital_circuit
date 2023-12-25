module traffic_light
(
    input clk,rstn,
    output [1:0]signal  //2'b00: Error, 2'b01:red, 2'b10:green, 2'b11:yellow 
);
    reg [4:0] cnt;
    reg [1:0] signal_reg;
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            cnt<=22;
        end
        else if(cnt <21) begin
            cnt<=cnt+5'b00001;
        end
        else begin
            cnt<=5'b00000;
        end
    end

    always @(cnt) begin
        if(cnt<10) begin
            signal_reg=2'b01;
        end
        else if(cnt<11) begin
            signal_reg=2'b11;
        end
        else if(cnt<20) begin
            signal_reg=2'b10;
        end
        else if(cnt<22) begin
            signal_reg=2'b11;
        end
        else begin
            signal_reg=2'b00;   //Error Signal
        end
    end

    assign signal=signal_reg;
endmodule
`timescale 1ns/1ps
module test;
    parameter dw=4,L=8;
    reg clk,rstn;
    reg [dw-1:0] d_in;
    reg req_in;
    wire ack_in;
    wire [dw-1:0] d_out;
    wire req_out;
    reg ack_out;

    reg [dw-1:0]localfifo[L-1:0];
    integer wp=0;
    integer data_num=0;
    integer full_num=0;
    integer empty_num=0;


    fifo_register_out #(dw,L) dut(clk,rstn,d_in,req_in,ack_in,d_out,req_out,ack_out);

    initial begin
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        rstn=1;
        #3 rstn=0;
        #13 rstn=1;
    end

    always @(posedge clk) begin
        req_in<=$random;
        d_in<=$random;
        ack_out<=$random;
    end


    initial begin
        $dumpfile("fifo_register_out.vcd");
        $dumpvars(0);
        #10000 $finish();
    end
endmodule
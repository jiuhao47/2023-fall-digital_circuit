`timescale 1ns/1ps
 
module test;
    reg clk;
    reg rstn;
    wire [1:0]signal;

    traffic_light dut(.clk(clk),.rstn(rstn),.signal(signal));

    initial begin
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        rstn=1;
        #3 
        rstn=0;
        #13 rstn=1;
    end

    initial begin
        $dumpfile("traffic_light_test.vcd");
        $dumpvars(0);
        #300 $finish();
    end
endmodule
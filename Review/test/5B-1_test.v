`timescale 1ns/1ps
module test;
    reg clk;
    wire[3:0] q;
    wire c;
    
    counterN #(12) dut (clk,q,c);

    initial begin
        $deposit(dut.q,0);//复位信号
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    initial begin
        $dumpfile("5B-1_test.vcd");
        $dumpvars(0);
        #1000 $finish();
    end
endmodule
//需要复位信号
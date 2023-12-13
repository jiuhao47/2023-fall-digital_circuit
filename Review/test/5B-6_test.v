`timescale 1ns/1ps
module test;
    reg clk,x;
    wire y;
    
    burst_detect #(3) dut (clk,x,y);
    initial begin
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    always @(posedge clk) begin
        x<=$random;
    end

    initial begin
        $dumpfile("5B-6_test.vcd");
        $dumpvars(0);
        #1000 $finish();
    end
endmodule
`timescale 1ns/1ps
module test ;
    reg [3:0] din;
    wire [2:0] dout;
    div div1(din,dout);

    initial begin
        din=0;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        #10 din=$random;
        $finish();
    end
    initial begin
        $dumpfile("hw2_test.vcd");
        $dumpvars(0);
    end
endmodule
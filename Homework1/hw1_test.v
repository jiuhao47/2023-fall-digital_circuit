`timescale 1ns/1ps
module test ;
    reg [7:0] d;
    wire [3:0] s;
    highnum highnum1(d,s);

    initial begin
        d=0;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        #10 d=$random;
        $finish();
    end
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0);
    end
endmodule
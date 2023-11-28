`timescale 1ns/1ps
module test ;
    reg CLK;
    reg r;
    wire [2:0] q;

    mydelay dut(.CLK(CLK),.r(r),.q(q));
initial begin
    CLK=0;
    forever begin
        #50 CLK=~CLK;
    end
end
initial begin
    r=0;
    #125 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    #50 r=1;
    $finish();
end
initial begin
    $dumpfile("hw1_delay_test.vcd");
    $dumpvars(0);
end
endmodule
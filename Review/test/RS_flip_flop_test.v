`timescale 1ns/1ps
module test ;
    reg clk;
    reg r;
    reg s;
    wire q;
    wire qb;
    RS_flip_flop dut(.s(s),.r(r),.clk(clk),.q(q),.qb(qb));
initial begin
    clk=0;
    forever begin
        #50 clk=~clk;
    end
end
initial begin
    s=1;
    r=0;
    #125 s=0;r=1;
    #100 s=1;r=0;
    #100 r=1;
    #50 s=0;
    #47 s=1;
    #5 r=0;
    #10 s=0;
    #25 s=1;
    #10 s=0;
    #8 r=1;
    $finish();
end
initial begin
    $dumpfile("RS_flip_flop.vcd");
    $dumpvars(0);
end
endmodule
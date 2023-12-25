`timescale 1ns/1ps

module  test;
    reg clk,rstn;
    reg [3:0] req_i;
    reg ack_o;
    wire [3:0] ack_i;
    wire req_o;
    
    randomprio_Arb4 #(4) dut(.clk(clk),.rstn(rstn),.req_i(req_i),.ack_i(ack_i),.req_o(req_o),.ack_o(ack_o));

    initial begin
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    initial begin
        req_i<=0;
        ack_o=1;
        #2000
        ack_o=0;
        #100
        ack_o=1;
    end
    initial begin
        rstn<=1;
        #3 rstn<=0;
        #13 rstn<=1;
    end

    
    always @(posedge clk) begin
        if(~req_i[0]) begin
            req_i[0]<=$random;
        end
        if(~req_i[1]) begin
            req_i[1]<=$random;
        end
        if(~req_i[2]) begin
            req_i[2]<=$random;
        end
        if(~req_i[3]) begin
            req_i[3]<=$random;
        end
    end

    always @(negedge clk) begin
        if(ack_i[0])begin
            req_i[0]<=0;
        end
        if(ack_i[1])begin
            req_i[1]<=0;
        end
        if(ack_i[2])begin
            req_i[2]<=0;
        end
        if(ack_i[3])begin
            req_i[3]<=0;
        end

    end


    integer n0=0,n1=0,n2=0,n3=0;
    always @(negedge clk) begin
        if(ack_i[0]) begin
            n0=n0+1;
        end
        if(ack_i[1]) begin
            n1=n1+1;
        end
        if(ack_i[2]) begin
            n2=n2+1;
        end
        if(ack_i[3]) begin
            n3=n3+1;
        end
    end


    
    initial begin
        $dumpfile("randomprio_Arb4_test.vcd");
        $dumpvars(0);
        #4000000 
        $display($stime, ": port 0 is answered %d times.\n",n0);
        $display($stime, ": port 1 is answered %d times.\n",n1);
        $display($stime, ": port 2 is answered %d times.\n",n2);
        $display($stime, ": port 3 is answered %d times.\n",n3);
        $finish();
    end

endmodule
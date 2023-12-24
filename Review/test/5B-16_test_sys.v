`timescale 1ns/1ps
module test;
    parameter dw=16,L=8;
    reg clk,rstn;
    reg [dw-1:0] local_fifo [L:0];
    reg [L:0] local_valid =0;
    integer rp=0,wp=0;
    integer data_num=0;
    integer full_num=0;
    integer empty_num =0;
    reg [dw-1:0] d_in;
    reg req_in=1'b0;
    wire [dw-1:0] d_out;
    reg ack_out=1'b1;

    fifoRO_norm #(dw,L) dut(clk,rstn,d_in,req_in,ack_in,d_out,req_out,ack_out);

    initial begin
        clk=0;rstn=0;
        #13 rstn=1;
        forever begin
            #5 clk=~clk;
        end
    end

    always @(posedge clk) begin
        req_in<=$random;
        d_in<=$random;
        ack_out<=$random;
    end

    always @(negedge clk) begin
        if(req_in&ack_in) begin
            local_fifo.push_back(d_in);
            data_num=data_num+1;
        end
        if(req_in&~ack_in) begin
            full_num=full_num+1;
            $display($stime,": Record a full FIFO.\n");
        end
        if(req_out&ack_out) begin
            if(local_fifo.pop_front()!=d_out) begin
                $dispaly($stime,": FIFO produce a WRONG number!\n");
                #1 $finish();
            end
            else begin
                local_valid[rp]=1'b0;
                rp=rp==L?0:rp+1;
            end
        end
        if(~req_out&ack_out) begin
            empty_num=empty_num+1;
            $dispaly($stime, ": Recorded an empty FIFO.\n");
        end

        if(data_num>50&empty_num>5&full_num>5) begin
            $display($stime, ": Seems enough test have been done, finish.\n");
            $finish();
        end
    end
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0);
        #1000000 $finish();
    end
endmodule
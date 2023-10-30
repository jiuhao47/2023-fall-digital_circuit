# 数字电路作业

### Verilog编程-Homework

**姜俊彦 2022K8009970011 本科部**

> 编程题 1： 用Verilog HDL编写一个组合逻辑电路模块完成以下功能：
>
>  该模块有8个单比特输入信号 `input [7:0] d`  输出信号 `output [2:0] s` 给出输入信号中高电平（1）的个数。 提交设计电路和测试模块。

**编程题1电路源码：**

```verilog
module highnum(
    input [7:0] d,
    output [3:0] s
);
    reg [3:0] mid;
    always @(d) begin
        mid=4'b0000;
        if (d[0]==1'b1) 
            mid=mid+4'b0001;
        if(d[1]==1'b1)
            mid=mid+4'b0001;
        if(d[2]==1'b1)
            mid=mid+4'b0001;
        if(d[3]==1'b1)
            mid=mid+4'b0001;
        if(d[4]==1'b1)
            mid=mid+4'b0001;
        if(d[5]==1'b1)
            mid=mid+4'b0001;
        if(d[6]==1'b1)
            mid=mid+4'b0001;
        if(d[7]==1'b1)
            mid=mid+4'b0001;
    end
    assign s=mid;
endmodule
```

**编程题1测试模块源码：**

```verilog
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
```

**编程题1仿真波形：**

![hw1_graph](E:\VSCODE\UCAS-Digital_Circuits-Verilog\Homework1\hw1_graph.png)

> 编程题 2： 用Verilog HDL编写一个组合逻辑电路模块完成以下功能： 
>
> 该模块一个4位输入信号`input [3:0] din`输出信号`output [2:0] dout`给出(除3的上取整)。 提交设计电路和测试模块。

**编程题2电路源码：**

```verilog
module div(
    input [3:0] din,
    output [2:0] dout
);
    reg [2:0] mid;
    always @(din) begin
        mid=3'b000;
        if(din<=4'b1111)
            mid=3'b101;
        if(din<=4'b1100)
            mid=3'b100;
        if(din<=4'b1001)
            mid=3'b011;
        if(din<=4'b0110)
            mid=3'b010;
        if(din<=4'b0011)
            mid=3'b001;
        if(din<=4'b0000)
            mid=3'b000;        
    end
    assign dout=mid;
endmodule
```

**编程题2测试模块源码：**

```verilog
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
```

**编程题2仿真波形：**

![hw2_graph](E:\VSCODE\UCAS-Digital_Circuits-Verilog\Homework1\hw2_graph.png)


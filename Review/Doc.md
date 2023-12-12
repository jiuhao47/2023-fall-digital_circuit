# Review

## 关键字

### 常量

```
8'b0100_1100	二进制 
8'h4c			十六进制 
8'd76			十进制 
```

### 逻辑运算符

```
&	按位与
|	按位或
~	按位取反
^	按位异或
[]	表示信号宽度
{}	拼接	{1'b0,1'b1}=01;
```

### 数学运算符

```
+	加
-	减
*	乘
<	小于
>	大于
==	判断相等
!=	判断不等
&q	递归与，q的所有位与的结果
|q	递归或
^q	递归异或
?:	条件三元运算符
```

### 赋值

```
=	阻塞赋值
<=	非阻塞赋值
```

### 关键字

```
module,endmodule		实例化模块
input,output			模块输入与输出
wire					线信号
assign					赋值语法以关键字assign开头，后面是信号名，可以是单个信号，也可以是不同信号网的连接。
reg						reg型变量是最常用的variable型变量，必须放在过程语句(如initial、 always) 中，通过过程赋值语句赋值
always					过程块
if,else					条件判断
begin,end				块开始与结束
case,end case			case语句
casez					优先编码选择
posedge,negedge			上升沿和下降沿检测
or						敏感列表中的或条件
parameter				指定参数
```


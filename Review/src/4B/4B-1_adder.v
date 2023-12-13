module adder(
    input a,b,ci,
    output s,co
);
    assign s=a^b^ci;
    assign co=(a&b)|(b&ci)|(a&ci);
endmodule
//1位全加器
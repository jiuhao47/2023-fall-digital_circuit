module adder_always(
    input a,b,ci,
    output s,co
);
    reg s,co;
    always @(a,b,ci) begin
        s=a^b^ci;
        co=(a&b)|(b&ci)|(a&ci);
    end
endmodule
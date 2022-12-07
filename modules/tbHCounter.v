`timescale 1ns/1ns
`include "modules/hCounter.v"

module hCounter_tb();
        reg clk;
        reg rst;
        wire [8:0] count;

        hCounter hCount(clk, rst, count);
        initial 
        begin
                $monitor("clk=%b, hCount=%d",clk, count);
                $dumpfile("and2.vcd");
                $dumpvars(0, hCounter_tb);
                rst = 0; #10;
                rst = 1; #10;
                rst = 0; #10;
                clk = 0; #10;
                clk = 1; #10;
                clk = 0; #10;
                clk = 1; #10;
                clk = 0; #10;
                clk = 1; #10;
                clk = 0; #10;
                clk = 1; #10;
                clk = 0; #10;
                clk = 1; #10;

                #10;
                $finish;
        end
endmodule
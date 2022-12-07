`timescale 1ns/1ns
`include "GPU.v"

module GPU_tb();

        integer i;

        reg clk;
        reg rst;
        wire hRst, hSync, vSync, oe;
        wire [15:0] addr;
        wire [8:0] hCount;
        wire [9:0] vCount;

        GPU gpu1(clk, rst, hSync, vSync, hCount, vCount, addr, oe);
        initial 
        begin
                $monitor("hCount=%d, vCount=%d, addr=%d, hSync=%d, vSync=%d, oe=%d",hCount, vCount, addr, hSync, vSync, oe);
                $dumpfile("GPU.vcd");
                $dumpvars(0, GPU_tb);
                rst = 0; #10;
                rst = 1; #10;
                rst = 0; #10;
                for(i = 0; i<165792; i++)
                begin
                        clk = 0; #10;
                        clk = 1; #10;
                end
                #10;
                $finish;
        end
endmodule
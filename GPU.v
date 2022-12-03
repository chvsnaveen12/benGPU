`include "modules/hCounter.v"
`include "modules/hSyncGen.v"
`include "modules/vCounter.v"
`include "modules/vSyncGen.v"


module GPU (
        input CLK,
        output HSYNC,
        output VSYNC,
        output [15:0] ADDR,
        output OE
);
        wire hRst, hVisible, hSync, vRst, vVisible, vSync;
        wire [8:0] hCount;
        wire [9:0] vCount;

        hCounter hcounter(clk, hRst, hCount);
        hSyncGen hgenerator(hCount, hVisible, hSync, hRst);
        vCounter vcounter(hRst, vRst, vCount);
        vSyncGen vgenerator(vCount, vVisible, vSync, vRst);

        assign HSYNC = hSync;
        assign VSYNC = vSync;

        assign OE = hSync & vSync; 
        assign ADDR = {vCount[9:2],hCount[7:0]};


endmodule
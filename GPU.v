`include "modules/hCounter.v"
`include "modules/hSyncGen.v"
`include "modules/vCounter.v"
`include "modules/vSyncGen.v"


module GPU (
        input CLK,
        input RST,
        output HSYNC,
        output VSYNC,
        output [8:0] HCOUNT,
        output [9:0] VCOUNT,
        output [15:0] ADDR,
        output OE
);
        
        wire hRst, hVisible, vRst, vVisible;
        wire [8:0] hCount;
        wire [9:0] vCount;

        hCounter hcounter(CLK, hRst, RST, hCount);
        hSyncGen hgenerator(hCount, hVisible, HSYNC, hRst);
        vCounter vcounter(hRst, vRst, RST, vCount);
        vSyncGen vgenerator(vCount, vVisible, VSYNC, vRst);

        assign OE = hVisible & vVisible;
        assign ADDR = {vCount[9:2],hCount[7:0]};

        assign HCOUNT = hCount;
        assign VCOUNT = vCount;

        assign HRST = hRst;

endmodule
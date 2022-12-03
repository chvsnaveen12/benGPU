module vSyncGen (
        input [9:0] vCount,
        output reg vVisible,
        output reg vSync,
        output vRst
);

        assign vRst = (vCount == 628) ? 1'b1 : 1'b0;

        always @ (vCount)
        begin
                if(vCount == 600)
                        vVisible <= 1'b0;
                else if(vCount == 601)
                        vSync <= 1'b0;
                else if(vCount == 605)
                        vSync <= 1'b1;
                else if(vCount == 628)
                        vVisible <= 1'b1;
        end

endmodule
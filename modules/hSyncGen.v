module hSyncGen (
        input [8:0] hCount,
        output reg hVisible,
        output reg hSync,
        output hRst
);

        assign hRst = (hCount == 264) ? 1'b1 : 1'b0;

        always @ (hCount)
        begin
                if(hCount == 200)
                        hVisible <= 1'b0;
                else if(hCount == 210)
                        hSync <= 1'b0;
                else if(hCount == 242)
                        hSync <= 1'b1;
                else if(hCount == 264)
                        hVisible <= 1'b1;
        end

endmodule
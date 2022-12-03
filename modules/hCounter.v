module hCounter (
        input clk,
        input rst,
        output reg [8:0] count
);

        always @(posedge clk or negedge rst)
        begin
                if(rst)
                        count <= 0;
                else
                        count <= count + 1'b1;
        end
endmodule
module vCounter (
        input clk,
        input rst,
        input RST,
        output reg [9:0] count
);

        always @(posedge clk or posedge rst or posedge RST)
        begin   
                if(RST)
                        count <= 0;
                else if(rst)
                        count <= 0;
                else
                        count <= count + 1'b1;
        end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2025 11:06:13 PM
// Design Name: 
// Module Name: jc_v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module jc_v(
input wire clk,
input wire rst ,
output reg [3:0] count 

    );
    always @(posedge clk or posedge rst) begin 
    if(rst) begin 
    count <=4'b0000;
    end else begin 
    count <=  {~count[3] ,count[3:1]};
    end 
    end 
endmodule
*/
module jc_v(
input wire clk,
input wire rst ,
output reg [3:0] count 
);
always @(posedge clk or posedge rst) begin 
if(rst) begin 
count<=4'b0000;
end else begin 
count <= {~count[3] , count [3:1]};
end 
end 
endmodule
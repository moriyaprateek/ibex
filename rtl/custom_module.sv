`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2021 21:06:40
// Design Name: 
// Module Name: custom_module
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


module custom_module(
    input logic custom_en,
    input logic [31:0] custom_in_RS1, //Register 1 data
    input logic [31:0] custom_in_RS2, //Register 2 data
    input logic clk,
    output logic custom_valid,
    input logic insert_bloom,
    input logic check_bloom,
    output logic match_bloom,
    input logic reset_bloom,    
    input logic [4:0] custom_op_ex
);

reg [4:0] custom_op_temp;
reg [31:0] register_data;

assign custom_op_temp = custom_op_ex; 

 always @(posedge clk) begin
    case ( custom_op_temp )
    
    5'b000001: begin //Insert bloom. I.e, insert the data
        insert_bloom = 1'b1;
        reset_bloom = 1'b0;
        match_bloom = 1'b0;
        check_bloom = 1'b0;
    end
    5'b000011: begin //Reset bloom. I.e, insert the data
        insert_bloom = 1'b0;
        reset_bloom = 1'b1;
        check_bloom = 1'b0;
    end
    5'b000100: begin //Check bloom. I.e, insert the data
        insert_bloom = 1'b0;
        reset_bloom = 1'b0;
        check_bloom = 1'b1;
    end       
    endcase
    
    Bloom bloom_i(
    .data(custom_in_RS1),
    .clk(clk),
    .insert(insert_bloom),
    .check(check_bloom),
    .match(match_bloom),
    .reset(reset_bloom)
);
    
 end


endmodule




`timescale 1ns / 1ps

module Bloom(clk, insert, data, check, reset, match);
    parameter d_size = 32;
    parameter bl_size = 32; //2^^5
    parameter hash_size = 5;
    input insert, check,  reset, clk;
    input [d_size - 1: 0] data;
    output match;

    reg [bl_size - 1:0]bloom;
    logic [hash_size - 1: 0] bl_out;

    hash#(d_size, bl_size, hash_size) hash_block (
        .clk(clk),
        .data(data),
        .insert(insert),
        .bl_out(bl_out));
        
    always@(posedge clk) begin
        bloom[bl_out] = 1;
        if(reset == 1) begin
            bloom = 0;
        end    
    end 
    
    comparator #(d_size, bl_size, hash_size) comparator_ting (
        .clk(clk),
        .hash(bl_out),
        .check(check),
        .bloom(bloom),
        .match(match)
    );
    
    
endmodule

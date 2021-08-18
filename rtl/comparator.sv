module comparator #(parameter d_size, bl_size, hash_size) (check, bloom, clk, hash, match);
    input logic clk, check;
    input logic [bl_size - 1: 0] bloom;
    input logic [hash_size - 1: 0]hash;
    output logic match;
    
    logic [bl_size - 1:0] temp;
    always @(posedge clk) begin
        if(bloom[hash] == 1) begin
            match = 1;
        end
    end
endmodule

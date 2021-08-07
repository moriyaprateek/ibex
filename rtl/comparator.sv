module comparator #(parameter d_size, bl_size, hash_size) (check, bloom, clk, hash, match);
    input logic clk, check;
    input logic [bl_size - 1: 0] bloom;
    input logic [hash_size - 1: 0]hash;
    output logic match;
    
    logic [bl_size - 1:0] temp;
    int sum = 0;
    always @(posedge clk) begin
        temp = bloom | hash;

        for(int i = 0; i < bl_size; i++) begin
            sum += temp[i];
        end
        if(sum == 3)begin
            match = 1;
        end
    end
endmodule

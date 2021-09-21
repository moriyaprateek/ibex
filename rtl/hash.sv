module hash #(parameter d_size, bl_size, hash_size) (clk, data, insert, bl_out, check, hash);
    input logic insert, clk, check;
    input logic [d_size - 1:0] data;
    output logic [hash_size - 1:0] bl_out;
    output logic [hash_size - 1:0] hash;
    
    always@(posedge clk) begin
        
        if(insert == 1) begin
        bl_out = 31;
            for(int i = 0; i < d_size/hash_size; i++)begin
                bl_out ^= data[i*hash_size  +: hash_size];
                bl_out *= 17;
                
            end
        end
        
        if(check == 1) begin
        hash = 31;
            for(int i = 0; i < d_size/hash_size; i++)begin
                hash ^= data[i*hash_size  +: hash_size];
                hash *= 17;
                
            end
        end
    end
    

endmodule


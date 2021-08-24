module hash #(parameter d_size, bl_size, hash_size) (clk, data, insert, bl_out);
    input logic insert, clk;
    input logic [d_size - 1:0] data;
    output logic [hash_size - 1:0] bl_out;
    
    always@(posedge clk) begin
        
        if(insert == 1) begin
        bl_out = 31;
        main
            for(int i = 0; i < d_size/hash_size; i++)begin
                bl_out ^= data[i*hash_size  +: hash_size];

            for(int i = 0; i < d_size/5; i++)begin
                bl_out ^= data[i*5 +: 5];

                bl_out *= 17;
                
            end
        end
    end
    

endmodule


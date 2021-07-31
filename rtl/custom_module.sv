module custom_module(
    input logic custom_en,
    input logic [31:0] custom_in_RS1, //Register 1 data
    input logic [31:0] custom_in_RS2, //Register 2 data
    input logic clk,
    output logic custom_valid,
//    input logic insert_bloom,
//    input logic check_bloom,
//    output logic match_bloom,
//    input logic reset_bloom,    
    input logic [4:0] custom_op_ex
);

reg [4:0] custom_op_temp;
reg [31:0] register_data;

logic insert_bloom;
logic check_bloom;
logic match_bloom;
logic reset_bloom;


assign custom_op_temp = custom_op_ex; 



always @(*)
begin
    case(custom_op_temp)
       5'b00001: begin //Insert bloom
        insert_bloom = 1'b1;
        reset_bloom = 1'b0;
        check_bloom = 1'b0;
        end
       5'b000011: begin //Reset bloom.
        insert_bloom = 1'b0;
        reset_bloom = 1'b1;
        check_bloom = 1'b0;
    end
        5'b000100: begin //Check bloom.
        insert_bloom = 1'b0;
        reset_bloom = 1'b0;
        check_bloom = 1'b1;
    end       
    endcase

end


    Bloom bloom_i(
    .data(custom_in_RS1),
    .clk(clk),
    .insert(insert_bloom),
    .check(check_bloom),
    .match(match_bloom),
    .reset(reset_bloom)
);
   
 



endmodule




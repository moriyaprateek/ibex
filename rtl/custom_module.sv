module custom_module(
   (* dont_touch = "true" *) input logic custom_en,
    input logic [31:0] custom_in_RS1, //Register 1 data
    input logic [31:0] custom_in_RS2, //Register 2 data
    input logic clk,
    (* dont_touch = "true" *) output logic custom_valid,
//    input logic insert_bloom,
//    input logic check_bloom,
//    output logic match_bloom,
//    input logic reset_bloom,    
    (* dont_touch = "true" *) input logic [4:0] custom_op_ex
);

(* dont_touch = "true" *) reg [4:0] custom_op_temp;
(* dont_touch = "true" *) reg [31:0] register_data;



logic insert_bloom;
logic check_bloom;
logic match_bloom;
logic reset_bloom;


assign custom_op_temp = custom_op_ex; 
assign register_data[7:0] = custom_in_RS1[7:0];

always @(*)
begin
    case(custom_op_temp)
       5'b00001: begin //Insert bloom
        insert_bloom = 1'b1;
        reset_bloom = 1'b0;
        check_bloom = 1'b0;
        custom_valid = 1'b1;
        end
       5'b000011: begin //Reset bloom.
        insert_bloom = 1'b0;
        reset_bloom = 1'b1;
        check_bloom = 1'b0;
        custom_valid = 1'b1;
    end
        5'b000100: begin //Check bloom.
        insert_bloom = 1'b0;
        reset_bloom = 1'b0;
        check_bloom = 1'b1;
        custom_valid = 1'b1;
    end      
    default: begin
        insert_bloom = 1'b0;
        reset_bloom = 1'b0;
        check_bloom = 1'b0;
        custom_valid = 1'b1;
    end 
    endcase

end

   
   Bloom bloom_i(
       .clk(clk),
       .insert(insert_bloom),
       .data(register_data),
       .check(check_bloom),
       .reset(reset_bloom),
       .match(match_bloom)
   );
 



endmodule




//Writing the custom module to pass on the relevant values to the bloom module that'll be synthesized



module custom_module(
    input logic custom_en,
    input logic custom_in_RS1, //Register 1 data
    input logic custom_in_RS2, //Register 2 data
    input logic clk,
    input logic check_bloom,
    input logic match_bloom,
    input logic reset_bloom,
    input logic custom_op_ex
);

    // logic [3:0] state = 0;
    //Adding actual custom instructions based on custom_op_ex
    // reg [4:0] custom_op_temp;

    // always@(posedge clk) begin

    // case (custom_op_temp)
    //     4'b0001: begin
    //         // Insert into bloom
    //         insert_bloom = custom_in_RS1;
    //     end
    //     4'b0011: begin
    //         // Reset bloom
    //         reset_loom = 1;
    //     end
    //     4'b0100: begin
    //         //Check bloom. If check = correct, match will output 1
    //         check_bloom = 1
    //     end 
    // default: begin
    //     custom_op_temp = custom_op_ex;
    //     check_bloom <= 1'b0;
    //     reset_bloom = 1'b0; 
    // end
    // endcase
    // end
//Passing on the signals to the bloom module
Bloom bloom_i(
    .data(custom_in_RS1),
    .clk(clk),
    .insert(insert_bloom),
    .check(check_bloom),
    .match(match_bloom),
    .reset(reset_bloom)
);

endmodule
//Insert bloom needs to be the input data while the others are control signals.
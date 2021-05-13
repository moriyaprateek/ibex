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


    //Adding actual custom instructions based on custom_op_ex
    
    
    // case()

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
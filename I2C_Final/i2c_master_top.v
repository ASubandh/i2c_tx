module i2c_master_top (
    input  wire i_Clk,      // system clock
    input  wire reset,    // reset
    // I2C interface
    output wire io_PMOD_1, //scl_out
    output wire io_PMOD_2 //sda_out, could be inout
);
    //wire to feed divided clock into the module
    wire i2c_clk;    
    wire scl_out;
    wire sda_out;


//instance of clock divider
  i2c_clk_divider clock_divider
  (.ref_clk(i_Clk),
   .reset(reset),
   .i2c_clk(i2c_clk)); //change to be sure?

//instance of master module 
step1 i2c_master_module(
    .i2c_clk(i2c_clk),
    .reset(reset),
    .i2c_sda(sda_out),
    .i2c_scl(scl_out)
);

//assign the stuff at the end 
assign io_PMOD_2 = sda_out;
assign io_PMOD_1 = scl_out;
endmodule
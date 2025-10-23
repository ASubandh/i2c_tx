module i2c_clk_divider(

    input wire reset,
    input wire ref_clk,
    output reg i2c_clk

);

reg [9:0] count_cycles = 0;
parameter DELAY = 250;  //25MHZ input clock
initial i2c_clk = 0;
always @(posedge ref_clk) begin

    if (count_cycles == (DELAY/2)-1) begin
        i2c_clk = ~i2c_clk; //reset clock
        count_cycles = 0 ; //reset counter
    end
    else begin
        count_cycles = count_cycles + 1; //incrament  
    end


end
endmodule
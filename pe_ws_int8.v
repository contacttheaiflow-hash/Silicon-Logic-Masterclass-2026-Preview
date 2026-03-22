module pe_ws_int8 #(parameter ACT_W = 8, WGT_W = 8, PSUM_W = 32) (
    input clk, rst_n, en,
    input signed [ACT_W-1:0] act_in,
    input signed [WGT_W-1:0] wgt_in,
    input wgt_en,
    input signed [PSUM_W-1:0] psum_in,
    output reg signed [ACT_W-1:0] act_out,
    output reg signed [PSUM_W-1:0] psum_out
);
    reg signed [WGT_W-1:0] wgt_reg;
    always @(posedge clk) begin
        if (en && wgt_en) wgt_reg <= wgt_in;
        act_out <= act_in;
        psum_out <= psum_in + (act_in * wgt_reg);
    end
endmodule


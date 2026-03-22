module pe_zero_skip #(parameter DWIDTH = 8) (
    input clk, rst_n,
    input [DWIDTH-1:0] act, wgt,
    output reg valid_compute,
    output reg [15:0] product
);
    wire is_zero = (act == 0) | (wgt == 0);
    always @(posedge clk) begin
        valid_compute <= !is_zero;
        product <= is_zero ? 0 : act * wgt;
    end
endmodule


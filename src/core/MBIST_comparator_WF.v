`timescale 1ns / 1ps

module MBIST_comparator_write_first (
    reset, comp_en, comp_clk, check, capture, comp_alg_end, data_in, data_out, fail, done
    );

	parameter DW = 1;										// Define data width

    input reset;											// Asynchronous reset, active high
    input comp_en;											// Block enable, active high
	input comp_clk;										// BIST Clock
	input check;											// Check Clock
    input capture;											// Capture input data enable, active high
	input comp_alg_end;									// End point enable
    input [DW:0] data_in;								// Input Data in
    input [DW:0] data_out;								// Output Data in
	output fail;											// Fail ID
	output done;											// Done ID

	reg fail_diag;
	reg [DW:0] comp_data;
	reg done;
	reg fail;
	
	// Comparator asynchronous reset
	always @(reset) begin
		if (reset) begin
			assign comp_data = 0;
			assign done = 0;
			assign fail = 0;
			assign fail_diag = 0;
		end
		else begin
			deassign comp_data;
			deassign done;
			deassign fail;
			deassign fail_diag;
		end
	end
	
	// Fail signal arise
	always @(posedge fail_diag) begin
		if (comp_en) begin
			fail <= 1;
			end
		else begin
			fail <= fail;
		end
	end
	
	// Done signal arise
	always @(posedge comp_alg_end) begin
		if (comp_en) begin
			done <= 1;
			end
		else begin
			done <= done;
		end
	end
	
	// Capture input data
	always @(posedge comp_clk) begin
		if (comp_en) begin
			if (capture) begin
				comp_data <= data_in;
			end
		end
	end
	
	// Check output data
	always @(negedge check) begin
		if(comp_en) begin
			if (comp_data == data_out) begin
				fail_diag <= 0;
				end
			else begin
				fail_diag <= 1;
			end
		end
	end

endmodule

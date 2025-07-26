module tb_riscv_sc;
//cpu testbench

reg clk;
reg start;

SingleCycleCPU uut(clk, start);

wire [31:0] i;
assign i = uut.instruction;

wire [31:0] t0, t1, s0;

    // Accessing the registers directly from the SingleCycleCPU
    assign t0 = uut.regFile.regs[5];  
    assign t1 = uut.regFile.regs[6];
    assign s0 = uut.regFile.regs[8];
//    assign sp = uut.regFile.regs[2];
//    assign max_in_mem = {uut.dataMemory.data_memory[sp+3],uut.dataMemory.data_memory[sp+2],uut.dataMemory.data_memory[sp+1],uut.dataMemory.data_memory[sp]};
//    assign min_in_mem = {uut.dataMemory.data_memory[sp+7],uut.dataMemory.data_memory[sp+6],uut.dataMemory.data_memory[sp+5],uut.dataMemory.data_memory[sp+4]};


initial
	forever #5 clk = ~clk;

initial begin
	clk = 0;
	start = 0;
	#10 start = 1;

	#1200 $finish;

end

endmodule

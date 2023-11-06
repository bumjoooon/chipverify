interface cnt_if #(parameter WIDTH = 4 ) (input bit clk);
    logic rstn;
    logic load_en;
    logic [WIDTH-1:0] load;
    logic [WIDTH-1:0] count;
    logic down;
    logic rollover;
endinterface

module tb;
    reg clk;

    always #10 clk = ~clk;
    
    cnt_if cnt_if0(clk);

    counter_ud co(

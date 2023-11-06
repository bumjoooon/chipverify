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

    counter_ud co( .clk (cnt_if0.clk),
                    .rstn (cnt_if0.rstn),
                    .load_en (cnt_if0.load_en),
                    .load (cnt_if0.load),
                    .count (cnt_if0.count),
                    .down (cnt_if0.down),
                    .rollover (cnt_if0.rollover));

    initial begin
        bit load_en, down;
        bit [3:0] load;

        $monitor("[%0t] down=%0b, $

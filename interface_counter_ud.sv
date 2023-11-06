module counter_ud
    #(parameter WIDTH = 4)
    (
     input clk,
     input rstn,
     input wire [WIDTH-1:0] load,
     input down,
     output rollover,
     output reg [WIDTH-1:0] count
    );

    always@(posedge clk or negedge rstn) begin
        if (!rstn) 
            count <= 0;
        else begin
            if(load_en)
                count <= load;
            else begin
                if(down)
                    count <= count - 1;
                else
                    count <= count + 1;
            end
        end
    end

        assign rollover =&count;
        endmodule

`include "axi_pkg.sv"
`include "axi_if.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;
import axi_pkg::*;
module top;
    axi_if xif();
    axi4 dut(.ACLK(xif.ACLK),
             .ARESETn(xif.ARESETn),
             .AWADDR(xif.AWADDR),
             .AWLEN(xif.AWLEN),
             .AWSIZE(xif.AWSIZE),
             .AWVALID(xif.AWVALID),
             .AWREADY(xif.AWREADY),
             .WDATA(xif.WDATA),
             .WVALID(xif.WVALID),
             .WLAST(xif.WLAST),
             .WREADY(xif.WREADY),
             .BRESP(xif.BRESP),
             .BVALID(xif.BVALID),
             .BREADY(xif.BREADY),
             .ARADDR(xif.ARADDR),
             .ARLEN(xif.ARLEN),
             .ARSIZE(xif.ARSIZE),
             .ARVALID(xif.ARVALID),
             .ARREADY(xif.ARREADY),
             .RDATA(xif.RDATA),
             .RRESP(xif.RRESP),
             .RVALID(xif.RVALID),
             .RLAST(xif.RLAST),
             .RREADY(xif.RREADY));
    axi4_memory dut2(.clk(xif.ACLK),
                    .rst_n(xif.rst_n),
                    .mem_en(xif.mem_en),
                    .mem_we(xif.mem_we),
                    .mem_addr(xif.mem_addr),
                    .mem_wdata(xif.mem_wdata),
                    .mem_rdata(xif.mem_rdata));

    initial begin
        xif.ACLK=0;
        forever #5 xif.ACLK=~xif.ACLK;
    end
    initial begin
        xif.ARESETn=0;
        xif.rst_n =0;
        #5ns;
        xif.ARESETn=1;
        xif.rst_n =1;
    end
    initial begin
        uvm_config_db#(virtual axi_if)::set(null,"*","axi_if",xif);
        run_test("axi_test");
    end
endmodule
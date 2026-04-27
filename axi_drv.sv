`ifndef AXI_DRIVER_SVH
`define AXI_DRIVER_SVH
`include "uvm_macros.svh"
`include "axi_transaction.sv"
import uvm_pkg::*;
class axi_driver extends uvm_driver #(axi_transaction);
    virtual axi_if x;
    `uvm_component_utils(axi_driver)
    function new(string name = "axi_driver",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(), $sformatf("build phane is done in driver"), UVM_LOW)
        if(!uvm_config_db#(virtual axi_if)::get(null,"","axi_if",x))
            `uvm_fatal(get_type_name(), $sformatf("failed to get axi_if from db"))
    endfunction
    task run_phase(uvm_phase phase);
        forever begin
            axi_transaction req;
            seq_item_port.get_next_item(req);
            drive(req);
            seq_item_port.item_done();
        end
    endtask
    extern task drive(axi_transaction req);
endclass
task axi_driver::drive(axi_transaction req);
    req.print();
    @(negedge x.ACLK);
    if(!x.ARESETn)begin
        x.ARESETn = req.ARESETn;
        x.AWADDR = req.AWADDR;
        x.AWLEN = req.AWLEN;
        x.AWSIZE = req.AWSIZE;
        x.AWVALID = req.AWVALID;
        x.AWREADY = req.AWREADY;
        x.WDATA = req.WDATA;
        x.WVALID = req.WVALID;
        x.WLAST = req.WLAST;
        x.BREADY = req.BREADY;
        x.ARADDR = req.ARADDR;
        x.ARLEN = req.ARLEN;
        x.ARSIZE = req.ARSIZE;
        x.ARVALID = req.ARVALID;
        x.ARREADY = req.ARREADY;
    end

endtask
`endif
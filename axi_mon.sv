`ifndef AXI_MONITOR_SVH
`define AXI_MONITOR_SVH
`include "axi_transaction.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;
class axi_monitor extends uvm_monitor;
    virtual axi_if y;
    uvm_analysis_port#(axi_transaction) analysis_port;
    `uvm_component_utils(axi_monitor)
    function new(string name = "axi_monitor",uvm_component parent = null);
        super.new(name,parent);
        analysis_port=new("analysis_port",this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual axi_if)::get(null,"","axi_if",y))
            `uvm_fatal(get_type_name(), $sformatf("the interface is not loaded from db"));
        `uvm_info(get_type_name(), $sformatf("build phane is done in monitor"), UVM_LOW)
    endfunction
    task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "ENTERED RUN PHASE", UVM_LOW)
        forever begin
            axi_transaction tr=axi_transaction #()::type_id::create("tr");
            @(posedge y.ACLK);
            #1ns;
            tr.AWREADY = y.AWREADY;
            tr.WREADY = y.WREADY;
            tr.BRESP = y.BRESP;
            tr.BVALID = y.BVALID;
            tr.ARREADY = y.ARREADY;
            tr.RDATA = y.RDATA;
            tr.RRESP = y.RRESP;
            tr.RVALID = y.RVALID;
            tr.RLAST = y.RLAST;
            analysis_port.write(tr);
            `uvm_info("MON_END", $sformatf("MONITOR RESULT GOT"), UVM_LOW)
        end
    endtask
endclass
`endif
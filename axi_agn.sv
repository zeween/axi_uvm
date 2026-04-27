`ifndef AXI_AGENT_SVH
`define AXI_AGENT_SVH
`include "uvm_macros.svh"
`include "axi_sqr.sv"
`include "axi_drv.sv"
`include "axi_mon.sv"
import uvm_pkg::*;
class axi_agent extends uvm_agent;
    `uvm_component_utils(axi_agent)
    axi_driver drv;
    axi_monitor mon;
    axi_sequencer sqr;
    function new(string name = "axi_agent",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv =axi_driver::type_id::create("drv",this);
        sqr = axi_sequencer::type_id::create("sqr",this);
        mon = axi_monitor::type_id::create("mon",this);
        `uvm_info(get_type_name(), $sformatf("build phane is done in agent"), UVM_LOW)
    endfunction
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
        `uvm_info(get_type_name(), $sformatf("connect phane has ended"), UVM_LOW)
    endfunction
endclass
`endif
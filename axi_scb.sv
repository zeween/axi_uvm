`ifndef AXI_SCOREBOARD_SVH
`define AXI_SCOREBOARD_SVH
`include "uvm_macros.svh"
`include "axi_transaction.sv"
import uvm_pkg::*;
class axi_scoreboard extends uvm_scoreboard;
    uvm_analysis_export#(axi_transaction) analysis_export;
    uvm_tlm_analysis_fifo#(axi_transaction) fifo;
    `uvm_component_utils(axi_scoreboard)
    function new(string name = "axi_scoreboard",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        analysis_export=new("analysis_export",this);
        fifo =new("fifo",this);
        `uvm_info(get_type_name(), $sformatf("build phane is done in scoreboard"), UVM_LOW)
    endfunction
    function void connect_phase(uvm_phase phase);
        analysis_export.connect(fifo.analysis_export);
    endfunction
endclass
`endif
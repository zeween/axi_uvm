`ifndef AXI_COVERAGE_SVH
`define AXI_COVERAGE_SVH
`include "uvm_macros.svh"
`include "axi_transaction.sv"
import uvm_pkg::*;
class axi_coverage extends uvm_component;
    uvm_analysis_export#(axi_transaction) analysis_export;
    uvm_tlm_analysis_fifo#(axi_transaction) fifo;
    `uvm_component_utils(axi_coverage)
    function new(string name = "axi_coverage",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        analysis_export=new("analysis_export",this);
        fifo  =new("fifo",this);
        `uvm_info(get_type_name(), $sformatf("build phane is done in coverage"), UVM_LOW)
    endfunction
    function void connect_phase(uvm_phase phase);
        analysis_export.connect(fifo.analysis_export);
        `uvm_info(get_type_name(), $sformatf("connect phane is done in coverage"), UVM_LOW)
    endfunction
endclass
`endif
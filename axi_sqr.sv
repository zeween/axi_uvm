`ifndef AXI_SEQUENCER_SVH
`define AXI_SEQUENCER_SVH
`include "uvm_macros.svh"
`include "axi_transaction.sv"
import uvm_pkg::*;
class axi_sequencer extends uvm_sequencer#(axi_transaction);
    `uvm_component_utils(axi_sequencer)
    function new(string name = "axi_sequencer",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(), $sformatf("build phane is done in sequencer"), UVM_LOW)
    endfunction
endclass
`endif
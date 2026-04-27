`ifndef AXI_TEST_SVH
`define AXI_TEST_SVH
`include "uvm_macros.svh"
`include "axi_env.sv"
`include "axi_seq.sv"
import uvm_pkg::*;
class axi_test extends uvm_test;
    `uvm_component_utils(axi_test)
    axi_env env;
    axi_seq seq;
    function new(string name = "axi_test",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = axi_env::type_id::create("env",this);
        seq = axi_seq::type_id::create("seq",this);
        `uvm_info(get_type_name(), $sformatf("build phane is done in test"), UVM_LOW)
    endfunction
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info(get_type_name(), $sformatf("end of elaboration phase is done in test"), UVM_LOW)
    endfunction
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        phase.drop_objection(this);
    endtask
endclass
`endif
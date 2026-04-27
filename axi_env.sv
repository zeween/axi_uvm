`ifndef AXI_ENV_SVH
`define AXI_ENV_SVH
`include "uvm_macros.svh"
`include "axi_agn.sv"
`include "axi_scb.sv"
`include "axi_cov.sv"
import uvm_pkg::*;
class axi_env extends uvm_env;
    `uvm_component_utils(axi_env)
    axi_agent agn;
    axi_coverage cov;
    axi_scoreboard scb;
    function new(string name = "axi_env",uvm_component parent = null);
        super.new(name,parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agn = axi_agent::type_id::create("agn",this);
        cov =axi_coverage::type_id::create("cov",this);
        scb = axi_scoreboard::type_id::create("scb",this);
        `uvm_info(get_type_name(), $sformatf("build phane is done in env"), UVM_LOW)
    endfunction
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agn.mon.analysis_port.connect(scb.analysis_export);
        agn.mon.analysis_port.connect(cov.analysis_export);
    endfunction
endclass
`endif
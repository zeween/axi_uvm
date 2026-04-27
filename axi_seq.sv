`ifndef AXI_SEQUENCE_SVH
`define AXI_SEQUENCE_SVH
`include "uvm_macros.svh"
`include "axi_transaction.sv"
import uvm_pkg::*;
class axi_seq extends uvm_sequence#(axi_transaction);
    `uvm_object_utils(axi_seq)
    function new(string name = "axi_seq");
        super.new(name);
    endfunction
    task body();
        axi_transaction tr;
        repeat(10)begin 
            tr = axi_transaction#()::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize());
            finish_item(tr);
    `uvm_info(get_type_name(),{"Data randomized :",tr.sprint()}, UVM_LOW)   
         end
    endtask
endclass
`endif
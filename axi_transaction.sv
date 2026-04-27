`ifndef AXI_TRANSACTION_SVH
`define AXI_TRANSACTION_SVH
`include "uvm_macros.svh"
import uvm_pkg::*;
class axi_transaction#(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 16
) extends uvm_sequence_item;
     logic                     rst_n;
     logic                     mem_en;
     logic                     mem_we;
     logic [9:0]               mem_addr;
     logic [31:0]              mem_wdata;
     logic [31:0]              mem_rdata;

     logic                     ARESETn;

    // Write address channel
rand logic [ADDR_WIDTH-1:0]    AWADDR;
rand logic [7:0]               AWLEN;
rand logic [2:0]               AWSIZE;
rand logic                     AWVALID;
     logic                     AWREADY;

    // Write data channel
rand logic [DATA_WIDTH-1:0]    WDATA;
     logic                     WVALID;
rand logic                     WLAST;
     logic                     WREADY;

    // Write response channel
     logic [1:0]                BRESP;
     logic                      BVALID;
rand logic                      BREADY;

    // Read address channel
rand logic [ADDR_WIDTH-1:0]    ARADDR;
rand logic [7:0]               ARLEN;
rand logic [2:0]               ARSIZE;
rand logic                     ARVALID;
     logic                     ARREADY;

    // Read data channel
    logic [DATA_WIDTH-1:0]     RDATA;
    logic [1:0]                RRESP;
    logic                      RVALID;
    logic                      RLAST;
    logic                      RREADY;

    `uvm_object_utils_begin(axi_transaction)

    //----------------memory signals---------------

    `uvm_field_int(rst_n, UVM_ALL_ON)
    `uvm_field_int(mem_en, UVM_ALL_ON)
    `uvm_field_int(mem_we, UVM_ALL_ON)
    `uvm_field_int(mem_addr, UVM_ALL_ON)
    `uvm_field_int(mem_wdata, UVM_ALL_ON)
    `uvm_field_int(mem_rdata, UVM_ALL_ON)

    //----------------axi signals-----------------
    //----------------WRITE ADDRESS---------------
    `uvm_field_int(ARESETn, UVM_ALL_ON)
    `uvm_field_int(AWADDR, UVM_ALL_ON)
    `uvm_field_int(AWLEN, UVM_ALL_ON)
    `uvm_field_int(AWSIZE, UVM_ALL_ON)
    `uvm_field_int(AWVALID, UVM_ALL_ON)
    `uvm_field_int(AWREADY, UVM_ALL_ON)

    //----------------WRITE DATA---------------
    `uvm_field_int(WDATA, UVM_ALL_ON)
    `uvm_field_int(WVALID, UVM_ALL_ON)
    `uvm_field_int(WLAST, UVM_ALL_ON)
    `uvm_field_int(WREADY, UVM_ALL_ON)

    //----------------WRITE RESPONSE---------------
    `uvm_field_int(BRESP, UVM_ALL_ON)
    `uvm_field_int(BVALID, UVM_ALL_ON)
    `uvm_field_int(BREADY, UVM_ALL_ON)

    //----------------READ ADDRESS---------------
    `uvm_field_int(ARADDR, UVM_ALL_ON)
    `uvm_field_int(ARLEN, UVM_ALL_ON)
    `uvm_field_int(ARSIZE, UVM_ALL_ON)
    `uvm_field_int(ARVALID, UVM_ALL_ON)
    `uvm_field_int(ARREADY, UVM_ALL_ON)

    //----------------READ DATA---------------
    `uvm_field_int(RDATA, UVM_ALL_ON)
    `uvm_field_int(RRESP, UVM_ALL_ON)
    `uvm_field_int(RVALID, UVM_ALL_ON)
    `uvm_field_int(RLAST, UVM_ALL_ON)
    `uvm_field_int(RREADY, UVM_ALL_ON)

    `uvm_object_utils_end

    constraint size{
        AWSIZE == 'd2;
        ARSIZE == 'd2;
        }

    constraint len {
        AWLEN == 0;
        ARLEN == 0;
        }
    
    constraint Avalid{
        AWVALID ==(AWREADY==1)?1:0;
        ARVALID ==(ARREADY ==1 && AWREADY ==0)?1:0;
        }

    constraint Wlast{
        WLAST ==(WREADY == 0 && AWREADY ==0)?1:0;
        }
    
    constraint bvalid{
        BREADY == (BVALID == 1)?1:0;
        }

    function new(string name = "axi_transaction");
        super.new(name);
    endfunction 
endclass 
`endif
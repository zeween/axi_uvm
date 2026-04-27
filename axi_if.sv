interface axi_if#(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 16,
    parameter MEMORY_DEPTH = 1024);
     logic                     ACLK;
     logic                     rst_n;
     logic                     mem_en;
     logic                     mem_we;
     logic [9:0]               mem_addr;
     logic [31:0]              mem_wdata;
     logic [31:0]              mem_rdata;

     logic                     ARESETn;

    // Write address channel
     logic [ADDR_WIDTH-1:0]    AWADDR;
     logic [7:0]               AWLEN;
     logic [2:0]               AWSIZE;
     logic                     AWVALID;
     logic                     AWREADY;

    // Write data channel
     logic [DATA_WIDTH-1:0]    WDATA;
     logic                     WVALID;
     logic                     WLAST;
     logic                     WREADY;

    // Write response channel
     logic [1:0]                BRESP;
     logic                      BVALID;
     logic                      BREADY;

    // Read address channel
     logic [ADDR_WIDTH-1:0]    ARADDR;
     logic [7:0]               ARLEN;
     logic [2:0]               ARSIZE;
     logic                     ARVALID;
     logic                     ARREADY;

    // Read data channel
    logic [DATA_WIDTH-1:0]     RDATA;
    logic [1:0]                RRESP;
    logic                      RVALID;
    logic                      RLAST;
    logic                      RREADY;
endinterface
// qsystop.v

// Generated using ACDS version 17.0 602

`timescale 1 ps / 1 ps
module qsystop (
		input  wire       clk_clk,         //      clk.clk
		output wire [7:0] ledout_export,   //   ledout.export
		input  wire       reset_reset_n,   //    reset.reset_n
		input  wire [7:0] switchin_export  // switchin.export
	);

	wire  [31:0] master_0_master_readdata;             // mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	wire         master_0_master_waitrequest;          // mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	wire  [31:0] master_0_master_address;              // master_0:master_address -> mm_interconnect_0:master_0_master_address
	wire         master_0_master_read;                 // master_0:master_read -> mm_interconnect_0:master_0_master_read
	wire   [3:0] master_0_master_byteenable;           // master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	wire         master_0_master_readdatavalid;        // mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	wire         master_0_master_write;                // master_0:master_write -> mm_interconnect_0:master_0_master_write
	wire  [31:0] master_0_master_writedata;            // master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	wire         mm_interconnect_0_led_s1_chipselect;  // mm_interconnect_0:LED_s1_chipselect -> LED:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;    // LED:readdata -> mm_interconnect_0:LED_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;     // mm_interconnect_0:LED_s1_address -> LED:address
	wire         mm_interconnect_0_led_s1_write;       // mm_interconnect_0:LED_s1_write -> LED:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;   // mm_interconnect_0:LED_s1_writedata -> LED:writedata
	wire  [31:0] mm_interconnect_0_switch_s1_readdata; // SWITCH:readdata -> mm_interconnect_0:SWITCH_s1_readdata
	wire   [1:0] mm_interconnect_0_switch_s1_address;  // mm_interconnect_0:SWITCH_s1_address -> SWITCH:address
	wire         rst_controller_reset_out_reset;       // rst_controller:reset_out -> [LED:reset_n, SWITCH:reset_n, mm_interconnect_0:LED_reset_reset_bridge_in_reset_reset, mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset]

	qsystop_LED led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (ledout_export)                        // external_connection.export
	);

	qsystop_SWITCH switch (
		.clk      (clk_clk),                              //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address  (mm_interconnect_0_switch_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_switch_s1_readdata), //                    .readdata
		.in_port  (switchin_export)                       // external_connection.export
	);

	qsystop_master_0 #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) master_0 (
		.clk_clk              (clk_clk),                       //          clk.clk
		.clk_reset_reset      (~reset_reset_n),                //    clk_reset.reset
		.master_address       (master_0_master_address),       //       master.address
		.master_readdata      (master_0_master_readdata),      //             .readdata
		.master_read          (master_0_master_read),          //             .read
		.master_write         (master_0_master_write),         //             .write
		.master_writedata     (master_0_master_writedata),     //             .writedata
		.master_waitrequest   (master_0_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (master_0_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (master_0_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                               // master_reset.reset
	);

	qsystop_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                  (clk_clk),                              //                                clk_0_clk.clk
		.LED_reset_reset_bridge_in_reset_reset          (rst_controller_reset_out_reset),       //          LED_reset_reset_bridge_in_reset.reset
		.master_0_clk_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),       // master_0_clk_reset_reset_bridge_in_reset.reset
		.master_0_master_address                        (master_0_master_address),              //                          master_0_master.address
		.master_0_master_waitrequest                    (master_0_master_waitrequest),          //                                         .waitrequest
		.master_0_master_byteenable                     (master_0_master_byteenable),           //                                         .byteenable
		.master_0_master_read                           (master_0_master_read),                 //                                         .read
		.master_0_master_readdata                       (master_0_master_readdata),             //                                         .readdata
		.master_0_master_readdatavalid                  (master_0_master_readdatavalid),        //                                         .readdatavalid
		.master_0_master_write                          (master_0_master_write),                //                                         .write
		.master_0_master_writedata                      (master_0_master_writedata),            //                                         .writedata
		.LED_s1_address                                 (mm_interconnect_0_led_s1_address),     //                                   LED_s1.address
		.LED_s1_write                                   (mm_interconnect_0_led_s1_write),       //                                         .write
		.LED_s1_readdata                                (mm_interconnect_0_led_s1_readdata),    //                                         .readdata
		.LED_s1_writedata                               (mm_interconnect_0_led_s1_writedata),   //                                         .writedata
		.LED_s1_chipselect                              (mm_interconnect_0_led_s1_chipselect),  //                                         .chipselect
		.SWITCH_s1_address                              (mm_interconnect_0_switch_s1_address),  //                                SWITCH_s1.address
		.SWITCH_s1_readdata                             (mm_interconnect_0_switch_s1_readdata)  //                                         .readdata
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule

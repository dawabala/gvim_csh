/*
//// chatgpt tdatq_q13
Verilog module df_mid_lsdc_matrixcvtgater13 implements a highly parameterized mechanism for managing and processing a 2D "age matrix." Here's an in-depth breakdown:
Purpose and Features:
    Parameterization:
        SIZE:              Defines the dimension of the square "age matrix."
        EQUALITY:          Controls how the matrix symmetry is computed (XOR operation with this parameter).
        ALLOC:             Specifies allocation-related functionality.
        GATER_SPLIT_SIZE:  Divides the matrix into regions for more granular control, improving simulation and synthesis efficiency.
        ACCURATE_GATER_EN: Toggles between precise and approximate implementations for enabling gates.

    Inputs and Outputs:
        Inputs:
            NxtAge:             Next age matrix values.
            AgeData:            Flattened lower triangular part of the current age matrix.
            PgenAgeMatrix:      Matrix for predictive gate enabling.
            AllocVal & AllocEn: Allocation signals controlling gating logic.
            KCLK_AR & SSE:      Clock and scan-shift signals.
        Outputs:
            NxtAgeData:          Flattened version of the next age matrix.
            RCLK_PgenAgeData_AR: Clock-gated version of predictive matrix data.
            Age:                 Full 2D reconstructed age matrix.

    Age Matrix Flattening:
        The lower triangular portion of the matrix (excluding the diagonal) is stored in a flat array (AgeData) to save storage and improve logic efficiency.

    Matrix Reconstruction:
        Lower Triangle: Reconstructed directly from AgeData.
        Diagonal: Always set to 0.
        Upper Triangle: Generated using symmetry and EQUALITY.

Gating Mechanism:

    Accurate Gating (ACCURATE_GATER_EN = 1):
        Each subregion of the matrix is processed independently, with precise logic to decide enablement.

    Inaccurate Gating (ACCURATE_GATER_EN = 0):
        Simpler logic to speed up computation but may sacrifice some precision. This is useful for meeting timing constraints in large designs.

    Gate Implementation:
        The gating for each subregion is computed based on PgenAgeMatrix or allocation signals.
        Clock gating is handled using instances of other modules like df_mid_lsdc_age_cg13.

Code Highlights:

    Age Matrix Flattening and Reconstruction:

for (gy=1; gy<SIZE; gy=gy+1) begin
  for(gx=0; gx<gy; gx=gx+1) begin
    assign Age[gy][gx] = AgeData[dff_cnt];
    assign NxtAgeData[dff_cnt] = NxtAge[gy][gx];
  end
end
for (gy=0; gy<SIZE; gy=gy+1) assign Age[gy][gy] = 1'b0;
for(gy=0; gy<SIZE; gy=gy+1) begin
  for(gx=gy+1; gx<SIZE; gx=gx+1) begin
    assign Age[gy][gx] = |EQUALITY ^ ~Age[gx][gy];
  end
end

Gater Logic for Accurate Mode:

    if (ACCURATE_GATER_EN == 1) begin : AccuratePgenGater
      for (gater_indx=gater_start; gater_indx<GATER_NUM; gater_indx=gater_indx+1) begin
        assign PgenGaterSplitAge[gater_indx] = |(PgenAgeData[dff_cnt_end:dff_cnt_start]);
      end
    end

Applications:

    Age Matrices in Scheduling: Used in hardware systems that manage priorities or scheduling, where "age" represents the relative priority or time since an event.
    Efficient Storage: By only storing the lower triangular part, the design saves space while allowing the upper triangular part to be inferred.
    Dynamic Gating: Reduces power consumption by selectively enabling parts of the matrix.

Considerations:

    The complexity of parameters like GATER_SPLIT_SIZE and SIZE requires careful testing to ensure correctness.
    The gating mechanism must align with timing and power requirements.

Would you like to focus on any specific part or functionality of this module?



rdatq.v

Initial Functional Hypothesis:

    The module seems to be a data control queue and processing unit with capabilities for:
        Packet processing and routing based on tags and IDs.
        Multi-clock domain synchronization.
        Debugging and monitoring support.

 
*/ 



/*

`timescale 1ps/1ps

module df_mid_tdatq_q13_tb;

parameter PICK=1, NUM_GRPS =1, ALLOC_IX_LSB=69,WIDTH=74 , DEPTH=26 , MASK_VECT=0, MASK_MODE=0, AGEM=0, AGEM_SPLIT=1,USE_VALID=0;
parameter NUM_ALLOC=2, NUM_ALLOC_BITS=1, USE_ALLOC_IX=1;
// copy netlist tdaq_q13* module name, compare rtl.v vs syn.v: num_a, num_g, mask_mode,

  reg                               Clk;  
  reg                               Reset;  // Queue[w*d] <= (QAllocArrEn[d])? QAllocArrPkt[w*d]: (QUpdIx[d]&QEn[w]? : QUpdPkt[w*d] : Queue); Valid[d] <= Valid[d] &~ClrValid[d] |SetValid[d]; 
                                            // QAllocArrPkt[w*d] = QAllocPkt[num_a*w]  = QAllocVect[num_a*w];   QUpdPkt[w*d] = QUpdVect[w*d]; 
					    // QEn[w]=GrpUpdMsk[num_g*w]  GrpUPdMskVect[num_g*w]; GrpUpdMskL=num_g*w'b0;  
  reg      [NUM_GRPS-1:0]           GrpUpdEn;        // Write strobe for entry to be updated
  reg      [NUM_GRPS*WIDTH-1:0]     GrpUpdMskVect;  
  reg      [NUM_ALLOC-1:0]          QAllocEn;        // Up to NUM_ALLOC allocations can be made to Queue
  reg      [NUM_ALLOC*WIDTH-1:0]    QAllocVect;      // Associated packet=WIDTH for each allocation
  reg      [DEPTH-1:0]              QUpdIx;          // Zero one-hot update vector (only one can happen per cycle)
  reg      [DEPTH*WIDTH-1:0]        QUpdVect;        // Associated update packet=WIDTH
  reg      [DEPTH-1:0]              DelValid;        // Indicate what entries are to be deleted
  reg      [DEPTH-1:0]              Pickable;        // 

  wire  [DEPTH*WIDTH-1:0]    QVect;                  // Queue of DEPTH * WIDTH; 
  wire  [DEPTH-1:0]          Oldest;  
  wire  [DEPTH-1:0]          OldestM1;               // Second next oldest 
  wire  [DEPTH-1:0]          Valid;                  // Indicate what entries to be deleted 
  wire  [DEPTH-1:0]          PickItem0;              // Indicate first Alocate position 

df_mid_tdatq_q13 #(.WIDTH(4), .DEPTH(4) 
              ) df_mid_tdatq_q13_001 (.QVect(QVect), .Oldest(Oldest), .OldestM1(OldestM1), .Valid(Valid), .PickItem0(PickItem0),
                                      .GrpUpdEn(GrpUpdEn), .GrpUpdMskVect(GrpUpdMskVect), .QAllocEn(QAllocEn), .QAllocVect(QAllocVect), .QUpdIx(QUpdIx), .QUpdVect(QUpdVect), .DelValid(DelValid), .Pickable(Pickable),
                                      .Clk(Clk), .Reset(Reset)  );

initial
begin
	$recordfile("sim_q13");  //for ncverilog simulation
	$recordvars();                //for ncverilog simulation
end


initial
begin
#0
    GrpUpdEn = 0; 
    GrpUpdMskVect = 0; 
    QAllocEn = 0; 
    QAllocVect = 0; 
    QUpdIx = 0; 
    QUpdVect = 0; 
    DelValid = 0; 
    Pickable = 0; 

    Clk = 0; 
    Reset = 1; 
#25 Reset = 0;

#500 $finish;

end

always  #10  Clk= ~Clk; 

initial
begin
   $monitor($time,"in: Clk=%b Reset=%b GrpUpdEn=%b GrpUpdMskVect=%b QAllocEn=%b QAllocVect=%x QUpdIx=%x QUpdVect=%x DelValid=%x Pickable=%x",Clk,Reset, GrpUpdEn,GrpUpdMskVect,QAllocEn,QAllocVect,QUpdIx,QUpdVect,DelValid,Pickable);
   $monitor($time,"out: QVect=%x Oldest=%x OldestM1=%x Valid=%x PickItem0=%x", QVect,Oldest,OldestM1,Valid,PickItem0);
end

always @(posedge Clk) 
   begin $display($time,"in: Clk=%b Reset=%b GrpUpdEn=%b GrpUpdMskVect=%b QAllocEn=%b QAllocVect=%x QUpdIx=%x QUpdVect=%x DelValid=%x Pickable=%x",Clk,Reset, GrpUpdEn,GrpUpdMskVect,QAllocEn,QAllocVect,QUpdIx,QUpdVect,DelValid,Pickable);
   $display($time,"out: QVect=%x Oldest=%x OldestM1=%x Valid=%x PickItem0=%x", QVect,Oldest,OldestM1,Valid,PickItem0);
end



endmodule

*/
// df_mid_tcdx1_df_mid_lsdc_age1_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_3_0

//module df_mid_tcdx1_df_mid_tdatq_q1_4_2_3_0_0_43_16_1_1_1_1_136334_0_0 (_1_0/_2_0/../_4_0)
// output [687:0] QVect ; output [15:0] Oldest ; output [15:0] OldestM1 ; output [15:0] Valid ; output [15:0] PickItem0 ;
// input  [2:0] GrpUpdEn ; input  [128:0] GrpUpdMskVect ; input  [3:0] QAllocEn ;
// input  [171:0] QAllocVect ; input  [15:0] QUpdIx ; input  [687:0] QUpdVect ; input  [15:0] DelValid ; input  [15:0] Pickable ;
// input  Clk ; input  Reset ;

// module df_mid_tcdx1_df_mid_tdatq1_0
// DatOQ0-5.OutQueueVect : 686x6 bit;  DatQ0-5.OutVect : 3784x6 bit;   tdatq1.DatTgt0/.../5_Pkt:587-bit; tdatq1.DatSrc0/.../5_Pkt:587-bit 
// TDAQCHAN0(size 817) -> TRSPQ(239)  TREQQ(317) -> TDAQCHAN0;    // PRB(154) RSPNDQ(316) 
// clocks: CfgClk 
//

`timescale 1ns / 1ns
module df_mid_lsdc_age13_tb;
parameter SIZE=8, ALLOC = 4, PICK = 1, MULTIPICK  = 0, ALLOCAGE = 1, ALLOCMULTIHOT = 0, NO_INVALID_CHECK = 0, ACCURATE_GATER_EN = 1, CHK_MODE=0;
parameter GATER_SPLIT_EN = 1, GATER_SPLIT_SIZE = 4; 

  reg                                 KCLK_AR;               
  reg                                 SSE;                   
  reg                      [SIZE-1:0] Valid;                 //Valid bit for the entry
  reg           [ALLOC-1:0][SIZE-1:0] AllocIdx;              //Decoded alloc indices
  reg                     [ALLOC-1:0] AllocVal;              //Alloc valid, can allocate many at once, age order 0->top same cycle
  reg            [PICK-1:0][SIZE-1:0] Pickable;              //Per pick mask, for example by thread

  wire  [PICK-1:0][SIZE-1:0] Oldest;                //Decoded oldest entry, 0 oldest, 1 2nd oldest, etc
  wire  [PICK-1:0][SIZE-1:0] Youngest;  
  wire  [SIZE-1:0][SIZE-1:0] Age;

df_mid_lsdc_age13 #(.SIZE(8),.ALLOC(4),.PICK(1),.MULTIPICK(0),.ALLOCAGE(1),.ALLOCMULTIHOT(0),.GATER_SPLIT_EN(1),.GATER_SPLIT_SIZE(4),.NO_INVALID_CHECK(0),.ACCURATE_GATER_EN(1),.CHK_MODE(0))
     age_001(.KCLK_AR(KCLK_AR), .SSE(SSE), .Valid(Valid), .AllocIdx(AllocIdx), .AllocVal(AllocVal), .Pickable(Pickable), .Oldest(Oldest), .Youngest(Youngest), .Age(Age));

// NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d

initial begin
	$recordfile("rtl_df_mid_lsdc_age13");  //for ncverilog simulation
	$recordvars();                         //for ncverilog simulation
end


initial
begin
#0 KCLK_AR = 0; 
    SSE = 0; 
    Valid = 0; 
    AllocIdx = 0; 
    AllocVal = 0; 
    Pickable = 0; 
#370 $finish;
end

always @(KCLK_AR)  $display($time, "PgenAgeMatrix=%x, RCLK_PgenAgeData_AR=%x,RCLK_PgenAge_AR=%b,NxtAge=%x,AgeX=%x ",age_001.PgenAgeMatrix, age_001.RCLK_PgenAgeData_AR, age_001.RCLK_PgenAge_AR, age_001.NxtAge, age_001.AgeX);

always @(posedge KCLK_AR) begin
    $display($time," in: KCLK_AR=%b SSE=%b Valid=%b AllocIdx=%b AllocVal=%b Pickable=%b ", KCLK_AR,SSE,Valid,AllocIdx,AllocVal,Pickable); 
    $display($time," out: Oldest=%x Youngest=%x Age=%x ", Oldest, Youngest,Age); 
end

always #10  KCLK_AR= ~KCLK_AR; 

endmodule



/*

// RCLK_PgenAgeData_AR gated clocks : DFFCNT(=120) GATER_SPLIT_SIZE=4?
// UniqNetlist.v.gz: bit-66,28,6,0;
// OptCts.v.gz:      bit-68,30,8,2;

// df_mid_tcdx1_df_mid_lsdc_age_cg1_17_0 AccuratePgenGater_I_RCLK_PgenGaterSplitAge_AR_2_(.gclk(RCLK_PgenAgeData_AR_30_),.clk(FxCts_ctosc_gls_45),.en(PgenGaterSplitAge[2]) ,.SSE(FxPlace_HFSNET_1),.optlc_5513(optlc_5513 ) ) ;
// df_mid_tcdx1_df_mid_lsdc_age_cg1_18_0 AccuratePgenGater_I_RCLK_PgenGaterSplitAge_AR_1_(.gclk(RCLK_PgenAgeData_AR_8_ ),.clk(FxCts_ZCTSNET_0 ) , .en(PgenGaterSplitAge[1]) ,.SSE(SSE ) ,     .optlc_1076 ( optlc_1076 ) ) ;
// df_mid_tcdx1_df_mid_lsdc_age_cg1_19_0 AccuratePgenGater_I_RCLK_PgenGaterSplitAge_AR_0_(.gclk(RCLK_PgenAgeData_AR_2_ ),.clk(FxCts_ZCTSNET_0 ) , .en(PgenGaterSplitAge[0]) ,.SSE(SSE ) ,     .optlc_5111 ( optlc_5111 ) ) ;
//
//module df_mid_tcdx1_df_mid_lsdc_matrixcvtgater1_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_3_0 ( 

`timescale 1ns / 1ns
module df_mid_lsdc_matrixcvtgater13_tb;
parameter SIZE=4, EQUALITY=0, ALLOC=1, GATE_SPLIT_SIZE=SIZE/2, ACCURATE_GATER_EN=1;
  reg            [SIZE-1:0][SIZE-1:0] NxtAge;
  wire       [(SIZE*SIZE-SIZE)/2-1:0] NxtAgeData;
  reg        [(SIZE*SIZE-SIZE)/2-1:0] AgeData;
  wire       [SIZE-1:0][SIZE-1:0]     Age;

  reg            [SIZE-1:0][SIZE-1:0] PgenAgeMatrix;
  reg                     [ALLOC-1:0] AllocVal;
  reg                      [SIZE-1:0] AllocEn;
  reg                                 KCLK_AR;
  reg                                 SSE; //Scan shift enable

  wire [(SIZE*SIZE-SIZE)/2-1:0] RCLK_PgenAgeData_AR;

df_mid_lsdc_matrixcvtgater13 #(.SIZE(4),.EQUALITY(0),.ALLOC(1),.GATER_SPLIT_SIZE(2),.ACCURATE_GATER_EN(1)) 
                        matrixcvtgater13_001  (.NxtAge(NxtAge), .AgeData(AgeData), .PgenAgeMatrix(PgenAgeMatrix), .AllocVal(AllocVal), .AllocEn(AllocEn), .KCLK_AR(KCLK_AR), .SSE(SSE),
                                                           .NxtAgeData(NxtAgeData), .Age(Age), .RCLK_PgenAgeData_AR(RCLK_PgenAgeData_AR) );

initial
begin
#0  KCLK_AR = 0; 
    AllocVal = 0; 
    AllocEn = 0; 
    PgenAgeMatrix = 0; 
    NxtAge = 0; 
    AgeData = 0; 
    
#1  SSE = 0; #7 SSE = 1; #7 SSE = 0; 
#297 AllocVal=1; AllocEn=0; //PgenAgeMatrix=0;
#390 $finish;
end

//always @(matrixcvtgater13_001.AgeOrRedColGater )  $display($time," AgeOrRedColGater=%b", matrixcvtgater13_001.AgeOrRedColGater);
//always @(AllocEn or PgenAgeMatrix)
// always @(matrixcvtgater13_001.PgenGaterSplitAge or matrixcvtgater13_001.PgenAgeData) $display($time," PgenAgeMatrix=%x, PgenAgeData=%b,PgenGaterSplitAge=%b", PgenAgeMatrix, matrixcvtgater13_001.PgenAgeData, matrixcvtgater13_001.PgenGaterSplitAge);

always @(RCLK_PgenAgeData_AR ) begin
     $display($time,"RCLK_PgenGaterSplitAge_AR[gater_idx]=%b --> RCLK_PgenAgeDataGSize_AR[dff_cnt_indx]=%b, RCLK_PgenAgeData_AR=%b ", matrixcvtgater13_001.RCLK_PgenGaterSplitAge_AR,matrixcvtgater13_001.RCLK_PgenAgeDataGSize_AR,RCLK_PgenAgeData_AR); //matrixcvtgater13_001. ,matrixcvtgater13_001. );
end

always #3 NxtAge = NxtAge+1'b1;  
always #23 PgenAgeMatrix=PgenAgeMatrix+'b10101;  
always #359 AllocEn=AllocEn +1'b1;  
always @(posedge KCLK_AR)  AgeData = #0 NxtAgeData;  // NxtAge_2d => NxtAgeData_1d =(gated_clock_dff)=> AgeData_1d => Age_2d
always #5 KCLK_AR = ~KCLK_AR; 

//always @(KCLK_AR)
always @(AgeData or Age) $display($time," KCLK_AR=%b,SSE=%b,AllocVal=%b,AllocEn=%b,PgenAgeMatrix=%x,  RCLK_PgenAgeData_AR=%x, AgeData_1d=%x -->Age_2d=%x",KCLK_AR,SSE,AllocVal,AllocEn,PgenAgeMatrix,RCLK_PgenAgeData_AR,AgeData,Age);
// always @(AgeData or NxtAgeData or Age) $display($time," NxtAge=%x, NxtAgeData=%x, AgeData=%x, Age=%x ", NxtAge,NxtAgeData, AgeData, Age );



endmodule
*/

/*
`timescale 1ns / 1ns
module df_mid_lsdc_matrixcvt13_tb;
parameter SIZE=4, EQUALITY=0;
  reg  [SIZE-1:0][SIZE-1:0]     NxtAge;
  reg  [(SIZE*SIZE-SIZE)/2-1:0] AgeData;

  wire [(SIZE*SIZE-SIZE)/2-1:0] NxtAgeData;
  wire [SIZE-1:0][SIZE-1:0]     Age;


df_mid_lsdc_matrixcvt13 #(.SIZE(4), .EQUALITY(0)) df_mid_lsdc_matrixcvt13_001  (.NxtAge(NxtAge), .AgeData(AgeData), .NxtAgeData(NxtAgeData), .Age(Age));

initial begin
#0    NxtAge = 0; 
#3970 $finish;
end


always #3 NxtAge = NxtAge+1'b1;      // NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d
always  AgeData = #11 NxtAgeData;     // NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d

// always @(*) $display($time,"########## agedata_1d->age_2d:  AgeData=%x,Age=%x",AgeData,Age);

always @(AgeData or NxtAgeData or Age) $display($time," NxtAge_2d=%x->NxtAgeData_1d=%x, AgeData_1d=%x->Age_2d=%x ", NxtAge,NxtAgeData, AgeData, Age );

endmodule
*/

/*
// #############################################################################################################
`timescale 1ns / 1ns
module df_mid_lsdc_chkcg13_tb;
 parameter WIDTH=8;          // default WIDTH of wire
   wire     [WIDTH-1:0]   gclk;  // gated/conditional clock wire
   reg                    clk;   // clock
   reg      [WIDTH-1:0]   en;    // active high gater enable. Captured on rising edge of clk.
   reg                    SSE;   // scan shift enable 

df_mid_lsdc_chkcg13 #(.WIDTH(8),         
                .LATCH_DONT(0),
                .AND_DONT(0),
                .CHK_MODE(1) ) df_mid_lsdc_chkcg13_001 ( .gclk(gclk), .clk(clk), .en(en), .SSE(SSE));

initial begin
    clk = 0; 
    SSE = 1; 
#17 SSE = 0;
    en  = 0;
#500 $finish;
end

always  #10  clk= ~clk; 
always  #23  en= ~en; 

always @(posedge clk) $display($time, "in: clk=%b,SSE=%b,en=%x;  out: gclk=%x;",clk,SSE,en,gclk);


endmodule


// #############################################################################################################
//  `timescale 1ns / 1ns
module df_mid_lsdc_age_cg13_tb;
 parameter WIDTH=8;          // default WIDTH of wire
   wire     [WIDTH-1:0]   gclk;  // gated/conditional clock wire
   reg                    clk;   // clock
   reg      [WIDTH-1:0]   en;    // active high gater enable. Captured on rising edge of clk.
   reg                    SSE;   // scan shift enable 

df_mid_lsdc_age_cg13 #(.WIDTH(8),         
                .LATCH_DONT(0),
                .AND_DONT(0) ) df_mid_lsdc_age_cg13_001 ( .gclk(gclk), .clk(clk), .en(en), .SSE(SSE));

initial begin
    clk = 0; 
    SSE = 1; 
#17 SSE = 0;
    en  = 0;
#500 $finish;
end

always  #10  clk= ~clk; 
always  #23  en= ~en; 

always @(posedge clk) $display($time, "in: clk=%b,SSE=%b,en=%x;  out: gclk=%x;",clk,SSE,en,gclk);

endmodule

// #############################################################################################################
`timescale 1ns / 1ns
module df_mid_ldff13_tb;
 parameter WIDTH=8;          // default WIDTH of wire
   wire [WIDTH-1:0]   q;     // data out
   reg                clk;   // clock
   reg  [WIDTH-1:0]   d;     // data in
   reg                SSE;    // scan shift enable // so that scan toggle reset, where SDI=0, will result in the q wire being 

df_mid_ldff13 #(.WIDTH(8),         
                .RVAL(0),
                .tolerate_clk_x(0), 
                .SSE_RESET(1'b1) ) df_mid_ldff13_001 ( .q(q), .clk(clk), .d(d), .SSE(SSE));

initial begin
    clk = 0; 
    SSE = 1; 
#17 SSE = 0;
    d = 8'h55; 

#500 $finish;

end

always  #10  clk= ~clk; 
always  #23  d= ~d; 

always @(posedge clk) $display($time, "in: clk=%b,SSE=%b,d=%x;  out: q=%x;",clk,SSE,d,q);

endmodule
*/




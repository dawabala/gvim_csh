
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

/*
module df_mid_lsdc_age13_tb;
parameter SIZE=8, ALLOC = 1, PICK = 1, MULTIPICK  = 0, ALLOCAGE = 0, ALLOCMULTIHOT = 0, NO_INVALID_CHECK = 0, ACCURATE_GATER_EN = 0, CHK_MODE=1;
parameter GATER_SPLIT_EN = 1, GATER_SPLIT_SIZE = 11; 

  reg                                 KCLK_AR,               //Coarse gated clock for this domain
  reg                                 SSE,                   //Scan shift enable
  reg                      [SIZE-1:0] Valid,                 //Valid bit for the entry
  reg           [ALLOC-1:0][SIZE-1:0] AllocIdx,              //Decoded alloc indices
  reg                     [ALLOC-1:0] AllocVal,              //Alloc valid, can allocate many at once, age order 0->top same cycle
  reg            [PICK-1:0][SIZE-1:0] Pickable,              //Per pick mask, for example by thread

  wire  [PICK-1:0][SIZE-1:0] Oldest,                //Decoded oldest entry, 0 oldest, 1 2nd oldest, etc
  wire  [PICK-1:0][SIZE-1:0] Youngest,  
  wire  [SIZE-1:0][SIZE-1:0] Age

df_mid_lsdc_age13 #(SIZE=8,ALLOC=1,PICK=1,MULTIPICK=0,ALLOCAGE=0,ALLOCMULTIHOT=0,GATER_SPLIT_EN=1,GATER_SPLIT_SIZE=11,NO_INVALID_CHECK=0,ACCURATE_GATER_EN=0,CHK_MODE=1)
 df_mid_lsdc_age13_001(.KCLK_AR(KCLK_AR), .SSE(SSE), .Valid(Valid), .AllocIdx(AllocIdx), .AllocVal(AllocVal), .Pickable(Pickable), .Oldest(Oldest, .Youngest(Youngest), .Age(Age));

// NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d

initial
begin
	$recordfile("rtl_df_mid_lsdc_age13");  //for ncverilog simulation
	$recordvars();                         //for ncverilog simulation
end


initial
begin
#0
    KCLK_AR = 0; 
    SSE = 0; 
    Valid = 0; 
    AllocIdx = 0; 
    AllocVal = 0; 
    Pickable = 0; 
#370 $finish;
end

initial
begin
always @(posedge KCLK_AR)
    $monitor($time,"in: KCLK_AR=%b SSE=%b Valid=%b AllocIdx=%b AllocVal=%b Pickable=%b ", KCLK_AR,SSE,Valid,AllocIdx,AllocVal,Pickable); 
    $monitor(,"out: Oldest=%x Youngest=%x Age=%x ", Oldest, Youngest,Age); 

end

begin #10  KCLK_AR= ~KCLK_AR; 

endmodule


initial
begin
	$recordfile("rtl_df_mid_tdatq_q13");  //for ncverilog simulation
	$recordvars();                //for ncverilog simulation
end


initial
begin
#0
    [NUM_GRPS-1:0]GrpUpdEn = 0; 
    [NUM_GRPS*WIDTH-1:0]GrpUpdMskVect = 0; 
    [NUM_ALLOC-1:0]QAllocEn = 0; 
    [NUM_ALLOC*WIDTH-1:0]QAllocVect = 0; 
    [DEPTH-1:0]QUpdIx = 0; 
    [DEPTH*WIDTH-1:0]QUpdVect = 0; 
    [DEPTH-1:0]DelValid = 0; 
    [DEPTH-1:0]Pickable = 0; 
    Clk = 0; 
    Reset = 0; 
    KCLK_AR = 0; 
    SSE = 0; 
    //Scanshiftenable = 0; 
    [SIZE-1:0]Valid = 0; 
    [ALLOC-1:0][SIZE-1:0]AllocIdx = 0; 
    [ALLOC-1:0]AllocVal = 0; 
    canallocatemanyatonce = 0; 
    ageorder0->topsamecycle = 0; 
    [PICK-1:0][SIZE-1:0]Pickable = 0; 
    //Perpickmask = 0; 
    [SIZE-1:0][SIZE-1:0]NxtAge = 0; 
    [(SIZE*SIZE-SIZE)/2-1:0]AgeData = 0; 
    outputlogic[(SIZE*SIZE-SIZE)/2-1:0]NxtAgeData = 0; 
    outputlogic[SIZE-1:0][SIZE-1:0]Age = 0; 
#2000 $finish;
end

initial
begin
    $monitor($time," ");
end


always 
begin #10  = ~; 
 end 

endmodule
`timescale 1ns / 1ns

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

initial
begin
#0
    NxtAge = 0; 
#3970 $finish;
end


always #3 NxtAge = NxtAge+1'b1;      // NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d
always  AgeData = #11 NxtAgeData;     // NxtAge_2d => NxtAgeData_1d (gated_clock_dff) => AgeData_1d => Age_2d

// always @(*) $display($time,"########## agedata_1d->age_2d:  AgeData=%x,Age=%x",AgeData,Age);

always @(AgeData or NxtAgeData or Age) $display($time," NxtAge_2d=%x->NxtAgeData_1d=%x, AgeData_1d=%x->Age_2d=%x ", NxtAge,NxtAgeData, AgeData, Age );

endmodule
*/

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
                        df_mid_lsdc_matrixcvtgater13_001  (.NxtAge(NxtAge), .AgeData(AgeData), .PgenAgeMatrix(PgenAgeMatrix), .AllocVal(AllocVal), .AllocEn(AllocEn), .KCLK_AR(KCLK_AR), .SSE(SSE),
                                                           .NxtAgeData(NxtAgeData), .Age(Age), .RCLK_PgenAgeData_AR(RCLK_PgenAgeData_AR) );

initial
begin
#0
    KCLK_AR = 0; 
    AllocVal = 0; 
    AllocEn = 0; 
    PgenAgeMatrix = 0; 

    NxtAge = 0; 
    AgeData = 0; 
    
#1 SSE = 0; 
#7 SSE = 1; 
#7 SSE = 0; 

#37 NxtAge = 1; 
    PgenAgeMatrix='hff; 
#21217 $finish;
end
//always @(df_mid_lsdc_matrixcvtgater13_001.PgenGaterSplitAge ) $display($time," PgenGaterSplitAge=%b", df_mid_lsdc_matrixcvtgater13_001.PgenGaterSplitAge);
//always @(df_mid_lsdc_matrixcvtgater13_001.AgeOrRedColGater ) $display($time," AgeOrRedColGater=%b", df_mid_lsdc_matrixcvtgater13_001.AgeOrRedColGater);
//always @(df_mid_lsdc_matrixcvtgater13_001.PgenAgeData) $display($time," AgeOrRedColGater=%b", df_mid_lsdc_matrixcvtgater13_001.PgenAgeData);
always @(AllocEn or df_mid_lsdc_matrixcvtgater13_001.PgenGaterSplitAge or df_mid_lsdc_matrixcvtgater13_001.PgenAgeData) $display($time,"  PgenGaterSplitAge=%x, PgenAgeData=%x", df_mid_lsdc_matrixcvtgater13_001.PgenGaterSplitAge, df_mid_lsdc_matrixcvtgater13_001.PgenAgeData);


always #3 NxtAge = NxtAge+1'b1;  
//always #7 AllocVal=AllocVal +1'b1;  
always #2 PgenAgeMatrix=PgenAgeMatrix+7'b10101;  
always #359 AllocEn=AllocEn +1'b1;  
always @(posedge KCLK_AR)  AgeData = #0 NxtAgeData;  // NxtAge_2d => NxtAgeData_1d =(gated_clock_dff)=> AgeData_1d => Age_2d
//always @(posedge KCLK_AR)  AgeData = #0 AgeData+1'b1;  // NxtAge_2d => NxtAgeData_1d =(gated_clock_dff)=> AgeData_1d => Age_2d

always #5 KCLK_AR = ~KCLK_AR; 

always @(KCLK_AR)
begin
    $display($time," KCLK_AR=%b,SSE=%b,AllocVal=%b,AllocEn=%b,PgenAgeMatrix=%x,  RCLK_PgenAgeData_AR=%x, AgeData_1d=%x -->Age_2d=%x",KCLK_AR,SSE,AllocVal,AllocEn,PgenAgeMatrix,RCLK_PgenAgeData_AR,AgeData,Age);

end

// always @(AgeData or NxtAgeData or Age) $display($time," NxtAge=%x, NxtAgeData=%x, AgeData=%x, Age=%x ", NxtAge,NxtAgeData, AgeData, Age );


// display inside q13.v;
// genvar cannot be displayed // $display($time,"RCLK_PgenAgeDataGSize_AR=%b,dff_cnt_indx=%b,gater_indx=%b ",PgenGaterSplitAge,RCLK_PgenAgeDataGSize_AR,dff_cnt_indx,gater_indx);
// always @(posedge KCLK_AR) $display($time,"PgenGaterSplitAge=%b,RCLK_PgenGaterSplitAge_AR=%b,ACCURATE_GATER_EN=%b ",PgenGaterSplitAge,RCLK_PgenGaterSplitAge_AR,ACCURATE_GATER_EN);

endmodule


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





~/mid_tq/q13.v
~/mid_tq/q13_tb.v



csh>   bsub -Is -q fstsim -n 4 -P at2-pd -J mdsj -R 'rusage[mem=80000] select[((type == any )&&((type == RHEL7_64 ||type == RHEL8_64 )&&(csbatch||parallel||gb128))&&(csbatch||gb128||parallel))]' xterm
xterm> cd /proj/at2_til22_nobackup/doudouye/
xterm> cd mi350; (cd at2) 

/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/GetNetlist.v.gz; # 100M 
/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/UniqNetlist.v.gz; # 67M
/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/OptCts.v.gz; 
# RCLK_PgenAgeData_AR_68 68/30/8/2

module df_mid_tcdx1_df_mid_tdatq_q1_4_2_3_0_0_43_16_1_1_1_1_136334_0_0
 module df_mid_tcdx1_df_mid_lsdc_matrixcvtgater1_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_4_0 ( 

# separate queue;
/proj/at2_til23_nobackup/
/proj/mi350_aid_feint_re/
/proj/at2_til22_nobackup/doudouye/at2_code/data/SynRtl/
~/mid_tq/uniqnetlist_df_mid_tdaq_q13.v # module df_mid_tdaq_q copied from UniqNetlist.v.gz
~/mid_tq/tdaq_q13_1118_noPICK.v;       # PICK deleted 

#### awk, sed
set -i "s/SIZE/16/g" tdatq_q13_noparams.v;  # replace parameters in place, no bak file;
awk '{print $2 $3}' df_mid_features.vh;

#### ncverilog, 
foreach i ( 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 )
  ncverilog +timescale=1ps/1ps -sv q13_tb.v rtl_df_mid_tdatq_q13.v ati_clock_gate.v +indir+/home/jdon/mid_tq/1030/inc ; sleep 98 ;
end

#### ncverilog, simvision
uname -a; # atletx7-neu004 3.10..0-1160.119.1.el7.x86_64;
whatos; # k310_g217_64;
module load cadenceIUS/9.2-e218;
which ncverilog; # ncsim, verilog, simvision;
# /tool/cbar/apps/cadenceIUS/9.2-e218/tools/bin/ncsim
#20241121,16:36;

#### trace verdi & fc
fc> open schematic; select DatQ0/QVect, trace fanout; 
    select DatOQ0/; trace fanin;
verdi> open; select DatQ*/QVect, trace drive/load;
    select DatOQ0/; trace drive/load;
  

#### verdi
module avail verdi;
module unload verdi; module unload verdi;
module load  verdi/2024.09         
csh> which verdi
/tool/cbar/apps/verdi/2024.09/bin/verdi
cd /proj/at2_til22_nobackup/doudouye/at2_code/
verdi -sv -f data/SynRtl/SynRtl.vf

#### fusion compiler
TileBuilderTerm;
# cd /proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/
cd /proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_tcdx0/1104/df_tcdx0_uti51/main/pd/tiles/df_tcdx0_df_tcdx0_uti52_new_sdc_frequency_TileBuilder_Nov04_0258_64459_GUI;

TileBuilderIntFX data/FpFinishPower.nlib/
fc> get_cells TDATQCHAN0_DatQ0; get_attr [get_cells TDATQCHAN0_DatQ0] name;
fc> all_fanin -flat -to TDATQCHAN0_DatQ0/* > dq0_fanin.flat.rpt
fc> all_fanout -from TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> all_fanout -from -only_cell TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> all_fanout -flat -from TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> report_nets -con -ver -segment TDATQCHAN0_QUpdPkt_3__12__38_ 


fc> all_connected TDATQCHAN0_QUpdPkt_3__12__38_ -leaf
fc> all_connected TDATQCHAN0_QUpdPkt_3__12__38_ -physical_context
fc> get_pins  TDATQCHAN0_DatQ3/Queue_reg_12__41__MB_Queue_reg_12__40__MB_Queue_reg_12__39__MB_Queue_reg_12__38__MB_Queue_reg_12__37__MB_Queue_reg_12__36__MB_Queue_reg_12__35__MB_Queue_reg_12__34_/*
# MBB 8-bit, Q1~Q7;
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/B21
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/B12
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/A12
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/A22
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/ZN1

 get_cells TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404
 get_pins  TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/*


fc> select_inst TDATQCHAN0
fc> select_inst TRSPQ
fc> set net_q2rsp [get_nets -from TDATQCHAN0_DatQ0 -to TRSPQ]
fc> highlight -nets $net_q2rsp
# set net_req2q [get_nets -from TREQQ -to TDAQCHAN0]
# highlight -nets $net_req2q
# TDAQCHAN0(size 817) -> TRSPQ(239)  TREQQ(317) -> TDAQCHAN0;    // PRB(154) RSPNDQ(316) 
fc> select_inst df_tcdx0_df_trspq0_0
fc> select_inst df_tcdx0_df_treqq0_0
fc> select_inst df_tcdx0_df_tprbq0_0
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_0_0;
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_1_0;
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_2_0;
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_3_0;
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_4_0;
fc> select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_0_0;
fc> select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_1_0;
fc> select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_4_0 
fc> select_inst df_tcdx0_df_lsdc_age0_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_4_0 
fc> select_inst df_tcdx0_df_lsdc_age0_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_0_0

fc> select_inst df_tcdx0_df_lsdc_age0_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_0_0;
fc> select_inst df_tcdx0_df_lsdc_matrixcvtgater0_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_0_0
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0; # .QVect[0:3483]
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0.genblk4_df_lsdc_age0;
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0.genblk4_df_lsdc_age0.GaterSplitForPower_matrixcvtgater 
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ1; 
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ1.genblk4_df_lsdc_age0 
fc> select_inst *.*.genblk4_df_lsdc_age0;
fc> select_inst df_tcdx0.TDATQCHAN0_DATQ1; 
fc> select_inst df_tcdx0.TDATQCHAN0_DATOQ0;
fc> select_inst df_tcdx0.TDATQCHAN0_DATOQ1;
fc> select_inst df_tcdx0.TREQQ
fc> select_inst df_tcdx0.TRSPQ
fc> select_inst df_tcdx0.TRBQ
fc> select_inst df_tcdx0.TPERF
# fc> select_inst df_tcdx0.
fc> select_net;
fc> get_designs;
fc> get_blocks;
fc> get_nets TDATQCHAN0_OutDatShiftTpbTag[388]
fc> select_net [get_nets TDATQCHAN0_OutDatShiftTpbTag[388] ]
 set n1 [get_nets TDATQCHAN0_OutDatShiftTpbTag[388] ]
 set n2 [all_connected -leaf $n1]
 set n2 [all_connected -phy  $n1]
 set p1 [get_pins $n2]  
 set qupd [get_attr [get_pins TDATQCHAN0_DatOQ4/QUpdVect*] full_name]
 all_connected [lindex $qupd 591]
 all_connected [lindex $qupd 0]
 all_connected FxSynthesize_ctmTdsLR_4_1935547/ZN
 all_connected [all_connected FxSynthesize_ctmTdsLR_4_1935547/*]


current_design  
current_block   
current_instance  
llength [get_attr [all_registers] name]
lindex  [get_attr [all_registers] name] 0


#
/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_tcdx0/1104/df_tcdx0_uti51/main/pd/tiles/df_tcdx0_df_tcdx0_uti52_new_sdc_frequency_TileBuilder_Nov04_0258_64459_GUI/data/UniqNetlist.v.gz

####  python  pdf2txt fusioncompiler.pdf
module load fusioncompiler
which fc_shell
/tool/cbar_ec/apps_k310_g217_64/fusioncompiler/2024.09-SP3-DEV-20240827-ec/bin/fc_shell
/tool/cbar_ec/apps_k310_g217_64/fusioncompiler/2024.09-SP3-DEV-20240827-ec/doc/FC/




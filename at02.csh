github_push_gvim_linux;
tcdx0_fxplace_fxcts_fxoptcts_fxroute;
gc_gl1ac_t_fxmacro_fxplace_fxcts;
pd_scripts;
emails_navi44_mi200;


~/mid_tq/ q13.v
~/mid_tq/q13_tb.v


csh>  bsub -Is -q fstsim -n 4 -P at2-pd -J mdsj -R 'rusage[mem=80000] select[((type == any )&&((type == RHEL7_64 ||type == RHEL8_64 )&&(csbatch||parallel||gb128))&&(csbatch||gb128||parallel))]' xterm
csh>  bsub -Is -q regr_high -n 4 -P at2-pd -J mdsj -R 'rusage[mem=200000] select[(type==RHEL7_64 ||type==RHEL6_64)&&(csbatch||tmpshortrr||gb32||gb64||gb128||gb256||gb512)]' xterm & ; # sudong bsub
xterm> cd /proj/at2_til22_nobackup/doudouye/
xterm> cd mi350; (cd at2) 

### mi450 netlist/sdc;
setenv FLOORPLAN_SDC /proj/at2_til11_nobackup/cyli/df/mi450/netlist/df_mid_tcdx1_run_df_mid_tcdx1_wCL536423_DEF_df_tcdxs4_mid_t_TileBuilder_Sep13_0157_49797_GUI/data/PrePlace.sdc.gz
setenv FLOORPLAN_VLG /proj/at2_til11_nobackup/cyli/df/mi450/netlist/df_mid_tcdx1_run_df_mid_tcdx1_wCL536423_DEF_df_tcdxs4_mid_t_TileBuilder_Sep13_0157_49797_GUI/data/PrePlace.v.gz

cd /proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti486_5port/test/
cd /proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_tcdx0/1104/df_tcdx0_uti51/main/pd/tiles/df_tcdx0_df_tcdx0_uti52_new_sdc_frequency_TileBuilder_Nov04_0258_64459_GUI;

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/GetNetlist.v.gz; # 
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/UniqNetlist.v.gz;  
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/OptCts.v.gz;       
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/Route.v.gz;       
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/ReRoute.v.gz;       

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxRoute.log.gz;       
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxReRoute.log.gz;       


# RCLK_PgenAgeData_AR_68 68/30/8/2

module df_mid_tcdx1_df_mid_tdatq_q1_4_2_3_0_0_43_16_1_1_1_1_136334_0_0
 module df_mid_tcdx1_df_mid_lsdc_matrixcvtgater1_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_4_0 ( 

# separate queue;
/proj/at2_til23_nobackup/
/proj/mi350_aid_feint_re/
/proj/at2_til22_nobackup/doudouye/at2_code/data/SynRtl/

~/mid_tq/uniqnetlist_df_mid_tdaq_q13.v # module df_mid_tdaq_q copied from UniqNetlist.v.gz
~/mid_tq/tdatq_q13_1118.noPICK.v;      # PICK deleted 

#### awk, sed
set -i "s/SIZE/16/g" ~/mid_tq/tdatq_q13.noparams.v;  # replace parameters in place, no bak file;
awk '{print $2 $3}' df_mid_features.vh;

#### ncverilog, 
foreach i ( 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 )
  ncverilog +timescale=1ps/1ps -sv q13_tb.v rtl_df_mid_tdatq_q13.v ati_clock_gate.v +indir+/home/jdon/mid_tq/1030/inc ; sleep 98 ;
end

#### ncverilog, simvision @ 20241121,16:36;
~/aliases
uname -a; # atletx7-neu004 3.10..0-1160.119.1.el7.x86_64;
whatos; # k310_g217_64;
module load cadenceIUS/9.2-e218;
which ncverilog; # ncsim, verilog, simvision;
# /tool/cbar/apps/cadenceIUS/9.2-e218/tools/bin/ncsim

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

cd /proj/at2_til22_nobackup/doudouye/at2_code/
verdi -sv -f data/SynRtl/SynRtl.vf &

#### fusion compiler
TileBuilderTerm;

TileBuilderIntFX data/FpFinishPower.nlib/
fc> get_cells TDATQCHAN0_DatQ0; get_attr [get_cells TDATQCHAN0_DatQ0] name;
fc> all_fanin -flat -to TDATQCHAN0_DatQ0/* > dq0_fanin.flat.rpt
fc> all_fanout -from TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> all_fanout -from -only_cell TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> all_fanout -flat -from TDATQCHAN0_QUpdPkt_3__12__38_ 
fc> report_nets -con -ver -segment TDATQCHAN0_QUpdPkt_3__12__38_ 

fc> all_connected TDATQCHAN0_QUpdPkt_3__12__38_ -leaf
fc> all_connected TDATQCHAN0_QUpdPkt_3__12__38_ -physical_context
# MBB 8-bit, Q1~Q7;
fc> all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/B21;   all_connected TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/ZN1
fc> get_pins  TDATQCHAN0_DatQ3/Queue_reg_12__41__MB_Queue_reg_12__40__MB_Queue_reg_12__39__MB_Queue_reg_12__38__MB_Queue_reg_12__37__MB_Queue_reg_12__36__MB_Queue_reg_12__35__MB_Queue_reg_12__34_/*
fc> get_cells TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404
fc> get_pins  TDATQCHAN0_DatQ3/FxSynthesize_ctmi__2080404/*

fc> select_inst TDATQCHAN0
fc> select_inst TRSPQ
fc> set net_q2rsp [get_nets -from TDATQCHAN0_DatQ0 -to TRSPQ]
fc> highlight -nets $net_q2rsp
# set net_req2q [get_nets -from TREQQ -to TDAQCHAN0]
# highlight -nets $net_req2q
# TDAQCHAN0(size 817) -> TRSPQ(239)  TREQQ(317) -> TDAQCHAN0;    // PRB(154) RSPNDQ(316) 
fc> select_inst df_tcdx0.TREQQ; select_inst df_tcdx0.TRSPQ; select_inst df_tcdx0.TRBQ; select_inst df_tcdx0.TPERF
fc> select_inst df_tcdx0_df_trspq0_0; select_inst df_tcdx0_df_treqq0_0 ; select_inst df_tcdx0_df_tprbq0_0
fc> select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_*_0;
fc> select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_*_0;
fc> select_inst df_tcdx0_df_lsdc_age0_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_*_0;
fc> select_inst df_tcdx0_df_lsdc_matrixcvtgater0_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_0_0
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0;  # .QVect[0:3483]
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0.genblk4_df_lsdc_age0;
fc> select_inst df_tcdx0.TDATQCHAN0_DatQ0.genblk4_df_lsdc_age0.GaterSplitForPower_matrixcvtgater 
fc> select_inst *.*.genblk4_df_lsdc_age0;
fc> select_inst df_tcdx0.TDATQCHAN0_DATQ1; 
fc> select_inst df_tcdx0.TDATQCHAN0_DATOQ0;
fc> select_inst df_tcdx0.TDATQCHAN0_DATOQ1;
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

#### set encoding=utr-8, GB words displaying will be OK.
#### RTL ppa AI, code splitter;
who are familiar with AI analysis of RTL code?
such as code splitter.
we have RTL PPA Code Advisor at Alpha stage, for area,tns RTL improvement, based on GPT4o and LLM, will output revised code;

when I met big RTL file, use code splitter to split into RAG; how to split is an focused consideration.


####  python  pdf2txt fusioncompiler.pdf
module load fusioncompiler
which fc_shell
/tool/cbar_ec/apps_k310_g217_64/fusioncompiler/2024.09-SP3-DEV-20240827-ec/bin/fc_shell
/tool/cbar_ec/apps_k310_g217_64/fusioncompiler/2024.09-SP3-DEV-20240827-ec/doc/FC/

#### QBUS pd seminar
bus too close, cause congestion? set RB; 

####
du1 /proj/navi44_feint25_nobackup/fengli1/navi48_NLD/main/pd/tiles/

####  pd flow, tb; df_mid_tcdx0/1, , gc_gl1ac_t;
cd /proj/at2_til29_nobackup/jdon;
source /home/huiyinli/setup_at2.tcl

Loading fusioncompiler/2022.12-SP6-T-20240924
ERROR: fusioncompiler/2022.12-SP6-T-20240924 cannot be loaded due to a conflict.
HINT: Might try "module unload fusioncompiler/2020.09-SP6-T-20210916" first.

/proj/at2_til29_nobackup/jdon/at2/override.params
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/


#### gc_gl1ac_t 
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxUniqNetlist.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxPlace.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxCts.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/report_hier.rpt
# FxPlace_start_time Dec 11 10:52:43 EST 2024 # FxPlace_end_time   Dec 17 04:06:51 EST 2024
tb> fxplace; 
    1.      utcl1                                   452618    0         41978.44  8.60%     
    2.      gl1c_3                                  423947    18        61413.16  12.59%    
    3.      gl1c_2                                  404060    18        60440.77  12.39%    
    4.      gl1c_1                                  401623    18        59481.72  12.19%    
    5.      gl1c_0                                  398208    18        59711.61  12.24%    
    6.      gl1a                                    392364    0         34650.71  7.10%     
    11.     grbmh_se                                26649     0         2794.96   0.57%     
    13.     pc_128b_exp_wr_gl1iw                    21150     4         9785.57   2.01%     
    15.     wr0_gl1iw                               19580     0         2346.97   0.48%     
    18.     wr1_gl1iw                               18484     0         2276.33   0.47%     
    14.     gl1iw_wgs_se                            20435     4         9396.66   1.93%     
    20.     gl1iw_sa0cb0                            17394     4         9779.90   2.00%     
    17.     gl1iw_sa0cb1                            18655     4         10021.40  2.05%     
    23.     gl1iw_sa0db0                            16926     4         9531.97   1.95%     
    12.     gl1iw_sa0db1                            21222     4         10122.42  2.07%     
    19.     gl1iw_sa1cb0                            18278     4         9813.26   2.01%     
    16.     gl1iw_sa1db1                            19181     4         9924.62   2.03%     
    21.     gl1iw_sa1db0                            17163     4         9681.26   1.98%     
    22.     gl1iw_sa1cb1                            17089     4         9714.37   1.99%     
    34.     gl1iw_sqg                               9474      1         2601.55   0.53%     
    31.     gl1ir_pc_rd                             11422     0         1171.36   0.24%     
    28.     gl1r_ret_sa1cb                          12943     0         976.20    0.20%     
    24.     gl1r_ret_sa1db                          16217     0         1102.13   0.23%     
    26.     gl1r_ret_sa0cb                          15286     0         1214.04   0.25%     
    35.     gl1r_ret_sa0db                          8969      0         838.46    0.17%     
    8.      gl1r_ret_se                             52241     0         4264.26   0.87%     
    9.      gl1r_src_se                             43415     0         3504.61   0.72%     
    10.     gl1r_src_sa0cb                          35111     0         2726.44   0.56%     
    27.     gl1r_src_sa1cb                          14282     0         1131.72   0.23%     
    30.     gl1r_src_sa0db                          11709     0         963.92    0.20%     
    32.     gl1r_src_sa1db                          11096     0         952.73    0.20%     
    29.     pa_64b_wr_gl1iw                         11993     4         9239.44   1.89%     
    36.     pa_64b_rd_gl1ir                         8878      0         981.71    0.20%     
    7.      rlc_se                                  67114     2         7810.90   1.60%     
    33.     rlc_se_gl1iw                            10565     4         8061.91   1.65%     
    25.     gc_gl1ac_t_rep_Cpl_GFXCLK               15307     0         3198.60   0.66%     
    37.     dbg_steer_wrapper                       2463      0         206.94    0.04%     
fc_shell> source *tbc;
fc_shell> show_item [get_flat_cells -hierarchical gl1iw*/*] gl1iw*
fc_shell> show_item [get_flat_cells -hierarchical utcl1*/*] utcl1*
fc_shell> show_item [get_flat_cells -hierarchical gl1r_src*/*] gl1r_src*
fc_shell> show_item [get_flat_cells -hierarchical gl1r_ret*/*] gl1r_ret*
fc_shell> show_item [get_flat_cells -hierarchical gl1c_0/*] gl1c_0


fc_shell>   report_qor; # timer using 'AWP, POCV,CRPR'
scenarios:  hold_ffgnp1p05vm40c_rcworst_rcworstCCworst100c_FuncFFg1p05v  
            setup_ffgnp1p05vm40c_typrc100c_FuncFFg1p05v (22 459 -114 293 -19205   701)   (23 255 32   293 0 0 )
            setup_tt0p65v0c_typrc100c_Functt0p65v       (21 602 -335 293 -1328515 48862) (26 464 -190 293 -109669 4291)
            setup_tt0p9v100c_typrc100c_Functt0p9v       (22 523 -172 293 -153941 3260)   (24 336 -48  293 -951 38 )
path_group:   GC_GFXCLK GC_GFXCLK _LARR GC_GFXCLK_gl1a_ret_mc_p2prd 
setup_timing: lol 22,23,19  clock_period: 293ps;   
cell_count:  hier_cells 60526 hier_ports 3151151 leaf_cells 3309609 buf/inv_cells 1312024 comb_cells 3062138 seq_cells 247471 
             cg_cells 34951 seq_macro_cells 123 single_bit_seq_cells 91438 mbb_seq_cells 120194 
fc_shell>   report_utilization; 
            # utilization_ratio 0.61  objects_excluded: hard_macros macro_keepouts soft_macros hard_blockages 
            # Area 664265  capacity_area: 452260 cells: 277864  hard_macros 210624  macro_keepouts: 1367 hard_blockages 211991 
            # total_excluded: 423982 raio_excluded: 0.63 
fc_shell>   report_hierarchy -no_leaf > ../../../report_hier.rpt
# highlight modules
fc_shell> source /tools/aticad/1.0/src/zoo/ms_scr/script/PnR/floorplan/ms_floorplan_utility.tbc
fc_shell> ms_hier_explore
fc_shell> show_item [get_flat_cells -hierarchical gl1c_0/*] gl1c_0
fc_shell> source /proj/at2_til22_nobackup/doudouye/ exer/tb/run_02/11132024/main/pd/tiles/ gc_gl1ac_t_run_02_TileBuilder_Nov13_0221_12801_GUI/shoe

fc_shell> foreach $tn (gl1c_0 gl1c_1 gl1c_2 gl1c_3 utcl1 gl1a rlc_se gl1r_ret_se )
fc_shell> show_item [get_flat_cells -hierarchical $tn/*] $tn

             
#### df_tcdx0  fusioncompiler
df_tcdx0 () {
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/cmds/FxPixPlace.cmd

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxPlace.log.gz 
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxCts.log.gz 
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxOptCts.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxRoute.log.gz

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/data/

fc_shell>   report_qor; 
scenarios:  hold_ffgnp1p05vm40c_rcworst_rcworstCCworst100c_FuncFFg1p05v  (R2R_reg2reg  -11 -1529 630)
            setup_ffgnp1p05vm40c_typrc100c_FuncFFg1p05v  (IO_in2reg 11 450 -265 470 -770224 3490) (IO_reg2out 5 136 -42 470 -82 2)
            setup_tt0p65v0c_typrc100c_Functt0p65v        (IO_in2reg 11 550 -365 470 -1046140 4011) (IO_reg2out 5 209 -115 470 -14153 909)
            setup_tt0p9v100c_typrc100c_Functt0p9v        (IO_in2reg 11 483 -297 470 -863483 3528) (IO_reg2out 5 161 -67 470 -14153 909)
path_group: FCLK clock_period: 470 ps
cell_count: hier_cell 2988 hier_ports 208280  leaf_cells 946916 buf/inv_cells 208239 comb_cells 905113 seq_cells 41803
            cg_cells 7313 seq_macro_cells 0 single_bit_seq_cells 6121 mbb_seq_cells 28369 

foreach clk [get_attr [all_clocks] sources] {
    set clkname [get_attr  $clk full_name];
    set reg_num [llength [get_attr [all_fanout -from $clkname -flat -end] full_name]]; 
    puts $clkname; puts  $reg_num;
}

tcdx0_highlight.tcl
fc_shell> source /tools/aticad/1.0/src/zoo/ms_scr/script/PnR/floorplan/ms_floorplan_utility.tbc
fc_shell> ms_hier_explore
fc_shell> show_item [get_flat_cells -hierarchical TREQQ/*] TREQQ
foreach tn {TREQQ TRSPQ TPRBQ}
foreach tn {TPERF tcdx_pg_regs}
foreach tn {TCPL_PG FCI2REG}
foreach tn {df_dbusif outcm_snsr_arr_p0}
foreach tn {TDATQCHAN0_DatQ4 TDATQCHAN0_DatQ3 TDATQCHAN0_DatQ2 TDATQCHAN0_DatQ1 TDATQCHAN0_DatQ0      } {
    show_item [get_flat_cells -hierarchical $tn/*] $tn   }
foreach tn {TDATQCHAN0_DatOQ4 TDATQCHAN0_DatOQ3 TDATQCHAN0_DatOQ2 TDATQCHAN0_DatOQ1 TDATQCHAN0_DatOQ0 } {
    show_item [get_flat_cells -hierarchical $tn/*] $tn   }

show_item [get_flat_cells -hierarchical TDATQCHAN0_TPB_DAT_P0_B0_*/*] TDATQCHAN0_TPB_DAT_P0_B0_*     
show_item [get_flat_cells -hierarchical TDATQCHAN0_TPB_DAT_P1_B0_*/*] TDATQCHAN0_TPB_DAT_P1_B0_*     
show_item [get_flat_cells -hierarchical TDATQCHAN0_TPB_DAT_P2_B0_*/*] TDATQCHAN0_TPB_DAT_P2_B0_*     
show_item [get_flat_cells -hierarchical TDATQCHAN0_TPB_DAT_P3_B0_*/*] TDATQCHAN0_TPB_DAT_P3_B0_*     
show_item [get_flat_cells -hierarchical TDATQCHAN0_TPB_DAT_P4_B0_*/*] TDATQCHAN0_TPB_DAT_P4_B0_*     
show_item [get_flat_cells -hierarchical TDATQCHAN0_DAT_PKT_*] TDATQCHAN0_DAT_PKT_*


    1.      TREQQ                                     201319    0         10659.49  18.41%    
    2.      TRSPQ                                     116403    0         6117.34   10.56%    
    3.      TPRBQ                                     53538     0         2963.65   5.12%     
    5.      TPERF                                     7015      0         237.43    0.41%     
    4.      tcdx_pg_regs                              7527      0         729.58    1.26%     
    98.     TCPL_PG                                   1792      0         107.78    0.19%     
    99.     FCI2REG                                   1055      0         54.63     0.09%     
    62.     df_dbusif                                 3608      0         155.89    0.27%     
    63.     outcm_snsr_arr_p0                         2915      0         109.77    0.19%     
    17.     TDATQCHAN0_DatQ4                          5694      0         507.36    0.88%     
    31.     TDATQCHAN0_DatQ3                          4897      0         407.95    0.70%     
    27.     TDATQCHAN0_DatQ2                          4979      0         414.82    0.72%     
    95.     TDATQCHAN0_DatQ1                          2432      0         208.29    0.36%     
    82.     TDATQCHAN0_DatQ0                          2556      0         209.38    0.36%     
    55.     TDATQCHAN0_DatOQ4                         4487      0         263.21    0.45%     
    25.     TDATQCHAN0_DatOQ3                         5018      0         283.22    0.49%     
    53.     TDATQCHAN0_DatOQ2                         4510      0         256.96    0.44%     
    57.     TDATQCHAN0_DatOQ1                         4429      0         244.25    0.42%     
    59.     TDATQCHAN0_DatOQ0                         4384      0         241.96    0.42%     
    16.     TDATQCHAN0_TPB_DAT_P4_B0_0                5706      0         428.24    0.74%     
    11.     TDATQCHAN0_TPB_DAT_P4_B0_5                5874      0         420.56    0.73%     
    12.     TDATQCHAN0_TPB_DAT_P4_B0_10               5811      0         424.24    0.73%     
    22.     TDATQCHAN0_TPB_DAT_P4_B0_15               5088      0         363.42    0.63%     
    61.     TDATQCHAN0_TPB_DAT_P2_B0_15               3995      0         290.58    0.50%     
    29.     TDATQCHAN0_TPB_DAT_P2_B0_10               4931      0         335.20    0.58%     
    32.     TDATQCHAN0_TPB_DAT_P2_B0_5                4892      0         339.78    0.59%     
    44.     TDATQCHAN0_TPB_DAT_P2_B0_0                4706      0         352.70    0.61%     
    60.     TDATQCHAN0_TPB_DAT_P3_B0_15               4273      0         298.77    0.52%     
    37.     TDATQCHAN0_TPB_DAT_P3_B0_10               4807      0         340.94    0.59%     
    39.     TDATQCHAN0_TPB_DAT_P3_B0_5                4779      0         344.34    0.59%     
    52.     TDATQCHAN0_TPB_DAT_P3_B0_0                4511      0         366.47    0.63%     
    97.     TDATQCHAN0_TPB_DAT_P1_B0_15               2207      0         156.50    0.27%     
    73.     TDATQCHAN0_TPB_DAT_P1_B0_10               2632      0         182.41    0.31%     
    76.     TDATQCHAN0_TPB_DAT_P1_B0_5                2592      0         184.75    0.32%     
    79.     TDATQCHAN0_TPB_DAT_P1_B0_0                2570      0         188.11    0.32%     
    96.     TDATQCHAN0_TPB_DAT_P0_B0_15               2331      0         155.21    0.27%     
    88.     TDATQCHAN0_TPB_DAT_P0_B0_10               2525      0         184.55    0.32%     
    90.     TDATQCHAN0_TPB_DAT_P0_B0_5                2488      0         184.36    0.32%     
    74.     TDATQCHAN0_TPB_DAT_P0_B0_0                2610      0         191.41    0.33%     

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxFpPlaceMacros.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxReRoute.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/logs/FxRoute.log.gz
/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/cmds/FxRoute.cmd
}

# 

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/df_tcdx0_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/    tune/project/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl

/proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl


# floorplan module
color_term> fxplace;
color_term> TileBuilderIntFX  data/FxPlace.nlib
fc> source /tools/aticad/1.0/src/zoo/ms_scr/script/PnR/floorplan/ms_floorplan_utility.tbc
fc> ms_hier_explore
fc> write highlight script, set same module highlight as same color; 
same module's macro should be placed nearby;

#### 
/proj/soundwave_pd_gfx_tile007_ner/edhe/NLBp1_PR/main/pd/tiles/ cf_clk8_t_AUTO_PR_MLMP_more_CTS_TileBuilder_Oct30_0529_50543_GUI/

 /proj/at2_til22_nobackup/doudouye/SHQBIT/1022_right_6/
 /proj/at2_til22_nobackup/doudouye/at2_code/data/SynRtl/rtl_df_mid_tdatq13.v
 /proj/at2_til22_nobackup/doudouye/at2_code/data/SynRtl/rtl_df_mid_lat_arr.v
     ~/mid_tq/rtl_df_mid_tdatq13_noparams.v
     ~/mid_tq/ df_mid_lat_arr #(
 /proj/at2_til22_nobackup/doudouye/df_mid_tcdx1/
 /proj/at2_til22_nobackup/doudouye/mi350_code/
# /proj/at2_til22_nobackup/doudouye/at2_code/SynRtl/
# /proj/at2_til22_nobackup/doudouye/at2/PreNLA/df_mid_tcdx1/1023/

#### tcdx0_fxplace report_timing
fc_shell> report_timing; # CPU 19037s  ELAPSE 157613s(43hrs) MEMPEAK: 36001M 
#  Wed Dec 11 06:23:05 EST 2024  # Thu Dec 12 14:19:21 EST 2024
default: -path_type full -delay_type max -nworst 3 -max_paths 3  (using AWP, POCV_slew, CRPR)
design: df_tcdx0 
start_point: TEST_CLK_EN  endpoint: TDATQCHAN0_TPB_DAT_P2_B0_15/CG_region_1__CG_lin_4__CG_en_0__Cg_I_S1ze_ckor(falling_edge)
mode: FuncTT0p65v corner: tt0p65v0c_typrc100c_setup  scenario: setup_tt0p65v0c_typrc100c_FuncTT0p65v path_group: IO_in2reg
clock FCLK(rist_edge)  input_external_delay 305.5  TEST_CLK_EN 306 BOUNDBUF_CEL_fillers_9673_0/Z(BUFFOPT3FD6) 321
      FXPlace_ctmTdsLR_1_954707/Z (BUFFSR2D10) 334 FxPlace_ZBUF_145_inst_965512/Z(BFFSR2D10) 350
      TDATQCHAN0_TPB_DAT_P2_B0_15/I_SSE_Marker/d0nt_buf/Z (MRKBUFFD8)  391
      TDATQCHAN0_TPB_DAT_P2_B0_15/I_SSE_Marker/FxPlace_ZBUF_11_inst_1154302/Z (BUFFSR2D10)  427
      TDATQCHAN0_TPB_DAT_P2_B0_15/FxPlace_ZINV_2_fp_inst_940002/ZN (INVOPT3FSKND6)  456
      TDATQCHAN0_TPB_DAT_P2_B0_15/I_d0nt_sse_en_X/Q (DFRNQTXGD1)  488
      TDATQCHAN0_TPB_DAT_P2_B0_15/FxPlace_ZINV_520_inst_1214881/ZN (INVOPT3FSKPD6)  456
      TDATQCHAN0_TPB_DAT_P2_B0_15/ctmi_12202/ZN (IAOI21OPT3FD3)  502
      TDATQCHAN0_TPB_DAT_P2_B0_15/FxSynthesize_ctmi__2093713/ZN2 (SPC2NR2DOP5AMD)  511
      TDATQCHAN0_TPB_DAT_P2_B0_15/FxPlace_ZBUF_54_inst_1220663/Z (BUFFOPT3FSKPD3)  527
      TDATQCHAN0_TPB_DAT_P2_B0_15/FxPlace_ctmTdsLR_2_968001/ZN (ND2OPTPAD1)  541
      TDATQCHAN0_TPB_DAT_P2_B0_15/CG_region_1__CG_lin_4__CG_en_0__Cg_I_S1ze_ckor(falling_edge) 550
data_arrival_time     550
clock_FCLK_fall_edge  235
clock_network_delay   0
clock_reconvergence_pessimism 0
output_external_delay -50
data_required_time    185
data_arrival_time     550
            =         -365

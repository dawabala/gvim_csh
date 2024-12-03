
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

#### verdi
module avail verdi;
module unload verdi; module unload verdi;
module load  verdi/2024.09         
csh> which verdi
/tool/cbar/apps/verdi/2024.09/bin/verdi
verdi -sv -f data/SynRtl/SynRtl.vf

#### fusion compiler
TileBuilderTerm;
cd /proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_tcdx0/1104/df_tcdx0_uti51/main/pd/tiles/df_tcdx0_df_tcdx0_uti52_new_sdc_frequency_TileBuilder_Nov04_0258_64459_GUI;
TileBuilderIntFX data/FpPlaceMacros.nlib/
fc> all_fanin -flat -to TDATQCHAN0_DatQ0/* > dq0_fanin.flat.rpt
select_inst TDATQCHAN0
select_inst TRSPQ
set net_q2rsp [get_nets -from TDATQCHAN0_DatQ0 -to TRSPQ]
highlight -nets $net_q2rsp
# set net_req2q [get_nets -from TREQQ -to TDAQCHAN0]
# highlight -nets $net_req2q
# TDAQCHAN0(size 817) -> TRSPQ(239)  TREQQ(317) -> TDAQCHAN0;    // PRB(154) RSPNDQ(316) 
select_inst df_tcdx0_df_trspq0_0
select_inst df_tcdx0_df_treqq0_0
select_inst df_tcdx0_df_tprbq0_0
select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_0_0;
select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_1_0;
select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_2_0;
select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_3_0;
select_inst df_tcdx0_df_tdatq_q0_2_1_5_1_61_67_52_1_0_0_0_528255_4_0;
select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_0_0;
select_inst df_tcdx0_df_tdatq_q0_4_2_3_0_0_37_16_1_1_1_1_329334_1_0;
select_inst df_tcdx0_df_lsdc_age0_SIZE16_ALLOC4_PICK1_MULTIPICK0_ALLOCAGE1_ALLOCMULTIHOT0_GATER_SPLIT_EN1_GATER_SPLIT_SIZE4_NO_INVALID_CHECK0_ACCURATE_GATER_EN1_CHK_MODE0_0_0;
select_inst df_tcdx0_df_lsdc_matrixcvtgater0_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_0_0
select_inst  




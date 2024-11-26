
/proj/at2_til23_nobackup/
/proj/mi350_aid_feint_re/


bsub -Is -q fstsim -n 4 -P at2-pd -J mdsj -R 'rusage[mem=80000] select[((type == any )&&((type == RHEL7_64 ||type == RHEL8_64 )&&(csbatch||parallel||gb128))&&(csbatch||gb128||parallel))]' xterm
xterm> cd /proj/at2_til22_nobackup/doudouye/
xterm> cd mi350; (cd at2) 
module load verdi;
verdi -sv -f data/SynRtl/SynRtl.vf

/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/GetNetlist.v.gz; # 100M 
/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/UniqNetlist.v.gz; # 67M
/proj/at2_til22_nobackup/zhihan/at2/PreNLA/df_mid_tcdx1/1023/main/pd/tiles/df_mid_tcdx1_tcdx_uti466_5port/data/OptCts.v.gz; 
# RCLK_PgenAgeData_AR_68 68/30/8/2

 module df_mid_tcdx1_df_mid_lsdc_matrixcvtgater1_SIZE16_EQUALITY0_ALLOC4_GATER_SPLIT_SIZE4_ACCURATE_GATER_EN1_4_0 ( 

/proj/at2_til22_nobackup/doudouye/at2/
~/mid_tq/uniqnetlist_df_mid_tdaq_q13.v # module df_mid_tdaq_q copied from UniqNetlist.v.gz
~/mid_tq/tdaq_q13_1118_noPICK.v;       # PICK deleted 

~/mid_tq/q13.v
~/mid_tq/q13_tb.v
ncverilog -sv q13*.v df_mid_features.vh +incdir+/home/jdon/mid_tq/1030/inc/ +timescale=1ps/1ps  

foreach i ( 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 1 2 3 2 2 2 2 2 2 2 2 2 2 2 2 )
  ncverilog +timescale=1ps/1ps -sv q13_tb.v rtl_df_mid_tdatq_q13.v ati_clock_gate.v +indir+/home/jdon/mid_tq/1030/inc ; sleep 98 ;
end


uname -a; # atletx7-neu004 3.10..0-1160.119.1.el7.x86_64;
whatos; # k310_g217_64;
module load cadenceIUS/9.2-e218;
which ncverilog; # ncsim, verilog, simvision;
# /tool/cbar/apps/cadenceIUS/9.2-e218/tools/bin/ncsim
#20241121,16:36;



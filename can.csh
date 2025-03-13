#### cdc script trial run
~/soc/cdc.csh

soc CDC owner: D K, Prateek
# use script to kick off CDC run;
/proj/canis_pd_fct04/fct_runs/NLC_test/soc_only.flat.cdcmax.csh
/proj/canis_pd_fct01/prateedk/SYNC_rpts/NLC_PLACE/
/proj/canis_pd_fct01/prateedk/
# cdc results, JIRA;
/proj/canis_pd_fct01/prateedk/cdc_check_paths_only_NBIF_TILE_DFX_all_data.rpt.gz; # DECANDFX-422; 
cip_nbif_t/tile_dfx/scan_cntl/te_gater_ff_reg/CP,BP_BP[3],DFX_SCAN_SHIFT_CLK,3951,,SDFRPQTXGD1BWP143M286H3P48CPDLVT,DBGCLK,606,,port,0.000000,7134.254883,5000.0,,,Min delay of cip_nbif_t/tile_dfx/scan_cntl/mrk_TEST_CLK_EN_mcpm/umcpm_0_/genblk1_genblk1_genblk1_d0nt_MCPM_HC0_C0_D_5000_/A BUFFCDCD2AMDBWP143M117H3P48CPDLVT (Module:cip_nbif_t_techind_mcpm_single_driveSel3_DestClkCnt0_HoldCheck0_CdcDestSetup5000_2_0:CdcDestSetup:5000.000000) ,,-2134.254883,FAIL
secip_art_t/tile_dfx/scan_cntl/async_rst_gater_ff_reg/CP,cip_nbif_t/tile_dfx/dft_clk_cntl_Cpl_SOCCLK/dft_clk_cntl_ono/dft_clk_cntl_status_tdr/reg_DFT_CLK_CNTL_STATUS/data/q_int_reg_0_/D,DFX_SCAN_SHIFT_CLK,3951,,SDFRPQSXGD4BWP143M286H3P48CPDLVT,MTAP_Wrck,15805,,DFQTXGD1BWP143M169H3P48CPDLVT,10.393300,47522.648438,47417.039064,,,Min delay of secip_art_t/sib_32_art_soc/sib_32_art_soc_rot_rst_top/d0nt_CDCBUF_ROT_SOC_PWROKRAW/u_techind_cdcfpm/ufpm_0_/genblk1_genblk1_d0nt_CDCFPM_C0_D_50000_/A BUFFCDCD2AMDBWP143M117H3P48CPDLVT (Module:secip_art_t_techind_cdcfpm_single_applyParams0_CdcDestSetup50000_DestClkCnt0_driveSel3_mode010_BufMetaWaiveMode2_SrcPath0_1_0:CdcDestSetup:50000.000000) ; cip_nbif_t/tile_dfx/dft_clk_cntl_Cpl_SOCCLK/dft_clk_cntl_ono/I_cdc_ext_clk_stop/u_tis_cdcefpm/uefpm_0_/genblk1_genblk1_genblk1_d0nt_CDCEFPM_HC0_C3_D_0_/A ND2CDCD2AMDBWP143M169H3P48CPDLVT (Module:cip_nbif_t_techind_cdcefpm_single_driveSel3_DestClkCnt3_CdcDestSetup0_HoldCheck0_SrcPath0_7_0:DestClkCnt:3.000000*15805.679688) ,,-116.002674,FAIL

/proj/canis_pd_fct01/prateedk/SYNC_rpts/NLC_PLACE/SYNC_check_paths_only_DF_all_data_detail.rpt.gz;
    SYNC Path through
    	df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D
    StartClocks      : virtual_pad_clk
    EndClock         : FCLK {Period: 827}
    Other EndClocks  : 
    Path Delay       : 6.8e+04
    Reqd Max Delay   : 5e+04
    MaxDelay setting : Min delay of df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D SDFSYNC4QD1AMDBWP143M455H3P48CPDULVT (TransportDelay from Instance_Name Last field:TransportDelay:50000.000000) 
/proj/canis_pd_fct01/prateedk/SYNC_rpts/NLC_PLACE/SYNC_check_paths_only_DF_all_data_csv.rpt;  # DECANPD-417;
    StartPoint,EndPoint,StartClock,StartClockPeriod,StartClockLatency,StartType,EndClock,EndClockPeriod,EndClockLatency,EndType,SetupTime,PathDelay,ReqdDelay,ReqdMaxDelay,ReqdDestCycles,Markers,Group,Slack,Result
    BP_CLKIN_NOSS_L,df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D,AMD_SYNC_VIRTCLK,1,,port,FCLK,826,,SDFSYNC4QD1AMDBWP143M455H3P48CPDULVT,6.418407,282275.09375,50000.0,,,Min delay of df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D SDFSYNC4QD1AMDBWP143M455H3P48CPDULVT (TransportDelay from Instance_Name Last field:TransportDelay:50000.000000) ,,-232281.512157,FAIL
    ssr_msmu_t/soc_msmu0/msmu_cru/MSMUREGS/umsmucfgrb/oQ_MSMU_FUNC_CLK_EN_13_reg_7__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_6__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_5__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_4__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_3__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_2__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_1__MB_oQ_MSMU_FUNC_CLK_EN_13_reg_0_/CP,df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D,PWROK_S5_GEN_ROCLK,8000,,MB8SRLSDFQTXGLP3553D1AMDBWP143M1144H3P48CPDLVT,FCLK,826,,SDFSYNC4QD1AMDBWP143M455H3P48CPDULVT,6.418407,276554.71875,50000.0,,,Min delay of df_pie_t/pie/pie_main/df_pie_dbg/CrossTrigInSync0/genblk1_usync_0_/s4_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync4msfqxss1us_d0nt_sync_HC0_C0_D_50000_/D SDFSYNC4QD1AMDBWP143M455H3P48CPDULVT (TransportDelay from Instance_Name Last field:TransportDelay:50000.000000) ,,-226561.137157,FAIL

csh> less report.cdc.path.rpt.gz | filter_pt.pl -s 'CDC Path through' -r "tile_dfx" | less

\\\\\\\\ clock no-route list;
Please check NLCp1 initial clock no-route list as below:
Clock no-route file: 
/proj/canis_pd_clk01/release/NLCp1/GFX/clk_noroute.list

# This is initial NLCp1 clock implementation plan for GFX.
Net	       source_tile	Num_of_tile_sinks	Manhhattan_length	implementation	Comment
Cpl_GFXCLK	gc_gdfll_t	125	                  15554.53	         Mesh	 
Cpl_ACVCLK	SOC	4	3543.12	Balance-multi-terminal	 
gpu_dldo_LONO_clkout_cg	gc_dldo_t	9	5467.246	Balance-multi-terminal	 
gpu_dldo_ONO_0_clkout_cg	gc_dldo_t	107	15385.504	Balance-multi-terminal	 
Cpl_VDDCR_SOC_SMNCLK	SOC	3	6551.05	RDL only	Before entering GFX need BUF/INV to push (RDL)
Cpl_VDDCR_SOC_GAP_REFCLK	SOC	2	6215.28	RDL only	Before entering GFX need BUF/INV to push (RDL)
Cpl_VDDCR_SOC_REFCLK_100	SOC	3	6302.224	RDL only	Before entering GFX need BUF/INV to push (RDL)
DFX_TARG_Shift_Clk_group4	SOC	3	6927.856	RDL only	Big Invx32/BUFx15 ~1600um unbal port place at mid RDL only net near boundary to SOC
Cpl_DLDOCLK_SOC_400	SOC	3	6577.648	RDL only	~800um #Freq quite high
BC1500_Wrck	SOC	1	5848.048	RDL only	 
Cpl_FCLK_vdci_gc_df_ch0_t	SOC	1	5560.1475	RDL only	 
Cpl_FCLK_vdci_gc_df_ch1_t	SOC	1	5397.128	RDL only	 
Cpl_FCLK_vdci_gc_df_ch2_t	SOC	1	5350.1565	RDL only	 
Cpl_FCLK_vdci_gc_df_ch3_t	SOC	1	5513.176	RDL only	 
Cpl_FCLK_vdci_gc_df_ch4_t	SOC	1	7626.562	RDL only	 
Cpl_FCLK_vdci_gc_df_ch5_t	SOC	1	7874.626	RDL only	 
Cpl_FCLK_vdci_gc_dfcrest_t	SOC	1	6423.066	RDL only	 
Cpl_SOCCLK	SOC	1	6215.28	RDL only	For SOC shielding need near boudnary
DFX_TARG_Shift_Clk	SOC	1	6001.264	RDL only	 
vdci_gc_syshub_t_xover_vddSOC_Cpl_GFXCLK_Bypass	SOC	1	5848.048	RDL only	 
DFX_TARG_Shift_Clk_group1	SOC	2	5560.1475	RDL only	 
DFX_TARG_Shift_Clk_group2	SOC	2	5513.176	RDL only	 
DFX_TARG_Shift_Clk_group3	SOC	2	7874.626	RDL only	 
Stac_Wrck_group1	SOC	2	5560.1475	RDL only	 
Stac_Wrck_group2	SOC	2	5513.176	RDL only	 
Stac_Wrck_group3	SOC	2	7874.626	RDL only	 
Stac_Wrck_group4	SOC	5	6927.856	Unbalance-single-terminal	SOC tmac ~15um near to boundary 
gc__Cpl_VDDCR_GFX_GFXAVFSCLK	gc_gdfll_t	11	13644.776	Unbalance-single-terminal	 
soc_dft__remote_dft_soc_dft_gc_se0__BC1500_0_Wrck	gc_sc_bci1_t0	21	8078.1715	Unbalance-single-terminal	 
soc_dft__remote_dft_soc_dft_gc_se1__BC1500_0_Wrck	gc_spi_s_bci0_cac_t0	21	8311.144	Unbalance-single-terminal	 
soc_dft__remote_dft_soc_dft_gc_se2__BC1500_0_Wrck	gc_pa_t0	22	9673.65	Unbalance-single-terminal	 
soc_dft__remote_dft_soc_dft_gc_se3__BC1500_0_Wrck	gc_pc_sx_t0	26	10427.534	Unbalance-single-terminal	 
vdci_gc_dfcrest_t_xover_vddBE_MtapStac_Wrck	vdci_gc_dfcrest_t	131	15641.474	Unbalance-single-terminal	 
vdci_gc_syshub_t_xover_vddFE_MtapStac_Wrck	vdci_gc_syshub_t	131	15641.474	Unbalance-single-terminal	 
vdci_gch_soc_gfxm_t_xover_vddGFX_MtapStac_Wrck	vdci_gch_soc_gfxm_t	131	15641.474	Unbalance-single-terminal	 
Cpl_DLDOCLK_GFX_400_MON	vdci_gc_syshub_t	1	3269.632	P2P-single-terminal	 
vdci_gc_syshub_t_xover_vddFE_Cpl_GFXCLK_Bypass	vdci_gc_syshub_t	1	3269.632	P2P-single-terminal	 
GCH_DFLL_PLLCHARZ_l 	SOC	0	2578.416	P2P-single-terminal	600-800um need a pair inv before send to SOC
GCH_DFLL_PLLCHARZ_h	SOC	0	2578.416	P2P-single-terminal	600-800um need a pair inv before send to SOC
MtapStac_Wrck	/	/	/	/	Floating port- https://ontrack-internal.amd.com/browse/DECANPD-166
Dfx_SCAN_SHIFT_CLK	/	/	/	/	Floating port- https://ontrack-internal.amd.com/browse/DECANPD-166
vdci_s5_soc_t_xover_vddSOC_MtapStac_Wrck_vddS5	/	/	/	/	Floating port same case to MtapStac_Wrck - https://ontrack-internal.amd.com/browse/DECANPD-166








# vigitpy dir: gvim git python packages; 
jdon: git add pythonall.csh(with py310 download links);  
guojia: install gvim, git,py310; chatgpt: outlook mails save into can_mail.csh;


~/soc/rpts/rpts.csh
~/soc/rpts/place61.csh
~/soc/rpts/cts66.csh
~/soc/rpts/route80.csh
~/soc/rpts/timing.061.csh

zdiff cts_withrdl cts_nordl;
zdiff place_0p65v place_0p75v;
zdiff place_0p6v  place_0p9v;
zdiff cts_0p6v    cts_0p9v;

# include  clock mesh design;
# 0066_cts_0p75v_2t_withrdl
# 0066_cts_0p65v_2t_withrdl
# 0066_cts_0p65v_2t_nordl

# pt session; 
timing report not in it, timing path; 
# sudong bsub ptsession;

bsub -Is -q regr_high -n 4 -P at2-pd -J mdsj -R 'rusage[mem=200000] select[(type==RHEL7_64 ||type==RHEL6_64)&&(csbatch||tmpshortrr||gb32||gb64||gb128||gb256||gb512)]' xterm & ; # sudong
# zgrep PT_SHELL ./logs/PtGfxFuncTT0p75v*.log.gz; setenv PT_SHELL_MODULE primetime/2022.03-SP5-2-T-20230819;
csh> cd /proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/;
~/git/aliases
# module load primetime/2022.03-SP5-2-T-20230819;
csh> source ~sdhe/.cshrc; module load primetime/2023.12-SP5
csh> pt_shell; 
pt_shell> restore_session rpts/PtGfxFuncTT0p75v*/ptsession
pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/trace_clk_path.tcl
pt_shell> trace_clk_path -inst_map inst_tile.map; # save *.csv files into clk_trace;
# /proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/inst_tile.map
# /proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/clk_trace/GC_GFXCLK.csv
# /proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/clk_sink_numbers.csv
pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/list_sink_numbers_by_clk.tcl; # save into ./clk_sink_numbers.csv

pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/check_clk_branches_talk.tcl
pt_shell> check_clk_branches_talk -top_nets_list Cpl_USB_HOST_CLK ;  # check different top clock nets sinks talk information.

# fct workbook scripts
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/path/
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/path/analyze_path_lol_length.tcl
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/analysis_bundles_from_topo_side.tcl

\\ # /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/*
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/fx_gen_inst2inst_min_distance.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_bi_net_rep.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_repeater_bundle_cycle.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_repeater_timing.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/estimate_norep_pretiming.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/report_no_rep_timing.tcl
python3 /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/gen_summary_csv_traceflow_based.py

\\ # /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/top_clock_net.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/gen_cfg.pl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/gen_clk_pm.pl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/get_tile_clock_latency_i2_summary.pl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/check_clk_branches_talk.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/dump_path_with_ccd_issue.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/list_sink_numbers_by_clk.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/summ_tile_clock_latency.py
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/summ_top_clock_latency.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/top_clock_net.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/trace_clk_path.tcl


source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/PT_check_design.tcl*
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/analysis_all_top_nets.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/analysis_bundles_from_topo_side.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/check_rlol_design_issue.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/gen_inst_tile_map.tcl


source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/analysis_bundles_from_topo_side.tcl
 analysis_bundles_from_topo_side # summarize bundle timing formation combine with topology based on prelayout ptsession
   -inst_map file         (instance and tile map file. Format: inst_name tile_name)
   -nl_xml file           (prelayout repeater xml file.)


pt_shell> analysis_bundles_from_topo_side -inst_map ./inst_tile.map -nl_xml ./nl_repeaters.xml -dist_csv ./distance.csv -clk_lst {GC_GFXCLK} -constraints 'EQ 0'


source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/analysis_all_top_nets.tcl
 analysis_all_top_nets # dump top signal nets with clock, timing, connectivity information. Run it in PreTim (w/o FCFP) ptsession.


source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/check_rlol_design_issue.tcl; # check and dump 2tile timing with large RLOL.
# check_rlol_design_issue 
pt_shell> mkdir ./rlol
pt_shell> check_rlol_design_issue  -inst_map inst_tile.map -out_dir ./rlol -factor 15
pt_shell> check_rlol_design_issue  -inst_map ../../inst_tile.map -out_dir ./rlol -factor 15

# large RLOL issue.  # check and dump 2tile timing with large RLOL.
csh> module load primetime/2023.12-SP5;
csh> cd ../FCT0101_20250210_SOC_FUNCSCAN_GFX_HDM_GFX_ONLY_ReRoute_LSB10_NoRDL/;  ls rpts/PtGfxFunc*0p75*/ptsession
csh> pt_shell -f rpts/PtGfxFuncTT0p75v.*/ptsession; # pt_shell> restore_session rpts/PtGfxFuncTT0p75v.*/ptsession;
pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/check_rlol_design_issue.tcl
pt_shell> check_rlol_design_issue  -inst_map inst_tile.map -out_dir ./rlol -factor 10
   [-buf_keyword BUF]     (buffer keyword in ref_name. default: BUF)
   [-inv_keyword INV]     (Inverter keyword in ref_name. default: INV)
   [-cell_dly value]      (typical cell delay value. set a number. default is auto)
   [-factor value]        (adjust target RLOL with it. default 1.0)

source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/design/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/correlation/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/


source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/path/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/pin/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_bi_net_rep.tcl
# /tools/aticad/1.0/src/zoo/hmyin/pt/procs.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_repeater_bundle_cycle.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_repeater_timing.tcl

source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/fx_gen_inst2inst_min_distance.tcl*
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/estimate_norep_pretiming.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/gen_summary_csv_traceflow_based.py
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/report_no_rep_timing.tcl
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/sdc/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/summary/
source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/tune_budget/

\\\\\  aziz scripts
/tools/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -p 750 > trace_opt_nlc
# The value of 750 passed as argument p here is the repeater distance which we aim to achieve. The optimization + sorting is doable in a single step:
/tools/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -a algo3 -p 750 | \
/tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m > trace_opt_nlc_max
/tools/aticad/1.0/src/zoo/azmohamm/scripts/
arrange_reps.py*
buf2inv.pl*
fct_tile_status.pl*
gen_early_trace.py*
gen_rel_pos.py*
histo.pl*
histo_drv.pl*
/tools/aticad/1.0/src/zoo/azmohamm/scripts/measure_rep_dist.py*
modify_bad_trans.pl*
process_trace.py*
qtop.pl*
sort_by_slack.pl*
sort_trace.pl*
split_report.pl*
split_sum_drv.pl*
split_trans_uniq.pl*
sum.pl*
sum.py*
summ_clktrans.pl*
summ_datacap.pl*
summ_datatrans.pl*
summ_dblswitch.pl*
summ_si_bottleneck.pl*
summ_si_clktrans.pl*
summ_si_datatrans.pl*
summ_sort.py*

/tools/aticad/1.0/src/zoo/azmohamm/scripts/fct_early/
/tools/aticad/1.0/src/zoo/azmohamm/scripts/fct_monitor/
/tools/aticad/1.0/src/zoo/azmohamm/scripts/ml_eco/
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/

/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/delay_table_N6.aziz.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/delay_table_N6.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/delay_table_n5.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/path_manager.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/delaycell_manager.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/fix_my_hold.tcl
/tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/strix_pt_hold_fix_config.tcl


pt_shell> source          /tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/path_manager.tcl
pt_shell> source          /tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/fix_my_hold.tcl
pt_shell> init_hold_fixer /tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/strix_pt_hold_fix_config.tcl
    pt_shell> set PHF(SETUP_PVT) ssg0p65v0c
    pt_shell> set PHF(SETUP_MARGIN) 80
    pt_shell> set PHF(FIX_PATH_TYPE) all
    pt_shell> set PHF(FIX_PATH_TYPE) interface

pt_shell> fix_my_hold {rpts/Pt*/si_LCLK_min.rpt.gz /proj/strix1/nonsi_fct_run/rpts/Pt*/LCLK_min.rpt.gz}

You can provide /tools/aticad/1.0/src/zoo/azmohamm/scripts/pt_hold_fix/


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ NLC release latest pkg,xml files
/proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run6_hollow/ gfx.pkg
/proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run6_hollow/GenRepeaterReport.xml
/proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run6_hollow/pd_repeaters.xml
/proj/canis_pd_gfx_fcfp_rel02/rel_LSC_GFX_bbox/gfx.pkg
/proj/canis_pd_gfx_fcfp_rel02/ rel_LSC_GFX_bbox/

/proj/canis/a0/floorplan/rel_NLC_GFX/gfx.pkg
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t/fp_00/fcfp.Final.pkg

/proj/canis_pd_gfx_tile045/yongjing/NLC_acv_sp/main/pd/tiles/gc_acv_sp_sq_t_acv_sp_run1_formal_TileBuilder_Feb14_0615_77281_GUI/



\\\\\\\\\\\\\\\\\\\\\\\\\\  timing_path reroute 109 
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rlc_t.gc_gl1ac_t0.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.gc_gl2c_q1_c5_t.gc_gl2c_q0_c0_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.gc_pa_spi_m_ra_t0.gc_rb_t011.sorted.gz




\\\\\\\\\\\\\\\\\\\\\\\\\\  timing_path reroute 098
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_pa_spi_m_ra_t0.gc_rb_t011.sorted.gz
start_point: 
  gc_pa_spi_m_ra_t0/FCFPRepFFCpl_GFXCLK103633_bundle_RLC_SE0_gfx_3d_en_order_5/CP (SDFQTXGEQAD4BWP143M169H3P48CPDLVT)                                                         31.52       4.20 &  1060.18 r
  gc_pa_spi_m_ra_t0/FCFPRepFFCpl_GFXCLK103633_bundle_RLC_SE0_gfx_3d_en_order_5/Q (SDFQTXGEQAD4BWP143M169H3P48CPDLVT)                                                          13.77      32.84 &  1093.02 f
end_point
  gc_rb_t011/FCFPRepFFMFNCpl_GFXCLK37_MB_FCFPRepFFMFNCpl_GFXCLK321_MB_FCFPRepFFMFNCpl_GFXCLK276_MB_FCFPRepFFMFNCpl_GFXCLK367/D2 (MB4SRLSDFQ2442D2AMDBWP143M572H3P48CPDLVT)    38.42      14.35 &  1646.80 f
# qilinren new pd.xml, no gfx*en*order_5 bundles
  <rep clk_wire="Cpl_GFXCLK" constraint="LE 24" container="gc_top_t" contract="2941" domain="Cpl_GFXCLK" file="/proj/canis_fe_fcnl01/FCNL/NLB/main/pd/tiles/canis_try_run3/data/CreateP4Env/out/linux_3.10.0_64.VCS/can/library/gc-canis/pub/src/meta/connectivity/bia_repeaters_gc.xml" limited="False" negedge="false" pd="4" rep_inst="gc_top_t_rep_Cpl_GFXCLK" scan_balance="false" scanned="" sdc_clk="GC_GFXCLK">
    <net bundle="gc__RLC_SE0_gfxen" fgcg_ctrl="false" name="gc__RLC_SE0_gfxen" net_bundle_dir="same" orig_bundle="RLC_SE0_gfxen" pdestimate="3" rep_type="rep">
      <repInstance id="73624" instName="FCFPRepFFCpl_GFXCLK73624_bundle_gc__RLC_SE0_gfxen_order_1" order="1" parentInstance="gc_utcl2_t" usageCount="1" />
      <repInstance id="73625" instName="FCFPRepFFCpl_GFXCLK73625_bundle_gc__RLC_SE0_gfxen_order_2" order="2" parentInstance="gc_utcl2_t" usageCount="1" />
      <repInstance id="73626" instName="FCFPRepFFCpl_GFXCLK73626_bundle_gc__RLC_SE0_gfxen_order_3" order="3" parentInstance="gc_sdma_t" usageCount="1" />
      <repInstance id="73627" instName="FCFPRepFFCpl_GFXCLK73627_bundle_gc__RLC_SE0_gfxen_order_4" order="4" parentInstance="gc_ge_aid_t" usageCount="1" />
    </net>
    <net bundle="gc__RLC_SE0_gfx_3d_en" fgcg_ctrl="false" name="gc__RLC_SE0_gfx_3d_en" net_bundle_dir="same" orig_bundle="RLC_SE0_gfx_3d_en" pdestimate="3" rep_type="rep">
      <repInstance id="73620" instName="FCFPRepFFCpl_GFXCLK73620_bundle_gc__RLC_SE0_gfx_3d_en_order_1" order="1" parentInstance="gc_rlc_t" usageCount="1" />
      <repInstance id="73621" instName="FCFPRepFFCpl_GFXCLK73621_bundle_gc__RLC_SE0_gfx_3d_en_order_2" order="2" parentInstance="gc_utcl2_t" usageCount="1" />
      <repInstance id="73622" instName="FCFPRepFFCpl_GFXCLK73622_bundle_gc__RLC_SE0_gfx_3d_en_order_3" order="3" parentInstance="gc_sdma_t" usageCount="1" />
      <repInstance id="73623" instName="FCFPRepFFCpl_GFXCLK73623_bundle_gc__RLC_SE0_gfx_3d_en_order_4" order="4" parentInstance="gc_ge_aid_t" usageCount="1" />
    </net>

# old pd.xml
# <net bundle="RLC_SE0_gfx_3d_en" fgcg_ctrl="false" name="RLC_SE0_gfx_3d_en" net_bundle_dir="same" orig_bundle="RLC_SE0_gfx_3d_en" pdestimate="3" rep_type="rep">
#       <repInstance id="103629" instName="FCFPRepFFCpl_GFXCLK103629_bundle_RLC_SE0_gfx_3d_en_order_1" order="1" parentInstance="gc_rlc_t" usageCount="1" />
#       <repInstance id="103630" instName="FCFPRepFFCpl_GFXCLK103630_bundle_RLC_SE0_gfx_3d_en_order_2" order="2" parentInstance="gc_sdma_t" usageCount="1" />
#       <repInstance id="103631" instName="FCFPRepFFCpl_GFXCLK103631_bundle_RLC_SE0_gfx_3d_en_order_3" order="3" parentInstance="gc_gds_oa_t" usageCount="1" />
#       <repInstance id="103632" instName="FCFPRepFFCpl_GFXCLK103632_bundle_RLC_SE0_gfx_3d_en_order_4" order="4" parentInstance="gc_pa_spi_m_ra_t0" usageCount="1" />
#       <repInstance id="103633" instName="FCFPRepFFCpl_GFXCLK103633_bundle_RLC_SE0_gfx_3d_en_order_5" order="5" parentInstance="gc_pa_spi_m_ra_t0" usageCount="1" />
#     </net>
# 
#  <bundle name="RLC_SE0_gfx_3d_en" orig_name="RLC_SE0_gfx_3d_en" pre_ctnr_name="gc" pre_tile_if_name="RLC_SE0_gfx_3d_en" protocol="NULL" />
#     <bundle_connection>
#       <end_block_info block_inst="gc_gl1ac_t0" port="RLC_gfx_3d_clken" port_blkport="receive" />
#       <end_block_info block_inst="gc_rlc_t" port="RLC_SE0_gfx_3d_en" port_blkport="transmit" />
# 
# 

~/soc/rpts/route98/../sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_ea_q1_c4_t.gc_gl2c_q1_c5_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_ea_q1_c5_t.gc_gl2c_q1_c5_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c4_t.gc_gl2c_q1_c5_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_rb_t011.gc_gl2c_q1_c5_t.sorted.gz


~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_ea_q1_c4_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_ea_q1_c5_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q0_c0_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q0_c1_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q0_c2_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q1_c3_t.sorted.gz
~/soc/rpts/route98_rdl/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q1_c4_t.sorted.gz

gc_gl2c_q1_c5_t.gc_gl2c_q0_c0_t
top_net: cpwd0__gl2cc__gl2c_os  bundle: cpwd0__gl2cc__gl2c_os  EQ 0;   

 <rep clk_wire="Cpl_GFXCLK" constraint="EQ 0" container="gc" contract="1073" domain="Cpl_GFXCLK" file="/proj/gfxip_pd8/zhijin/gfx13_1028/out/linux_3.10.0_64.VCS/canis/library/gc-canis/pub/src/meta/connectivity/bia_repeaters_gc.xml" negedge="false" pd="0" rep_inst="gc_rep_Cpl_GFXCLK" scan_balance="false" scanned="" sdc_clk="GC_GFXCLK">
    <net bundle="cpwd0__gl2cc__gl2c_os" fgcg_ctrl="false" name="cpwd0__gl2cc__gl2c_os" net_bundle_dir="same" orig_bundle="gl2c_os" pdestimate="0" rep_type="rep" />
    <bundle name="cpwd0__gl2cc__gl2c_os" orig_name="gl2c_os" pre_ctnr_name="gc" pre_tile_if_name="cpwd0__gl2cc__gl2c_os" protocol="NULL" />
    <bundle_connection>
      <end_block_info block_inst="gc_gl2c_q0_c0_t" port="psm_os_detected_in" port_blkport="receive" />
      <end_block_info block_inst="gc_gl2c_q0_c1_t" port="psm_os_detected_in" port_blkport="receive" />
      <end_block_info block_inst="gc_gl2c_q0_c2_t" port="psm_os_detected_in" port_blkport="receive" />
      <end_block_info block_inst="gc_gl2c_q1_c3_t" port="psm_os_detected_in" port_blkport="receive" />
      <end_block_info block_inst="gc_gl2c_q1_c4_t" port="psm_os_detected_in" port_blkport="receive" />
      <end_block_info block_inst="gc_gl2c_q1_c5_t" port="psm_os_detected_out" port_blkport="transmit" />
    </bundle_connection>


\\\\\\\\\\\\\\\\\\\\\\\\\\ cts tune
# cts tune file; kyle;  $tile.cts.early_skew.tcl; $tile.cts.late_skew.tcl; 
tune/FxCts/FxCts.pre_opt.tcl
# set_clock_balance_points -delay -90 -balance_points [get_pins gc_rlc_t/grbm/ugrbm_schedule/FxPlace_qSCH_GDS_DMA_TRAPPED_reg_MB_qSCH_GDS_DMA_RTR_reg_MB_SYSTEM_READ_PENDING_reg_MB_GRAPHICS_READ_PENDING_reg_MB_qMe0Pipe0Barrier_dly_reg_0__MB_qMe0Pipe1Barrier_reg_0__MB_qSCH_FAO_reg_MB_qSCH_CLKEN_HALT_reg_bank_6__696004/CP ]
  set_clock_balance_points -delay -90 -balance_points [get_pins          grbm/ugrbm_schedule/FxPlace_qSCH_GDS_DMA_TRAPPED_reg_MB_qSCH_GDS_DMA_RTR_reg_MB_SYSTEM_READ_PENDING_reg_MB_GRAPHICS_READ_PENDING_reg_MB_qMe0Pipe0Barrier_dly_reg_0__MB_qMe0Pipe1Barrier_reg_0__MB_qSCH_FAO_reg_MB_qSCH_CLKEN_HALT_reg_bank_6__696004/CP ]

~/rpts/timingpath.061.csh
\\\\\\\\\\\\\\\\\\\\\\\\\\ gc_gl1ac_t timingpath 061
# gl1ac sort_rpt, gc_rlc_t.gc_gl1ac_t timing path, top net,  
# grep pd_repeater.xml: current repeaters constraints, current repeaters, bundles 
\\\\ rlc.gl1ac mem_power_ctrl; LSC.5  mem_power_ctrl IP add patches; 
gc_rlc_t.gc_gl1ac_t: 76 vios, slack: -639 ~ -476  top_net: FE_FEEDX_SHARE*gc*gc*_mem_power_ctrl_8   rep_constraints:EQ0  current_repeaters: 0;  bundles;
  FE_FEEDX_SHARE__gc_rlc_t__gc_sdma_t__mem_power_ctrl__8 (net) 
  FE_FEEDX_SHARE__gc_pa_spi_m_ra_t0__gc_gl1ac_t0__mem_power_ctrl__8 (net) 

<no_rep bundle="gc__mem" container="gc_top_t" name="gc__mem_power_ctrl[8]" orig_bundle="mem" reason="MCI">
  <bundle_connection>
      <end_block_info block_inst="gc_rlc_t" port="gc__mem" port_blkport="transmit" />
      <end_block_info block_inst="gc_gl1ac_t0" port="mem" port_blkport="receive" />
  </bundle_connection>
</no_rep>

\\\\ gl1ac.rlc *BARRIER: LSC.5 fcfp add repeaters for *BARRIER with constraint: LE26 ; 
# ask ip/sdc team  to confirm SDC;
# gl1ac.rlc.place
Startpoint: gc_gl1ac_t0/grbmh_se/ugrbmh_schedule/FxPlace_oCLR_ME0PIPE1_BARRIER_reg_MB_oCLR_ME0PIPE0_BARRIER_reg_bank_0__4615392/CP
Endpoint:   gc_rlc_t/grbm/ugrbm_schedule/FxPlace_qSCH_GDS_DMA_TRAPPED_reg_MB_qSCH_GDS_DMA_RTR_reg_MB_SYSTEM_READ_PENDING_reg_MB_GRAPHICS_READ_PENDING_reg_MB_qMe0Pipe0Barrier_dly_reg_0__MB_qMe0Pipe1Barrier_reg_0__MB_qSCH_FAO_reg_MB_qSCH_CLKEN_HALT_reg_bank_6__696004/D
# gl1ac.rlc.cts
Startpoint: gc_gl1ac_t0/grbmh_se/ugrbmh_schedule/FxPlace_oCLR_ME0PIPE1_BARRIER_reg_MB_oCLR_ME0PIPE0_BARRIER_reg_bank_0__4653827/CP
EndPoint  : gc_rlc_t/grbm/ugrbm_schedule/FxPlace_qSCH_GDS_DMA_TRAPPED_reg_MB_qSCH_GDS_DMA_RTR_reg_MB_SYSTEM_READ_PENDING_reg_MB_GRAPHICS_READ_PENDING_reg_MB_qMe0Pipe0Barrier_dly_reg_0__MB_qMe0Pipe1Barrier_reg_0__MB_qSCH_FAO_reg_MB_qSCH_CLKEN_HALT_reg_bank_6__696004/CP 
# gl1ac.rlc place vs. cts: same endpoints, startpoints reg_bank_0_4615392/CP  vs. startpoints_reg_bank_0_4653827/CP;

# 
gc_gl1ac_t.gc_rlc_t: 4 viols, slack: -378~ -313 top_net: CLR_ME0PIPE0SE0_BARRIER CLR_ME0PIPE1SE0_BARRIER   rep_constraints: EQ0  reps: 0 noconstraints; bundles: 
  <no_rep bundle="gc__CLR_ME0PIPE0SE0_BARRIER" container="gc_top_t" name="gc__CLR_ME0PIPE0SE0_BARRIER" orig_bundle="CLR_ME0PIPE0SE0_BARRIER" reason="bia:FIXME:missing_constraint">
    <bundle_connection>
      <end_block_info block_inst="gc_rlc_t" port="CLR_ME0PIPE0SE0_BARRIER" port_blkport="receive" />
      <end_block_info block_inst="gc_gl1ac_t0" port="CLR_ME0PIPE0_BARRIER" port_blkport="transmit" />
    </bundle_connection>
  </no_rep>
  <no_rep bundle="gc__CLR_ME0PIPE1SE0_BARRIER" container="gc_top_t" name="gc__CLR_ME0PIPE1SE0_BARRIER" orig_bundle="CLR_ME0PIPE1SE0_BARRIER" reason="bia:FIXME:missing_constraint">
    <bundle_connection>
      <end_block_info block_inst="gc_rlc_t" port="CLR_ME0PIPE1SE0_BARRIER" port_blkport="receive" />
      <end_block_info block_inst="gc_gl1ac_t0" port="CLR_ME0PIPE1_BARRIER" port_blkport="transmit" />
    </bundle_connection>
  </no_rep>
# rts0.gl1ac
gc_rts_0_t0000.gc_gl1ac_t0: 53 viols, slack: -55~ -0.33 top_net:se0__WGP_SA0_WGP0 rep_constraints: reps:   constraints; bundles: 
  gc_rts_0_t0000/FCFPRepFFcgcg_Cpl_GFXCLK268092_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267168_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK268554_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267344_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267256_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267300_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267685_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267740_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10/CP (MB8SRLSDFQ3575D1AMDBWP143M1144H3P48CPDLVT)      52.81     0.00       0.00 r
  gc_rts_0_t0000/FCFPRepFFcgcg_Cpl_GFXCLK268092_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267168_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK268554_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267344_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267256_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267300_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267685_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10_MB_FCFPRepFFcgcg_Cpl_GFXCLK267740_bundle_se0__WGP_SA0_WGP0_3_TCP1_GL1_req_order_10/Q8 (MB8SRLSDFQ3575D1AMDBWP143M1144H3P48CPDLVT)      15.70     75.72 &    75.72 f
  gc_rts_0_t0000/FxSynthesize_HFSNET_3087 (net)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      1    1.11 
  gc_gl1ac_t0/ZBUF_216_1589 (net)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    1    26.28 
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK264872_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265672_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264912_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264848_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265624_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265408_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265216_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264888_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8/D1 (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVT)                 46.70      22.67 &   657.58 f
  data arrival time                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            657.58
  clock GC_GFXCLK (rise edge)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             52.81     652.00     652.00
  clock network delay (ideal)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       0.00     652.00
  clock reconvergence pessimism                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     0.00     652.00
  inter-clock uncertainty                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           -43.10     608.90
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK264872_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265672_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264912_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264848_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265624_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265408_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK265216_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8_MB_FCFPRepFFcgcg_Cpl_GFXCLK264888_bundle_se0__WGP_SA0_WGP0_2_TCP1_GL1_req_order_8/CP (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVT)                                    608.90 r
  library setup time                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                -7.02     601.88
  data required time                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          601.88
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  data required time                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          601.88
  data arrival time                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           -657.58
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  statistical adjustment                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            0.00     -55.70
  slack (VIOLATED)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            -55.70
### Path from ./rpts/PtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming/report_timing_2tile_max.rpt.gz , slack = -54.030000, tns = -154.030000, margin = 100, clock = GC_GFXCLK

\\\\\\\\\  xml file, by michael
# nl.xml: xml file before insert repeater ; pd.xml : xml file after repeater inserted  (for fct, no big difference between 2 files, as we only check the bundle name and repeater constraints from the file)
# rep_info_file.lscm.txt: extract the net info from xml file (format: net name, bundle name, repeater constraints, pd inserted repeater number, related clock name)
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/nl_repeaters.xml   
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/pd_repeaters.xml  
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/rep_info_file.lscm.txt  
/proj/canis_pd_gfx_fct01/FCT/feedthru_xml/latest/feedthru_connectivity.xml

/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/nl_repeaters.xml
/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/pd_repeaters.xml
/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/rep_info_file.lscm.txt  


#### cts  8 tiles big net delay; compare rdl vs. nordl;
  gc_gdfll_t/gdfll/d0nt_touch_gdfll_glitch_free_mux_0/cgated_clk1 (net)                                                                                                                                                                                                                                     1    12.80 
  gc_gdfll_t/gdfll/d0nt_touch_gdfll_glitch_free_mux_0/d0nt_touch_inst_agmux_out/CP (CKOR2D4AMDBWP143M169H3P48CPDULVT)                                       28.12       7.06 &   322.83 r
  gc_gdfll_t/gdfll/d0nt_touch_gdfll_glitch_free_mux_0/d0nt_touch_inst_agmux_out/Z (CKOR2D4AMDBWP143M169H3P48CPDULVT) (gclock source)                       358.44     229.66 &   552.49 r
  gc_gdfll_t/gdfll/d0nt_touch_gdfll_glitch_free_mux_0/o_clk (net)                                                                                       1   195.54 
  gc_gdfll_t/gdfll/d0nt_touch_gdfll_glitch_free_mux_0/o_clk (gc_gdfll_t_gdfll_agmux_0)                                                                       0.00       0.00 &   552.49 r
  gc_gdfll_t/gdfll/GDFLL_GFXCLK_out[0] (net) 
  gc_gdfll_t/gdfll/GDFLL_GFXCLK_out[0] (gc_gdfll_t_gdfll_0)                                                                                                  0.00       0.00 &   552.49 r
  gc_gdfll_t/Cpl_GFXCLK (net) 
  gc_gdfll_t/Cpl_GFXCLK (gc_gdfll_t)                                                                                                                         0.00       0.00 &   552.49 r


grep "gc*FE_FEEDX" /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.gc_gl2c_q1_c5_t.gc_gl2c_q0_c0_t.sorted.gz
q1c5 to q1c4: no feedthru;
  gc_gl2c_q1_c5_t/psm_os_detected_out (gc_gl2c_2_t) <-                                                                                                                                                                                                                                                   0.00       0.00 &   100.18 f
  cpwd0__gl2cc__gl2c_os (net) 
  gc_gl2c_q1_c4_t/psm_os_detected_in (gc_gl2c_1_t)                                                                                                                                                                                                                                                       0.00       0.00 &   100.18 f

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.gc_dldo_t.gc_spi_s_bci0_cac_t0.sorted.gz
  bci1t0/FxPlace_HFSNET_205776: 373 ps 

  gc_sc_bci1_t0/FxPlace_HFSNET_158914 (net)                                               
  gc_sc_bci1_t0/FxPlace_HFSBUF_201_788879/I (BUFFD8BWP143M169H3P48CPDULVTLL)                    31.80 &  1231.13 f
  gc_sc_bci1_t0/FxPlace_HFSBUF_201_788879/Z (BUFFD8BWP143M169H3P48CPDULVTLL)                    23.93 &  1255.06 f
  gc_sc_bci1_t0/FxPlace_HFSNET_205776 (net)                                               
  gc_sc_bci1_t0/FxPlace_HFSINV_169_792427/I (INVD4BWP143M169H3P48CPDULVTLL)                    373.94 &  1628.99 f
  gc_sc_bci1_t0/FxPlace_HFSINV_169_792427/ZN (INVD4BWP143M169H3P48CPDULVTLL)                   152.65 &  1781.65 r
  gc_sc_bci1_t0/FxPlace_HFSNET_209324 (net)                                               
  gc_sc_bci1_t0/FxPlace_HFSBUF_9_538651/I (BUFFD3AMDBWP143M169H3P48CPDULVTLL)                   48.34 &  1829.99 r
  gc_sc_bci1_t0/FxPlace_HFSBUF_9_538651/Z (BUFFD3AMDBWP143M169H3P48CPDULVTLL)                   38.30 &  1868.29 r
  gc_sc_bci1_t0/FxPlace_HFSNET_158909 (net)                                               


# 0061_0p65v_cts
# done -25ps /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Cts_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_pa_spi_m_ra_t0.sorted.gz
# 0061_0p65v_place
# done -25ps /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_pa_spi_m_ra_t0.sorted.gz
  se0__GL1_PA_64B_RD_ret_clken (net) 
  se0__GL1_PA_64B_WR_ret_tag[0] (net) 
# 0061_0p65v_place

#done -55ps res:EQ1 /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_pc_sx_t0.sorted.gz
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK290161_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK288285_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289857_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289149_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289833_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK288853_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK290077_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289057_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2/CP (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                   52.81       0.00       0.00 r
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK290161_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK288285_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289857_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289149_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289833_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK288853_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK290077_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK289057_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_2/Q8 (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                    6.87      76.96 &    76.96 f
  se0__gl1cc__GL1C0_DIR0_GL1R4_ret_data[367] (net) 
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK288994_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK290282_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK291970_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK289118_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK291834_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK289058_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK288594_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK291530_bundle_se0__gl1cc__GL1C0_DIR0_GL1R4_ret_order_3/D6 (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVT)                       131.41       5.15 &   653.18 f
  se0__GL1_PC_RD_ret_tag[8] (net) 
  se0__GL1_SA0DB1_64B_ret_data[191] (net) 
  se0__gl1cc__GL1C0_DIR0_GL1R4_ret_tag_vec[16] (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_rb_t011.sorted.gz
#done /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_rlc_t.sorted.gz
#done -5ps reps:EQ1 /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_pa_spi_m_ra_t0.gc_gl1ac_t0.sorted.gz
  gc_pa_spi_m_ra_t0/FCFPRepFFcgcg_Cpl_GFXCLK101040_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK100328_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK100980_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK101072_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4/CP (MB4SRLSDFQ2442D2AMDBWP143M572H3P48CPDLVT)                                      52.81       0.00       0.00 r
  gc_pa_spi_m_ra_t0/FCFPRepFFcgcg_Cpl_GFXCLK101040_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK100328_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK100980_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK101072_bundle_se0__gl1cc__DIR0_GL1R13_GL1C4_src_order_4/Q4 (MB4SRLSDFQ2442D2AMDBWP143M572H3P48CPDLVT)                                      17.53      80.76 &    80.76 r
  FE_FEEDX_MFT__3__gc_pa_spi_m_ra_t__gc_gl1ac_t__se0__gl1cc__DIR0_GL1R13_GL1C4_src_data__477 (net) 
  gc_gl1ac_t0/GL1R_GL1C4_SA_src_in_data[477] (gc_gl1ac_t)                                                                                                                                                                                                                                                                                                                                                                                        0.00       0.00 &   148.44 r
#done -5ps /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rb_t000.gc_gl1ac_t0.sorted.gz
  se0__BPM_SA0CB0_GL1I_cmd (net) 
#done -63ps  large BUF/INV delay /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_spi_s_bci0_cac_t0.gc_gl1ac_t0.sorted.gz
  gc_pc_sx_t0/FxPlace_ZBUF_318_inst_3512111/I (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                             104.88      54.95 &   499.66 r
  gc_pc_sx_t0/FxPlace_ZBUF_318_inst_3512111/Z (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                              20.10      32.52 &   532.19 r
  gc_pc_sx_t0/FxPlace_ZBUF_46_inst_3512110/I (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                               86.13      43.51 &   575.69 r
  gc_pc_sx_t0/FxPlace_ZBUF_46_inst_3512110/Z (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                               16.23      29.59 &   605.29 r

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rb_t011.gc_gl1ac_t0.sorted.gz
#done /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rlc_t.gc_gl1ac_t0.sorted.gz
#done -55ps large BUF/INV delay /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rts_0_t0000.gc_gl1ac_t0.sorted.gz

  gc_rts_0_t0000/FxPlace_ZBUF_4_inst_3171552/I (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                                           101.95      54.33 &   228.27 f
  gc_rts_0_t0000/FxPlace_ZBUF_4_inst_3171552/Z (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                                             9.89      32.28 &   260.54 f
  gc_rts_0_t0000/FE_FEEDX_MFT__1__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__3__AMD_gc_rts_0_t_0 (gc_rts_0_t)      0.00       0.00 &   260.54 f
  gc_pc_sx_t0/FE_FEEDX_MFT__0__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__3 (gc_pc_sx_t)                           0.00       0.00 &   260.54 f
  gc_pc_sx_t0/FxPlace_ZINV_424_inst_3521606/I (INVD4SPG1AMDBWP143M169H3P48CPDULVTLL)                                                          10.62       2.08 &   262.62 f
  gc_pc_sx_t0/FxPlace_ZINV_424_inst_3521606/ZN (INVD4SPG1AMDBWP143M169H3P48CPDULVTLL)                                                         19.33      13.58 &   276.20 r
  gc_pc_sx_t0/FxPlace_ZINV_385_inst_3521605/I (INVD8BWP143M169H3P48CPDULVTLL)                                                                 24.52       6.88 &   283.08 r
  gc_pc_sx_t0/FxPlace_ZBUF_89_inst_3521601/Z (BUFFD8AMDBWP143M169H3P48CPDULVTLL)                                                               9.29      26.59 &   479.41 f
  gc_pc_sx_t0/FxPlace_ZINV_38_inst_3521600/I (INVD8BWP143M169H3P48CPDULVTLL)                                                                  83.39      44.48 &   523.89 f
  gc_pc_sx_t0/FxPlace_ZINV_38_inst_3521600/ZN (INVD8BWP143M169H3P48CPDULVTLL)                                                                 48.64      40.58 &   564.47 r
  gc_pc_sx_t0/FxPlace_ZINV_15_inst_3521599/I (INVD8BWP143M169H3P48CPDULVTLL)                                                                  71.47      27.45 &   591.92 r
  gc_pc_sx_t0/FxPlace_ZINV_15_inst_3521599/ZN (INVD8BWP143M169H3P48CPDULVTLL)                                                                 19.48      18.85 &   610.78 f

  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__35 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_* (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__35 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_* (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__10 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_* (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__10 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_* (net) 



# other clock no violation, all runs will auto-sort, nosp & nospflush is tuning flow, nosp to check violation.
# review _2tile


# pathform scripts
color_xterm> /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py
# pathform;
select _2tile report file, check my_path; acv clock by owners; add comments; inherate comments; ref_comments:
1st round: all violations, 2nd round: new violations
default: 200 warnings; fanout lol si,
machine_learning_comments: machine learning targets;
# ask kyle and cannie on pathform;
cd fct04/rel61;
usage: pathform.py [-h] [--rundir RUNDIR] [--config CONFIG] [--report REPORT] [--rep_xml REP_XML] [--ft_xml FT_XML] [--inst_map INST_MAP] [--gen_db_only] [--dump_summary]
Parse timing reports and show with a friendly way. just run it under rundir.

optional arguments:
  --config CONFIG      pathform config file.           read from rundir/pathform.conf by default.
  --rep_xml REP_XML    repeater contract XML file.     read from rundir/pd_repeaters.xml by default.
  --ft_xml FT_XML      feedthru_connectivity.xml file. read from rundir/feedthru_connectivity.xml by default.
  --inst_map INST_MAP  instance map file.              read from rundir/inst_tile.map by default.
  --report REPORT      only process specified report.
  --dump_summary       Dump status summary to central file.

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ meeting minutes
\\\\ 0220 sudong tasks
Hi Su Dong, Currently there 3 tasks:
1.	Interface timing analysis for L2WD tiles, detail check the attached mail.
  a.	Check if any path need relaxation for long path. File a jira if needed.
  b.	Release tune file to tile team in NLC
    i.	  Debanking startpoint or endpoint
    ii.	  Bound file to bound start/end poinit of critical path to a more reasonable location
    iii.  Tighten io
    iv.	  If only flop need early or late skew
2.	Special timing
  a.	Currently the scripts is ready for fei, but we have not setup the flow yet
  b.	Please load the pre-timing session, source the scripts to check if:
    i.	  If any syntax
    ii.	  If any input required
    iii.  What is the output file, how to understand the output file
    iv.	  How to determine the check is passed or not
3.	Special timing  cdc check
  a.	Co-work with Cannie to setup the flow
  i.	Cannie has already setup the flow, but need check if corresponding reports is generated or not
  b.	How to read the output
  c.	How to determine the path is passed or failed
4.	DRV
  a.	Collect the script on how to summarize the drv violations

\\\\ 0225 special timing check
https://confluence.amd.com/display/TSG/Check+special+timing
~/soc/special_timing_check/p4sync_soc15.csh
~/soc/special_timing_check/dfx.tcl


\\ jianshu p4 sync tcl files;

/proj/canis_pd_gfx_fct01/jiaguo12/special_timing_check/main/pd/tiles/CHIP/LaunchScript/
/proj/canis_pd_gfx_fct01/jiaguo12/special_timing_check/main/pd/tiles/CHIP/NLC/GFX/gfx_dldo_chargeInj_skew_check.tcl
/proj/canis_pd_gfx_fct01/jiaguo12/special_timing_check/main/pd/tiles/CHIP/NLC/GFX/

/proj/canis_pd_gfx_fct01/jiaguo12/special_timing_check/main/pd/tiles/CHIP/LaunchScript_test/
# /proj/canis_pd_gfx_fct01/jiaguo12/special_timing_test/


# michael bsub ptsession;
module load primetime/2023.12-SP5 ; cd ~/soc/rpts/runs_0115; 
bsub -Ip -q regr_high -n 8 -P canis-pd -R 'rusage[mem=255000] select[(csbatch||gb32||gb64||gb128||gb256||gb512||gb1024||type==RHEL7_64||type==RHEL6_64)]' 'pt_shell ' &;
cd /proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/rpts/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/ptsession;
pt_shell> set_host_options -max_cores 8 ;restore_session rpts/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/ptsession;



# Launch script :
FUNC mini-GCH : //soc15/canis/main/pd/tiles/CHIP/special_timing/LaunchScript/SpecialTiming_MiniGCH_Func_Level_Run.tcl #1  report_max_trans_net.tcl and  gfx_dldo_chargeInj_skew_check.tcl not ready 
FUNC top  :     //soc15/canis/main/pd/tiles/CHIP/special_timing/LaunchScript/SpecialTiming_GC_Func_Level_Run.tcl      #1
FUNC tile :     //soc15/canis/main/pd/tiles/CHIP/special_timing/LaunchScript/SpecialTiming_Tile_Func_Level_Run.tcl    #2   run tiles : gc_cpg_t gc_gl2c_2_t gc_pc_sx_t gc_rlc_t gc_vmw_t gc_gdfll_t
SCAN top :      //soc15/canis/main/pd/tiles/CHIP/special_timing/LaunchScript/SpecialTiming_GC_Scan_Level_Run.tcl      #1

# Script info :
Excel link : Canis_GFX_special_timing_check_list.xlsx

GFX:
Script File Name	         Purpose                  	IP owner/content reviewer	MV Run	Run Order  Update_Timing Run Level	Run Mode View	SI/Non-SI Comments        	Signoff Rules Signoff Reports	    Script Path
report_max_trans_net.tcl	CHARZ Transition Delay Checks	Lui, Alvin	            No Req.	No Req.	   No	         mini-GCH	Func	 setup	Non-SI	  Check clock transition 	No  FAIL  AVFSCLK.csv CHARZ.csv	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/report_max_trans_net.tcl#2
review_gdfll_tile_clock_paths.tcl	GDFLL Clock Path Review	Lui, Alvin	            No Req.	No Req.	   Yes           Tile 	    Func	 setup	Non-SI	  Manual review by GDFLL designer to ensure critical clock paths do not have unnecessary CTS buffers, logic, etc.	No "Error" Manual review by GDFLL designer	*/rpts/Pt*/special_timing_check.rpt	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/review_gdfll_tile_clock_paths.tcl #2
addition_gdfll_check.tcl    DFLLMaxDelaySignalAlignmentChecks Lui, Alvin	        No Req.	No Req.    No	         mini-GCH	Func	 setup	Non-SI	  Additional max delay and signal alignment checks for DFLL I/Os, as required by DFLL IP	All script checks pass 	Summary: */rpts/Pt*/gch_gdfll_pins_summary.rpt Details: */rpts/Pt*/gch_gdfll_pins_detail.rpt	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/addition_gdfll_check.tcl#1
gfx_dldo_chargeInj_skew_check.tcl	                        Shao, Kai	            No Req.	No Req.    No           mini-GCH	Func	setup	Non-SI	No failure in report	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gfx_dldo_chargeInj_skew_check.tcl#1
asyncfifo.GC.tcl  & asyncfifo.run.tcl                       Shao, Kai       No Req.	Run asyncfifo.run.tcl first	No	Tile Func	 setup	Non-SI	No failure in report	
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/asyncfifo.GC.tcl#4
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/asyncfifo.run.tcl#1
script_repeater_timing.tcl	                                Shao, Kai               No Req.	No Req.	No	mini-GCH	Func	setup	Non-SI	No failure in report	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/script_repeater_timing.tcl#2
gch_special_timing.tcl	                                    Shao, Kai               No Req.	No Req.	No	mini-GCH	Func	setup	Non-SI	No failure in report	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gch_special_timing.tcl#2
stc_max_delay_and_signal_alignment_proc.tcl
stc_max_delay_and_signal_alignment_SE.tcl
stc_max_delay_and_signal_alignment_L2WD.tcl	                Shao, Kai       No Req.	Run *_proc.tcl first No dependency between *_SE.tcl and *_L2WD.tcl	Yes	
                                                                            SE check run in mini-GCH L2WD check run in mini-GCH first , for remaining part which cannot be reported in mini-GCH level , run in chip level 	
                                                                                                                                 Func	setup	Non-SI	No failure in report or all failures are waiveable in report	max_delay_*.rpt signal_alignment_*.rpt	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_proc.tcl#1

//soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_L2WD.tcl#1
//soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_SE.tcl#1
gdfll_signal_same_mcp.tcl	                                Shao, Kai	            No Req.	No Req.	No	mini-GCH	Func	setup	Non-SI	No failure in report	
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gdfll_signal_same_mcp.tcl#1

DFX Script File Name Purpose IP owner/content reviewer MV Run Run Order Update_Timing Run Level Run Mode View SI / Non-SI Comments Signoff Rules Signoff Reports script path 
1 check_alttap_hold.tcl; Special timing check run to cover Alttap hold timing   Ding,Jie No Req.  No Req.  Yes GC/SOC Func hold SI & Non-SI 
   Stac_PipelineEn = 0 and Stac_AltTapEn = 1 -> special timing check run to cover Alttap hold timing ; zegrep -v VIOLATED alttap_hold.rpt.gz ; alttap_hold.rpt ;si_alttap_hold.rpt
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/check_alttap_hold.tcl#3
2 sms_special_check.tcl; Check the max delay from mrk_sfp_resetb in fuse_if block to memories RRSRST pin   Ding,Jie No Req.  No Req.  Yes GC/SOC Func setup & hold SI & Non-SI
   The max delay from mrk_sfp_resetb in fuse_if block to memories RRSRST pin should be less than 30 mrk_sfp_resetb clock cycles No "FAIL" ; sms_special_check.rpt ;si_sms_special_check.rpt
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/sms_special_check.tcl#1
3 pll_charz_mpw_tran_delay_check.tcl; check CLK_OBS min_pulse_width and differential_skew   Ding,Jie No Req.  No Req.  Yes GC/SOC Func setup & hold SI & Non-SI 
   check CLK_OBS min_pulse_width > 35% and differential_skew <15ps ; zegrep -v VIOLATED and No "FAIL" ; refclk_mpw_clk_obs_summary.rpt ;charz_skew_stp.rpt
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/pll_charz_mpw_tran_delay_check.tcl#5
4 check_xtrig_max_delay.tcl; Check the max delay for xtrig   Ding,Jie No Req.  No Req.  Yes GC/SOC Func setup SI & Non-SI 
   The max delay for xtrig should be less than 25ns; zegrep -v VIOLATED xtrig_special_check.rpt si_xtrig_special_check.rpt;
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/check_xtrig_max_delay.tcl#1
5 scanchannel.skew.max.tcl; Max scanchannel skew check    Liu,Shizhe No Req.  No Req.  No GC/SOC Scan setup & hold SI & Non-SI 
   Max scanchannel skew check; zegrep -v FAIL scanchannel.out.max.skew.rpt scanchannel.in.max.skew.rpt;
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/scanchannel.skew.max.tcl#1

6 scanchannel.skew.min.tcl; Min scanchannel skew check   Liu,Shizhe No Req.  No Req.  No GC/SOC Scan setup & hold SI & Non-SI 
   Min scanchannel skew check; zegrep -v FAIL scanchannel.out.min.skew.rpt scanchannel.in.min.skew.rpt 
  //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/DFX/scanchannel.skew.min.tcl#1


\\ special_timing_check copied from xls file; 

/proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/;
/proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/;
csh> cd /proj/canis_pd_gfx_fct04/fct_runs/FCT0115_20250218_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL_nosp/;


CHARZ.csv
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/report_max_trans_net.tcl#2
# review_gdfll_tile_clock_paths.tcl	GDFLL Clock Path Review	Lui, Alvin	No Req.	No Req.	Yes	Tile 	Func	setup	"Non-SI	"	Manual review by GDFLL designer to ensure critical clock paths do not have unnecessary CTS buffers, logic, etc.	"No ""Error""
# Manual review by GDFLL designer"	*/rpts/Pt*/special_timing_check.rpt	
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/review_gdfll_tile_clock_paths.tcl#2
# addition_gdfll_check.tcl	DFLL Max Delay and Signal Alignment Checks	Lui, Alvin	No Req.	No Req.	No	mini-GCH	Func	setup	"Non-SI	"	Additional max delay and signal alignment checks for DFLL I/Os, as required by DFLL IP	All script checks pass 	"Summary: */rpts/Pt*/gch_gdfll_pins_summary.rpt
# Details: */rpts/Pt*/gch_gdfll_pins_detail.rpt"	
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/addition_gdfll_check.tcl#1
# gfx_dldo_chargeInj_skew_check.tcl		Shao, Kai	No Req.	No Req.	No	mini-GCH	Func	setup	"Non-SI	"		No failure in report		
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gfx_dldo_chargeInj_skew_check.tcl#1
# "asyncfifo.GC.tcl
# asyncfifo.run.tcl"		Shao, Kai	No Req.	Run asyncfifo.run.tcl first	No	Tile 	Func	setup	"Non-SI	"		No failure in report		" //soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/asyncfifo.GC.tcl#3
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/asyncfifo.run.tcl#1
# script_repeater_timing.tcl		Shao, Kai	No Req.	No Req.	No	mini-GCH	Func	setup	"Non-SI	"		No failure in report		
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/script_repeater_timing.tcl#2
# gch_special_timing.tcl		Shao, Kai	No Req.	No Req.	No	mini-GCH	Func	setup	"Non-SI	"		No failure in report		
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gch_special_timing.tcl#2
# stc_max_delay_and_signal_alignment_proc.tcl; stc_max_delay_and_signal_alignment_SE.tcl; stc_max_delay_and_signal_alignment_L2WD.tcl;
# Shao, Kai	No Req.	"Run *_proc.tcl first.  No dependency between *_SE.tcl and *_L2WD.tcl"	Yes	"SE check run in mini-GCH
# L2WD check run in mini-GCH first , for remaining part which cannot be reported in mini-GCH level , run in chip level "	Func	setup	"Non-SI	"		No failure in report or all failures are waiveable in report	"max_delay_*.rpt

# signal_alignment_*.rpt"	"
//soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_proc.tcl#1
//soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_L2WD.tcl#1
//soc15/canis/main/pd/tiles/CHIP/special_timing/GFX/stc_max_delay_and_signal_alignment_SE.tcl#1"
//soc15/canis/main/pd/tiles/CHIP/special_timing/NLC/GFX/gdfll_signal_same_mcp.tcl#1
# gdfll_signal_same_mcp.tcl		Shao, Kai	No Req.	No Req.	No	mini-GCH	Func	setup	"Non-SI	"		No failure in report		


  


\\\\ 0218 meeting



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_sc_bci1_t0.gc_spi_s_bci0_cac_t0.sorted.gz
\\  bci1.bci0: path_1: slack -272ps;  371 violations; bundle: se0__SA1WGP00_SQG_msg_order_2;    LE 7;  top_net: FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_spi_s_bci0_cac_t__se0__SA1WGP00_SQG_msg_valid (net) 
               path_371: slack -0.1ps;                bundle: se0__SA1WGP00_SQG_ttrace_order_2; LE 7 ; top_net: FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_spi_s_bci0_cac_t__se0__SA1WGP00_SQG_ttrace_data__42 
CPF_SE0SA0TA0_texstat
CPF_SE0SA0TA2_texstat
CPF_SE0SA0TA6_texstat
CPF_SE0SA0TA7_texstat
se0__SA1WGP00SP0_SX_expvdata
se0__SA1WGP00SP1_SX_expvdata
se0__SA1WGP00SQ0_SX_expcmd
se0__SA1WGP00_SQG_msg
se0__SA1WGP00_SQG_ttrace
se0__SA1_RIE_CAC_sig2
se0__SA1_SP_CAC_sig4

  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK519_bundle_se0__SA1WGP00_SQG_msg_order_2/CP (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            34.35       1.84 &   733.87 r
  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK519_bundle_se0__SA1WGP00_SQG_msg_order_2/Q (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             22.53      26.70 &   760.57 r
  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK519_bundle_se0__SA1WGP00_SQG_msg_order_2Net (net)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  7    12.34 
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK26065_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26181_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26201_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26089_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26175_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26179_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26075_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26011_bundle_se0__SA1WGP00_SQG_msg_order_2/CP (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVTLL)                   25.57       5.03 &   765.60 r
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK26065_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26181_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26201_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26089_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26175_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26179_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26075_bundle_se0__SA1WGP00_SQG_msg_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26011_bundle_se0__SA1WGP00_SQG_msg_order_2/Q5 (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVTLL)                    9.75      47.88 &   813.48 r
  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_spi_s_bci0_cac_t__se0__SA1WGP00_SQG_msg_valid (net) 

  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK521_bundle_se0__SA1WGP00_SQG_ttrace_order_2_28_MPCTS_SPLIT/CP (CKOR2LNQAN2LPSD2AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     29.31       5.43 &   684.64 r
  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK521_bundle_se0__SA1WGP00_SQG_ttrace_order_2_28_MPCTS_SPLIT/Q (CKOR2LNQAN2LPSD2AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      32.05      26.83 &   711.47 r
  gc_sc_bci1_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK521_bundle_se0__SA1WGP00_SQG_ttrace_order_2Net_38 (net)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       5     9.64 
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK26519_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26273_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26497_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26531_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26361_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26269_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26401_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26293_bundle_se0__SA1WGP00_SQG_ttrace_order_2/CP (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                   32.56       4.45 &   743.49 r
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK26519_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26273_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26497_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26531_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26361_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26269_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26401_bundle_se0__SA1WGP00_SQG_ttrace_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK26293_bundle_se0__SA1WGP00_SQG_ttrace_order_2/Q6 (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                   12.01      39.17 &   782.66 r

  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_spi_s_bci0_cac_t__se0__SA1WGP00_SQG_ttrace_data__42 (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pc_sx_t0.gc_spi_s_bci0_cac_t0.sorted.gz
se0__SA0SX_SPI_db_scbd1 , LE 9, pd=1,   
se0__SA0SX_SPI_idx_scbd , LE 9, pd=1,    
se0__SA0WGP00_SQG_msg  , LE 9, pd=1,    
se0__sa0__DbgBusOut_wgp00, LE 9, pd=1,    

path_1: slack -272ps;  371 violations; bundle: se0__SA0WGP00_SQG_msg; LE 9; top_net: FE_FEEDX_MFT__4__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__SA0WGP00_SQG_msg_valid  ;
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK24310_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24772_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24688_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24716_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24240_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24366_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24429_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24191_bundle_se0__SA0WGP00_SQG_msg_order_7/CP (MB8SRLSDFQSXG4844D2BWP143M286H3P48CPDLVT)                   35.95       5.68 &   755.66 r
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK24310_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24772_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24688_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24716_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24240_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24366_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24429_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24191_bundle_se0__SA0WGP00_SQG_msg_order_7/Q3 (MB8SRLSDFQSXG4844D2BWP143M286H3P48CPDLVT)                    8.57      39.08 &   794.74 r
  FE_FEEDX_MFT__4__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__SA0WGP00_SQG_msg_valid (net) 

path_461: slack -0.45ps; bundle: se0__SA0WGP00_SQG_msg; LE 9 ; top_net:   FE_FEEDX_MFT__4__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__SA0WGP00_SQG_msg_data__46 
  gc_pc_sx_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK510_bundle_se0__SA0WGP00_SQG_msg_order_7/CP (CKOR2LNQAN2LPSD1AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                   36.86       9.86 &   711.97 r
  gc_pc_sx_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK510_bundle_se0__SA0WGP00_SQG_msg_order_7/Q (CKOR2LNQAN2LPSD1AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                    13.18      17.93 &   729.90 r
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK24289_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24331_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24394_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24408_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24485_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24100_bundle_se0__SA0WGP00_SQG_msg_order_7/CP (MB6SRLSDFQSXG4644EQBD2BWP143M286H3P48CPDULVTLL)                   29.72       3.48 &   754.40 r
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK24289_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24331_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24394_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24408_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24485_bundle_se0__SA0WGP00_SQG_msg_order_7_MB_FCFPRepFFcgcg_Cpl_GFXCLK24100_bundle_se0__SA0WGP00_SQG_msg_order_7/Q4 (MB6SRLSDFQSXG4644EQBD2BWP143M286H3P48CPDULVTLL)                   52.36      63.97 &   818.37 f
  FE_FEEDX_MFT__4__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__SA0WGP00_SQG_msg_data__46 (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_pc_sx_t0.sorted.gz

  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_pc_sx_t0__se0__GRBMH_TA_soft_resetb (net) 
  Endpoint: gc_pc_sx_t0/FCFPRepFFMFNCpl_GFXCLK407/D (rising edge-triggered flip-flop clocked by GC_GFXCLK)
                                                                                                                                                     3    12.77 
  gc_gl1ac_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK2212_bundle_se0__GL1_PC_RD_ret_order_1/CP (CKOR2LNQAN2LPSD1AMDBWP143M286H3P48CPDULVT)                                                                                                                             30.94       2.49 &   695.05 r
  gc_gl1ac_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK2212_bundle_se0__GL1_PC_RD_ret_order_1/Q (CKOR2LNQAN2LPSD1AMDBWP143M286H3P48CPDULVT)                                                                                                                              32.35      26.74 &   721.79 r
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK394716_bundle_se0__GL1_PC_RD_ret_order_1/CP (SDFQTXGOPTQFD1BWP143M169H3P48CPDLVT)                                                                                                                                      36.38       3.37 &   764.23 r
  gc_gl1ac_t0/FCFPRepFFcgcg_Cpl_GFXCLK394716_bundle_se0__GL1_PC_RD_ret_order_1/Q (SDFQTXGOPTQFD1BWP143M169H3P48CPDLVT)                                                                                                                                        8.72      30.53 &   794.77 f
  se0__GL1_PC_RD_ret_tag[7] (net) 
  
  se0__GL1_PC_RD_ret_tag[6] (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pc_sx_t0.gc_gl1ac_t0.sorted.gz
  gc_pc_sx_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK1384_bundle_se0__WGP_SA0_WGP0_3_TCP0_GL1_req_order_12/CP (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                             39.90       5.58 &   733.80 r
  gc_pc_sx_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK1384_bundle_se0__WGP_SA0_WGP0_3_TCP0_GL1_req_order_12/Q (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                              38.59      35.64 &   769.43 r
  gc_pc_sx_t0/FCFPRepCLKGATEcgcg_Cpl_GFXCLK1384_bundle_se0__WGP_SA0_WGP0_3_TCP0_GL1_req_order_12Net (net)                                                                                  23    20.93 
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK154776_bundle_se0__WGP_SA0_WGP0_3_TCP0_GL1_req_order_12/CP (SDFQTXGEQAD4BWP143M169H3P48CPDULVTLL)                                                                     42.94       3.45 &   772.89 r
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK154776_bundle_se0__WGP_SA0_WGP0_3_TCP0_GL1_req_order_12/Q (SDFQTXGEQAD4BWP143M169H3P48CPDULVTLL)                                                                       5.56      27.20 &   800.09 f
2-stage CLKGATE repeaters;
top_net: 
  FE_FEEDX_MFT__2__gc_pc_sx_t__gc_gl1ac_t__se0__SA0CB0_GL1_comp_req_op__6 (net) 
  FE_FEEDX_MFT__5__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_1_TCP1_GL1_req_op__4 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP0_GL1_req_op__3 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP0_GL1_req_send (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP0_GL1_req_op__1 (net) 
  FE_FEEDX_MFT__12__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA1_WGP0_3_TCP1_GL1_req_op__6 (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_rb_t011.sorted.gz

  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_rb_t011__se0__GRBMH_GFX_soft_resetb (net) 

  gc_rb_t011/clk_out_cts_6_1324 (net) 
  gc_rb_t011/FCFPRepFFMFNCpl_GFXCLK366_MB_FCFPRepFFMFNCpl_GFXCLK367_MB_FCFPRepFFMFNCpl_GFXCLK38_MB_FCFPRepFFMFNCpl_GFXCLK322/CP       0.32 &  1103.99 r
  clock reconvergence pessimism                                                                                                     100.30    1204.29
  library setup time                                                                                                                -10.66    1193.63
  data required time                                                                                                                          1193.63
  ------------------------------------------------------------------------------------------------------------------------------------------------------
  data required time                                                                                                                          1193.63
  data arrival time                                                                                                                          -1183.28


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_rb_t010.sorted.gz
  gc_gl1ac_t0/RLC_BPM1_status (net)                                                                      1    12.45 
  gc_gl1ac_t0/RLC_BPM1_status (gc_gl1ac_t) <-                                                                             0.00       0.00 &   925.72 r
  se0__BPM_SA1CB0_GL1I_status (net) 
  gc_rb_t010/bpm_db/bpm_status_in/q0_reg_0_/D (SDFQTXGOPTBCED1BWP143M169H3P48CPDULVTLL)                                  46.90      17.20 &  1188.54 r
  data arrival time                                                                                                                          1188.54

  gc_rb_t010/bpm_db/bpm_status_in/clk (gc_rb_t_ati_dff_in_WIDTH1_2_0)                                                        0.00       0.00 &  1094.60 r
  gc_rb_t010/bpm_db/bpm_status_in/clk (net) 
  gc_rb_t010/bpm_db/bpm_status_in/q0_reg_0_/CP (SDFQTXGOPTBCED1BWP143M169H3P48CPDULVTLL)                                    31.87       3.17 &  1097.77 r
  clock reconvergence pessimism                                                                                                       100.34    1198.11
  library setup time                                                                                                                   -3.27    1194.84
  data required time                                                                                                                            1194.84


  se0__BPM_SA1CB0_GL1I_status (net) 

  FE_FEEDX_MFT__1__gc_rb_2_t__gc_rb_t_1__se0__BPM_SA1CB0_GL1I_status (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_QSPICLK.gc_spi_s_bci0_cac_t0.gc_pc_sx_t0.sorted.gz
clk_gate repeater;  top_net: cpwd0__ipx_dldo_top__gpu_dldo; bundle: cpwd0__ipx_dldo_top__gpu_
  gc_spi_s_bci0_cac_t0/FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193520_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_43_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193202_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_28_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193499_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_42_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194361_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194370_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194364_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2/CP (MB6SRLSDFQSXG4644EQAD2BWP143M286H3P48CPDLVT)                   59.40      13.77 &   879.36 r
  gc_spi_s_bci0_cac_t0/FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193520_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_43_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193202_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_28_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193499_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_42_wakeX_order_1_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194361_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194370_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg194364_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_86_wakeX_order_2/Q3 (MB6SRLSDFQSXG4644EQAD2BWP143M286H3P48CPDLVT)                   90.81      92.67 &   972.03 f
  FE_FEEDX_MFT__4__gc_spi_s_bci0_cac_t__gc_pc_sx_t__cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_42_wakeX__1 (net) 
  gc_pc_sx_t0/FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193500_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_42_wakeX_order_2_MB_FCFPRepFFCpl_gpu_dldo_ONO_0_clkout_cg193200_bundle_cpwd0__ipx_dldo_top__gpu_dldo_v1__I_gpu_dldo_pgmon_core_v1__gpu_dldo_ONO_0_col_27_wakeX_order_2/D1 (MB2SRLSDFQ2211D1AMDBWP143M286H3P48CPDLVTLL)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    135.53      31.86 &  2631.13 f


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_QSPICLK.gc_spi_s_bci0_cac_t0.gc_rb_t000.sorted.gz



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.gc_pc_sx_t0.sorted.gz
# add repeaters;
  se0__SQG_SA0WGP00_cmd_fgcg (net) 
  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK588_bundle_se0__SQG_SA0WGP00_cmd_order_1/D (SDFQTXGOPTBCED2BWP143M286H3P48CPDULVTLL)                                                                                                                                                                                                                                                                                          18.58       7.56 &  1386.66 f

  se0__DIDT_SA0_VMW_power_throttle_stall (net) 
  gc_pc_sx_t0/FCFPRepFFCpl_GFXCLK322375_bundle_se0__DIDT_SA0_VMW_power_throttle_order_1_MB_FCFPRepFFCpl_GFXCLK168112_bundle_se0__DIDT_SA0_VTF_power_throttle_order_1/D1 (MB2SRLSDFQ2211D1AMDBWP143M286H3P48CPDLVT)                                                                                                                                                                                                                      67.34      18.26 &  1332.41 f


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.gc_sc_bci1_t0.sorted.gz
  se0__SA1_wgp_cac_ctrl[0] (net) 
  gc_sc_bci1_t0/FCFPRepFFCpl_GFXCLK32000_bundle_se0__SA1_wgp_cac_ctrl_order_1/D (SDFQD1AMDBWP143M286H3P48CPDLVTLL)                                                                                            63.28       8.47 &  1312.01 f

  se0__SPI_SA1WGP00SQ1_sdata_data[171] (net) 
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK39448_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK40300_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK39124_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK40444_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK40504_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK40138_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK40492_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4_MB_FCFPRepFFcgcg_Cpl_GFXCLK38968_bundle_se0__SPI_SA1WGP00SQ1_sdata_order_4/D4 (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                          29.10       7.53 &  1241.01 f

  se0__SPI_SA1WGP00SP1_vdata_data[650] (net) 
  gc_sc_bci1_t0/FCFPRepFFcgcg_Cpl_GFXCLK442577_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK443477_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK444209_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK443399_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK443339_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK444269_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK445265_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6_MB_FCFPRepFFcgcg_Cpl_GFXCLK441407_bundle_se0__SPI_SA1WGP00SP1_vdata_order_6/D4 (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                          67.97      15.05 &  1215.20 f


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.gc_pa_spi_m_ra_t0.sorted.gz
  FE_FEEDX_MFT__4__gc_spi_s_bci0_cac_t__gc_pa_spi_m_ra_t__CPC_SE0SPI_cscntl1_transport_send (net) 
  gc_pa_spi_m_ra_t0/spi_m/ugfx_icg_spim/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_45_MPCTS_SPLIT/E (CKOR2LNQAN2LPSD2AMDBWP143M286H3P48CPDULVT)                                                                                44.52      22.02 &  1302.93 r
  gc_pa_spi_m_ra_t0/spi_m/ugfx_icg_spim/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_45_MPCTS_SPLIT/CP (CKOR2LNQAN2LPSD2AMDBWP143M286H3P48CPDULVT)                                                                               10.31       0.54 &  1062.98 r


  FE_FEEDX_MFT__4__gc_spi_s_bci0_cac_t__gc_pa_spi_m_ra_t__CPC_SE0SPI_cscntl1_pipeid__1 (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.gc_rts_0_t0100.sorted.gz
  se0__DIDT_SA1_SQ_power_throttle_stall (net) 
  se0__DIDT_SA1_VMW_power_throttle_stall (net) 
  se0__DIDT_SA1_VCD_power_throttle_stall (net) 
  se0__DIDT_SA1_VTF_power_throttle_stall (net) 
  FE_FEEDX_MFT__2__gc_spi_s_bci0_cac_t__gc_rts_0_t_4__se0__gl1cc__GL1C2_DIR0_GL1R4_ret_data__447 (net) 
  FE_FEEDX_MFT__1__gc_spi_s_bci0_cac_t__gc_rts_0_t_4__se0__PC_SA1WGP00LDS0_cntrl_wgp_id__1 (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rlc_t.gc_gdfll_t.sorted.gz
  cpwd0__GfxClk_ClkDs_allow (net) 
  cpwd0__RLC_GDFLL_reg_access_srcid_0
  cpwd0__RLC_GDFLL_reg_access_srcid_1
  cpwd0__RLC_GDFLL_reg_access_srcid_2
  cpwd0__RLC_GDFLL_reg_access_srcid_3
  cpwd0__RLC_GDFLL_reg_access_vld_tog (net) 



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_cpg_t.gc_ea_cpwd_t.sorted.gz
  cpwd0__CPG_TPI_crest_sdp_sel (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pa_spi_m_ra_t0.gc_rb_t011.sorted.gz
  FE_FEEDX_MFT__3__gc_pa_spi_m_ra_t__gc_gl1ac_t__RLC_SE0_gfxen (net) 
  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_rb_t011__se0__RLC_BPM_gfxen (net) 
  gc_rb_t011/FCFPRepFFMFNCpl_GFXCLK37_MB_FCFPRepFFMFNCpl_GFXCLK321_MB_FCFPRepFFMFNCpl_GFXCLK276/D3 (MB3SRLSDFQLP2233D1AMDBWP143M455H3P48CPDULVTLL)                                                                                                                                                                                                                                                                                                      46.62      22.17 &  1312.13 r

  FE_FEEDX_MFT__3__gc_pa_spi_m_ra_t__gc_gl1ac_t__RLC_SE0_gfx_3d_en (net) 
  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_rb_t011__se0__RLC_BPM_gfx_3d_en (net) 
  gc_rb_t011/FCFPRepFFMFNCpl_GFXCLK37_MB_FCFPRepFFMFNCpl_GFXCLK321_MB_FCFPRepFFMFNCpl_GFXCLK276/D2 (MB3SRLSDFQLP2233D1AMDBWP143M455H3P48CPDULVTLL)                                                                    59.68      27.38 &  1263.40 f


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_imu_t.gc_sdma_t.sorted.gz
cpwd0__SEM_SDMA0_resp_send 
cpwd0__SEM_SDMA1_resp_send 
cpwd0__SEM_SDMA1_resp_status__0 
cpwd0__SEM_SDMA1_resp_status__1 

  FE_FEEDX_MFT__1__gc_rlc_t__gc_sdma_t__cpwd0__SEM_SDMA1_resp_send (net) 
  FE_FEEDX_MFT__1__gc_rlc_t__gc_sdma_t__cpwd0__SEM_SDMA0_resp_send (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_sc_bci1_t0.gc_cpf_t.sorted.gz
gc__SE0SA1TA_CPF_texstat0

  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_cpg_t__SE0SA1TA_CPF_texstat0_pix_min_lod__1 (net) 
  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_cpg_t__SE0SA1TA_CPF_texstat0_cntr_bank_id__7 (net) 
  gc_cpf_t/FCFPRepFFcgcg_Cpl_GFXCLK327871_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327931_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327841_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327811_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327836_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327801_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327806_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327926_bundle_SE0SA1TA_CPF_texstat0_order_5/D3 (MB8SRLSDFQTXGLP4444D1AMDBWP143M572H3P48CPDLVT)                           23.37       8.75 &  1288.25 f

  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_cpg_t__SE0SA1TA_CPF_texstat0_cntr_bank_id__0 (net) 
  gc_cpf_t/FCFPRepFFcgcg_Cpl_GFXCLK327901_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327856_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327861_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327881_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327866_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327896_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327916_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327921_bundle_SE0SA1TA_CPF_texstat0_order_5/D7 (MB8SRLSDFQTXGLP4444D1AMDBWP143M572H3P48CPDLVT)                   24.64       9.80 &  1198.65 f

  FE_FEEDX_MFT__2__gc_sc_bci1_t__gc_cpg_t__SE0SA1TA_CPF_texstat0_pix_lod_clamp_cnt__2 (net) 
  gc_cpf_t/FCFPRepFFcgcg_Cpl_GFXCLK327901_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327856_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327861_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327881_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327866_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327896_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327916_bundle_SE0SA1TA_CPF_texstat0_order_5_MB_FCFPRepFFcgcg_Cpl_GFXCLK327921_bundle_SE0SA1TA_CPF_texstat0_order_5/D6 (MB8SRLSDFQTXGLP4444D1AMDBWP143M572H3P48CPDLVT)                         22.51       8.33 &  1219.07 f


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_utcl2_t.gc_cpg_t.sorted.gz
cpwd0__CH_ACV0_ret
cpwd0__CH_CPF_ret
cpwd0__CH_RLC_ret
cpwd0__CPF_CH_req_free

  Startpoint: gc_utcl2_t/FCFPRepFFcgcg_Cpl_GFXCLK2275_bundle_cpwd0__CH_RLC_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK104440_bundle_cpwd0__CPF_CH_req_order_1/CP (rising edge-triggered flip-flop clocked by GC_GFXCLK)
  Endpoint:   gc_cpg_t/FCFPRepFFcgcg_Cpl_GFXCLK104441_bundle_cpwd0__CPF_CH_req_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK104439_bundle_cpwd0__CPF_CH_req_order_2/D1 (rising edge-triggered flip-flop clocked by GC_GFXCLK)
  gc_utcl2_t/FCFPRepFFcgcg_Cpl_GFXCLK2275_bundle_cpwd0__CH_RLC_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK104440_bundle_cpwd0__CPF_CH_req_order_1/CP (MB2SRLSDFQ2222D2AMDBWP143M286H3P48CPDLVT)                          33.96       3.49 &   699.48 r
  gc_utcl2_t/FCFPRepFFcgcg_Cpl_GFXCLK2275_bundle_cpwd0__CH_RLC_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK104440_bundle_cpwd0__CPF_CH_req_order_1/Q2 (MB2SRLSDFQ2222D2AMDBWP143M286H3P48CPDLVT)                          10.56      43.17 &   742.65 r
  FE_FEEDX_MFT__1__gc_utcl2_t__gc_rlc_t__cpwd0__CPF_CH_req_free__0 (net) 

  FE_FEEDX_MFT__1__gc_utcl2_t__gc_rlc_t__cpwd0__CH_ACV0_ret_data__168 (net) 
  cpwd0__CH_ACVIO_ACV0_ret_data[168] (net) 
  gc_cpg_t/FCFPRepFFcgcg_Cpl_GFXCLK470753_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470666_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470468_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470867_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470627_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470087_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470774_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK470642_bundle_cpwd0__CH_ACVIO_ACV0_ret_order_1/D1 (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVT)                   43.31       9.33 &  1320.50 f

  FE_FEEDX_MFT__1__gc_utcl2_t__gc_rlc_t__cpwd0__CH_CPF_ret_data__254 (net) 
  FE_FEEDX_MFT__2__gc_rlc_t__gc_cpg_t__cpwd0__CH_CPF_ret_data__254 (net) 
  gc_cpg_t/FCFPRepFFcgcg_Cpl_GFXCLK433372_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433302_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433656_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433686_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433172_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433326_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433600_bundle_cpwd0__CH_CPF_ret_order_2_MB_FCFPRepFFcgcg_Cpl_GFXCLK433248_bundle_cpwd0__CH_CPF_ret_order_2/D5 (MB8SRLSDFQTXGLP4444D1AMDBWP143M572H3P48CPDLVT)                   55.26      28.02 &  1225.12 f

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_cpg_t.gc_utcl2_t.sorted.gz
cpwd0__ACV0_ACVIO_CH_src
cpwd0__ACV0_ACVIO_CH_req
cpwd0__CH_ACVIO_ACV0_ret


  FE_FEEDX_MFT__3__gc_cpg_t__gc_rlc_t__cpwd0__ACV0_ACVIO_CH_src_last (net) 
  cpwd0__ACV0_CH_src_last (net) 
  gc_utcl2_t/FCFPRepFFcgcg_Cpl_GFXCLK468115_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467908_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467953_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468020_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467957_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467907_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468111_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467975_bundle_cpwd0__ACV0_CH_src_order_1/D4 (MB8SRLSDFQ4464D2AMDBWP143M1144H3P48CPDLVT)                                                                      54.22      26.88 &  1245.18 f
  gc_utcl2_t/FCFPRepFFcgcg_Cpl_GFXCLK468164_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468120_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467906_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468033_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468176_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467921_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK468063_bundle_cpwd0__ACV0_CH_src_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK467930_bundle_cpwd0__ACV0_CH_src_order_1/D8 (MB8SRLSDFQTXGLP4444D1AMDBWP143M572H3P48CPDLVT)                                                               44.15      20.19 &  1206.66 r

  cpwd0__ACV0_CH_src_last 
  cpwd0__ACV0_CH_src_data
  cpwd0__ACV0_CH_src_mask


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pa_spi_m_ra_t0.gc_pc_sx_t0.sorted.gz
  FE_FEEDX_MFT__3__gc_pa_spi_m_ra_t__gc_gl1ac_t__RLC_SE0_gfxen (net) 
  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_pc_sx_t0__se0__RLC_BPM_gfxen (net) 
  gc_pc_sx_t0/FCFPRepFFMFNCpl_GFXCLK271/D (SDFQTXGOPTBCED4BWP143M286H3P48CPDULVTLL)                                                                                                                                                                                                                                                                                                                                                                     22.35       8.88 &  1284.39 r

  FE_FEEDX_MFT__3__gc_pa_spi_m_ra_t__gc_gl1ac_t__RLC_SE0_gfx_3d_en (net) 
  FE_FEEDX_SHARE__gc_gl1ac_t0__gc_pc_sx_t0__se0__RLC_BPM_gfx_3d_en (net) 
  gc_pc_sx_t0/FCFPRepFFMFNCpl_GFXCLK316/D (SDFQTXGOPTBBD4BWP143M169H3P48CPDULVTLL)                                                                                                                                    32.30      14.12 &  1208.43 f



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_sdma_t.gc_pa_spi_m_ra_t0.sorted.gz
 2 pre-stage repeaters;  
  gc_sdma_t/FCFPRepCLKGATEcgcg_Cpl_GFXCLK753_bundle_CPG_SE0SPI_csdata1_order_3/CP (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          39.39       6.00 &   754.45 r
  gc_sdma_t/FCFPRepCLKGATEcgcg_Cpl_GFXCLK753_bundle_CPG_SE0SPI_csdata1_order_3/Q (CKOR2LNQAN2LPSD4AMDBWP143M286H3P48CPDULVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           38.94      35.72 &   790.17 r
  gc_sdma_t/FCFPRepFFcgcg_Cpl_GFXCLK65979_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66189_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66018_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66054_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66012_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66159_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66129_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66291_bundle_CPG_SE0SPI_csdata1_order_3/CP (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                   44.23       3.66 &   793.82 r
  gc_sdma_t/FCFPRepFFcgcg_Cpl_GFXCLK65979_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66189_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66018_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66054_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66012_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66159_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66129_bundle_CPG_SE0SPI_csdata1_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK66291_bundle_CPG_SE0SPI_csdata1_order_3/Q3 (MB8SRLSDFQTXGLP3553D2AMDBWP143M1144H3P48CPDLVT)                   13.51      56.51 &   850.34 f

  FE_FEEDX_MFT__2__gc_sdma_t__gc_gds_oa_t__CPG_SE0SPI_csdata1_data__ (net) 
  FE_FEEDX_MFT__3__gc_gds_oa_t__gc_pa_spi_m_ra_t__CPG_SE0SPI_csdata1_data__ (net) 
  CGP_SE0_SPI_csdata 

\\\ for web pages;
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_cpf_t.gc_cpg_t/cpwd0__CPC_CH_req.histo  



https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_rb_t001.gc_rb_t000/se0__SCT0_SA0DB0_tile.histo
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_rb_t001.gc_rb_t000/se0__SPI_SA0WGP00SP0_vdata.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_gds_oa_t.gc_spi_s_bci0_cac_t0/GDS_SE0SPI_addr.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_ch_t.gc_rlc_t/gc__cpwd0__CHC1_CAC_2_active.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_ch_t.gc_rlc_t/gc__cpwd0__CHC1_CAC_1_active.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_pc_sx_t0.gc_rts_0_t0100/se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_2_SQC_harvest.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_pc_sx_t0.gc_rts_0_t0100/se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_1_SQC_rep_fgcg.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_pc_sx_t0.gc_rts_0_t0100/se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg.histo  
https://logviewer-atl.amd.com//proj/at2_til53_nobackup/zhihan/STA/Records/gc_pc_sx_t0.gc_rts_0_t0100/se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg.histo  



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pc_sx_t0.gc_rts_0_t0100.sorted.gz

se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_2_SQC_harvest  
se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_1_SQC_rep_fgcg 
se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg 
se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg

  Startpoint: gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK473204_bundle_se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg_order_2/CP (rising edge-triggered flip-flop clocked by GC_GFXCLK)
  Endpoint: gc_rts_0_t0100/FCFPRepFFcgcg_Cpl_GFXCLK473268_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473184_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473226_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473109_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473235_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473193_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473100_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473277_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC1_rep_fgcg_order_3/D2 (rising edge-triggered flip-flop clocked by GC_GFXCLK)

  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg_override (net) 
  FE_FEEDX_MFT__2__gc_spi_s_bci0_cac_t__gc_rts_0_t_4__se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg_override (net) 
  gc_rts_0_t0100/FCFPRepFFcgcg_Cpl_GFXCLK473268_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473184_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473226_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473109_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473235_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473193_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473100_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473277_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC1_rep_fgcg_order_3/D2 (MB8SRLSDFQTXGLP3553D1AMDBWP143M1144H3P48CPDULVTLL)                   27.79       9.85 &  1246.37 r

  gc_pc_sx_t0/FCFPRepFFcgcg_Cpl_GFXCLK473129_bundle_se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg_order_2/Q (SDFQTXGOPTBBD4BWP143M169H3P48CPDLVT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 31.59      38.84 &   789.46 f
  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg_override (net) 
  FE_FEEDX_MFT__2__gc_spi_s_bci0_cac_t__gc_rts_0_t_4__se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg_override (net) 
  gc_rts_0_t0100/FCFPRepFFcgcg_Cpl_GFXCLK473268_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473184_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473226_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473109_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473235_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET1_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473193_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_RET0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473100_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_2_GL1R_SRC0_rep_fgcg_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK473277_bundle_se0__gl1cc__GL1A_WGP_SA0_WGP0_3_GL1R_SRC1_rep_fgcg_order_3/D4 (MB8SRLSDFQTXGLP3553D1AMDBWP143M1144H3P48CPDULVTLL)                   38.43      18.12 &  1204.74 f

  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_WGP_SA1_WGP0_2_GL1R_RET0_rep_fgcg_override (net) 
  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_2_SQC_harvest_active (net) 
  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_GL1IR_WGP_SA1_WGP0_1_SQC_rep_fgcg_override (net) 
  FE_FEEDX_MFT__1__gc_pc_sx_t__gc_spi_s_bci0_cac_t__se0__gl1cc__GL1A_WGP_SA1_WGP0_3_GL1R_SRC0_rep_fgcg_override (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_cpg_t.gc_cpf_t.sorted.gz
slack -50.8,  skew -100,

cpwd0__CH_CPC_ret, LE 3 , pd =3,lol=26;

  FE_FEEDX_MFT__3__gc_cpg_t__gc_cpf_t__cpwd0__CH_CPC_ret_data__131 (net) 
  FE_FEEDX_MFT__3__gc_cpg_t__gc_cpf_t__cpwd0__CH_CPC_ret_data__254 (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_cpf_t.gc_cpg_t.sorted.gz
slack -46.8, skew -102, 
cpwd0__CPC_CH_src, LE 3 , pd =3, lol=25
cpwd0__CPC_CH_req, LE 3 , pd =3, lol=25


  FE_FEEDX_MFT__1__gc_cpf_t__gc_cpg_t__cpwd0__CPC_CH_src_data__13 (net) 
  FE_FEEDX_MFT__1__gc_cpf_t__gc_cpg_t__cpwd0__CPC_CH_req_addr__8 (net) 


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rb_t001.gc_rb_t000.sorted.gz

bundles: 
se0__SCT0_SA0DB0_tile   LE 9, pd = 7; slack -39.7 skew -113;
  FE_FEEDX_MFT__3__gc_rb_1_t__gc_rb_t_0__se0__SCT0_SA0DB0_tile_context_id__2 (net) 
  FE_FEEDX_MFT__3__gc_rb_1_t__gc_rb_t_0__se0__SCT0_SA0DB0_tile_context_id__1 (net) 
se0__SPI_SA0WGP00SP0_vdata EQ 3, pd=3;  slack -5, skew -115;
  FE_FEEDX_MFT__2__gc_rb_1_t__gc_rb_t_0__se0__SPI_SA0WGP00SP0_vdata_we__20 (net) 

se0__SCT0_SA0DB0_tile  gc_rb_t000/db/udb_scdb_tile_io_no_redundancy/sc_db_tile_rtindex_reg_13__MB_sc_db_tile_rtindex_reg_8__MB_sc_db_tile_rtindex_reg_7__MB_sc_db_tile_rtindex_reg_6__MB_sc_db_tile_rtindex_reg_12__MB_sc_db_tile_rtindex_reg_11__MB_sc_db_tile_rtindex_reg_10__MB_sc_db_tile_rtindex_reg_9_/D1	-26.77
se0__SPI_SA0WGP00SP0_vdata  gc_rb_t000/FCFPRepFFcgcg_Cpl_GFXCLK272630_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK273560_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK273032_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK273302_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK274169_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK273383_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK273089_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3_MB_FCFPRepFFcgcg_Cpl_GFXCLK271943_bundle_se0__SPI_SA0WGP00SP0_vdata_order_3/D4	-4.93


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gds_oa_t.gc_spi_s_bci0_cac_t0.sorted.gz
slack -37 skew -117 lol 22 
bundle: GDS_SE0SPI_addr  LE 10 pd=1;  add 1 repeater, or tune sdc/constraint;
top_net:  GDS_SE0SPI_addr_valid (net) 
gc_gds_oa_t/FCFPRepFFcgcg_Cpl_GFXCLK452301_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452290_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452284_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452299_bundle_GDS_SE0SPI_addr_order_1/CP	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_1__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_730_MPCTS_SPLIT/E	-37.21
gc_gds_oa_t/FCFPRepFFcgcg_Cpl_GFXCLK452301_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452290_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452284_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452299_bundle_GDS_SE0SPI_addr_order_1/CP	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_0__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_698_MPCTS_SPLIT/E	-23.50
gc_gds_oa_t/FCFPRepFFcgcg_Cpl_GFXCLK452301_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452290_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452284_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452299_bundle_GDS_SE0SPI_addr_order_1/CP	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_1__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_730_MPCTS_SPLIT/E	-22.18
gc_gds_oa_t/FCFPRepFFcgcg_Cpl_GFXCLK452301_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452290_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452284_bundle_GDS_SE0SPI_addr_order_1_MB_FCFPRepFFcgcg_Cpl_GFXCLK452299_bundle_GDS_SE0SPI_addr_order_1/CP	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_0__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_698_MPCTS_SPLIT/E	-9.86

GDS_SE0SPI_addr	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_1__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_730_MPCTS_SPLIT/E	-37.21
GDS_SE0SPI_addr	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_0__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_698_MPCTS_SPLIT/E	-23.50
GDS_SE0SPI_addr	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_1__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_730_MPCTS_SPLIT/E	-22.18
GDS_SE0SPI_addr	gc_spi_s_bci0_cac_t0/spi_s/ugfx_icg_spis_vgpr_wr_ctl_genblk_0__ugfx_icg_spis_vgpr_wr_ctl/clock_gater_0__u_dyn_oclk/d0nt_clkgate_cell_698_MPCTS_SPLIT/E	-9.86


/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_ch_t.gc_rlc_t.sorted.gz                       
slack=-35.9, skew=-67; sdc/constraint;
top_net: 
  cpwd0__CHC1_CAC_1_active (net) 
  cpwd0__CHC1_CAC_2_active (net) 

gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-35.92
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-33.53
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-33.14
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-33.09
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-32.97
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig2/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-32.76
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig2/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-32.18
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D2	-29.52
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig2/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-27.23
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig2/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-24.38
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D1	-22.85
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig2/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D3	-22.58
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D1	-21.29
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D1	-20.85
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D2	-20.04
gc_ch_t/chc1/CHC_CAC_0_active_reg_MB_CHC_CAC_2_active_reg/CP	gc_rlc_t/gc_cac/lcac_CHC_sig0/activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0_/D1	-14.76
gc_ch_t/chc1/CHC_CAC_1_active_reg/CP	                        gc_rlc_t/gc_cac/lcac_CHC_sig1/FxPlace_activity_value_d_reg_MB_num_active_reg_1__MB_num_active_reg_0__bank_2__734980/D	-0.41
bundles: 
gc__cpwd0__CHC1_CAC_2_active, EQ 0, pd=0;
gc__cpwd0__CHC1_CAC_1_active, EQ 0, pd=0;
# gc__cpwd0__CHC1_CAC_0_active









 -165.4   GC_GFXCLK  -178    40    gc_rlc_t.gc_gdfll_t
 -146.6   GC_GFXCLK  -136    4     gc_cpg_t.gc_ea_cpwd_t
 -137.8   GC_GFXCLK  -84     4     gc_pa_spi_m_ra_t0.gc_rb_t011
 -104.0   GC_GFXCLK  -181    32    gc_imu_t.gc_sdma_t
 -99.0   GC_GFXCLK   -131    37    gc_sc_bci1_t0.gc_cpf_t
 -93.7   GC_GFXCLK   -83     392   gc_utcl2_t.gc_cpg_t
 -73.3   GC_GFXCLK   -56     4     gc_pa_spi_m_ra_t0.gc_pc_sx_t0
 -69.8   GC_GFXCLK   -157    454   gc_cpg_t.gc_utcl2_t
 -58.8   GC_GFXCLK   -206    391   gc_sdma_t.gc_pa_spi_m_ra_t0

 -55.9   GC_GFXCLK   -80     8     gc_pc_sx_t0.gc_rts_0_t0100
 -50.8   GC_GFXCLK   -101    14    gc_cpg_t.gc_cpf_t
 -46.8   GC_GFXCLK   -103    39    gc_cpf_t.gc_cpg_t
 -39.8   GC_GFXCLK   -113    27    gc_rb_t001.gc_rb_t000
 -37.2   GC_GFXCLK   -118    4     gc_gds_oa_t.gc_spi_s_bci0_cac_t0
 -35.9   GC_GFXCLK   -68     17    gc_ch_t.gc_rlc_t                       


.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.
.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.
.sorted.gz



/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_.sorted.gz

/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_sc_bci1_t0.gc_spi_s_bci0_cac_t0.sorted.gz

# drv : fly hu does not summarize DRV report for soundwave yet, 
# open pt_drv session; enable pt drv running;


\\\\ 0211 meeting
cdctiming 
~/soc/cdc.csh

cannie xue create CDC env based on NLB , run CDC; 
special timing; lihuan, flush flow; check error; 
drv: soundwave drv report summary; 1 corner;


\\ rpts/PtTimFuncSS0p72vtyprc0css0p72v0cReRouteSxStp/CdcTiming
\\ rpts/CdcMaxDefault/
# The following files are generated:
report.cdc.summary.rpt.gz  -- The summary report of the cdc timing
report.sync.summary.rpt.gz -- The summary report of the sync cell timing
report.sync.csv.gz         -- SYNC cell paths that fails to meet one cycle (or transport delay specified in RTL) to the input D pin.
report.cdc.csv.gz          -- Paths that fails to meet the destination clock count or destination time value as determined above, through a CDCBUF* marker cell.
report.sync.waivers.csv.gz -- Waived SYNC cell paths.
report.cdc.waivers.csv.gz  -- Waived CDC Paths.
report.sync.path.rpt.gz    -- The detail path report for the failed sync path.
report.cdc.path.rpt.gz     -- The detail path report for the failed sync path.
sync.maxdelay_setting.rpt.gz -- File containing parameter value used for each SYNC* cell.
cdc.maxdelay_setting.rpt.gz  -- File containing parameter values used for each CDC* cell.
report.multibit.csv.gz     -- The raw data for multibit check.
report.path.rpt.gz         -- The detail report for the failed multibit groups.
report.cdc.warning.rpt.gz  -- The warning message generated during cdc timing
report.sync.warning.rpt.gz -- The warning message generated during sync cell timing

# The flow also generates several informational and warning messages. 
# A clean RTL (0in clean) should not have any warnings. These messages are captured in the following files (or the CdcMaxDefault? .log file in standalone mode)

Sync_timing.log.gz    -- Messages generated while checking SYNC cell paths.
Sync_timing.si.log.gz -- Same as above but generated during the timing using si run.
Cdc_timing.log.gz     -- Messages generated while checking CDCBUF cell paths.
Cdc_timing.si.log.gz  -- Same as above but generated during the timing using si run.

~/soc/rpts/cdc_rel_0105/CdcTiming/

~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.summary.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync.summary.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync.waivers.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync.warning.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.maxdelay_setting.rpt.gz
# gc_gdfll_t/gdfll/udfll_dft_gasket/dfll_v2p0_dft_gasket_bc1500_ctrl_inst/genblk60_aeb_dec_en_cdc_57/u_tis_cdcefpm/uefpm_0_/genblk1_genblk1_genblk1_d0nt_CDCEFPM_HC0_C0_D_20000_/A, 20000, , , , 20000, Module:gc_gdfll_t_techind_cdcefpm_single_driveSel3_DestClkCnt0_CdcDestSetup20000_HoldCheck0_SrcPath0_19_0, MAX_DELAY parameter value(20000) is higher than DstClk period(0)
# CDCEFPM  : cdc enhanced flipflop with metastability;  # set maxdelay = max (CdcDestSetup, DestClkCnt * the period of its fastest fanout clocks)
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.maxdelay_setting.rpt.gz.header
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.techind_delay_inst.rpt.gz
# DestClkCnt 
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.waived_inst.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.zerodelay_inst.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/cdcmax.json
~/soc/rpts/cdc_rel_0105/CdcTiming/cdcmultibit.json
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.summary.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.waivers.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc.warning.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc_samedomain.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.cdc_samedomain.path.rpt.gz

~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync_samedomain.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.sync_samedomain.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.fmt.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.multibit.csv.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.multibit.path.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/report.multibit_sync.path.rpt.gz

~/soc/rpts/cdc_rel_0105/CdcTiming/
~/soc/rpts/cdc_rel_0105/CdcTiming/sync.maxdelay_setting.rpt.gz
# gc_rts_0_t0110/bpm/dyn_rm_se_for_compiled_mem_udyn_rm_se_v/rm_valid_synchronizer/genblk1_usync_0_/s3_u_1__genblk1_u/genblk1_genblk1_genblk1_hdsync3msfqxss1us_d0nt_sync_HC0_C40_D_0_/D, , 40.000000, GC_GFXCLK, 495.000000, 19800.0, TransportCycle from Instance_Name Last field, 
~/soc/rpts/cdc_rel_0105/CdcTiming/sync.maxdelay_setting.rpt.gz.header
~/soc/rpts/cdc_rel_0105/CdcTiming/sync.relaxed_delay_inst.rpt.gz
sync.techind_delay_inst.rpt.gz
sync.waived_inst.rpt.gz




\\\\\\\\ canis  drv
/proj/canis_pd_gfx_fct04/fct_release/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/

/proj/canis_pd_gfx_fct04/fct_release/FCT0110_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ApplyMvtRoute_LSB10_WithRDL/
/proj/canis_pd_gfx_fct05_aie_er/fct_runs/NLB_FP00/FCT0109_20250213_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_LSB10_WithRDL/

DRV is a kind of timing sign-off item. FCT need to make sure all of them are check properly. Some of them can be waived following rules from design guidelines.
Item           Criteria                             Runs to check             Report files name            Owner waivers
Illegal clock No Vio with waiver (Follow dont use list) nonSI normal runs Pt*/check_clock_cells.rpt        FCT signoff and fix (tile owner can fix non CK buffer/inverter first)
check_clock_cells
min_pulse_width
min_period
clock_tran
data_tran
data_cap
si_clock_noise_area
si_clock_noise_height
si_clock_double_switch
si_noise_area
si_noise_height
clock_si
si_bottleneck
tie_fanout
RC-011/RC-012
si_clock_tran
si_data_tran


# min_period;  Minimum Period Checking
Minimum period checking looks for violations of the min_period constraint for a cell pin, as defined in the cell library. 
This constraint requires the time between successive arrivals of clock edges of the same type (rising or falling) to be at least a specified value.
pt_shell> report_min_period             [-verbose] ...
pt_shell> report_constraint -min_period [-verbose] ...
pt_shell> report_analysis_coverage -check_type min_period
pt_shell> report_min_period -path_type full_clock uff2/CP

~/soc/rpts/route98
~/soc/rpts/run_route94

ls: cannot access ./rpts/PtDrv*Stp*/data_trans.rpt.gz:                 No such file or directory missing data_tran rpt, check if ./rpts/PtDrv*Stp*/data_trans.rpt.gz exist!
ls: cannot access ./rpts/PtDrv*Stp*/data_cap.rpt.gz:                   No such file or directory missing data_cap rpt, check if ./rpts/PtDrv*Stp*/data_cap.rpt.gz exist!
ls: cannot access ./rpts/PtDrv*Stp*/clock_trans.rpt.gz:                No such file or directory missing ck_tran rpt, check if ./rpts/PtDrv*Stp*/clock_trans.rpt.gz exist!
ls: cannot access ./rpts/PtDrv*Stp*/tie_fanout.rpt.gz:                 No such file or directory missing tie_fanout rpt, check if ./rpts/PtDrv*Stp*/tie_fanout.rpt.gz exist!  
ls: cannot access ./rpts/Pt*Func*Stp*/si_data_trans.rpt.gz:            No such file or directory missing si_data_tran rpt, check if ./rpts/Pt*Func*Stp*/si_data_trans.rpt.gz exist!
ls: cannot access ./rpts/Pt*/si_noise_height.rpt.gz:                   No such file or directory
ls: cannot access ./rpts/Pt*/si_noise_area.rpt.gz:                     No such file or directory missing si_noise rpt, check if ./rpts/Pt*/si_noise_height.rpt.gz ./rpts/Pt*/si_noise_area.rpt.gz exist!
ls: cannot access ./rpts/Pt*Stp*/si_bottleneck_nets_cells_for_eco.rpt: No such file or directory missing si_bottleneck_nets_cells_for_eco rpt
ls: cannot access ./rpts/Pt*Func*Stp*/si_clock_trans.rpt.gz:           No such file or directory missing si_clock_tran rpt, chcek if ./rpts/Pt*Func*Stp*/si_clock_trans.rpt.gz exist!
ls: cannot access ./rpts/Pt*/si_clock_noise_height.rpt.gz:             No such file or directory
ls: cannot access ./rpts/Pt*/si_clock_noise_area.rpt.gz:               No such file or directory missing si_ck_noise rpt
ls: cannot access ./rpts/Pt*/si_clock_double_switching.rpt.gz:         No such file or directory missing si_clock_double_switching rpt
ls: cannot access ./rpts/Pt*/clock_si.rpt.gz:                          No such file or directory missing clock_si rpt, check if ./rpts/Pt*/clock_si.rpt.gz exist!

 ./rpts/PtDrv*Stp*/*
 ./rpts/Pt*Func*Stp*/si_*
 ./rpts/Pt*/*si*; ./rpts/Pt*Stp*/si*


Traceback (most recent call last): File "/home/jiaguo12/soc/drv/fix_drv.py", line 2455, in <module> check_rc('RC-011')
Traceback (most recent call last): File "/home/jiaguo12/soc/drv/fix_drv.py", line 2455, in <module> check_rc('RC-011')
  File "/home/jiaguo12/soc/drv/fix_drv.py", line 2110, in check_rc cell_pin, slack = extract_rc(row)
  File "/home/jiaguo12/soc/drv/fix_drv.py", line 2095, in extract_rc slack = matchall.group().split('rpt.gz')[1].replace(',', '.')

Reference method
Script to summarize DRV: developed by Feng1, Jian1 

/tools/pandora/bin/python3.9  /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/fix_drv.py -instMap inst_tile.map
                              /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/fix_drv.py
/tools/pandora/bin/python3.9  /home/jiaguo12/soc/drv/fix_drv.py -instMap inst_tile.map

cd /proj/canis_pd_gfx_fct04/fct_release/FCT0122_20250225_SOC_FUNCSCAN_GFX_HDM_GFX_ONLY_DRV_ReRoute_LSB10_WithRDL;


/tools/pandora/bin/python3.9  ~/soc/drv/fix_drv.py
usage: fix_drv.py [-h] [--nonsi] [--si] [--rc] [-instMap INSTMAP] [-fix FIX] [-lib_cell_file LIB_CELL_FILE] [-waiver WAIVER]
optional arguments:
  --nonsi               enable nonsi option to fix nonsi drv
  --si                  enable si option to fix si drv
  --rc                  check rc011 and rc012 violation
  -instMap INSTMAP      inst map file
  -fix FIX              violation to fix
  -lib_cell_file LIB_CELL_FILE     inst lib cells which can be used when fix drv
  -waiver WAIVER        add waiver when fixing drv


For SI bottlneck report si_bottleneck_nets_cells_for_eco.rpt.gz , use scripts 
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/report_si_bottleneck.tcl    
in tune/PtTim/PtTim.general.extrasirpts.tcl .
# /proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/tune/PtTim/PtTim.general.extrasirpts.tcl 
/proj/canis_pd_gfx_fct04/fct_runs/FCT0094_20250207_SOC_FUNCSCAN_GFX_HDM_GFX_ONLY_ReRoute_LSB10_WithRDL/tune/PtTim/PtTim.general.extrasirpts.tcl 
/proj/canis_pd_gfx_fct04/fct_runs/
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/FCFP_REP_TILE_LOC_start_end_reps_io_budget/
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/bound/
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/tighten_io/tighten_io.GC_GFXCLK.guanwang.list
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/tighten_io/tighten_io.GC_GFXCLK.joanling.list
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/repeaterRelPos.txt
/proj/canis_pd_gfx_fct01/FCT/release/to_budget/NLC/repflag
# /proj/canis_pd_gfx_fct02/fct_runs/

# Below scripts implemented above methods. developed by Ren, Qilin 
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/fix_drv.py
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/report_si_bottleneck.tcl; # source in tune/PtTim/Pttim.general.extrasirpts.tcl
pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/check_RC011.tcl
pt_shell> source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/check_RC012.tcl

# Output files:
rpts/${TARGET_NAME}/check_DRV_RC011.postwaived.rpt
rpts/${TARGET_NAME}/check_DRV_RC012.postwaived.rpt





/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/check_DRV_RC011.waived.rpt.gz
# ### in setup corner, <80% min_slew_index value of RC-011 violations could ignore ###
# Warning: An extrapolation exceeding 80% of the library characterization range has been detected. The delay calculation accuracy may be affected. for the cell timing arc, (trfps2plvt128x256m1bp_gfx_tt0p750v100c_typical/trfps2plvt128x256m1bp_gfx) gc_gl2ar_q1_t/gl2a/mdcc/mdc0/mdc_data/mdata_mem/mem_0_1/PDP/CLK-->QP[97] (max retain_rising) [r/f total_cap = 0.000138279/0.000145601, lib_range = [0.001 0.075]/[0.001 0.075] (pF)] (RC-011)
# Warning: An extrapolation exceeding 80% of the library characterization range has been detected. The delay calculation accuracy may be affected. for the cell timing arc, (trfps2plvt128x256m1bp_gfx_tt0p750v100c_typical/trfps2plvt128x256m1bp_gfx) gc_gl2ar_q1_t/gl2a/mdcc/mdc0/mdc_data/mdata_mem/mem_0_1/PDP/CLK-->QP[98] (max retain_rising) [r/f total_cap = 0.000163518/0.000171574, lib_range = [0.001 0.075]/[0.001 0.075] (pF)] (RC-011)
# Warning: An extrapolation exceeding 80% of the library characterization range has been detected. The delay calculation accuracy may be affected. for the cell timing arc, (trfps2pslvt128x64m1bl_gfx_tt0p750v100c_typical/trfps2pslvt128x64m1bl_gfx) gc_gl2ar_q1_t/gl2a/mdcc/mdc2/mdc_tag/dirty_ram/mem_0_0/PDP/CLK-->QP[62] (min rising_edge) [r/f total_cap = 0.000150024/0.000159892, lib_range = [0.001 0.075]/[0.001 0.075] (pF)] (RC-011)
# ### in setup corner, >10% max_slew_index value of RC-011 violations, if slack > skew_diff could waive ###
/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/check_DRV_RC011.postwaived.rpt.gz

/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/check_DRV_RC012.waived.rpt.gz
/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/check_DRV_RC012.postwaived_report.rpt.gz
/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/check_DRV_RC012.postwaived_fix.rpt.gz

/proj/canis_pd_gfx_fct04/fct_runs/FCT0062_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/


nlc release; dft release is discussing
lihuan to release function in 0214;
nlc trial run flow;
0217 : release budge sdc; 
tile-level work: 
nlb: reroute database
focus on 098/099 run:  read clock design , match may be incorect
fct099 check timing, feedback to tile team;  bundle, clock_latency, io,


\\\\   0121 meeting:
after newyear; check nlb reroute timing , nlc pretiming;
# top module name changed to gc_top_t;
/proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/nl/prelayout/gc_top_t/sdc_release/functional/NLC_prelayout_set1_budget_uncertainty/PlFc*
/proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/nl/prelayout/gc_top_t/sdc_release/functional/NLC_prelayout_set1_budget_uncertainty/PlFcFreqAdjFULLCHIPTIMINGFastOverdriveSdc.flat.sdc.gz
# signoff corner : tt0p9v for rem run, and a setup signoff corner; but a lowpower project, and may removed; Not: soc signoff corner; gc_acv* on soc_pwoer_domain,  onlyf for ACV and vdci interface, not for gfx tiles;
    rem corner changed to tt0p75v;
    tt0p6v only for gfx, not soc;
    10 corners now;
0p6v & 0p75v most critical corners; 0p58v being evalued for lowpower ;


\\\\   0114 meeting:
place run: 061, 062;  ask other team for branch run;
cts database;  propagate clock;
route database;
pretiming 
clock design check;
budget run status: running 32 hours;

# NLB Budget run dir:
# NA /proj/canis_pd_fct02/budget/gc_top_t/BGT_runs/main/pd/tiles/gc_top_t_NLB_PrePhysical_func_1028_TileBuilder_Oct28_0521_29994_GUI/
# NLAB repeaterRelPosFile.txt for GFX domain:
/proj/canis_pd_gfx_fct01/guanwang/repeater/NLB/repeaterRelPos.txt


hdm run; full-flatten run;
half-cycle clock jitter;
pt_shell> report_timing to <> -exception all

pretiming analysis: toplevel gc;
GC_GFXCLK timing status @LSB.10 place stage
timing paths mainly on gc_rlc_t/gc_vmw_t* tiles
HFN timing : branch place run, test bound tune file
debanking endpoint cell;
add bounds: on internal timing, local congestions;
memory channel: was only buffer, no flop; now has flop;
early skew; 
# NA /proj/murano/a0/floorplan/rel_NLD_DFT_SOC/pf_top_t/fp_00/pf_top_t.cts.early_skew.tcl
# empty /proj/murano/

/proj/canis_pd_gfx_fct01/guanwang/repeater/LSCm/gen_2tile.rpt.gz
/proj/canis_pd_gfx_fct01/guanwang/repeater/scripts/filter_bad_nets.tcl
/proj/canis_pd_gfx_fct01/guanwang/repeater/scripts/filter_cant_meet.tcl
pt_fix_eco;

gl1ac_t 2 tile path;
rdl or match;
multi-terminal;
cpl_gfxclk_bypass:  vdci to gdfll, p2p-single-terminal;
gfxclk dldoclk acvclk(mv timing) scan_shift_clk
gc_gfxclk_1 : clock_mux; to select between gc_gfxclk and gc_gfxclk_1 (affect tile internal timing, half-cycle path)

# kyle wang  
Timing report:
/proj/canis_pd_gfx_fct01/guanwang/work/gc_rlct_long_nets.rpt.gz
/proj/canis_pd_gfx_fct01/guanwang/work/gc_rlct_long_nets.rpt.gz


#########
Feb 10, fcfp ready, 
Feb 12, synthesis netlist ready, release function sdc;
Feb 17, budgeting run; to release budgeting sdc;
nlc: repeater, sdc, feedx, pin/point assignment;
(nlc.?): 
nld: 
eco:

\\\\   0115 discussion with michael: 
constraint, sdc, floorplan(pin assignment), repeater,
fct workbook;
python scripts;
startpoint/endpoint
old : excel file, 
database update some parts, rerun & reanalyze;
nlb stage: nlc stage design will include,

place run has results; drv not begin; check function timing now;
critical tiles: vmw, gl1ac; check all gl1ac two_tile path;
familiar with design
pathform config not changed; path now assign to Kyle, you can filter by yourself;
 
place run, full flat fct0058 run

gl1ac tile has lots paths with  other tiles, so it is critical, review it first;
# fcfp package:
# NLC fcfp package
/proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run5_hollow/gfx.pkg
/proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run5_hollow/
# /proj/canis/a0/floorplan/rel_LSCm_GFX/gc/fp_latest/fcfp.Final.pkg
# LSB.10 fcfp package
# /proj/canis_pd_gfx_fcfp01/qilinren/release/LSCm_1209/gc/fp_00/fcfp.Final.pkg
fcfp_explorer /home/www/htdocs/cad/socdm/viz_tools/docs/fcfp_explorer/training/raven2_training.pkg
fcfp_explorer /proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run5_hollow/gfx.pkg

#### NLB fp_00 GFX FCFP are released in the below area:  copied from NLB+fp_00
# NLB formal run preplace QoR(1024).xls
gl1ac: area of 585, cells of 388000, mem of 167, macro of 19, repeaters of 31925;
vmw:   area of 708, cells of 543000, mem of 482, macro of 2,  repeaters of 3700;



FCFP release area: /proj/canis/a0/floorplan/rel_NLB_GFX/*/fp_00/*
FCFP PKG:          /proj/canis/a0/floorplan/rel_NLB_GFX/gfx.pkg

NLC FCFP PKG: /proj/canis/a0/floorplan/rel_NLC_GFX/ gfx.pkg
/proj/canis/a0/floorplan/rel_NLC_GFX/gfx.pkg
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t.upf*
/proj/canis/a0/floorplan/rel_NLC_GFX/FEEDS
/proj/canis/a0/floorplan/rel_NLC_GFX/feedthrough.list
/proj/canis/a0/floorplan/rel_NLC_GFX/FEI_PDI.map
/proj/canis/a0/floorplan/rel_NLC_GFX/ 
excel
/proj/canis/a0/floorplan/rel_NLC_GFX/ 
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_ExcludeNets.list
/proj/canis/a0/floorplan/rel_NLC_GFX/repeater.list
/proj/canis/a0/floorplan/rel_NLC_GFX/reuse_user_check_misalign_pins_10um
/proj/canis/a0/floorplan/rel_NLC_GFX/reuse_user_check_misalign_pins_50um
/proj/canis/a0/floorplan/rel_NLC_GFX/ instpower.csv
tile_no_routelist

## FE tile List
dfx_dftcnr2_t00gc_acv_lds_t00gc_acv_sp_sq_t00gc_acvi_t00gc_ch_t00gc_cpc_t00gc_cpf_t00gc_cpg_t00gc_dldo_t00gc_ea_1_t00gc_ea_cpwd_t00gc_ea_t00gc_gdfll_t00gc_gds_oa_t00gc_ge_aid_t00gc_gl1ac_t00gc_gl2ar_1_t00gc_gl2ar_t00gc_gl2c_1_t00gc_gl2c_2_t00gc_gl2c_t00gc_imu_t00gc_pa_t00gc_pc_sx_t00gc_rb_1_t00gc_rb_2_t00gc_rb_t00gc_rlc_t00gc_rts_0_t00gc_rts_1_t00gc_sc_bci1_t00gc_sdma_t00gc_sp0_0_t00gc_sp0_1_t00gc_sp1_0_t00gc_sp1_1_t00gc_spi_m_ra_t00gc_spi_s_bci0_cac_t00gc_sq_sqc_t00gc_utcl2_t00gc_vmw_t00gc_vx_swc_0_t00gc_vx_swc_1_t00vdci2_gc_df_2_t00vdci_gc_acv_t00vdci_gc_df_ch_t00vdci_gc_dfcrest_t00vdci_gc_dfx_t00vdci_gc_syshub_t00vdci_gch_soc_gfxm_t
## PD tile List
dfx_dftcnr2_t00gc_acv_lds_t00gc_acv_sp_sq_t00gc_acvi_t00gc_ch_t00gc_cpc_t00gc_cpf_t00gc_cpg_t00gc_dldo_t00gc_ea_1_t00gc_ea_cpwd_t00gc_ea_t00gc_gdfll_t00gc_gds_oa_t00gc_ge_aid_t00gc_gl1ac_t00gc_gl2ar_1_t00gc_gl2ar_t00gc_gl2c_1_t00gc_gl2c_2_t00gc_gl2c_t00gc_imu_t00gc_pa_t00gc_pc_sx_t00gc_rb_1_t00gc_rb_2_t00gc_rb_t00gc_rlc_t00gc_rts_0_t00gc_rts_1_t00gc_sc_bci1_t00gc_sdma_t00gc_sp0_0_t00gc_sp0_1_t00gc_sp1_0_t00gc_sp1_1_t00gc_spi_m_ra_t00gc_spi_s_bci0_cac_t00gc_sq_sqc_t00gc_utcl2_t00gc_vmw_t00gc_vx_swc_0_t00gc_vx_swc_1_t00vdci2_gc_df_2_t00vdci_gc_acv_t00vdci_gc_df_ch_t00vdci_gc_dfcrest_t00vdci_gc_dfx_t00vdci_gc_syshub_t00vdci_gch_soc_gfxm_t


# repeater insertion already have;
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=16000]  select[(type==RHEL8_64||type==RHEL7_64)&&tmpshortrrforce]' '/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py &'
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=16000]  select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/bin/fct_explorer ./ &'
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=16000]  select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/bin/fcfp_explorer ./ &'

\\\\\\\\ fct_explorer
fct use fct_explorer; to check tile path directions;
alias fcte  '';
cd release/0071*; 
fcte;

FCT Explorer expects to find a specific database within a FCT TileBuilder run directory. 
The database is created by FCT Explorer in batch mode by TileBuilder target "GenFctExplorerDb".
# fct working dir;
/proj/canis_pd_gfx_fct04/fct_release/FCT0126_20250303_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_NLC_nosp/back2userworkspace/
# fct timing report
/proj/canis_pd_gfx_fct04/fct_release/FCT0126_20250303_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_NLC_nosp/rpts/sort_rpts/ *0p75v*_2t/rlc.gdfll
\\\\\\\\\ fcfp_explorer fcfpe

/proj/canis_pd_gfx_tile045/yongjing/NLC_acv_sp/main/pd/tiles/gc_acv_sp_sq_t_acv_sp_run1_formal_TileBuilder_Feb14_0615_77281_GUI

/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t/fp_00/doc/nl_repeaters.xml
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t/fp_00/doc/pd_repeaters_bk.xml
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t/fp_00/doc/pd_repeaters.xml
/proj/canis/a0/floorplan/rel_NLC_GFX/gfx.pkg
/proj/canis/a0/floorplan/rel_NLC_GFX/gc_top_t/fp_00/fcfp.Final.pkg



# xml file, MCI, by kyle
/proj/canis_pd_gfx_fct01/FCT/rep_xml/NLC_fp00/pd_repeater.xml

# gl1ac timing paths;
top net
current repeater constraints;
How many repeater inserted in current design;

# freeze 
# add patch with false path;
mem_power_ctrl[0]; mem_power_ctrl[16]; MEM_POWER_CTRL[]


# Full flat run
/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming/report_timing_2tile_max.rpt.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/

/proj/canis_pd_gfx_fct04/fct_release/FCT0058_20250112_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming/report_timing_2tile_max.rpt.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0058_20250112_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/
report_timing_2tile_max.histogram.gz
report_timing_2tile_max.ptfixeco.rpt.gz
report_timing_2tile_max.rpt.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0058_20250112_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/
report_timing_2tile_max.histogram.gz
report_timing_2tile_max.ptfixeco.rpt.gz
report_timing_2tile_max.rpt.gz
# Full flat without read in sp/sqc tile
/proj/canis_pd_gfx_fct04/fct_release/FCT0059_20250112_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10_nosp/



# check clock latency from tile report, formal run,
/proj/canis/a0/tiles/rel_LSB10_FP00_GFX;            // release_tag CANIS_GFX_LSB10_FP00_CTS_RELEASE
/proj/canis/a0/tiles/rel_LSB10_FP00_COLD_START_GFX; // release_tag CANIS_GFX_LSB10_FP00_COLD_START_CTS_RELEASE


#### deliver tune recipe to tile PR team
# https://confluence.amd.com/pages/viewpage.action?spaceKey=TSG&title=Deliver+tune+recipe+to+tile+PR+team#DelivertunerecipetotilePRteam-Owner:eachFCTmember
p&r done by tile team; to do timing closure, FCT team need to deliver some tcl files, and tile flow takes tcl files at proper stage.
tile get netlist from FCFP release dirs; FCT place tcl files into FCFP release dirs too; FCT should align tune recipe file namings with tilef low owners;
# source *.tcl; tile flow proces *.list
$tile.place.io_weight.tcl $tile.place.fct_bound.tcl $tile.place.mbb_exclude.list $tile.place.rep_bound.tcl $tile.place.magnet.tcl 
$tile.cts.early_skew.tcl $tile.cts.late_skew.tcl
$tile.route.ndr.list $tile.optroute.io_weight.tcl
IO weight method:
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/tune_pr/tune_gen_for_critical_bundle.tcl



#### pt session
Subject: RE: [Canis GFX] FCT tune files for SYN
Hi Joanne, Could you please save a local session for AIE session? Once loaded, please update the table
Pre-syn (without FCFP, nometa data) released on Jan 14 (main session used for pretiming analysis)
 	Dir	Local session with library include
No-sp	  /proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/ 	/proj/canis_pd_gfx_fct01/michzhan/nlc/pretiming_nometa/pre_session_nometa_0114
Full-AIE /proj/canis_pd_gfx_sdc01/qingrloh/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata_fullAIE/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/	

Pre-syn (without FCFP, nometa data) released on Jan 10  (Please also keep these session)
 	Dir	Local session with library include
No-sp	/proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/ 	/proj/canis_pd_gfx_fct01/michzhan/nlc/pretiming_nometa/pre_session_nometa_0109
Full-AIE	/proj/canis_pd_gfx_sdc01/qingrloh/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata_fullAIE/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession	 /proj/canis_pd_gfx_fct03_aie_er/joanling/nlc/pretiming_nometa/


To: Wang, Kyle <Guangling.Wang@amd.com>; Chang, An <An.Chang@amd.com>; Ling, Joanne <Joanne.Ling@amd.com>; Zhang, Michael(SH) <Michael.Zhang3@amd.com>
Subject: RE: [Canis GFX] FCT tune files for SYN
Please find NLC below FP00 nometadata ptsession :

Non-AIE : /proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/
AIE : /proj/canis_pd_gfx_sdc01/qingrloh/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata_fullAIE/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/
For these 2 runs , we fixed bpm related generated clock and all rlc_mem_power_ctrl_reg_cp through DSLP or SD to sync pudelay violations , still exist lib internal generated clock  ¿gc_rlc_t/u_gfxDldoPsmTileTop/I_psmlt_v1/I_mapsmro_v1/CLK1_div_pin_1¿ which needs IP to confirm . 


From: Wang, Kyle <Guangling.Wang@amd.com> 
To: Chang, An <An.Chang@amd.com>; Ling, Joanne <Joanne.Ling@amd.com>
Cc: dl.Canis_PD_GFX_FCT <dl.Canis_PD_GFX_FCT@amd.com>; Ong, ZiWei (Zi Wei) <ZiWei.Ong@amd.com>; Li, Huan <Huan.Li@amd.com>; Zhang, Michael(SH) <Michael.Zhang3@amd.com>
Subject: RE: [Canis GFX] FCT tune files for SYN

            Update port name for syn_io tune files.
            /proj/canis_pd_gfx_fct01/FCT/release/to_syn/NLC/syn_io/*
            Please help to retrace it.


To: Chang, An <An.Chang@amd.com>; Ong, ZiWei (Zi Wei) <ZiWei.Ong@amd.com>; Li, Huan <Huan.Li@amd.com>; Wang, Kyle <Guangling.Wang@amd.com>
Subject: RE: [Canis GFX] FCT tune files for SYN
Hi Kyle, Could you please work with Joanne and check it?
 
 
# Please below is the AIE ptsession:
/proj/canis_pd_gfx_sdc01/qingrloh/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata_fullAIE/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession
 
# Please use below NLC FP00 nometadata session :
/proj/canis_fe_gfx_sdc01/huanli12/Canis/FCNL_constraints/GC_SDC_RUN2/main/pd/tiles/NLC_FP00_nometadata/rpts/PtFcGenFULLCHIPTIMINGLpTypicalTopSdc/ptsession/ 
Please note this session have some lib internal generated clocks and these clocks may impact timing results . We have sent mail to related IP to confirm .
 
 
 
Hi @Chang, An, I have checked in LSB.10 pd_repeaters.xml, This port exist in these tiles.
Hi @Zhang, Michael(SH), These ports are related to the HFN from gc_vmw_t* tile.
 Do you know why these ports are missing in NLC design? 
 
Hi @Wang, Kyle, We see below ports can¿t be found for io delay override in NLC design.  Would you check and correct?
 
gc_rts_0_t	cannot find port se0__sa0__wgp00__vmw_os, skip it
gc_rts_1_t	cannot find port se0__sa0__wgp00__vmw_os, skip it
gc_vx_swc_0_t	cannot find port se0__sa0__wgp00__vmw_os, skip it
gc_vx_swc_1_t	cannot find port se0__sa0__wgp00__vmw_os, skip it
gc_sq_sqc_t	cannot find port se0__sa0__wgp00__vmw_os, skip it
 
Hi An, Updating tune files directory,
                        /proj/canis_pd_gfx_fct01/FCT/release/to_syn/NLC/syn_io/*
                        /proj/canis_pd_gfx_fct01/FCT/release/to_syn/NLC/mbb_syn/*
 
            For IO constraints, please source them into tune after loading SDC.
                        source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/tune_pr/procs.tcl
                        source -echo -verbose /proj/canis_pd_gfx_fct01/FCT/release/to_syn/NLC/syn_io/<tile>.syn.io_sdc.tcl
                        source -echo -verbose rpts/$TARGET_NAME/override_io_delay.sdc
 
 
We will apply them in NLC syn.
Can you share definition of ¿override_io_delay¿?
 
Hi @Chang, An, FCT have prepared some tune files for SYN, if you have no issues for these, please take it in NLC.
 Please take a look the format of the tune files.  
            For example: 
1)	/proj/canis_pd_gfx_fct01/FCT/release/to_syn/mbb_syn/gc_rts_0_t.GC_GFXCLK_guanwang.syn.mbb_exclude.list
2)	/proj/canis_pd_gfx_fct01/FCT/release/to_syn/syn_io/gc_rts_0_t.GC_GFXCLK_guanwang.syn.io_sdc.tcl
 
I have put them in these directory, /proj/canis_pd_gfx_fct01/FCT/release/to_syn/*
            

Created by Yin, Haimeng, last modified on Dec 13, 2024
Category: timing closure
Owner:    each FCT member
Feedback to: Tile owner
Stage: NLA-NLD
Based on data: Cts
Background
Tile PR flow builds clock tree for tile internal.
Tile owners adjust clock latency to fix tile internal timing.
Tile owner cannot see top level clock latency.
FCT need to provide target latency to tile team to balance clocks from top level.

Useful_information
Tile flow has clock latency report, which shows tile level clock latency values for each clock.
FX: rpts/FxCts/FxCts_qor_latency.rpt.gz
I2: rpts/I2Cts/I2Cts_qor_latency.rpt.gz

Example:
#### Latency Reporting for Corner tt0p65v0c_typrc125c_setup ####
summary table for corner tt0p65v0c_typrc125c_setup
clock/skew_group   attrs sinks target_skew global_skew target_latency max_latency min_latency median_latency latency_std_dev

\\\\\\\\\\\\\\\\\\  Mode list:
FuncFFG1p05v    FuncTT0p75v     FuncTT0p65v     FuncTT0p9v       FuncSSG0p6v    FuncTT0p6v
### Mode: FuncTT0p65v Scenario: setup_tt0p65v0c_typrc125c_FuncTT0p65v
clock_core         M,D   147954   50        226        150             405        179          308           32
MTAP_Wrck
SMS_WEST_WRCK
clk_eth
DFX_SCAN_SHIFT_CLK M,D    144     40        333        150             962        628         798            104
### Mode: ScanShiftSSG0p65v  Scenario: setup_tt0p65v0c_tprc125c_ScanShiftSSG0p65v
SCAN_SC_TCLK       M,D    150274  40        545        150             1173       628         1015            45
DFX_SCAN_SHIFT_CLK M,D    150243 
DFX_JTAG_TCLK
--------
All clocks                151141            545                        1173                   179

Important columns: 'Clock', 'Median Latency' and 'Latency Std Dev'.
Do statistics based on the data, and make sure all tiles latency are in a proper range for main clocks.
Do the analysis based on timing results and design information.

# You may check below report for debug.
<rundir>/rpts/FxCts/FxCts_structure.rpt.gz

# Reference method; Chose one script to summarize for all tiles all clocks into a table.
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/summ_tile_clock_latency.py
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/get_tile_clock_latency_i2_summary.pl


# Feedback clock latency to tile team
FCT can give a guidance of median latency range and max std dev to tile PR team.
The outlier tiles not meet the targets need special review and waiver.
# Example table of Murano project:
clock            	corner	        type    min median latency	max median latency	max std dev
bx_tx_block_clk_ln0	FuncTT0p65v	            200	500	40
clk_core            FuncTT0p65v   	Mesh	190	310	35
clk_ddr	            FuncTT0p65v   	H-Tree	530	680	40
clk_eth	            FuncTT0p65v   	H-Tree	260	410	40
clk_stg	            FuncTT0p65v   	Mesh	210	310	35
DFX_SCAN_SHIFT_CLK	ScanSSG0p65v	H-Tree	200	900	80
MTAP_Wrck        	FuncTT0p65v   	H-Tree	200	1000	80
PMA_capture_clock_12_DFT FuncTT0p65v	    200	500	40
SMS             	FuncTT0p65v	   H-Tree	200	1100	80

# NLB.10 check itmes for func and scan sdc
# exclude ones in sdc report, left extra ones in FCt run;
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/extra_noclock_in_fct.list;  #Count: 22276    
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/extra_uncons_in_fct.list;   #Count: 131911
# For NLB.10 non aie no clock report, Points below not commented, pls help review.
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/ 

### Generated by  joanling  with /tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths  on Jan 8, 2025  at  11:46:27
### /tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths -outdir ./relDir/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming -tmpdir ./relDir/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?) (mp4_top_t/.*?) (dcn_top_t/.*?) (vcn_top_t/.*?) (ddrss_top_t/.*?) (ddrss_top_h_t/.*?)" ./rpts/PtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/report_timing.rpt.gz -limit 100
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming_2t/

# Aie sq num not match, pls check extra 6 points:
tile	no clock number	in FCT run number
gc_sq*	944	950
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/left_aie.rpt.gz
# Uncons points: Uncommented ones:
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/left_unconstrained_endpoints.rpt.gz



/tools/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sort_mpu.sh
/tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths
/home/zyang2/home_backup/sort_davlu_si.csh
/tools/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/configs/canis/a0/SOC/flow_scripts/sort.csh
/home/zyang2/home_backup/Mi350/Tile_SPT/spt_web_11244.pl 
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py

/tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths -outdir $outdir -tmpdir $outdir -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?) (mp4_top_t/.*?) (dcn_top_t/.*?) (vcn_top_t/.*?) (ddrss_top_t/.*?) (ddrss_top_h_t/.*?)" $1 -limit $limit
#/tools/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sortTimingPaths -outdir $outdir -tmpdir /tmp -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?)" $1 -limit $limit

# /home/zyang2/home_backup/sort_davlu_si.csh
#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tools/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldXtiming

ls -lrt $base_dir/rpts/$TARGET_NAME/*DBG*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_DBG
ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |zgrep -v "DBG" | grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_noDBG

/tools/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt
/tools/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tools/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d

#/tools/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz

#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tools/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldXtiming

ls -lrt $base_dir/rpts/$TARGET_NAME/*DBG*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_DBG
ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |zgrep -v "DBG" | grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_noDBG

touch rpts/$TARGET_NAME/SSB_report_all.rpt
touch rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz

foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list_DBG`)
zcat $CLK >> rpts/$TARGET_NAME/SSB_report_all.rpt
end
foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list_noDBG`)
cat $CLK >> rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz
end

/tools/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt
/tools/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt


bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tools/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d

#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tools/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d

\\\\\\\\\ RepeaterTraceFlow
#### Creating a repeater trace from GenEnhanced xmls file
create an FCFP repeater trace from GenEnhancedRepeater XML, with following script (typically included as a FINISH script to repeater insertion target).
/tools/aticad/1.0/src/zoo/azmohamm/scripts/gen_early_trace.py -x data/GenEnhancedRepeaterXML.xml -t <top_module>  > data/early_trace_preopt.txt
/tools/aticad/1.0/src/zoo/azmohamm/scripts/gen_early_trace.py -x /proj/canis/a0/floorplan/rel_LSCm_GFX/gc/fp_latest/doc/nl_repeaters.xml  -t gc > data/early_trace_preopt.txt

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/
/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/ 
# pd_repeaters.xml
top_module can be "gc", "mpu" or even "", runs fast and  pre-collapse. 
unable to merge super tiles (any sub-hierarchies like SE in case of graphics IP), hence there is loss of accuracy at interface of super tiles if any.
# Creating a repeater trace from def files
It is very useful to check the repeater positioning just after tile placement data is available. 
This will help us understand if there are any large repeater distance violations after tile placement. 
The design input in this case is the list of def files.  Floorplan def files can also be used for this purpose.
These def files can be the final def files, after collapse. 
Super tiles are flattened at this stage, hence this offers a true picture at the interface of the tiles. 
Other inputs are configured via the measure_xmls.py file which is located in the current run directory. An example is provided here:
/tools/aticad/1.0/src/zoo/azmohamm/doc/measure_xmls.py
The file format can be kept simple (even though this is executed as a python script, so can include python code) like:
var=value
The most important input here are the XMLs:
  PrepTopForRelease XMLs showing all the final repeaters
  The top level feedthrough connectivity XML.
I have had requests to have the capability to generate the repeater trace flow through some other intermediate files, 
but as I have learnt the hardway those files don't have all the info, so it doesn't work.
The first thing is to have this environment variable set:
setenv TILEMAP_CSV fcfp.csv
The command to generate the trace file (unprocessed):
/tools/aticad/1.0/src/zoo/azmohamm/scripts/measure_rep_dist.py -d clk -l def_list -f fcfp.csv -c ./all_conn  -t trace.out -p measure_xmls.py
clk here is a regex for the clocks of interest ("." will get the trace for all the clocks)
def_list is a comma separate values of tile,path_to_def
trace.out is the name of the trace file generated
measure_xmls.py is the full path of the location of the configuration file (default is to look for this in the current directory< br> all_conn is a file needed only when there are sub-hierarchies involved. It is a file that shows how the sub-hierarchies are connected to the top level. 
It is generated in a prelayout timing session using the following tcl snippet (assuming se0 and se1 are the instance names of the sub-hierarchies)
set ac [open all_conn w]
foreach_in_collection p [get_pins se0/*] {
    set n [get_object_name [get_nets -of_objects $p]]
    puts $ac "$n [get_object_name [get_pins -of_objects $n]]"
}
foreach_in_collection p [get_pins se1/*] {
    set n [get_object_name [get_nets -of_objects $p]]
    puts $ac "$n [get_object_name [get_pins -of_objects $n]]"
}
close $ac
We would normally want to sort the net traces in decreasing order of max repeater distance. The below script comes in handy.
/tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m trace_fp_nlc > trace_fp_nlc_max
Raw viewEdit
Optimizing the trace
The trace file generated at the floorplan stage uses placement locations which are going to be quite different from the final placement. This is likely to show lots of distance violations which are not real since the placement of repeaters within the tile is not optimal. To find out the real violations, we simulate the best case - this is called the optimization step. The repeaters within the tile are relocated to fix the repeater distance violations. It is important to point out that the repeater topology is not changed - that is, the trace flow never moves a repeater from one tile to another.
/tools/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -p 750 > trace_opt_nlc
The value of 750 passed as argument p here is the repeater distance which we aim to achieve. The optimization + sorting is doable in a single step:
/tools/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -a algo3 -p 750 | \
          /tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m > trace_opt_nlc_max
Raw viewEdit
Generating the relpos file
The relpos file is consumed by the budgeting step. However, there is another important reason to run this step. Until the previous stage, repeaters are all considered unique. This might create some optimism in case of reuse tiles (the effect of collapse isn't captured). It is at this stage that the reuse repeaters are de-uniquified. The final trace and the relpos file are generated with this command:

/tools/aticad/1.0/src/zoo/azmohamm/scripts/gen_rel_pos.py -i trace_opt_nlc_max -o repeaterRelPos.txt -d relpos.dbg -t rel_trace_opt_nlc 
/tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m rel_trace_opt_nlc > rel_trace_opt_nlc_max
Raw viewEdit
Processing the trace file
filter_pt.pl comes in very handy when working with the trace file. The command below for example filters out all EQ0 and LE0 contracts:
filter_pt.pl -s "Trace of" -e "EQ 0" -e "LE 0" trace_full > trace_noneq0
Raw viewEdit
Working with multiple clock domains
In case of SoC , there are multiple clock domains each with their own repeater distance target. We split the trace per clock and optimize separately, merge the optimized traces and then generate the relpos file.
filter_pt.pl -s "Trace of" -o 'domain=Cpl_HSPCLK' -o 'domain.*SHUBCLK' trace_nld_fp_merged > trace_hsp_shubclk
filter_pt.pl -s "Trace of" -o 'domain=.*SMNCLK' -o 'domain=Cpl_LCLK' trace_nld_fp_merged > trace_lclk_smnclk
filter_pt.pl -s "Trace of" -r 'domain=Cpl_DCLK' trace_nld_fp_merged > trace_dclk

# Now optimize..
/tools/aticad/1.0/azmohamm/scripts/arrange_reps.py  -i trace_lclk_smnclk -p 1150 -f   /home/azmohamm/mero/fcfp.csv   |  \
      /tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_lclk_smnclk_opt

/tools/aticad/1.0/zoo/azmohamm/scripts/arrange_reps.py  -i trace_dclk -p 1300 -f   /home/azmohamm/mero/fcfp.csv   |  \
       /tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_dclk_opt

/tools/aticad/1.0/zoo/azmohamm/scripts/arrange_reps.py  -i trace_hsp_shubclk -p 1500 -f   /home/azmohamm/mero/fcfp.csv   |  \
       /tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_hsp_shubclk_opt

cat trace_lclk_smnclk_opt trace_dclk_opt trace_hsp_shubclk_opt > trace_for_rel
/tools/aticad/1.0/src/zoo/azmohamm/scripts/gen_rel_pos.py -i trace_for_rel -o full_relpos.txt -d relpos.dbg -t trace_postrel

/tools/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  trace_postrel >  trace_postrel_max
Raw viewEdit
Generating bounds based on the trace file
Even if the optimal trace does not contain any repeater distance violations, the post placement trace can. This happens because the placer choses a repeater placement different from the optimized trace. Repeaters which are close to violating the distance requirement in the optimal trace are likely to go well over the edge and cause a large distance issue. As an additional protection step, graphics fcfp teams create bounds on these critical repeaters to prevent any such large displacement from the optimal trace.
Bound Window Criteria if (tile_width >= 400 && < 800) { Divide width in 2 equal regions } if (tile_width >= 800 && < 1200) { Divide width in 3 equal regions } if (tile_width >= 1200 && < 1500) { Divide width in 4 equal regions } Bound Command ICC2 create_bound command is used to create bounded regions in the design. These are soft bounds because intension is to not force the tool to bound the repeaters by sacrificing routability and timing. Generally, there is no guarantee that cells will be placed completely within a bound. For instance, coarse placement will violate bounds if the quality of its primary placement objectives would otherwise be destroyed. Per ICC2 manual, this command defines region-based placement constraints for coarse placement. There are two different types of bounds available: move bounds and group bounds. Move bounds restrict the placement of cells within fixed regions (i.e., bound shapes) of the core area.
catch { create_bound -name FCFP_REP_BOUND_gc_gl1a_t_x1_y0 -boundary (1) -type soft [get_cells -physical_context [list *FCFPRepFFcgcg_Cpl_GFXCLK468675 *FCFPRepFFcgcg_Cpl_GFXCLK468333 *FCFPRepFFcgcg_Cpl_GFXCLK21482 *FCFPRepFFcgcg_Cpl_GFXCLK19238 ]]} In the above example, bound name FCFP_REP_BOUND_gc_gl1a_t_x1_y0 is used to define the boundary in (2) area. 4 repeaters are bounded to this region.
Critical Repeaters Only critical repeaters that satisfy a certain bound criterion are bounded. For Feyarch, NLDp0 below criteria was used to generate critical repeaters list: 1. Bound repeaters if rep2rep distance >750um, make sure to bound repeater and preceding one because that's how we control the distance between two repeaters (reps)
Trace of net SE1SA0? ? _WGP00_TA1_GRBM_stat_busy (bundle=SE1SA0_WGP00_TA1_GRBM_stat, constraint=LE 32, max=2510.7, avg=633) [ 3000.0, 4231.9] se1/gc_tatd_t0001/terminal [ 2800.0, 4031.9] se1/gc_tatd_t0001/TA_GRBM_stat_busy [ 2800.0, 4026.9] se1/gc_lds_t000/FE_FEEDX_MFT__0__gc_tatd_1_t_0__gc_lds_t_0__TA_GRBM_stat1_busy__AMD_gc_lds_t_0 506.4 -> [ 2799.8, 3515.6] se1/gc_lds_t000/FCFPRepFFcgcg_Cpl_GFXCLK531968 [ 2799.9, 3254.3] se1/gc_lds_t000/FE_FEEDX_MFT__1__gc_lds_t_0__gc_tatd_t_0__TA_GRBM_stat1_busy__AMD_gc_lds_t_0 [ 2799.9, 3249.3] se1/gc_tatd_t0000/FE_FEEDX_MFT__0__gc_lds_t_0__gc_tatd_t_0__TA_GRBM_stat1_busy__AMD_gc_tatd_t_0 860.1 -> [ 2800.2, 2656.0] se1/gc_tatd_t0000/FCFPRepFFcgcg_Cpl_GFXCLK531969 [ 2800.0, 2649.5] se1/gc_tatd_t0000/FE_FEEDX_MFT__1__gc_tatd_t_0__gc_db_t_0__TA_GRBM_stat1_busy__AMD_gc_tatd_t_0 [ 2800.0, 2644.5] se1/gc_db_t00/FE_FEEDX_MFT__0__gc_tatd_t_0__gc_db_t_0__TA_GRBM_stat1_busy__AMD_gc_db_t_0 531.1 -> [ 2798.1, 2127.0] se1/gc_db_t00/FCFPRepFFcgcg_Cpl_GFXCLK531970 [ 2791.2, 2121.5] se1/gc_db_t00/FE_FEEDX_MFT__1__gc_db_t_0__gc_cb1_t_0__TA_GRBM_stat1_busy__AMD_gc_db_t_0 [ 2791.2, 2116.5] se1/gc_cb1_t00/FE_FEEDX_MFT__0__gc_db_t_0__gc_cb1_t_0__TA_GRBM_stat1_busy__AMD_gc_cb1_t_0 536.6 -> [ 2784.7, 1603.8] se1/gc_cb1_t00/FCFPRepFFcgcg_Cpl_GFXCLK531971 [ 2783.0, 1598.3] se1/gc_cb1_t00/FE_FEEDX_MFT__1__TA_GRBM_stat1_busy__AMD_gc_cb1_t_0
2. Magnet placement feed: Do not bound magnet placement repeaters, these are repeaters in tile preceding endpoint tile. These are special repeater which do not follow FCT clock gating request (CG) and hence need to be tied closer to feed terminal through magnet placement a. As a part of flow, the output feed in tile preceding endpoint tile has repeater b. Trace flow owner provide a list of above mentioned feed ports to CG owner for magnet placement request.
3. IO Budgeting repeater locations: Do not bound any repeater in startpoint/endpoint tile which is connected to RTL port. 1. Bound generation flow is enabled to generate repeater locations file for critical repeaters list. The location file per tile is provided for IO budgeting. 2. We do not add these repeaters relative locations to the repeaterRelPos.txt.
Bound Generation flow is used for two purposes and each purpose needs a separate critical repeaters list. 1. Generate bound files for each tile for PNR 2. Generate repeater location file for IO budgeting per tile and magnet placement files per tile
Flow Scripts Finish script to generate bounds file for tiles, IO budgeting input and magnet placement feed data: /home/adosi/zoo/adosi/bin/README /home/adosi/zoo/adosi/bin/gen_trace_bound.pl /home/adosi/zoo/adosi/bin/run_me
Master bound generation scripts: /home/adosi/zoo/adosi/bin/gen_rep_bound.pl
Inputs for Trace and Bound Generation In short: 1. Measure_xmls.py 2. Fcfp.csv 3. Def files pointer in one file: gc_def_list/mpu_def_list 4. All_conn: se to gc level connection
Outputs of the Flow 1. Bound files for each tile  Delivered to Tile Leads and Tile PD Flow Guy 2. Start-end tile repeater location file for IO budgeting 3. Magnet placement feedthrough file for each tile 4. List of repeaters to avoid banking during placement
Output files:
Under Directory: $pwd/ Trace: o Initial trace file is trace_fp which reads in the random locations from FCFP database. o Locations in above file are optimized in trace_opt_max. o Further, reuse tile cases are considered, and relative optimum location is generated in rel_trace_opt_max which is a sorted file with max distance on top. o For GCH, l2wd_interface_rel_trace_opt_max_filter_eq0_le0_0806 and se_rel_trace_opt_max_filter_eq0_le0_0806 are separated for l2wd+interface and SE. o Critical bundles with max distance are filtered in l2wd_interface_bundles_crit.txt and se_bundles_crit.txt. ¿ Bound files: FCFP_REP_TILE_BOUND ¿ IO Budgeting data: FCFP_REP_TILE_LOC_start_end_reps_io_budget and repeaterRelPos.txt ¿ Magnet placement for feedthrough ports: magnet_feed ¿ Repeater banking: no_bank_critical_reps 




#### canis tasks & owners; 
Task	Original owner	Owner	Comments
Special timing	 	Guo, Jia/Ong, JoeHuei	 
CDC Check	 	Guo, Jia/Ong, JoeHuei	 
MV Timing/ACVCLK	Kyle, Wang	Guo, Jia	 
Repeater trace flow report analysis	Kyle, Wang	Kyle, Wang/Ling, Joanne	 
GFX Flow	Michael	Michael	 

# gfx/dft timing;
gfx owner: non-er tiles kyle, er tiles joan;
dft owner: non-er tiles ding, er tiles joehuei,
# gfx clocks group
gfx clock: 
gc_gfxclk: 
dldoclock: fanout to all tiles
gfxclk_1 : same as  gfxclk
socclk: fanout low
qspiclk: fanout low
wrck
# 4 tiles mv timing
mv timing: acv settings to be setup; fct mv flow: to be done.
mv_tile_list: gc_acv_sp_sq_t gc_acv_lds_t vdci_gc_  gc_d
repeater timing:
# DRV 
si, double_switch
# pt sessions;
pt timing: no-clock, timing loop, non-constraint; compare with tile-level pt session;
# owners
sdc owner: collect scripts for special timing; most 6 issues;
# current stages: NLB10p
floorplan;
NLC : check CDC timing; based on pretiming ;
RTG vs GFX: W W/A repeater tiles; 
# disk and dirs;
fct01: working dir;
/proj/canis_pd_gfx_fct01/jiaguo12/
/proj/canis_pd_gfx_fct02/fct_runs/NLB_FP00/
fct04_release: copied from er dir;
/proj/canis_pd_gfx_fct04/fct_release/FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming
# timing corners
FuncFFG1p05v FuncTT0p9v FuncTT0p75v FuncTT0p65v FuncTT0p6v FuncSSG0p6v 

# Seras
cd /proj/canis_pd_gfx_fct04/fct_runs/FCT0042_20241220_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp_flushflow;
color_term> tbc; 
gvim 
/proj/canis_pd_gfx_fct04/fct_runs/FCT0042_20241220_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp_flushflow/cmds/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming.cmd

realpath shqbit.tcl

#### xterm history;
cd /proj/canis_pd_gfx_fct01/
gvim /home/zyang2/home_backup/DRV.csh
gvim /home/zyang2/home_backup/Navi31/get_distance_from_def.pl
gvim /home/zyang2/home_backup/Navi31/SPT/MCD_2tile/asynfifo.csh
gvim /proj/canis_pd_gfx_fct04/fct_release/FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/rpts/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/GC_ACVCLK_max.rpt.gz
   /proj/canis_pd_gfx_fct04/fct_release/FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/cmds/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming.cmd

gvim ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/fullchip.Grp.GC_CPUGFX_REF_ROCLK_400.gc_imu_t.gc_dldo_t.sorted.gz
cd ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/
gvim SortPtGfxFuncTT0p6vReRouteFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_MTAP_Wrck.gc_vmem_rt_0_t0000.sorted.gz
cd ../../../FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/
resolve ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/fullchip.
/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=32000]   select[type==RHEL7_64||type==RHEL6_64]' '/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py . &'
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py . &'
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py .&'
bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tools/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py'
    



# /tools/aticad/1.0/src/zoo/hmyin/pt/procs.tcl
~/soc/rpts/n100.xml
proc parse_nl_rep_xml {xml net_bundle bundle_constriant net_container net_clk net_orig} {
    upvar $net_bundle        a_net_bundle
    upvar $bundle_constriant a_bundle_constriant
    upvar $net_container     a_net_container
    upvar $net_clk           a_net_clk
    upvar $net_orig          a_net_orig
    
    set FI [open $xml r]
    set cur_clk ""
    set cur_constraint ""
    set cur_container ""
    set flag_constraint 0
    while {[gets $FI line] >= 0} {
        #if {[regexp "<rep .* sdc_clk=\"(.*?)\" constraint=\"(.*?)\" .* container=\"(.*?)\" file" $line - clk constraint container]} 
        if {[regexp "<rep " $line]} {
            foreach seg [split $line] {
                if {[regexp "^sdc_clk=\"(.*?)\"" $seg - clk]} {
                    set cur_clk $clk
                    set flag_constraint 0
                } elseif {[regexp "^constraint=\"(.*)" $seg - constraint]} {
                    set cur_constraint $constraint
                    set flag_constraint 1
                } elseif {$flag_constraint == 1 && [regexp "(.*)\"" $seg - constraint]} {
                    set cur_constraint "${cur_constraint} ${constraint}"
                    set flag_constraint 0
                } elseif {[regexp "^container=\"(.*?)\"" $seg - container]} {
                    set cur_container $container
                    set flag_constraint 0
                } else {
                    set flag_constraint 0
                }
            }
        # elseif {[regexp "<net name=\"(.*?)\" bundle=\"(.*?)\"" $line - net bundle]} 
        } elseif {[regexp "<net " $line]} {
            foreach seg [split $line] {
                if {[regexp "^name=\"(.*?)\"" $seg - net]} {
                    set net_orig $net
                    set net [regsub {\[} $net "___hmyin1___"]
                    set net [regsub {\]} $net "___hmyin2___"]
                } elseif {[regexp "^bundle=\"(.*?)\"" $seg - bundle]} {
                    set bundle $bundle
                }
            }
            set a_net_bundle($net) $bundle
            set a_net_container($net) $cur_container
            set a_net_clk($net) $cur_clk
            set a_net_orig($net) $net_orig
            #if {![info exists a_bundle_constriant($bundle)]} {set a_bundle_constriant($bundle) $cur_constraint}
            set a_bundle_constriant($bundle) $cur_constraint
        #elseif {[regexp "<no_rep name=\"(.*?)\" bundle=\"(.*?)\" .* container=\"(.*?)\" file" $line - net bundle container]} 
        } elseif {[regexp "<no_rep " $line]} {
            foreach seg [split $line] {
                if {[regexp "^name=\"(.*?)\"" $seg - net]} {
                    set net_orig $net
                    set net [regsub {\[} $net "___hmyin1___"]
                    set net [regsub {\]} $net "___hmyin2___"]
                } elseif {[regexp "^bundle=\"(.*?)\"" $seg - bundle]} {
                    set bundle $bundle
                } elseif {[regexp "^container=\"(.*?)\"" $seg - container]} {
                    set cur_container $container
                }
            }
            set cur_clk "*"
            set cur_constraint "no_rep"
            set a_net_bundle($net) $bundle
            set a_net_container($net) $cur_container
            set a_net_clk($net) $cur_clk
            set a_net_orig($net) $net_orig
            #if {![info exists a_bundle_constriant($bundle)]} {set a_bundle_constriant($bundle) $cur_constraint}
            set a_bundle_constriant($bundle) $cur_constraint
        #elseif {[regexp "<axi_rep .* sdc_clk=\"(.*?)\" constraint=\"(.*?)\" .* container=\"(.*?)\" file" $line - clk constraint container]} 
        } elseif {[regexp "<axi_rep " $line]} {
            foreach seg [split $line] {
                if {[regexp "^sdc_clk=\"(.*?)\"" $seg - clk]} {
                    set cur_clk $clk
                    set flag_constraint 0
                } elseif {[regexp "^constraint=\"(.*)" $seg - constraint]} {
                    set cur_constraint $constraint
                    set flag_constraint 1
                } elseif {$flag_constraint == 1 && [regexp "(.*)\"" $seg - constraint]} {
                    set cur_container "${cur_constraint} ${constraint}"
                    set flag_constraint 0
                } elseif {[regexp "^container=\"(.*?)\"" $seg - container]} {
                    set cur_container $container
                    set flag_constraint 0
                } else {
                     set flag_constraint 0
                }
            }
        } elseif {[regexp "</" $line] || [regexp "<bundle" $line] || [regexp "^$" $line] || [regexp "<end_block_info" $line]} {
            ## NA
        } elseif {[regexp "<?" $line] || [regexp "<net_repeaters>" $line] || [regexp "<identifier" $line]} {
            ## NA
        } else {
            puts "unmatched: $line"
        }
    }
    close $FI
}
## [parse_nl_rep_xml $nl_xml a_net_bundle a_bundle_constriant a_net_container a_net_clk a_net_orig]


history [-h] [-r] [argument_list]
ARGUMENTS
       -h     Displays  the history list without the leading numbers.  You can use this for creating scripts from existing  history.   
              You  can then source the script with the source command.  You can combine this option with only a single numeric argument.  
       -r     Reverses the order of output so that most recent history entries display first rather than the oldest  entries  first.   
       argument_list
              Additional arguments to history (see DESCRIPTION).

Advanced Tcl History
       The history command performs  one  of  several  operations  related  to
       recently-executed  commands  recorded in a history list.  Each of these
       recorded commands is referred to as an  "event."   When  specifying  an
       event to the history command, the following forms may be used:

        o  A  number,  which if positive, refers to the event with that number
         (all events are numbered starting at 1).  If the number is  negative,
         it  selects  an  event relative to the current event; for example, -1
         refers to the previous event, -2 to the one before that, and  so  on.
         Event 0 refers to the current event.

        o  A string selects the most recent event that matches the string.  An
         event is considered to match the string either if the string  is  the
         same  as  the first characters of the event, or if the string matches
         the event in the sense of the string match command.

       The history command can take any of the following forms:

       history
              Same as history info, described below.

       history add command [exec]
              Adds the command argument to the history list as  a  new  event.
              If  exec is specified (or abbreviated), the command is also exe-
              cuted and its result is returned.  If exec is not specified,  an
              empty string is returned.

       history change newValue [event_number]
              Replaces  the  value  recorded  for an event with newValue.  The
              event_number specifies the event to replace, and defaults to the
              current  event (not event -1).  This command is intended for use
              in commands that implement new forms of history substitution and
              want  to  replace  the current event (that invokes the substitu-
              tion) with the command created through substitution.  The return
              value is an empty string.

       history clear
              Erases  the  history  list.  The current keep limit is retained.
              The history event numbers are reset.

       history event [event_number]
              Returns the value of  the  event  given  by  event_number.   The
              default value of event_number is -1.

       history info [count]
              Returns a formatted string, giving the event number and contents
              for each of the events in the history list  except  the  current
              event.   If  count is specified, then only the most recent count
              events are returned.

       history keep [count]
              Changes the size of the history  list  to  count  events.   Ini-
              tially, 20 events are retained in the history list.  If count is
              not specified, the current keep limit is returned.

       history nextid
              Returns the number of the next event to be recorded in the  his-
              tory  list.   Use this for printing the event number in command-
              line prompts.

       history redo [event_number]
              Reruns the command indicated by event and  returns  its  result.
              The  default  value of event_number is -1.  This command results
              in history revision.  See the following section for details.


 gui_start
 current_design
 help *no_clock*; help *clock*; help report*; help *skew*; 
 puts $argv; puts $argc; set argc;
 report_clocks
 get_clock
 report_clock; report_clock_crossing; report_clock_gate_savings; report_clock_gating_check;

 restore_session rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/ptsession
 set {worst.endpts.default.GC_ACVCLK.setup.paths} [::get_timing_paths -delay_type max -path_type full_clock_expanded -to [get_selection] -max_paths 999999 -nworst 1 -slack_lesser_than 0 -include_hierarchical_pins -group {GC_ACVCLK}]
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_repeater_bundle_cycle.tcl
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/trace_clk_path.tcl
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/clocks/list_sink_numbers_by_clk.tcl
 trace_clk_path -inst_map inst_tile.map -clks GC_ACVCLK; # clk_trace/*;  trace_clk_path.log;
 check_repeater_bundle_cycle -inst_map inst_tile.map -nl_xml pd_repeaters.xml
 list_sink_numbers_by_clk
 # sh gvim clk_sink_numbers.csv
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/repeater/check_bi_net_rep.tcl
 check_bi_net_rep -inst_map inst_tile.map -nl_xml pd_repeaters.xml
 #  sh gvim bi_nets.rpt;
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/check_RC011.tcl
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/check_RC012.tcl
 ls -al rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/ -t
# rpts/PtGfxFuncTT0p75v*/check_DRV_RC011.waived.rpt.gz
# rpts/PtGfxFuncTT0p75v*/check_DRV_RC012.waived.rpt.gz
 source /tools/aticad/1.0/src/zoo/SCBU_PD/TSG/fct_workbook/scripts/drv/fix_drv.py
 report_min_period -help
 report_analysis_coverage -help

 ls ../FCT0101_20250210_SOC_FUNCSCAN_GFX_HDM_GFX_ONLY_ReRoute_LSB10_NoRDL/rpts/PtGfxFuncTT0p75vReRouteHdmTyprc100cTT0P75V100CStpTiming/ptsession/
 restore_session rpts/PtGfxFuncTT0p75vReRouteHdmTyprc100cTT0P75V100CStpTiming/ptsession


# csh> TileBuilderIntPrimetime cmds/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming.cmd
csh> source ~sdhe/.cshrc; which module;
# csh> module load primetime/2022.03-SP5-2-T-20230819
# csh> module unload primetime; module avail pt_shell
csh> module load primetime/2023.12-SP5
csh> cd ../FCT0101_20250210_SOC_FUNCSCAN_GFX_HDM_GFX_ONLY_ReRoute_LSB10_NoRDL/;  ls rpts/PtGfxFunc*0p75*/ptsession
csh> pt_shell;

csh>  ps -w `whoami`
csh>  ps -u jiaguo12
csh>  top; ps aux; jobs -l ;ps aux | grep find;

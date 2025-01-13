

# 
jdon: git add pythonall.csh(with py310 download links);  
guojia: install py310; chat: outlook mails save into can_mail.csh;

# other clock no violation, all runs will auto-sort, nosp & nospflush is tuning flow, nosp to check violation.
# review _2tile
/proj/canis_pd_gfx_fct04/fct_release/FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming


Task	Original owner	Owner	Comments
Budgeting	Ong, JoeHuei	Ong, JoeHuei	Required er_aie permission
GFX Timing (exclude SP interface)	Kyle, Wang	Kyle, Wang	 
GFX Timing (SP interface)	Ling, Joanne	Ling, Joanne	Required er_aie permission
DFT Timing (exclude SP interface)	Xue, Cannie	Xue, Cannie	 
DFT Timing (SP interface)	Ong, JoeHuei	Ong, JoeHuei	Required er_aie permission

DRV/Misc check	Ling, Joanne	Guo, Jia/Ling, Joanne	 
Special timing	 	Guo, Jia/Ong, JoeHuei	 
CDC Check	 	Guo, Jia/Ong, JoeHuei	 
MV Timing/ACVCLK	Kyle, Wang	Guo, Jia	 

Other Clock timing (exclude GFXCLK/ACVCLK)	Xue, Cannie	Xue, Cannie	 
Repeater trace flow report analysis	Kyle, Wang	Kyle, Wang/Ling, Joanne	 
FCT Daily timing run	Ling, Joanne	Ling, Joanne/Ong, JoeHuei	Required er_aie permission
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



fct workbook;

# pathform scripts
color_xterm> /tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py
# pathform;
select _2tile report file, check my_path;
acv clock by owners; add comments;
new_run, new database, inherate comments;
1st round: all violations, 2nd round: new violations
default: 200 warnings; fanout lol si,
ref_comments:
machine_learning_comments: machine learning targets;
ask kyle and cannie on pathform;



python scripts;
startpoint/endpoint
old : excel file, 
database update some parts, rerun & reanalyze;
nlb stage: nlc stage design will include,

我们place的run有结果了，这边因为drv相关的还没有开始，你可以先看看function的timing
这样子我们这边比较critical的两个tile，一个是vmw，一个gl1ac, 你要不先看看所有和gl1ac相关的two tile的path
熟悉下design
因为pathform里面的config 没有改，这个path目前还是assign给Kyle的，你可以自己先试着过滤先，先看看
 
place run, full flat fct0058 run

gl1ac这个tile和其他tile的path比较多，所以相对来说比较critical你可以先研究研究研究
fcfp package可以从这个目录下面抓到
/proj/canis/a0/floorplan/rel_LSCm_GFX/gc/fp_latest/fcfp.Final.pkg
可以用fcfp_explorer打开，fct我们有一个类似工具fct_explorer,这个可以看看tile 的path是怎么走的


# Full flat run
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

Reference method
Chose one script to summarize for all tiles all clocks into a table.
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
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/PtGfxFuncTT0p75vPlaceFlatTyprc100cTT0P75V100CStpTiming/

### Generated by  joanling  with /tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths  on Jan 8, 2025  at  11:46:27
### /tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths -outdir ./relDir/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming -tmpdir ./relDir/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?) (mp4_top_t/.*?) (dcn_top_t/.*?) (vcn_top_t/.*?) (ddrss_top_t/.*?) (ddrss_top_h_t/.*?)" ./rpts/PtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/report_timing.rpt.gz -limit 100
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.report.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.report.gz.ready
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.vdci_gc_acv_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_ACVCLK.gc_acv_lds_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_ACVCLK.gc_acv_sp_sq_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_ACVCLK.gc_acvi_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_ACVCLK.vdci_gc_acv_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_GFXCLK.gc_gl2c_q1_c5_t.gc_gl2c_q0_c0_t.sorted.gz
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming/fullchip.gc_vx_swc_1_t0131.gc_vx_swc_0_t0130.sorted.gz

/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming_2t/
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p6vPlaceFlatTyprc100cTT0P6V0CStpTiming_2t_ptfixeco/



# Aie sq num not match, pls check extra 6 points:
tile	no clock number	in FCT run number
gc_sq*	944	950
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/left_aie.rpt.gz
# Uncons points: Uncommented ones:
/proj/canis_pd_gfx_fct04/fct_release/FCT0048_20250108_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/left_unconstrained_endpoints.rpt.gz




/tool/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sort_mpu.sh
/tool/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths
/home/zyang2/home_backup/sort_davlu_si.csh
/tool/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/configs/canis/a0/SOC/flow_scripts/sort.csh
/home/zyang2/home_backup/Mi350/Tile_SPT/spt_web_11244.pl 
/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py

/tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths -outdir $outdir -tmpdir $outdir -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?) (mp4_top_t/.*?) (dcn_top_t/.*?) (vcn_top_t/.*?) (ddrss_top_t/.*?) (ddrss_top_h_t/.*?)" $1 -limit $limit
#/tools/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sortTimingPaths -outdir $outdir -tmpdir /tmp -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?)" $1 -limit $limit

# /home/zyang2/home_backup/sort_davlu_si.csh
#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tool/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldXtiming

ls -lrt $base_dir/rpts/$TARGET_NAME/*DBG*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_DBG
ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |zgrep -v "DBG" | grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list_noDBG

/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt
/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d

#/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz

#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


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

/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/SSB_report_noDBG.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt
/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt


bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d

#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


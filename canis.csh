

# other clock no violation, all runs will auto-sort, nosp & nospflush is tuning flow, nosp to check violation.
# review _2tile
/proj/canis_pd_gfx_fct04/fct_release/FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming

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



/tool/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sort_mpu.sh
/tool/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths
/home/zyang2/home_backup/sort_davlu_si.csh
/tool/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/configs/canis/a0/SOC/flow_scripts/sort.csh
/home/zyang2/home_backup/Mi350/Tile_SPT/spt_web_11244.pl 
/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py


# sort_mpu.sh
#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <pt rpt> [limit] [outdir]"
    exit
fi

limit=100
if [ -n "$2" ]; then
    limit=$2
fi

outdir="sort"
if [ -n "$3" ]; then
    outdir=$3
fi

/tools/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths -outdir $outdir -tmpdir $outdir -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?) (mp4_top_t/.*?) (dcn_top_t/.*?) (vcn_top_t/.*?) (ddrss_top_t/.*?) (ddrss_top_h_t/.*?)" $1 -limit $limit
#/tools/aticad/1.0/src/zoo/SCBU_PD/FCT/flow/post_report/sortTimingPaths -outdir $outdir -tmpdir /tmp -groups -gzip -clockinfo -extrainfo -prefix fullchip -inst "(acp_.*?) (athub_.*?) (chnl_*) (dce_.*?) (df_.*?) (dfx_.*?) gc/(se0/gc_.*?) gc/(se1/gc_.*?) gc/(se0/*?) gc/(se1/*?) gc/(.*?) (se0/.*?) (se1/.*?) gc_top_t/gc/(.*?) gc_top_t/(se0/.*?) gc_top_t/(se1/.*?) gc_top_t/(.*?) (gc_*?) (io_usb_s5_t) (mmhub_.*?) (nbio_.*?) (oss_.*?) (stat.*?) (serdes.*?) (smu_.*?) (umc_.*?) (uvd_.*?) (vdci.*?) (usb_t_hc_0/.*?) (usb_t_hc_1/.*?) (io_t/.*?)" $1 -limit $limit
touch $outdir/fullchip.report.gz.ready

# /home/zyang2/home_backup/sort_davlu_si.csh
# /home/zyang2/home_backup/sort_davlu_si.csh
#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tool/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set base_dir = `pwd`
echo $base_dir
set date = `date | awk '{print $2$3}'`
echo $date
set day = `date +%m%d`

#set TARGET_NAME = PtFlatFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
#set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldXtiming

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

gzip rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d




##set TARGET_NAME = PtFlatFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldTiming
##set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V0CHldTiming
#set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldXtiming
#
#ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list
#foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list`)
#
#cat $CLK >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#end
#
#/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tool/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set base_dir = `pwd`
echo $base_dir
set date = `date | awk '{print $2$3}'`
echo $date
set day = `date +%m%d`

#set TARGET_NAME = PtFlatFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
#set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
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

gzip rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d




##set TARGET_NAME = PtFlatFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldTiming
##set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V0CHldTiming
#set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldXtiming
#
#ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list
#foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list`)
#
#cat $CLK >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#end
#
#/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCmanualmanualFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extraimanualnfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tool/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set base_dir = `pwd`
echo $base_dir
set date = `date | awk '{print $2$3}'`
echo $date
set day = `date +%m%d`

#set TARGET_NAME = PtFlatFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
#set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
set TARGET_NAME = PtIlmFUNCSSG0P65VRCBESTCCBEST0CSSG0P65V0CHldXtiming

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

gzip rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d




##set TARGET_NAME = PtFlatFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldTiming
##set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V0CHldTiming
#set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldXtiming
#
#ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |grep -v clock_gating_defaumanuallt_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list
#foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list`)
#
#cat $CLK >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#end
#
#/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d


#set group_list {FCLK NBIO_LCLK SOCCLK SMU_MP0CLK SMU_MP1CLK SMS_SMNCLK DCE_DCEFCLK DCE_DISPCLK DCE_DPREFCLK UMC_UCLK UVD_DCLK UVD_VCLK VCE_ECLK}
#foreach group $group_list {
#report_timing -delay_type max -nets -cap -tran -input_pins -nosplit -group $group -max_paths 500000 -unique_pins  -nworst 10 -slack_lesser_than 50 > ./davlu/$group/${group}_max.rpt.gz
#}
  #      /tool/aticad/1.0/bin/perl -w /home/djlu/Greenland/FCT/filter_pt.pl -e FCFPRep -e FCFP_AXI  $timing_report_files_nossb > rpts/$TARGET_NAME/sort_timing/report_norep_timing.rpt.gz
#
set base_dir = `pwd`
echo $base_dir
set date = `date | awk '{print $2$3}'`
echo $date
set day = `date +%m%d`

#set TARGET_NAME = PtFlatFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
#set TARGET_NAME = PtIlmFUNCSSG0P65VRCWORSTCCWORST100CSSG0P65V0CHldTiming
set TARGET_NAME = PtIlmFUNCFFG1P05VRCBESTCCBEST0CFFG1P05V0CHldXtiming

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

gzip rpts/$TARGET_NAME/SSB_report_all.rpt

bsub -P v20-pd -q regr_high -Is -R "rusage[mem=50000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*SVT08*" -outdir ./rpts/davlu/manual/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz

/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/manual/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/manual/$TARGET_NAME/fullchip.report.gz
cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncSSG0p65vRCWORST --web Main --file=- -d




##set TARGET_NAME = PtFlatFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldTiming
##set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V0CHldTiming
#set TARGET_NAME = PtIlmFUNCFFG1P05VRCWORSTCCWORST100CFFG1P05V100CHldXtiming
#
#ls -lrt $base_dir/rpts/$TARGET_NAME/*max.rpt* |grep -v clock_gating_default_max| awk '{if ($5>310) print $9}'|sort > $base_dir/rpts/$TARGET_NAME/ssb_list
#foreach CLK (`cat $base_dir/rpts/$TARGET_NAME/ssb_list`)
#
#cat $CLK >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#end
#
#/tool/aticad/1.0/bin/perl -w  /home/djlu/Greenland/FCT/filter_pt.pl -r FCFP_SSB rpts/$TARGET_NAME/si_clock_gating_default_max.rpt.gz >> rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#bsub -P v20-pd -q regr_high -Is -R "rusage[mem=20000]" -R "select[type==RHEL4_64 || type==RHEL5_64]" sortTimingPaths -extrainfo -gzip -clockinfo -params tile.params -prefix fullchip -hvt "*ur" -outdir ./rpts/davlu/$date/$TARGET_NAME/ -inst "compute_array0/\w+ compute_array1/\w+ compute_array2/\w+ compute_array3/\w+ \w+" $base_dir/rpts/$TARGET_NAME/SSB_report_all.rpt.gz
#
#/home/hhelong/createOwnershipTables.pl -nickname $TARGET_NAME -sort rpts/davlu/$date/$TARGET_NAME -rel_dir $base_dir -prefix H -path_type all rpts/davlu/$date/$TARGET_NAME/fullchip.report.gz
#cat rpts/davlu/$date/$TARGET_NAME/fullchip.report.twiki | /tool/sysadmin/scripts/twikiedit --create --modify --topic ${day}_Ilm_Si_FuncFFG1p05vRCWORST --web Main --file=- -d



# /tool/aticad/1.0/flow/TileBuilder/supra/scripts/timing/sortTimingPaths
#!/tool/aticad/1.0/bin/perl

use strict;
use warnings;
use Getopt::Long;
use File::Basename;
use FileHandle;
use Env qw(TILEBUILDER_TMPDIR FLOW_DIR);
use lib "$FLOW_DIR/util";
use ParamsDB;

# Features to add:
#
#   - nodes in both setup and hold violations - clean up formatting of output - separate into another file?
#   - better uniquification algorithm
#   - bottleneck node analysis (most fixable nodes, best bang for the buck)
#   - add top level description of what this program does and how it works
#     - also, how to add new algorithms for uniquification & how to use justify
#     - document all variables
#   - use indexes for cell and net names instead of actual names
#   - Extra info per path:
#
#       Clock skew without OCV
#       Clock OCV - remove CRPR
#       Data delay without OCV
#       Data delay OCV only
#       Lib requirement with and without OCV


# For profiling: perl -d:DProf sortTimingPaths [options]  (then dprofpp tmon.out)


# Variables for command line options
my $limit = undef;                  # Slack limit, only report paths violating by this or worse
my $limitSingleTile = undef;        # Slack limit for paths that do not touch the top level
my $pathGroupLimit = "";            # Overrides slack limits for specific TILE1.TILE2 paths
my $not_top_level_regexp = undef;   # Anything matching this is ignored in determining if a path reaches top level
my $help = 0;                       # Display usage message and exit
my $gzip = 0;                       # Set to 1 to compress sorted output files
my $ignore_header_pins = 0;         # Set to 1 to ignore pin-names in header and script considers inst-names
my $prefix = "fullchip";            # Prefix for sorted output files (prefix.TILE1.TILE2.suffix)
my $suffix = "sorted";              # Suffix for sorted output files (prefix.TILE1.TILE2.suffix)
my $outdir = ".";                   # Directory to write sorted output files and sort report file
my $tmpdir = ".";                   # Directory to write temporary files
my $instances = undef;              # List of tilenames to use for TILE1.TILE2 in sorted reports
my $showClockAndSkew = 0;           # In the report, show clock and skew instead of number of viols
my $extraPathInfo = 0;              # Get OCV/CRPR/skew/lib time/max fanout/logic levels/num HVT cells per path
my $skew_crpr = 0;                  # Apply CRPR on skew calculation
my $splitIntoPathGroups = 0;        # In output reports, have one file per path group (in addition to normal sorting)
my $minLimit = undef;               # Do not show violations with slack more negative than this number
my $maxLimit = undef;               # Do not show violations with slack more positive than this number
my $filterFile = undef;             # File with filters like filter_pt.pl to exclude or require regexps 
my $reportFile = "fullchip.report"; # Filename for main report (usually FCTREPORT)
my $paramsFile = undef;             # revrc.main file with margins to use for slack limits in different corners
my $getPathGroupFromFileName = "";  # Use the tiles in the filename to get the tile path
my $findBothSetupAndHold = 0;       # Identify cells and nets violating in both setup and hold reports
my $findWireDominatedPaths = 0;     # Find paths with a high percentage of delay caused by wire not cell delay
my $uniquify = 0;                   # Uniquify timing paths to the smallest set that will fix everything
my $algorithm = undef;              # Which uniquification algorithm to use
my $justify = 0;                    # If set to 1, justify why non-unique paths are not considered unique
my $genPlots = 0;                   # If set to 1, generate GNU plots per corner for violations
my $plotDotSize = 0.5;              # Size of plot dots.  Sometimes plots are more readable with smaller dots
my $hvt_celltype_pattern;           # Regular expression used to count HVT cells on a path
my $keep_passing_paths = 0;         # If set to 1, does not discard paths that meet timing requirements
my $borrow_time = 0;                # If set to 1, adds potentially borrowed time to slacks
my $get_corner_scaling = 0;         # If set to 1, gets scaling factors between timing corners (nets/cells)

# Consecutive node algorithm tweaks
my $num_consecutive_cells = 2;
my $num_consecutive_nodes = 4;

# Other globals
my $default_hvt_celltype_pattern = "HVT";   # Use a default since this option takes regexps and makes CSH programming difficult so you pretty much always need to include the HVT option even if it's blank
my $input_port_tilename = "IN";    # Name to use in sorted reports for top level inputs
my $output_port_tilename = "OUT";  # Name to use in sorted reports for top level outputs
my %pathGroupLimit = ();           # Hash to store the input from the path group limit option
my %paramScaling = ();             # Scaling limits from the params file
my $show_scaling = 0;
my %paramLimits = ();              # Slack limits from the params file
my %cornerLibs = ();               # Stores the library PVT for each corner (used for getting param limits)
my $global_max_limit;              # The highest of all limits (no paths better than this are ever shown)
my $global_max_limit_for_file;     # Same, except adds the specific file limit in case it's higher
my $library_time_units = "ns";     # The default library units

# Memorize the full command line options, then process them
my $ALL_OPTIONS = "";
foreach my $option (@ARGV) {
  if ($option =~ /\s/ or $option eq "" or $option =~ /\*|\?/) {
    $ALL_OPTIONS .= "\"$option\" ";
  } else {
    $ALL_OPTIONS .= $option . " ";
  }
}


# Use the TILEBUILDER_TMPDIR as the tmpdir if it is defined
if (defined $TILEBUILDER_TMPDIR and -d $TILEBUILDER_TMPDIR and -w $TILEBUILDER_TMPDIR) {
  $tmpdir = $TILEBUILDER_TMPDIR;
}


chop $ALL_OPTIONS unless ($ALL_OPTIONS eq "");
if (!GetOptions(
                "algorithm=s"                      => \$algorithm,
                "borrow"                           => \$borrow_time,
                "both_setup_and_hold"              => \$findBothSetupAndHold,
                "clockinfo"                        => \$showClockAndSkew,
                "consecutive_cells=i"              => \$num_consecutive_cells,
                "consecutive_nodes=i"              => \$num_consecutive_nodes,
                "extrainfo"                        => \$extraPathInfo,
                "skew_crpr"                        => \$skew_crpr,
                "filter=s"                         => \$filterFile,
                "groups"                           => \$splitIntoPathGroups,
                "gzip"                             => \$gzip,
                "ignore_header_pins"               => \$ignore_header_pins,
                "help"                             => \$help,
                "hvt=s"                            => \$hvt_celltype_pattern,
                "identify_path_group_by_file_name" => \$getPathGroupFromFileName,
                "instances=s"                      => \$instances,
                "justify"                          => \$justify,
                "keep_passing_paths"               => \$keep_passing_paths,
                "limit=f"                          => \$limit,
                "limit_single_tile=f"              => \$limitSingleTile,
                "max_limit=f"                      => \$maxLimit,
                "min_limit=f"                      => \$minLimit,
                "not_top=s"                        => \$not_top_level_regexp,
                "outdir=s"                         => \$outdir,
                "params=s"                         => \$paramsFile,
                "path_group_limit=s"               => \$pathGroupLimit,
                "plot"                             => \$genPlots,
                "dot_size"                         => \$plotDotSize,
                "prefix=s"                         => \$prefix,
                "report=s"                         => \$reportFile,
                "scaling"                          => \$get_corner_scaling,
                "suffix=s"                         => \$suffix,
                "tmpdir=s"                         => \$tmpdir,
                "uniquify"                         => \$uniquify,
                "wiredominated"                    => \$findWireDominatedPaths,
	       ) or $help) {
  usage();
}

if ($prefix ne "fullchip" and $reportFile eq "fullchip.report") {
  $reportFile = "$prefix.report";
}

# Make sure regexp for not top level is undefined if set to nothing
$not_top_level_regexp = undef if (defined $not_top_level_regexp and $not_top_level_regexp =~ /^\s*$/);

# Use the deault hvt pattern if it is set to nothing to get around CSH quoting nonsense
if (not defined $hvt_celltype_pattern or (defined $hvt_celltype_pattern and $hvt_celltype_pattern eq "")) {
  $hvt_celltype_pattern = $default_hvt_celltype_pattern;
}
# Clean up the hvt celltype pattern (turn * into .* if needed)
$hvt_celltype_pattern =~ s/([^.]|^)\*/$1\.\*/g;


# Set up a variable to control the number of # signs in comments to work correctly with filter_pt.pl
$justify = 0 if !$uniquify; # Nothing to justify if we're not uniquifying
my $comm = $justify ? "#" : "###"; # Set the number of comment signs to work properly with filter_pt.pl


###################################################################
#
# In top level mode,  split into 1-TILE vs 2-TILE
# In tile level mode, split into I/O vs INTERNAL
#
my $TOPLEVELMODE  = 0; # enum for mode
my $TILELEVELMODE = 1; # enum for mode
my @TOPMODETEXT = ("ALL", "1-TILE", "2-TILE", "IO");
my @TILEMODETEXT = ("ALL", "INTERNAL", "EXTERNAL");
my $MODE = (defined $instances) ? $TOPLEVELMODE : $TILELEVELMODE;
my $ALL = 0; # Used only to make code easier to read
my @MODETEXT = (defined $instances) ? @TOPMODETEXT : @TILEMODETEXT;
my @MODENUMS = (defined $instances) ? (1, 2, 3, $ALL) : (1, 2, $ALL);
print STDERR "INFO: Running in full chip mode (since used -instances option)\n" if ($MODE == $TOPLEVELMODE);
#
###################################################################



sub usage {
  print STDERR "\n\n";
  print STDERR "USAGE: ",basename($0)," [options] REPORT_FILE(S)\n\n";
  print STDERR "  -limit <number> ....................... treat paths with slack less than <number> as violations\n";
  print STDERR "  -limit_single_tile <number> ........... treat single-tile paths with slack less than <number> as violations\n";
  print STDERR "  -min_limit <number> ................... ignore paths with slack more negative than <number>\n";
  print STDERR "  -max_limit <number> ................... ignore paths with slack more positive than <number>\n";
  print STDERR "  -params <file> ........................ revrc.main file to use for getting limits from SETUP/HOLD_MARGIN params\n";
  print STDERR "  -report <file> ........................ output report filename (default \"$reportFile\")\n";
  print STDERR "  -filter <file> ........................ filter file to require or exclude paths by regexp\n";
  print STDERR "  -prefix <text> ........................ output filename prefix (default \"$prefix\")\n";
  print STDERR "  -suffix <text> ........................ output filename suffix (default \"$suffix\")\n";
  print STDERR "  -outdir <path> ........................ output file directory (default \"$outdir\")\n";
  print STDERR "  -tmpdir <path> ........................ temporary file directory (default \"$tmpdir\")\n";
  print STDERR "  -gzip ................................. gzip sorted files\n";
  print STDERR "  -ignore_header_pins ................... ignore pin-names in timing-path header\n";
  print STDERR "  -instances <inst1 inst2 ...>   ........ start and endpoint instances (if set, script uses full chip mode)\n";
  print STDERR "  -uniquify ............................. uniquify timing paths\n";
  print STDERR "  -justify .............................. justify why paths are considered unique or not\n";
  print STDERR "  -keep_passing_paths ................... do not discard paths that meet timing (based on limits and margins)\n";
  print STDERR "  -plot ................................. generate gnu plots per corner for unique violations\n";
  print STDERR "  -dot_size.............................. dot size to use when generating gnu plots (default 0.5)\n";
  print STDERR "  -clockinfo ............................ show Clock and Skew instead of Total and Met\n";
  print STDERR "  -groups ............................... split report files into path groups (SCLK, MCLK, etc)\n";
  print STDERR "  -both_setup_and_hold .................. find nodes violating both setup and hold timing\n";
  print STDERR "  -wiredominated ........................ find paths with a high percentage of wire delay over cell delay\n";
  print STDERR "  -scaling .............................. get net/cell delay scaling factors between timing corners\n";
  print STDERR "  -extrainfo ............................ report skew, max fanout, HVT cell count, etc per path\n";
  print STDERR "  -borrow ............................... add potentially borrowed time to slacks when borrowing info present\n";
  print STDERR "  -skew_crpr ............................ apply CRPR on skew calculation\n";
  print STDERR "  -hvt <regexp> ......................... cell type pattern to use for detecting HVT cells (default \"hvt\")\n";
  print STDERR "  -path_group_limit <string> ............ per-path_group limit which overerrides -limit or -limit_single_tile for the path groups\n";
  print STDERR "  -identify_path_group_from_filename .... when using -path_group_limit, identify path's pathgroup by the name of the file that,\n";
  print STDERR "                                          it's in, rather than by the \"Path Group\" field.  Filename must have the form\n";
  print STDERR "                                          <path>/something.path_group.something, ie /path/to/file/timing_paths.IO_MCLKA.rpt\n";
  print STDERR "                                          specified in <string>.  Format of <string> is: 'path_group:limit path_group:limit ...'\n";
  print STDERR "\n  -algorithm <function_name> ............ specify which algorithm to use for uniquification\n";
  print STDERR "               \"worst_slack_per_cell\" ... unique = has the worst slack for cells (considers endpoints for hold)\n";
  print STDERR "                \"worst_slack_per_net\" ... unique = has the worst slack for  nets (considers endpoints for hold)\n";
  print STDERR "     \"worst_slack_per_start_end_pair\" ... unique = has the worst slack for startpoint/endpoint pair (matches algorithm used for gnuplots)\n";
  print STDERR "                  \"consecutive_nodes\" ... backwards compatible with sort_and_uniquify (consecutive notes/nets)\n";
  print STDERR "                  \"consecutive_cells\" ... like consecutive_nodes but ignores nets\n";
  print STDERR "\n  Special options for uniquification algorithms:\n";
  print STDERR "       -consecutive_nodes <number> ...... number of identical consecutive cells+nets to make a path non-unique\n";
  print STDERR "       -consecutive_cells <number> ...... number of identical consecutive cells to make a path non-unique\n";
  print STDERR "\n";

  exit;
}


if (! -d $outdir) {
  my $rc = system("mkdir --parents $outdir");
  if ($rc) {
    die "ERROR: Can't create directory $outdir"
  }
}

if (! -d $tmpdir) {
  die "ERROR: Temp dir \"$tmpdir\" does not exist\n";
}

# If the temp dir is not writable, try the outdir and spit out an error
if (1) {
  my $testfile = "$tmpdir/test_file_to_see_if_dir_is_writable";
  my $good = 1;
  open TEST, ">$testfile" or $good = 0;
  close TEST;
  if (!$good) {
    print STDERR "WARNING: Temp dir \"$tmpdir\" is not writable, so using outdir \"$outdir\" instead\n";
    $tmpdir = $outdir;
  } else {
    `rm $testfile`;
  }

  $testfile = "$outdir/test_file_to_see_if_dir_is_writable";
  $good = 1;
  open TEST, ">$testfile" or $good = 0;
  close TEST;
  if (!$good) {
    die "ERROR: Output directory \"$outdir\" is not writable!\n";
  } else {
    `rm $testfile`;
  }

}

#Copy $limit to $limitSingleTile if not specified in options
$global_max_limit = (defined $limit) ? $limit : 0;
if (defined $limit) {
  print STDERR "WARNING: Using -limit option overrides limits from params file (-paramsFile option)\n" if (defined $paramsFile);
  print STDERR "WARNING: Using -limit option overrides path group limit option\n" if ($pathGroupLimit);
}
if (!defined $limitSingleTile) {
  $limitSingleTile = (defined $limit) ? $limit : 0;
} else {
  print STDERR "WARNING: Using -limitSingleTile option overrides limits from params file (-paramsFile option)\n" if (defined $paramsFile);
  print STDERR "WARNING: Using -limitSingleTile option overrides path group limit option\n" if ($pathGroupLimit);
}

$global_max_limit = $maxLimit if (defined $maxLimit and $maxLimit < $global_max_limit);


if ($pathGroupLimit and not defined $limit) {
  print STDERR "WARNING: path group limit option overrides limits from params file (-paramsFile option)\n" if (defined $paramsFile);
  foreach my $pair (split(' ', $pathGroupLimit)) {
    my ($pathGroup, $limitValue) = split(':', $pair);
    $pathGroupLimit{$pathGroup} = $limitValue;
    $global_max_limit = $limitValue if ($limitValue > $global_max_limit);
  }
}



# Set the uniquification function (and make sure a legal one was chosen)
my $uniquify_data_gather_function;
my $uniquify_function;
my $uniquify_type;
if ($uniquify) {
  if (not defined $algorithm) {
    $algorithm = "consecutive_nodes"; # Use old style as default (from sort_and_uniquify)
  }

  if ($algorithm eq "worst_slack_per_cell") {
    $algorithm = "worst_slack_per_cell";
    $uniquify_function             = \&uniquify_worst_slack_per;
    $uniquify_data_gather_function = \&data_gather_worst_slack_per_cell;
    $uniquify_type = 0;
  } elsif ($algorithm eq "worst_slack_per_net") {
    $uniquify_function             = \&uniquify_worst_slack_per;
    $uniquify_data_gather_function = \&data_gather_worst_slack_per_net;
    $uniquify_type = 1;
  } elsif ($algorithm eq "worst_slack_per_start_end_pair") {
    $uniquify_function             = \&uniquify_worst_slack_per;
    $uniquify_data_gather_function = \&data_gather_worst_slack_per_start_end_pair;
    $uniquify_type = 2;
  } elsif ($algorithm eq "consecutive_cells") {
    $uniquify_function             = \&uniquify_consecutive_cells;
    $uniquify_data_gather_function = \&data_gather_consecutive_cells;
  } elsif ($algorithm eq "consecutive_nodes") {
    $uniquify_function             = \&uniquify_consecutive_nodes;
    $uniquify_data_gather_function = \&data_gather_consecutive_nodes;
  } else {
    print STDERR "\nERROR: Algorithm \"$algorithm\" is not supported for uniquification";
    &usage();
  }
  print STDERR "INFO: Setting uniquification function to \"$algorithm\"\n";
}


# Parse the params file (if provided) to find slack margins.  The priority order for slack margins is:
#
# 1. Specific corner margin (TIMING_PtTimIlmDtyHldFunc1p1vcbest0cff1p21v0cHld_HOLD_MARGIN = 0.050)
# 2. Specific si library margin (TIMING_HOLD_ff0p99v0c_MARGIN = 0.030) (si reports only)
# 3. Default si margin (TIMING_SETUP_MARGIN = 0.000) (si reports only)
# 4. Specific library margin (TIMING_HOLD_ff0p99v0c_MARGIN = 0.030)
# 5. Default margin (TIMING_SETUP_MARGIN = 0.000)
# 6. Command line margin (from -limit option)
#
if (defined $paramsFile) {
  die "ERROR: Params file \"$paramsFile\" does not exist\n" if (not -e $paramsFile);
  my @output = ();
  my %Params = %{ParamsDB::dbget_all()->getParamsHash()};
  my @keys = keys %Params;

  if (not defined $limit) {
    my @lines = grep { /^TIMING_.*(SETUP|HOLD)_.*MARGIN$/ } @keys;
    foreach my $line (@lines) {
      my $value = $Params{$line};#$$paramsDb->getValue("params", $line);
      if ($line =~ /^TIMING_(.*)_MARGIN$/) {
        my $param = $1;
        my $setup_or_hold = ($param =~ /HOLD/i) ? "hold" : "setup";
        if ($param =~ /(Pt[^_]+)_/) {
          my $corner = $1;
          $paramLimits{$setup_or_hold}{$corner} = $value;
          push @output, "INFO: Slack margin for $setup_or_hold corner \"$corner\" is $value\n";
        } elsif ($param =~ /^DEFAULT_(SETUP|HOLD)$/i) {
          $paramLimits{$setup_or_hold}{"DEFAULT"} = $value;
          push @output, "INFO: Default slack margin for $setup_or_hold is $value\n";
        } elsif ($param =~ /^DEFAULT_SI_(SETUP|HOLD)$/i) {
          $paramLimits{$setup_or_hold}{"DEFAULT_SI"} = $value;
          push @output, "INFO: Default slack margin for Si $setup_or_hold is $value\n";
        } elsif ($param =~ /^DEFAULT_(SETUP|HOLD)_(\S+)$/i) {
          $paramLimits{$setup_or_hold}{"LIB:$2"} = $value;
          push @output, "INFO: Default slack margin for $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^DEFAULT_SI_(SETUP|HOLD)_(\S+)$/i) {
          $paramLimits{$setup_or_hold}{"LIB_SI:$2"} = $value;
          push @output, "INFO: Default slack margin for Si $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^(SETUP|HOLD)$/i and not defined $paramLimits{$setup_or_hold}{"DEFAULT"}) {
          $paramLimits{$setup_or_hold}{"DEFAULT"} = $value;
          push @output, "INFO: Default slack margin for $setup_or_hold is $value\n";
        } elsif ($param =~ /^SI_(SETUP|HOLD)$/i and not defined $paramLimits{$setup_or_hold}{"DEFAULT_SI"}) {
          $paramLimits{$setup_or_hold}{"DEFAULT_SI"} = $value;
          push @output, "INFO: Default slack margin for Si $setup_or_hold is $value\n";
        } elsif ($param =~ /^(SETUP|HOLD)_(\S+)$/i and not defined $paramLimits{$setup_or_hold}{"LIB:$2"}) {
          $paramLimits{$setup_or_hold}{"LIB:$2"} = $value;
          push @output, "INFO: Default slack margin for $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^SI_(SETUP|HOLD)_(\S+)$/i and not defined $paramLimits{$setup_or_hold}{"LIB_SI:$2"}) {
          $paramLimits{$setup_or_hold}{"LIB_SI:$2"} = $value;
          push @output, "INFO: Default slack margin for Si $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^Sort/ or $param !~ /Pt/) {
          # Ignore sort targets, other Pt targets
        } else {
          print STDERR "INFO: Ignoring timing margin param from: $line";
        }
      } else {
        print STDERR "WARNING: Can't parse MARGIN limit from revrc.main from this line: $line";
      }
    }
  }
  if (1) {
    my @lines = grep { /^TIMING_.*_(SETUP|HOLD)_.*SCALING$/ } @keys;
    foreach my $line (@lines) {
      my $value = $Params{$line};#$paramsDb->getValue("params", $line);
      if ($line =~ /^TIMING_(.*)_SCALING$/) {
        my $param = $1;
        my $setup_or_hold = ($param =~ /HOLD/i) ? "hold" : "setup";
        if ($param =~ /(Pt[^_]+)_/) {
          my $corner = $1;
          $paramScaling{$setup_or_hold}{$corner} = $value;
          push @output, "INFO: Scaling factor for $setup_or_hold corner \"$corner\" is $value\n";
        } elsif ($param =~ /^DEFAULT_(SETUP|HOLD)$/i) {
          $paramScaling{$setup_or_hold}{"DEFAULT"} = $value;
          push @output, "INFO: Default scaling factor for $setup_or_hold is $value\n";
        } elsif ($param =~ /^DEFAULT_(SETUP|HOLD)_(\S+)$/i) {
          $paramScaling{$setup_or_hold}{"LIB:$2"} = $value;
          push @output, "INFO: Default scaling factor for $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^(SETUP|HOLD)$/i and not defined $paramScaling{$setup_or_hold}{"DEFAULT"}) {
          $paramScaling{$setup_or_hold}{"DEFAULT"} = $value;
          push @output, "INFO: Default scaling factor for $setup_or_hold is $value\n";
        } elsif ($param =~ /^(SETUP|HOLD)_(\S+)$/i and not defined $paramScaling{$setup_or_hold}{"LIB:$2"}) {
          $paramScaling{$setup_or_hold}{"LIB:$2"} = $value;
          push @output, "INFO: Default scaling factor for $setup_or_hold library \"$2\" is $value\n";
        } elsif ($param =~ /^Sort/) {
          # Ignore sort targets
        } else {
          print STDERR "Warning: Could not figure out what to do with timing scaling param: $line";
        }
      } else {
        print STDERR "WARNING: Can't parse SCALING limit from revrc.main from this line: $line";
      }
    }
  }
  if (exists($Params{LIBRARY_TIME_UNITS}) and defined($Params{LIBRARY_TIME_UNITS})) {
    $library_time_units = $Params{LIBRARY_TIME_UNITS};
  }
  if (0 and @output) {
    foreach my $line (sort {length($a) <=> length($b) or $a cmp $b} @output) {
      print STDERR $line;
    }
  }
  
  my @lines = grep { /^INPUT_LIBNAME/ } @keys;
  foreach my $line (@lines) {
    next if ($line =~ /^(Sort|PtGen)/ or $line !~ /Pt/);
    if ($line =~ /^INPUT_LIBNAME_(.+)$/) {       
        $cornerLibs{$1} = $Params{$line};#$paramsDb->getValue("params", $line);
      #print STDERR "DEBUG: Corner for $1 = $Params{$line}\n";
    } else {
      print STDERR "Warning: Could not figure out LIBNAME for timing target from line: $line";
    }
  }
}



# Variables for reporting use
my ($worst,$tot,$met,$viol,$path,$clock,$skew,$tns,$wtns);

# Memorize hierarchies that were provided as regexp's in -instances option
# core/* gets turned into core/(.*?)
# For multi-hierarchies, you can do something like this:  -instances "core/(compute_array./.*?) core/(.*?)"
# Whatever is in parentheses gets captured as the tile.  Slashes get turned into colons.
my @tilePatterns = ();
my %foundPatterns = (); # Prevent duplicates in the array but preserve ordering from the command line
my %tileLengths = (); # Hash for quick lookups of previously found tiles
my @sorted_tileLengths = (1); # Array to sort tile lengths from shortest to longest
my %reverseTileMap = (); # For finding out the hierarchy used to get a tile name
my %tiles = (); # Hash of tiles previously found
if ($MODE == $TOPLEVELMODE and defined $instances) {
  foreach my $pattern (split /\s+/, $instances) {
    $pattern = "core/*" if ($pattern =~ /^core\/[A-Za-z0-9_]+$/); # Handle old tile instance lists
    $pattern = "ucore/*" if ($pattern =~ /^ucore\/[A-Za-z0-9_]+$/); # Handle old tile instance lists
    $pattern = "io/*" if ($pattern =~ /^io\/io_[A-Za-z0-9_]+$/); # Handle old tile io instance lists
    $pattern =~ s/\/\*/\/\(\.\*\?\)/g; # Turn /* into /(.*?) so "core/*" becomes "core/(.*?)"
    $pattern = "^" . $pattern if ($pattern !~ /^\^/);  # Prepend the begin-of-line-match thing
    $pattern = $pattern . "\/" if ($pattern !~ /\/$/); # Stick a slash at the end
    $pattern = "(" . $pattern . ")" if ($pattern !~ /\(.*\)/);
    push @tilePatterns, $pattern unless exists $foundPatterns{$pattern};
    $foundPatterns{$pattern} = 1; # Prevent duplicates in the array but preserve ordering from the command line
  }
}

# Add the outdir path to the report file if the filename has no path info already
if ($reportFile !~ /\//) { 
  $reportFile = "$outdir/$reportFile";
}


############################################################################
#
# The old method used seek pointers to store locations in the input file
# to later go back and print paths in worst-to-best order.  Since gunzipping
# was taking incredibly long due to huge report files, this has been
# rewritten with this new method:
#
# Cache each timing path in local memory.  Parse it to figure out all the
# interesting bits.  Immediately write it out to the appropriate binned
# file (sorted TILE.TILE files), except with ".tmp" added.  Once the entire
# report is parsed and binned, go back and sort them.  Speed this up by
# tracking line numbers and slack amounts when the tmp files are written.
#
############################################################################

if (@ARGV) {
  my $rpt = $gzip ? "| gzip -c > $reportFile.gz" : ">$reportFile";
  open REPORT, $rpt or die "ERROR: Can't open report file `$reportFile'\n";
} else {
  &usage;
}

# Print the report header
&print_report_header();


##############################################
# Globals used for uniquification algorithms #
##############################################

# All algorithms
my %unique = ();  # Tells if path [filenum,linenum] is unique or not
my %justify = (); # Tells why path [filenum,linenum] is unique or not
my %unique_count = (); # Statistics about number of unique paths
my %unique_stats = (); # Statistics about unique paths ($wns, $wtns, $tns, $wmargin)
my $INDEX_WNS     = 0;
my $INDEX_WTNS    = 1;
my $INDEX_TNS     = 2;
my $INDEX_WMARGIN = 3;

my %cellNameIndex = ();
my $cellNameIndexCount = 0;
my @cellNameList = ();

my %netNameIndex = ();
my $netNameIndexCount = 0;
my @netNameList = ();

# Worst consecutive cell/node algorithms
my %worstConsecutiveCellPath = ();
my %worstConsecutiveCellTNS = ();
my %consecutiveSegments = ();

# Worst slack per cell/net algorithms
my %worstTNSbyIndex = ();
my %worstTNSfilenum = ();
my %worstTNSlinenum = ();
my %numPathsByIndex = ();
my %totalTNSbyIndex = ();
my %isIndexEndpoint = ();
my %numItemsPerPath = ();
my %violatingPathsWithIndex = ();


#
##############################################


# General globals
my %totalcount = ();
my %NumTilesForPath = ();
my %violationcount = ();
my %ignorecount = ();
my %skewOfWorst = ();
my %TNSOfWorst = ();
my %WNSOfWorst = ();
my %PreviousTNS = ();
my %clockOfWorst = ();
my %TNSOutOfOrder = ();
my %fh = (); # File handle hash for sorted reports
my %filename = (); # Hash of file names for sorted reports
my %pathdata = (); # Slack and line numbers of "unsorted" sorted reports

# Assign path ID numbers to paths
my $filenum_letter = "A";
my @perFile_letter  = ();
my @perFile_counter = ();


# Track the number of violations per corner and worst start/endpoints per corner
my @violsPerFile = ();
my %StartpointEndpoint = (); # Hash of array with worst violation and which file
my %sp_ep_worst_corner = (); # Hash of whether or not this corner has the worst margined slack for this sp/ep
my %sp_ep_not_unique   = (); # Hash of whether or not this sp/ep was found in more than one file
my %StartEndPoints = ();
my $StartEndPointsCounter = -1;
my $startpoint_id;
my $endpoint_id;
my %numberOfFile = ();

# Variables for cells and nets in both setup and hold
my @cellTNS = ();
my @netTNS = ();
my @SLACK = ();
my @pathCells = ();
my @pathNets = ();

# Variables for wire dominated stats
my %wireDominatedStats = ();
my $wireDomMaxPaths = 1000;   # Only show the top N paths with the highest net to cell delay ratios
my $wireDomMinRatio = 0.30;   # Only show paths with a net to cell delay ratio higher than this

# Variables to hold extra path info
my %extraPathInfo = ();
my @extraPathText = ("Max Fanout  ", "Logic Levels", "HVT Cells   ", "Clock Skew  " );   # Extra info text description


# Variables to get corner scaling factors
my %corner_celldelay = ();
my %corner_celltype = ();
my %corner_netdelay = ();


# Store the worst time for various categories:
#   o  "ALL" = worst of all paths
#   o  "TILE_TILE"  = worst for a specific path
my @worst = ();
my @best = ();
my @wtns = ();

my $in_path = 0;
my @numPathsByBin = ();
my @numViolatorsByBin = ();
my @pathclock = ();
my @pathskew = ();

my $starttile = "";
my $endtile = "";
my $startpoint = "";
my $endpoint = "";
my $endpoint_regexp;
my $startpoint_regexp;
my $startpoint_found_counter;
my $startpoint_equals_endpoint;
my $tile = "";
my $count = 0;
my $pathClock;
my $launchInsDly;
my $crp = 0;
my $captureInsDly;
my $launchEdge;
my $captureEdge;
my @cache;
my $pathGroup = "";
my $is_hold = 0;
my $is_input = 0;
my $is_output = 0;
my $is_unclocked_path = 0; # For paths constrained by set_min_delay and set_max_delay, there is no clock, and hence no skew
my @filenames = ();
my @cornernames = ();
my $filecounter = -1;
my $path_begin_line;   # First line after launch clock path
my $path_end_line;     # Last line of actual data path
my $capture_last_line; # Last line of capture clock path to get capture insertion delay
my $found_endpoint = 0;
my $found_pathgroup = 0;
my $found_minmax = 0;
my $found_arrival_time = 0;
my $skip_one_ins_dly;
my $launchSkipInsDly = 0;
my $captureSkipInsDly = 0;
my @margin = (); # Timing margin pre file number
my $margin = 0; # Timing margin for this corner
my @scaling = (); # Timing scaling pre file number
my $scaling = 1;  # Timing scaling for this corner
my $reason;
my $reason_scaling;

# Plotting data (for gnuplot charts)
my %plotData = (); # $plotData{$clock}{$endpoint}{$startpoint}{$filenum} = $tns


my $num_files = scalar(@ARGV);
my $reportNumPerCorner = 1; #($num_files > 1);

&usage if (!$num_files);

foreach my $file (@ARGV) {
  $filecounter++;
  $filenames[$filecounter] = $file;
  $numberOfFile{$file} = $filecounter;
  $cornernames[$filecounter] = $file;
  $cornernames[$filecounter] =~ s/^.*?(Pt[^\/]+).*?$/$1/;  # Get rid of "rpts/" and "/report_timing.rpt.gz"
  $cornernames[$filecounter] =~ s/\..*//;                     # Get rid of ".gz" and ".rpt"

  # Get an index letter for building IDs for this file
  $perFile_letter[$filecounter] = $filenum_letter;
  $perFile_counter[$filecounter] = 0;
  $filenum_letter++;

  # Get the margin for this file (might end up being the default from -limit option)
  ($margin,$reason) = GetSlackMarginForFile($file);
  $margin[$filecounter] = $margin;
  # Get the scaling for this file (might end up being the default from -limit option)
  ($scaling,$reason_scaling) = GetScalingForFile($file);
  $scaling[$filecounter] = $scaling;

  # Any path with a higher slack than this variable will be completely ignored
  $global_max_limit_for_file = ($global_max_limit > $margin) ? $global_max_limit : $margin;
  $global_max_limit_for_file = $maxLimit if (defined $maxLimit and $maxLimit < $global_max_limit_for_file);


  if ($getPathGroupFromFileName) {
    if ($file =~ /timing_paths\.([^\.\-]+)\.rpt$/) {
      $pathGroup = $1;
    } elsif ($file =~ /timing_paths\.([^\.\-]+)-.*\.rpt$/) {
      $pathGroup = $1;
    } else {
      die "ERROR: Can't identify path group from filename '$file'\n";
    }
  }

  if (not -e $file) {
    print STDERR "ERROR: File does not exist: $file (skipping)\n";
    next;
  }

  die "ERROR: Filter file does not exist: $filterFile (exiting)\n" if (defined $filterFile and ! -e $filterFile);

  if (defined $filterFile) {
    open FILE, "filter_pt.pl -f $filterFile $file|" or die "ERROR: Can't filter $file with filter_pt.pl -f $filterFile (is filter_pt.pl in your path?)\n";
  } elsif (`file -L $file` =~ /gzip compressed/) {
    open FILE, "gunzip -c $file|" or die "ERROR: Can't gunzip $file\n";
  } else {
    open FILE, "<$file" or die "ERROR: Can't read $file\n";
  }
  print STDERR "INFO: Parsing $file \tslack margin is $margin ($reason), \tscaling is $scaling ($reason_scaling)\n";

  my $linecount = 0;
  $in_path = 0;
  my $startline;
  my $look_for_unused_borrow_time = 0;
  my $found_header = 0;
  my $path_cnt = 0;
  while (<FILE>) {
    $linecount++;
    if (!$in_path) {
        if (!$found_header and /^\s*Report\s*\:\s*timing/) {
            $found_header = 1;
        }
      if (/^\s*Startpoint/) {
          ++$path_cnt;
        $in_path++;
        @cache = ($_);
        $startline = $linecount;
        $look_for_unused_borrow_time = 0;
      }
    } else {
      if (/^\s*slack \((?:MET|VIOLATED).*\)(\s+\S+\s+\S+)?\s+(\S+)\s*$/) {
        my $this_slack = $2;


        # If time borrowing information was found, look for extra slack not used
        # and add it to the given slack.  Do this before comparing against global
        # limits to make sure things with plenty of slack get ignored properly.
        if ($look_for_unused_borrow_time) {

          push @cache, $_;  # Store this otherwise it would be lost

          my $found_max = 0;
          my $found_actual = 0;
          my $borrow_max;
          while (<FILE>) {
            $linecount++;
            push @cache, $_;
            if (!$found_max and /^\s*max time borrow\s+(\S+)/) {
              $found_max = 1;
              $borrow_max = $1;
            } elsif (!$found_actual and /^\s*actual time borrow\s+(\S+)/) {
              $found_actual = 1;
              $this_slack = $this_slack + $borrow_max - $1;
              last;
            } elsif (/^\s*Startpoint/) {
              die "ERROR: At line $linecount of file \"$file\", could not find borrowing information (found next startpoint instead)\n";
            }
          }
          if (!$found_max or !$found_actual) {
            die "ERROR: At line $linecount of $file \"$file\", hit EOF before finding borrowing information\n";
          }
        }


        # Compare to global max limit to see if this path can be dropped immediately
        my $skip_path = 0;

        if ((defined $minLimit and ($this_slack <= $minLimit)) or
            (defined $maxLimit and ($this_slack >= $maxLimit))) {
          # Even if we're keeping passing paths, never show anything outside these 2 limits
          $skip_path = 1;
        } elsif (!$keep_passing_paths and ($this_slack >= $global_max_limit_for_file)) {
          # Ignore this path since it has more slack than all known limits
          $skip_path = 2;
        }

        if ($skip_path) {
          # Record the path for stats, but don't parse it
          $numPathsByBin[1]++;   # Assume INTERNAL/1-TILE to avoid wasting time figuring it out
          $numPathsByBin[$ALL]++;

          # Reset path cache and status of being in a path or not
          @cache = ();
          $in_path = 0;

        } else {
          push @cache, $_ unless $look_for_unused_borrow_time;

          # ProcessPath(FILENUM, LINE_NUM_IN_FILE, ARRAY_OF_PATH_DATA, SLACK)
          ProcessPath($filecounter, $startline, \@cache, $this_slack);
          $in_path = 0;
        }

      } elsif ($borrow_time and /^\s*time borrowed from endpoint/) {
        # Make a note to look for time borrowing extra slack
        $look_for_unused_borrow_time = 1;
        push @cache, $_;

      } else {
        push @cache, $_;
      }
    }
  }
  if (!$found_header) {
      if ($path_cnt) {
          #Do nothing for now
          #warn "\nWARNING: file \"$file\" had no header but did have timing paths\n";
      } else {
          warn "\nERROR: file \"$file\" appears corrupted and contained no paths nor header information\n";
      }
  }
  close FILE;

} # foreach file



if ($uniquify) {
  # Call uniquification function - using global variables, sets entries in the %unique hash
  # for each path by file number and line number.  If set to 1, the path is unique.  If not
  # exists for the path or set to 0, the path is not unique:  $unique{$filenum}{$linenum} = ?
  &{$uniquify_function};
}



# Once all files are parsed and all unordered paths are printed, go through each tile path
# report and re-sort it to be ordered if necessary, or just copy it if already ordered.
my %GrpFiles;
my %GrpFileMap;
my $grpfile;
my $justify_text;
my $sp_ep_worst_in_corner_text;
my $skip_path;
foreach my $tilepath (sort keys %pathdata) {
  %GrpFiles = ();
  %GrpFileMap = ();

  # Skipping the sort means losing the justify text and the worst-in-corner text, so above was commented
  if (1) {
    $fh{$tilepath}->close(); # Close the file
    #print STDERR "$tilepath has $needs_sort out of order paths, needs sort\n";

    $fh{"$tilepath.read"} = new FileHandle;
    $fh{"$tilepath.read"}->open("<$tmpdir/$filename{$tilepath}.unordered") or die "ERROR: Can't read temp file $tmpdir/$filename{$tilepath}.unordered\n";
    if ($gzip) {
      $fh{$tilepath}->open("| gzip -c > $outdir/$filename{$tilepath}.gz") or die "ERROR: Can't write $outdir/$filename{$tilepath}.gz\n";
    } else {
      $fh{$tilepath}->open(">$outdir/$filename{$tilepath}") or die "ERROR: Can't write $outdir/$filename{$tilepath}\n";
    }

    # Sorted by worst TNS followed by position in file
    foreach my $data (sort {$a->[2] <=> $b->[2] or $a->[4] <=> $b->[4] or $a cmp $b}  @{$pathdata{$tilepath}}) {
      my ($filenum,$linenum,$tns,$slack,$seek_pos,$numlines,$pathGroup,$is_hold,$start_id,$end_id);

      $skip_path = 0;

      if ($splitIntoPathGroups) {
        ($filenum, $linenum, $tns, $slack, $seek_pos, $numlines, $is_hold, $start_id, $end_id, $pathGroup) = @{$data};
      } else {
        ($filenum, $linenum, $tns, $slack, $seek_pos, $numlines, $is_hold, $start_id, $end_id) = @{$data};
      }
      #print STDERR "  path with slack $slack at byte $seek_pos with $numlines lines\n";

      if ($uniquify) {
        # Print the justification text for the path if it exists
        if ($justify) {
          if (exists $justify{$filenum}{$linenum}) {
            $justify_text = &{$justify{$filenum}{$linenum}->[0]}($filenum,$linenum,$tns,$slack,@{$justify{$filenum}{$linenum}->[1]});
          } else {
            $justify_text = undef;
          }
        }

        # Catch non-unique paths, simply skipping them here unless unique is set to 1
        if (not exists $unique{$filenum}{$linenum} or !$unique{$filenum}{$linenum}) {
          #print STDERR "Skipping non-unique path at line $linenum of $filenames[$filenum]\n";
          $skip_path = 1;
        }

      }


      # Also write to the split up file if splitting into path groups was requested
      if ($splitIntoPathGroups) {
        if (exists $GrpFileMap{$pathGroup}) {
          $grpfile = $GrpFileMap{$pathGroup};
        } else {
          $grpfile = $filename{$tilepath};
          $grpfile =~ s/$prefix\./$prefix\.Grp\.$pathGroup\./;
          die "ERROR: Group file should not be the same as the normal file" if ($grpfile eq $filename{$tilepath});
          $GrpFileMap{$pathGroup} = $grpfile;
        }
        if (not exists $GrpFiles{$grpfile}) {
          $GrpFiles{$grpfile} = 1;
          $fh{$grpfile} = new FileHandle;
          if ($gzip) {
            $fh{$grpfile}->open("| gzip -c > $outdir/$grpfile.gz") or die "ERROR: Can't write $outdir/$grpfile.gz";
          } else {
            $fh{$grpfile}->open(">$outdir/$grpfile") or die "ERROR: Can't write $outdir/$grpfile";
          }
        }
      }

      # Print the justify text if needed
      if ($justify and defined $justify_text) {
        $fh{$tilepath}->print($justify_text);
        if ($splitIntoPathGroups) {
          $fh{$grpfile}->print($justify_text);
        }
      }

      if ($uniquify or $splitIntoPathGroups) {
        # Track unique and non-unique path counts, plus WNS an TNS for:
        #
        #   o main groups: ALL, 1-TILE/2-TILE or IO/INTERNAL
        #   o setup vs hold
        #   o path groups
        #
        #print STDERR "===\n";

        foreach my $a ($ALL, ($skip_path+1)) {
          foreach my $b ($ALL, $NumTilesForPath{$tilepath}) {
            foreach my $c ($ALL, ($is_hold+1)) {
              my @d = ($ALL);
              push @d, $pathGroup if $splitIntoPathGroups;
              foreach my $d (@d) {
                $unique_count{$d}[$c][$b][$a]++; # {group}[is_hold][num_tiles][unique?]
                if (not defined $unique_stats{$d}[$c][$b][$a][$INDEX_WTNS] or ($tns < $unique_stats{$d}[$c][$b][$a][$INDEX_WTNS])) {
                  $unique_stats{$d}[$c][$b][$a][$INDEX_WNS]   = $slack;
                  $unique_stats{$d}[$c][$b][$a][$INDEX_WTNS]  = $tns;
                  my $marg = ($slack-$tns);
                  $unique_stats{$d}[$c][$b][$a][$INDEX_WMARGIN] = $marg;
                }
                my $this_tns = ($tns < 0) ? $tns : 0;
                $unique_stats{$d}[$c][$b][$a][$INDEX_TNS] += $this_tns;
              }
            }
          }
        }
      }

      # For runs with >1 file, tell if the path was unique to this file and if it was the worst in this file
      if ($num_files > 1) {
        if ($sp_ep_worst_corner{$filenum}{$linenum}) {
          $sp_ep_worst_in_corner_text = "This is the worst corner for this startpoint and endpoint";
          if (exists $sp_ep_not_unique{$filenum}{$linenum}) {
            $sp_ep_worst_in_corner_text .= " but it appears in other corners";
          } else {
            $sp_ep_worst_in_corner_text .= " and it is unique to this corner";
          }

        } else {
          my ($other_slack, $other_filenum, $other_linenum, $other_tns) = @{$StartpointEndpoint{$is_hold}{$start_id}{$end_id}};
          if ($other_filenum == $filenum) {
            $sp_ep_worst_in_corner_text = "This startpoint/endpoint appears above with a higher violation, and is worse in this corner than other corners";
          } else {
            my $other_corner_name = $cornernames[$other_filenum];
            $sp_ep_worst_in_corner_text = "This startpoint/endpoint is worse in $other_corner_name with slack of $other_slack and tns of $other_tns (at line $other_linenum)";
          }
        }
      }

      # Skip outputting the actual path if it's non unique
      if ($skip_path and $num_files > 1) {
        $fh{$tilepath}->print("# $sp_ep_worst_in_corner_text\n");
        $fh{$grpfile}->print("# $sp_ep_worst_in_corner_text\n") if ($splitIntoPathGroups);
        next;
      } elsif ($skip_path) {
        next;
      }

      $fh{"$tilepath.read"}->seek($seek_pos,0);
      for (my $x=0; $x<=$numlines; $x++) {
        if ($num_files > 1 and $x==1) {
          # Insert worst-in-corner text after the first line
          $fh{$tilepath}->print("# $sp_ep_worst_in_corner_text\n");
          $fh{$grpfile}->print("# $sp_ep_worst_in_corner_text\n") if ($splitIntoPathGroups);
        }

        my $t = $fh{"$tilepath.read"}->getline();
        $fh{$tilepath}->print($t);
        $fh{$grpfile}->print($t) if ($splitIntoPathGroups);
      }
      $fh{$tilepath}->print("\n");
      $fh{$grpfile}->print("\n") if ($splitIntoPathGroups);

    } # foreach my $data

    $fh{$tilepath}->print("\n# EOF\n");
    $fh{$tilepath}->close();
    $fh{"$tilepath.read"}->close();
    if (-e "$tmpdir/$filename{$tilepath}.unordered") {
      `rm $tmpdir/$filename{$tilepath}.unordered`;
    }
  }

  # Gzip sorted file if called for in command line options
  if ($gzip) {
    if (-e "$outdir/$filename{$tilepath}") {
      print STDERR "INFO: Compressing $outdir/$filename{$tilepath}\n";
      system("gzip --force $outdir/$filename{$tilepath}");
    }
  }

  if (%GrpFiles) {
    foreach my $file (sort keys %GrpFiles) {
      $fh{$file}->print("\n# EOF\n");
      $fh{$file}->close();
      if ($gzip) {
        if (-e $file) {
          print STDERR "INFO: Compressing $file\n";
          system("gzip --force $file");
        }
      }
    }
  }

}


# Create empty files (with EOF comment) for anything that might be a vovoutput or needed by metrics
if ($MODE == $TILELEVELMODE) {
  foreach my $mode (@MODETEXT) {
    next if ($mode eq "ALL");
    if (not exists $fh{$mode}) {
      $fh{$mode} = new FileHandle;
      $filename{$mode} = "$prefix.$mode.$suffix";
      print STDERR "INFO: Creating empty file \"$outdir/" . $filename{$mode} . "\" since no violating \"$mode\" paths were found\n";
      if ($gzip) {
        $fh{$mode}->open("| gzip -c >$outdir/$filename{$mode}.gz") or die "ERROR: Can't write to $outdir/$filename{$mode}.gz\n";
      } else {
        $fh{$mode}->open(">$outdir/$filename{$mode}") or die "ERROR: Can't write to $outdir/$filename{$mode}\n";
      }
      $fh{$mode}->print("# INFO: No violating \"$mode\" paths found\n");
      $fh{$mode}->print("# EOF\n");
      $fh{$mode}->close();
    }
  }
}



if (not exists $numPathsByBin[$ALL] or $numPathsByBin[$ALL] <= 0) {
  print STDERR "INFO: There are no paths to report\n";
}


# Set up the output report format
format REPORTWITHCLOCK =
@#######.#   @#######.#   @<<<<<<<<<<<<<<<<<<<<<<<<<<   @######  @######   @*
$worst,      $wtns,       $clock,                       $skew,   $viol,    $path,
.
format REPORTNORMAL =
@#######.#   @#######.#   @#######  @#######  @#######   @*
$worst,      $wtns,       $tot,     $met,     $viol,    $path,
.
$worst = "N/A" if (!defined($worst));
$wtns  = "N/A" if (!defined($wtns));
$clock = "N/A" if (!defined($clock));
$skew  = "N/A" if (!defined($skew));
$viol  = "N/A" if (!defined($viol));
$path  = "N/A" if (!defined($path));

print "$worst,      $wtns,       $clock,                       $skew,   $viol,    $path\n";

if ($showClockAndSkew) {
  REPORT->format_name("REPORTWITHCLOCK");
} else {
  REPORT->format_name("REPORTNORMAL");
}


foreach my $key (@MODENUMS) {
  if (not defined $worst[$key]) {
    $worst[$key] = "N/A";
    $wtns[$key] = "N/A";
    $numViolatorsByBin[$key] = 0 if not defined $numViolatorsByBin[$key];
    $numPathsByBin[$key] = 0 if not defined $numPathsByBin[$key];
    $pathclock[$key] = "N/A" if not defined $pathclock[$key];
    $pathskew[$key] = 0 if not defined $pathskew[$key];
  }
}

my $header;
my $headerlines;
if ($showClockAndSkew) {
  $header      = "    WNS          WTNS      Worst Clock                    Skew     Viols    Tile Path              \n";
  $headerlines = "-----------  -----------  ----------------------------  --------  -------  ------------------------\n";
} else {
  $header      = "    WNS          WTNS       Total     Met       Viol     Tile Path              \n";
  $headerlines = "-----------  -----------  --------  --------  --------  ------------------------\n";
}

print REPORT "\n\n";
print REPORT "### VIOLATION SUMMARY\n";
print REPORT "\n";
print REPORT "$header$headerlines";

foreach my $x (@MODENUMS) {
  $numViolatorsByBin[$x] = 0 if (not defined $numViolatorsByBin[$x]);
  print REPORT $headerlines if ($x==$ALL);
  if (defined $worst[$x]) {
    if ($showClockAndSkew) {
      ($worst,$wtns,$clock,$skew,$viol,$path) = ($worst[$x] eq "N/A" ? " N/A" : sprintf("% .3f", $worst[$x]), $wtns[$x] eq "N/A" ? " N/A" : sprintf("% .3f", $wtns[$x]), $pathclock[$x], sprintf("% .3f", $pathskew[$x]), $numViolatorsByBin[$x], "$MODETEXT[$x] PATHS");
    } else {
      ($worst,$wtns,$tot,$met,$viol,$path) = ($worst[$x] eq "N/A" ? " N/A" : sprintf("% .3f", $worst[$x]), $wtns[$x] eq "N/A" ? " N/A" : sprintf("% .3f", $wtns[$x]), $numPathsByBin[$x], $numPathsByBin[$x]-$numViolatorsByBin[$x], $numViolatorsByBin[$x], "$MODETEXT[$x] PATHS");
    }
    write REPORT;
  }
}

if (1) {
  my $limitprint = (defined $limit) ? $limit : 0;
  print STDERR "INFO: Found $numPathsByBin[$ALL] paths, with $numViolatorsByBin[$ALL] worse than ${limitprint}${library_time_units} slack ($MODETEXT[2]) and ${limitSingleTile}${library_time_units} slack ($MODETEXT[1])\n";
  if ($numViolatorsByBin[$ALL] == 0) {
    print REPORT "INFO: No violations found\n";
  }
}

# Set all counts to zero unless already set to something
# Also, calculate the longest tilepath length for the INFO message
my $longest = 0;
foreach my $tilepath (keys %totalcount) {
  $violationcount{$tilepath}   = 0 unless (exists $violationcount{$tilepath});
  $ignorecount{$tilepath} = 0 unless (exists $ignorecount{$tilepath});
  $TNSOfWorst{$tilepath}     = 999999 unless (exists $TNSOfWorst{$tilepath});
  $WNSOfWorst{$tilepath}     = 999999 unless (exists $WNSOfWorst{$tilepath});
  my $len = length($tilepath);
  if ($len > $longest) {
    $longest = $len;
  }
}

foreach my $tilepath (sort keys %violationcount) {
  my ($total,$found,$ignored) = ($totalcount{$tilepath},  $violationcount{$tilepath}, $ignorecount{$tilepath});
  my $spc = ' ' x ($longest - length($tilepath) + 1);
  my $limitPrint = $tilepath =~ /\./ ? ((defined $limit) ? $limit : 0) : $limitSingleTile;
  if (!$found) {
    print STDERR "INFO:  \"$tilepath\": $spc$total paths, but none are worse than ${limitPrint}${library_time_units}\n";
  } else {
    print STDERR "INFO:  \"$tilepath\": $spc$total paths, \t$ignored met time of ${limitPrint}${library_time_units}\n";
  }
}



my @sortedTilePaths = sort { $TNSOfWorst{$a} <=> $TNSOfWorst{$b} or
                               $violationcount{$b} <=> $violationcount{$a} or
                                 $totalcount{$b} <=> $totalcount{$a} or
                                   $a cmp $b
                               } keys %violationcount;


foreach my $x (@MODENUMS) {
  my $txt = $MODETEXT[$x];

  print REPORT "\n\n";
  print REPORT "### VIOLATIONS FOR $txt PATHS \n";
  print REPORT "\n";
  print REPORT "$header$headerlines";

  # Summarize the path amounts and write out the files

  foreach my $tilepath (@sortedTilePaths) {
    next if ($x != $ALL and $x != $NumTilesForPath{$tilepath});

    my $found_violations = $violationcount{$tilepath};
    if ($showClockAndSkew) {
      $skewOfWorst{$tilepath} = 0 if (not defined $skewOfWorst{$tilepath});
      ($wtns,$worst,$clock,$skew,$viol,$path) = ($TNSOfWorst{$tilepath},$WNSOfWorst{$tilepath},$clockOfWorst{$tilepath}, sprintf("% .3f", $skewOfWorst{$tilepath}),$found_violations,$tilepath);
    } else {
      ($wtns,$worst,$tot,$met,$viol,$path) = ($TNSOfWorst{$tilepath},$WNSOfWorst{$tilepath},$totalcount{$tilepath},$ignorecount{$tilepath},$found_violations,$tilepath);
    }

    # The numbers were converted to 999999 if none existed
    if ($worst != 999999) {
      write REPORT;
    }


  }
  print REPORT $headerlines;
}


print REPORT "\n\n";


# Generate histograms
select REPORT;


# Summarize the number of violations per corner and worst per corner
if ($reportNumPerCorner) {
  my $totalWorst = 0;
  my @worstPerFile = ();
  my @TNSPerFile = ();
  my @uniqueToFile = ();

  foreach my $is_hold (keys %StartpointEndpoint) {
    foreach my $startpoint (keys %{$StartpointEndpoint{$is_hold}}) {
      foreach my $endpoint (keys %{$StartpointEndpoint{$is_hold}{$startpoint}}) {
        my ($slack,$filenum,$linenum,$tns) = @{$StartpointEndpoint{$is_hold}{$startpoint}{$endpoint}};
        #        $worstPerFile[$filenum]++;
        $TNSPerFile[$filenum] += $tns;
        #        $totalWorst++;
      }
    }
  }

  my $totalUniq = 0;
  foreach my $filenum (keys %sp_ep_worst_corner) {
    foreach my $linenum (keys %{$sp_ep_worst_corner{$filenum}}) {
      my $is_worst  = $sp_ep_worst_corner{$filenum}{$linenum};
      if ($is_worst) {
        $worstPerFile[$filenum]++;
        $totalWorst++;

        my $is_unique = (not exists $sp_ep_not_unique{$filenum}{$linenum});
        if ($is_unique) {
          $uniqueToFile[$filenum]++;
          $totalUniq++;
        }
      }
    }
  }

  my $totalViols = 0;
  my $totalTNS = 0;
  foreach my $file (@filenames) {
    my $filenum = $numberOfFile{$file};
    $violsPerFile[$filenum] = 0 if not defined $violsPerFile[$filenum];
    $worstPerFile[$filenum] = 0 if not defined $worstPerFile[$filenum];
    $TNSPerFile[$filenum]   = 0 if not defined $TNSPerFile[$filenum];
    $uniqueToFile[$filenum] = 0 if not defined $uniqueToFile[$filenum];
    $totalViols += $violsPerFile[$filenum];
    $totalTNS += $TNSPerFile[$filenum];
  }

  print REPORT "\n### Violations per timing corner\n";
  print REPORT "  # Total  = Total non-unique violations per input file\n";
  print REPORT "  # Unique = Number of unique startpoint/endpoint pairs that only violate the timing margin in this corner\n";
  print REPORT "  # Worst  = Number of unique startpoint/endpoint pairs per input file that have the worst slack in that file\n";
  print REPORT "  # Margin = Timing setup/hold margin for this corner - used to compute TNS\n";
  print REPORT "  # Scale  = Timing setup/hold scaling for this corner - used to compute TNS\n" if $show_scaling;
  print REPORT "  # TNS    = Total negative slack for the paths worst in this corner (compared to margin for this corner)\n\n";

  if ($show_scaling) {
    print REPORT "  Total     %      Unique       Worst     %     Margin   Scale        TNS        %     Corner\n";
    print REPORT "--------- -----   ---------   --------- -----   ------   ------   ------------ -----   ---------------------------\n"; 
  } else {
    print REPORT "  Total     %      Unique       Worst     %     Margin       TNS        %     Corner\n";
    print REPORT "--------- -----   ---------   --------- -----   ------   ------------ -----   -----------------------------\n";
  }
  foreach my $file (sort {$worstPerFile[$numberOfFile{$b}] <=> $worstPerFile[$numberOfFile{$a}] or $a cmp $b} @filenames) {
    my $filenum = $numberOfFile{$file};
    my $cornername = $cornernames[$filenum];
    my $viols = $violsPerFile[$filenum];
    my $worst = $worstPerFile[$filenum];
    my $margin = $margin[$filenum];
    my $scaling = $scaling[$filenum] if $show_scaling;
    my $tns = $TNSPerFile[$filenum];
    my $unique2file = $uniqueToFile[$filenum];
    my $viols_pct = ($totalViols == 0) ? 0 : $viols/$totalViols*100;
    my $worst_pct = ($totalWorst == 0) ? 0 : $worst/$totalWorst*100;
    my $tns_pct = ($totalTNS == 0) ? 0 : (abs($tns)/abs($totalTNS))*100;

    if ($show_scaling) {
      printf REPORT "%9d %5.1f   %9d   %9d %5.1f   %6.3f   %6.3f   %12.3f %5.1f   %s\n", $viols, $viols_pct, $unique2file, $worst, $worst_pct, $margin, 1/$scaling, $tns, $tns_pct, $cornername;
    } else {
      printf REPORT "%9d %5.1f   %9d   %9d %5.1f   %6.3f   %12.3f %5.1f   %s\n", $viols, $viols_pct, $unique2file, $worst, $worst_pct, $margin, $tns, $tns_pct, $cornername;
    }

  }

  if ($show_scaling) {
    print REPORT "--------- -----   ---------   --------- -----   ------   ------   ------------ -----   ---------------------------------------\n"; 
    printf REPORT "%9d %5.1f   %9d   %9d %5.1f   %6s   %6s   %12.3f %5.1f   %s\n", $totalViols, 100, $totalUniq, $totalWorst, 100, "", "",$totalTNS, 100, "TOTAL";
  } else {
    print REPORT "--------- -----   ---------   --------- -----   ------   ------------ -----   ----------------------------------------\n";
    printf REPORT "%9d %5.1f   %9d   %9d %5.1f   %6s   %12.3f %5.1f   %s\n", $totalViols, 100, $totalUniq, $totalWorst, 100, "", $totalTNS, 100, "TOTAL";
  }
  print REPORT "\n";
}



# Summarize unique counts for every possible combination we kept track of
if ($uniquify or $splitIntoPathGroups) {
  print REPORT "\n### Unique counts per category (WNS/TNS/etc are for unique only)\n\n";
  print REPORT " Type    Path       Total    Unique  Non-Uniq      WNS  Wst TNS     Total TNS  Margin  Clock Group\n";
  print REPORT "-----  --------  --------  --------  --------  -------  -------  ------------  ------  -----------\n";
  my $grouplines;
  foreach my $grp (sort keys %unique_count) {
    my $group = $grp;
    $grouplines = 0;
    $group = "ALL" if ($group eq "0");
    foreach my $is_hold_plus_one (0..2) {
      next if ($is_hold_plus_one == 0 and (not defined $unique_count{$grp}[1] or not defined $unique_count{$grp}[2]));
      next unless (defined $unique_count{$grp}[$is_hold_plus_one]);
      my $minmax = ($is_hold_plus_one==$ALL) ? "ALL" : ($is_hold_plus_one==1) ? "SETUP" : "HOLD";
      foreach my $modenumber (0..2) {
        next if ($modenumber == 0 and (not defined $unique_count{$grp}[$is_hold_plus_one][1] or not defined $unique_count{$grp}[$is_hold_plus_one][2]));
        next unless (defined $unique_count{$grp}[$is_hold_plus_one][$modenumber]);
        my $mode = $MODETEXT[$modenumber];
        my $ref = $unique_count{$grp}[$is_hold_plus_one][$modenumber];
        my $total = (defined $ref->[$ALL]) ? $ref->[$ALL] : 0;
        my $unique = (defined $ref->[1]) ? $ref->[1] : 0;
        my $notunique = (defined $ref->[2]) ? $ref->[2] : 0;
        my ($wns,$wtns,$tns,$wmargin) = (0,0,0,0);
        if (defined $unique_stats{$grp}[$is_hold_plus_one][$modenumber][1][$INDEX_WNS]) {
          $wns     = $unique_stats{$grp}[$is_hold_plus_one][$modenumber][1][$INDEX_WNS];
          $wtns    = $unique_stats{$grp}[$is_hold_plus_one][$modenumber][1][$INDEX_WTNS];
          $tns     = $unique_stats{$grp}[$is_hold_plus_one][$modenumber][1][$INDEX_TNS];
          $wmargin = $unique_stats{$grp}[$is_hold_plus_one][$modenumber][1][$INDEX_WMARGIN];
        
        }
        $grouplines++; # If more than one line per group, print newlines between groups
        printf REPORT "%5s  %8s  %8d  %8d  %8d  %7.3f  %7.3f  %12.3f  %6.3f  $group\n", $minmax, $mode, $total, $unique, $notunique, $wns, $wtns, $tns, $wmargin;
      }
    }
    print REPORT "\n" if ($grouplines > 1);
  }
  print REPORT "\n";
}

# Temp placeholder for setup and hold analysis
if ($findBothSetupAndHold) {
  # Go through all paths, finding a total score for cells and nets in both setup and hold
  # Then we'll take the top scores and show them in order from highest to lowest

  my $maxpaths = 100;

  my @totalPathTNS = ();
  my %totalCellTNS = ();
  my %totalNetTNS = ();
  my @cellContributions = ();
  my @netContributions = ();
  my %pathsWithCell = ();
  my %pathsWithNet = ();
  foreach my $filenum (0..$#pathCells) {
    foreach my $linenum (keys %{$pathCells[$filenum]}) {
      foreach my $cellindex (@{$pathCells[$filenum]{$linenum}}) {
        if (defined $cellTNS[0][$cellindex] and defined $cellTNS[1][$cellindex]) { # Both setup and hold
          my $celltotal = $cellTNS[0][$cellindex] + $cellTNS[1][$cellindex]; 
          $totalCellTNS{$cellindex} += $celltotal;
          $pathsWithCell{$cellindex}{$filenum}{$linenum} = 1;
          $totalPathTNS[$filenum]{$linenum} += $celltotal;
          $cellContributions[$filenum]{$linenum}{$cellindex} = $celltotal;
        }
      }
      foreach my $netindex (@{$pathNets[$filenum]{$linenum}}) {
        if (defined $netTNS[0][$netindex] and defined $netTNS[1][$netindex]) { # Both setup and hold
          my $nettotal = $netTNS[0][$netindex] + $netTNS[1][$netindex];
          $totalNetTNS{$netindex} += $nettotal;
          $pathsWithNet{$netindex}{$filenum}{$linenum} = 1;
          $totalPathTNS[$filenum]{$linenum} += $nettotal;
          $netContributions[$filenum]{$linenum}{$netindex} = $nettotal;
        }
      }
    }
  }

  my %pathsWithTotals = ();
  foreach my $filenum (0..$#totalPathTNS) {
    foreach my $linenum (keys %{$totalPathTNS[$filenum]}) {
      my $tns = $totalPathTNS[$filenum]{$linenum};
      push @{$pathsWithTotals{$tns}}, [$filenum,$linenum];
    }
  }

  print REPORT "### Worst paths with both setup and hold nets/cells:\n\n";
  my $pathcounter = 0;
  foreach my $tns (sort {$a <=> $b} keys %pathsWithTotals) {
    foreach my $aref (@{$pathsWithTotals{$tns}}) {
      $pathcounter++; last if ($pathcounter > $maxpaths);
      print REPORT "TNS=$tns FILE=$filenames[$aref->[0]] LINE=$aref->[1] SLACK = @{$SLACK[$aref->[0]]{$aref->[1]}} \n";
      foreach my $cellindex (sort keys %{$cellContributions[$aref->[0]]{$aref->[1]}}) {
        my $celltns = $cellContributions[$aref->[0]]{$aref->[1]}{$cellindex};
        print REPORT "  $celltns came from cell $cellNameList[$cellindex]\n";
      }
      foreach my $netindex (sort keys %{$netContributions[$aref->[0]]{$aref->[1]}}) {
        my $nettns = $netContributions[$aref->[0]]{$aref->[1]}{$netindex};
        print REPORT "  $nettns came from net $netNameList[$netindex]\n";
      }

    }
  }
  print REPORT "\n";

  print REPORT "### Worst cells in both setup and hold paths:\n\n";
  $pathcounter = 0;
  foreach my $cellindex (sort {$totalCellTNS{$a} <=> $totalCellTNS{$b}} keys %totalCellTNS) {
    $pathcounter++; last if ($pathcounter > $maxpaths);
    print REPORT "TNS=$totalCellTNS{$cellindex} Cell=$cellNameList[$cellindex] Paths=\n";
    foreach my $filenum (sort {$a <=> $b} keys %{$pathsWithCell{$cellindex}}) {
      foreach my $linenum (sort {$a <=> $b} keys %{$pathsWithCell{$cellindex}{$filenum}}) {
        print REPORT "  Line $linenum of $filenames[$filenum] SLACK = @{$SLACK[$filenum]{$linenum}} \n";
      }
    }
  }
  print REPORT "\n";

  print REPORT "### Worst nets in both setup and hold paths:\n\n";
  $pathcounter = 0;
  foreach my $netindex (sort {$totalNetTNS{$a} <=> $totalNetTNS{$b}} keys %totalNetTNS) {
    $pathcounter++; last if ($pathcounter > $maxpaths);
    print REPORT "TNS=$totalNetTNS{$netindex} Net=$netNameList[$netindex] Paths=\n";
    foreach my $filenum (sort {$a <=> $b} keys %{$pathsWithNet{$netindex}}) {
      foreach my $linenum (sort {$a <=> $b} keys %{$pathsWithNet{$netindex}{$filenum}}) {
        print REPORT "  Line $linenum of $filenames[$filenum] SLACK = @{$SLACK[$filenum]{$linenum}}\n";
      }
    }
  }

  print REPORT "\n\n";
}


if ($findWireDominatedPaths) {
  my $maxWireCount = 0;

  print REPORT "\n### Wire-dominated violation report (net delay to cell delay ratio)\n\n";
  print REPORT " Ratio    Net Delay  Cell Delay          TNS       Slack    Type      Path     Line #     Corner\n";
  print REPORT "-------  ----------  ----------  ------------  ----------  -----  ---------  ---------  ------------------------------\n";
  foreach my $ratio (sort {$b <=> $a} keys %wireDominatedStats) {
    last if ($maxWireCount >= $wireDomMaxPaths);
    foreach my $tns (sort {$a <=> $b} keys %{$wireDominatedStats{$ratio}}) {
    last if ($maxWireCount >= $wireDomMaxPaths);
      foreach my $filenum (sort keys %{$wireDominatedStats{$ratio}{$tns}}) {
        last if ($maxWireCount >= $wireDomMaxPaths);
        foreach my $linenum (sort keys %{$wireDominatedStats{$ratio}{$tns}{$filenum}}) {
          my ($slack,$is_hold,$num_tiles,$netdelay,$celldelay) = @{$wireDominatedStats{$ratio}{$tns}{$filenum}{$linenum}};
          my $setup_or_hold = ($is_hold) ? "hold" : "setup";
          my $num_tiles_text = $MODETEXT[$num_tiles]; # "Internal" is the longest one
          printf REPORT "%7.3f  %10.3f  %10.3f  %12.3f  %10.3f  %5s  %9s  %9d  %s\n", $ratio, $netdelay, $celldelay, $tns, $slack, $setup_or_hold, $num_tiles_text, $linenum, $filenames[$filenum];
          $maxWireCount++;
          if ($maxWireCount >= $wireDomMaxPaths) {
            print REPORT "\nWARNING: Max number of wire dominated paths reached ($wireDomMaxPaths)\n";
            last;
          }
        }
      }
    }
  }
  print REPORT "\n\n";
}


# This should really go in its own file
if ($get_corner_scaling) {
  print REPORT "\n### Scaling factors between timing corners\n\n";
  #$corner_celldelay{$name}{$input_pin}{$filenum} = $incr;
  #$corner_celltype{$name} = $type;
  #$corner_netdelay{$name}{$filenum} = $incr;

  my %cell_total = ();
  my %cell_num = ();

  foreach my $name (keys %corner_celldelay) {
    foreach my $pin (keys %{$corner_celldelay{$name}}) {
      my @filenums = (keys %{$corner_celldelay{$name}{$pin}});
      for (my $f1 = 0; $f1 < (scalar(@filenums)-1); $f1++) {
        for (my $f2 = $f1+1; $f2 < scalar(@filenums); $f2++) {
          my $inc1 = $corner_celldelay{$name}{$pin}{$filenums[$f1]};
          my $inc2 = $corner_celldelay{$name}{$pin}{$filenums[$f2]};
          next if (not defined $inc1 or not defined $inc2 or $inc1 == 0 or $inc2 == 0);
          my $scale1 = ($inc2/$inc1);
          my $scale2 = ($inc1/$inc2);
          my $type = $corner_celltype{$name};
          $name =~ /.*\/(.*?)$/;
          my $opin = $1;
          $cell_total{$type}{"$pin->$opin"}{$filenums[$f1]}{$filenums[$f2]} += $scale1;
          $cell_total{$type}{"$pin->$opin"}{$filenums[$f2]}{$filenums[$f1]} += $scale2;
          $cell_num{$type}{"$pin->$opin"}{$filenums[$f1]}{$filenums[$f2]}++;
          $cell_num{$type}{"$pin->$opin"}{$filenums[$f2]}{$filenums[$f1]}++;

        }
      }
    }
  }

  print REPORT "File numbers:\n\n";
  for (my $fn=0; $fn<scalar(@filenames); $fn++) {
    my $name = $filenames[$fn];
    print REPORT "$fn = $name\n";
  }
  print REPORT "\n\n";

  my %global_total = ();
  my %global_num = ();

  foreach my $type (sort keys %cell_total) {
    print REPORT "Cell: $type\n";
    my $is_hvt = ($type =~ /$hvt_celltype_pattern/);
    my $is_lvt = (!$is_hvt and $type =~ /LVT/);
    my $vt = ($is_hvt) ? "HVT" : ($is_lvt) ? "LVT" : "SVT";
    my $is_long_channel = ($type =~ /GPO_P2/);
    my $is_buf = ($type =~ /BUF/);
    my $is_del = ($type =~ /DEL/);

    my $desc = "$vt";
    $desc .= " +2nm" if $is_long_channel;
    $desc .= " BUF" if $is_buf;
    $desc .= " DEL" if $is_del;

    foreach my $pins (sort keys %{$cell_total{$type}}) {
      print REPORT "\t$pins\n";
      foreach my $f1 (sort keys %{$cell_total{$type}{$pins}}) {
        foreach my $f2 (sort keys %{$cell_total{$type}{$pins}{$f1}}) {
          my $total = $cell_total{$type}{$pins}{$f1}{$f2};
          my $num   =   $cell_num{$type}{$pins}{$f1}{$f2};
          my $avg = 0.01 *int(100*$total/$num);
          print REPORT "\t\tFile $f1 to file $f2 scaling: $avg\n";

          $global_total{$f1}{$f2}{"ALL"} += $total;
          $global_num{$f1}{$f2}{"ALL"} += $num;
          $global_total{$f1}{$f2}{$desc} += $total;
          $global_num{$f1}{$f2}{$desc} += $num;
        }
      }
    }
  }

  print REPORT "\n\nFile numbers:\n\n";
  for (my $fn=0; $fn<scalar(@filenames); $fn++) {
    my $name = $filenames[$fn];
    print REPORT "$fn = $name\n";
  }
  print REPORT "\n\nTotal average scaling:\n\n";

  foreach my $f1 (sort keys %global_total) {
    foreach my $f2 (sort keys %{$global_total{$f1}}) {
      foreach my $what (sort keys %{$global_total{$f1}{$f2}}) {
        my $total = $global_total{$f1}{$f2}{$what};
        my $num   =   $global_num{$f1}{$f2}{$what};
        $num = 0.01 * int(100*$total/$num);
        printf REPORT "%3d to %3d = %4.2f ($what)\n", $f1, $f2, $num;
      }
    }
    print REPORT "\n";
  }
}



{
  # Histogram internal (1-tile paths) and multi-tile paths
  my %hashes = ();
  my @count = ([0,0,0],[0,0,0]);
  foreach my $tilepath (keys %violationcount) {
    my $num_tiles = $NumTilesForPath{$tilepath};

    if ($violationcount{$tilepath} > 0 or ($keep_passing_paths and $ignorecount{$tilepath} > 0)) {
      foreach my $array (@{$pathdata{$tilepath}}) {
        # my @data = ($filenum,$linenum,$tns,$slack,$position_before,$numlines,$is_hold);
        my ($filenum,$linenum,$slack) = ($array->[0],$array->[1],$array->[3]);
        my $is_unique = (exists $unique{$filenum}{$linenum} and $unique{$filenum}{$linenum});
        $hashes{$ALL}{$MODETEXT[$ALL]}[$count[0][$ALL]] = $slack;
        $count[0][$ALL]++;
        if ($uniquify and $is_unique) {
          $hashes{$is_unique}{$MODETEXT[$ALL]}[$count[1][$ALL]] = $slack;
          $count[1][$ALL]++;
        }
        $hashes{$ALL}{$MODETEXT[$num_tiles]}[$count[0][$num_tiles]] = $slack;
        $count[0][$num_tiles]++;
        if ($uniquify and $is_unique) {
          $hashes{$is_unique}{$MODETEXT[$num_tiles]}[$count[1][$num_tiles]] = $slack;
          $count[1][$num_tiles]++;
        }
      }
    }
  }

  foreach my $uniqueOrNot (sort keys %hashes) {
    my $uniqText = (!$uniquify) ? " " : $uniqueOrNot ? " UNIQUE " : " ALL ";
    foreach my $pathtype (sort keys %{$hashes{$uniqueOrNot}}) {

      # Make sure all histograms have 0 in them somewhere
      if ($best[$ALL] > 0 and $worst[$ALL] > 0) {
        $worst[$ALL] = 0;
      } elsif ($best[$ALL] < 0 and $worst[$ALL] < 0) {
        $best[$ALL] = 0;
      }

      # Make sure the global max limit is in the histogram somewhere (for consistency across runs)
      if ($best[$ALL] > $global_max_limit and $worst[$ALL] > $global_max_limit) {
        $worst[$ALL] = $global_max_limit;
      } elsif ($best[$ALL] < $global_max_limit and $worst[$ALL] < $global_max_limit) {
        $best[$ALL] = $global_max_limit;
      }

      my $num_items = scalar(@{$hashes{$uniqueOrNot}{$pathtype}});
      my $pathtypePrint = ($pathtype eq "ALL") ? ($uniquify ? "" : "ALL ") : "$pathtype ";
      if ($num_items > 2) {
        print REPORT "\n### Histogram of${uniqText}${pathtypePrint}paths \n";
        &histogram_it($hashes{$uniqueOrNot}{$pathtype}, $best[$ALL], $worst[$ALL]);
        print REPORT "\n";
      } else {
        print REPORT "\n### Skipping histogram of${uniqText}${pathtypePrint}paths since there are only $num_items item(s)\n\n";
      }
    }
  }

  if ($extraPathInfo) {
    for (my $ep = 0; $ep < scalar(@extraPathText); $ep++) {
      my $description = $extraPathText[$ep];

      my @datapoints = ();
      my ($min,$max);

      foreach my $filenum (keys %extraPathInfo) {
        foreach my $linenum (keys %{$extraPathInfo{$filenum}}) {
          if (defined $extraPathInfo{$filenum}{$linenum}[$ep]) {
            my $num = $extraPathInfo{$filenum}{$linenum}[$ep];
            push @datapoints, $num;
            $min = $num if (not defined $min or $num < $min);
            $max = $num if (not defined $max or $num > $max);
          }
        }
      }

      if (@datapoints) {
        print REPORT "\n### Histogram of $description\n";
        &histogram_it(\@datapoints, $max, $min);
        print REPORT "\n";
      } else {
        print REPORT "\n### Skipping histogram of $description since no data\n\n";
      }

    } # for each extra info type (for $ep)
  } # if $extraPathInfo

}

select STDOUT;


# Generate GNU plots of per-corner violations if requested
if ($genPlots) {
  # $plotData{$pathClock}{$endpoint}{$startpoint}{$filecounter} = $tns;

  my @plotData; # plotData[pathnumber][filenumber] = TNS
  my @totalTNS; # Count the total TNS for each path for secondary sorting
  my @worstTNS; # Track which paths had the worst TNS in any corner
  my @TNSperFile; # Track total TNS per file so we can put the worst first
  my @startEndPoints; # record the startpoint/endpoint for each data point, for debug

  # Build an array of all TNS values for each path for each file
  my $pointcounter = -1;
  foreach my $pathclock (keys %plotData) {
    foreach my $endpoint (keys %{$plotData{$pathclock}}) {
      foreach my $startpoint (keys %{$plotData{$pathclock}{$endpoint}}) {
        $pointcounter++;
        foreach my $filenum (keys %{$plotData{$pathclock}{$endpoint}{$startpoint}}) {
          # Use absolute value so logarithmic scale will work
          my $tns = abs($plotData{$pathclock}{$endpoint}{$startpoint}{$filenum});

          # Apply scaling factors here to account for difficulty of fixing various corners
          # relative to eachother.

          $scaling = $scaling[$filenum];

          $plotData[$pointcounter][$filenum] = $tns;
          $totalTNS[$pointcounter] += $tns;
          $worstTNS[$pointcounter] = $tns if (not defined $worstTNS[$pointcounter] or $tns > $worstTNS[$pointcounter]);
          $TNSperFile[$filenum] += $tns;
		  $startEndPoints[$pointcounter] = "$startpoint $endpoint";
        }
      }
    }
  }

  # Set any undefined values to zero
  for (my $pointnum = 0; $pointnum <= $pointcounter; $pointnum++) {
    $totalTNS[$pointnum] = 0 if (not defined $totalTNS[$pointnum]);
    for (my $filenum = 0; $filenum < $num_files; $filenum++) {
      if (not defined $plotData[$pointnum][$filenum]) {
        $plotData[$pointnum][$filenum] = 0;
      }
    }
  }

  # Get simple names for corners
  my @plotnames = ();
  my @simplenames = ();
  my @field_sizes = (); # To make plot legend have same number of characters per corner
  for (my $filenum = 0; $filenum < $num_files; $filenum++) {
    my $filename = $filenames[$filenum];
    my $is_setup = ($filename =~ /Stp/);
    my $is_si = ($filename =~ /si_report/);
    $filename =~ s/^.*?(Pt[^\/]+).*?$/$1/;  # Get rid of "rpts/" and "/report_timing.rpt.gz"
    $filename =~ s/\..*//;                     # Get rid of ".gz" and ".rpt"
    $filename =~ s/PtTim//;
    $filename =~ s/Pt//;
    $filename =~ s/([0-9]c)[A-Z]\w+?Route.*/$1/;
    $filename =~ s/(Func|Disp|ScanCapt|ScanShift....)/${1}__/;
    $filename =~ s/H?l?d?(SS|TT|FF)[0-9]+p[0-9]+v//;
    $filename =~ s/(.*)typrc([0-9]+)c(.*)/${1}${3}__typ${2}c/;
    $filename =~ s/(.*)cbest[0-9]+c(.*)/${1}${2}__min/;
    $filename =~ s/(.*)cworst[0-9]+c(.*)/${1}${2}__max/;

    $plotnames[$filenum] = $filename;
    my @fields = (split /__/, $filename);
    for (my $f=0; $f<scalar(@fields); $f++) {
      my $chars = length($fields[$f]);
      $field_sizes[$f] = $chars if (not defined $field_sizes[$f] or $chars > $field_sizes[$f]);
    }

    $filename .= ".stp" if ($is_setup);
    $filename .= ".hld" if (!$is_setup);
    $filename .= ".si" if $is_si;

    $simplenames[$filenum] = $filename;
  }

  # Make the plot names all the same number of characters for easier readability
  for (my $n = 0; $n < scalar(@plotnames); $n++) {
    my @fields = (split /__/, $plotnames[$n]);
    for (my $f = 0; $f < scalar(@fields); $f++) {
      if (length($fields[$f]) < $field_sizes[$f]) {
        $fields[$f] .= "_" x ($field_sizes[$f] - length($fields[$f]));
      }
    }
    my $newname = (join "__", @fields);
    $plotnames[$n] = $newname;
  }

  # Sort files by plot names
  my @sorted_files = (sort {$plotnames[$a] cmp $plotnames[$b] or $a <=> $b} 0..($num_files-1));

  # Set plotter text for files
  my $plotter_text = "plot ";
  foreach my $filenum (@sorted_files) {
    my $plotname = $plotnames[$filenum];
    $plotter_text .= " \"-\" using 1:2 title \"$plotname\" with points,";
  }
  chop $plotter_text; # Get rid of that last comma

  # Generate one chart for each corner, with that corner's paths sorted from most negative TNS to most positive
  # Every single corner goes on every single chart, but each corner gets it's own chart with it sorted for that one
  # Secondary sort will use the worst TOTAL TNS for each path, which was computed above

  my ($ALL, $ABOVE, $BELOW) = (0,1,2);

  my %compare_stats = ();
  foreach my $compare ($ALL, $ABOVE, $BELOW) {

    # Outer loop is for whatever corner we're sorting in this pass
    foreach my $sortfilenum (-1, @sorted_files) {
      next if ($sortfilenum == -1 and $compare != $ALL);
      my $comparetxt = ($compare==$ALL) ? "all" : ($compare==$ABOVE) ? "above" : "below";
      my $filename = ($sortfilenum == -1) ? $reportFile . ".png" : "$outdir/$simplenames[$sortfilenum].$comparetxt.png";
      open PLOT, "|/tool/pandora64/.package/gnuplot-5.0.4/bin/gnuplot" or die "ERROR: Can't pipe output to gnuplot\n";
      print STDERR "INFO: Generating image: $filename\n";
      print PLOT "set terminal png small size 1024,768\n";
      print PLOT "set out \"$filename\"\n";
      print PLOT "set pointsize $plotDotSize\n";
      print PLOT "set logscale y\n";
      print PLOT "$plotter_text\n";

      # Build the sorted list of point numbers to use for this data generation pass
      my @sorted_points;
      if ($sortfilenum == -1) {
        @sorted_points = (sort {$worstTNS[$b] <=> $worstTNS[$a] or $a <=> $b} 0..$pointcounter); # Sort by worst all around
      } else { 
        @sorted_points = (sort {$plotData[$b][$sortfilenum] <=> $plotData[$a][$sortfilenum] or $totalTNS[$b] <=> $totalTNS[$a] or $a <=> $b} 0..$pointcounter);
      }

      # Inner loop is for whatever corner we're generating a plot for at this moment
      foreach my $filenum (@sorted_files) {
        my $any_points = 0;
        for (my $point = 0; $point <= $pointcounter; $point++) {
          # Cut off the chart when this corner runs out of paths for clarity
          my $datum = $plotData[$sorted_points[$point]][$filenum];
          if ($datum != 0) {
            my $good = 0;
            if ($sortfilenum == -1 or $sortfilenum == $filenum) {
              $good = 1;
            } elsif ($compare == $ALL) {
              $good = ( ($plotData[$sorted_points[$point]][$sortfilenum] != 0) );

            } elsif ($compare == $ABOVE) {
              $good = ( ($plotData[$sorted_points[$point]][$sortfilenum] != 0) and
                        $datum > $plotData[$sorted_points[$point]][$sortfilenum] );
            } else {
              $good = ( ($plotData[$sorted_points[$point]][$sortfilenum] != 0) and
                        $datum < $plotData[$sorted_points[$point]][$sortfilenum] );
            }

            if ($good) {
              $compare_stats{$sortfilenum}{$filenum}{$compare}++ unless ($sortfilenum == -1);
              print PLOT "$point $datum\n";
              #~ print STDERR "$plotnames[$filenum] $point $datum $startEndPoints[$sorted_points[$point]]\n" if ($point > 3500 and $point <= 3510 and $filename eq "Func__tt0p85v0cRouteStp__typ110c.stp.all.png"); # and $plotnames[$filenum] eq "Func__tt0p85v110cRouteStp__typ110c"
			  $any_points++;
            }

          }
        }
        print PLOT "0 0\n" if (!$any_points);
        print PLOT "END\n";
      }

      close PLOT;
    }
  }

  foreach my $mainfilenum (sort {$a <=> $b} keys %compare_stats) {
    print REPORT "# $plotnames[$mainfilenum] \n";
    foreach my $filenum (sort {$a <=> $b} keys %{$compare_stats{$mainfilenum}}) {
      my $all = $compare_stats{$mainfilenum}{$filenum}{$ALL}; $all = 0 if not defined $all;
      my $abv = $compare_stats{$mainfilenum}{$filenum}{$ABOVE}; $abv = 0 if not defined $abv;
      my $blw = $compare_stats{$mainfilenum}{$filenum}{$BELOW}; $blw = 0 if not defined $blw;
      print REPORT "#\t$plotnames[$filenum] ALL=$all ABOVE=$abv BELOW=$blw\n";
    }
    print REPORT "\n";
  }

}






print REPORT "\n\nINFO: End of report\n";
close REPORT;

print STDERR "INFO: Finished writing report\n";
# system("rm /atitmp/fctiming.sort.$$");
exit(0);



sub print_report_header() {
  select REPORT;

  my @stamp = localtime(time);
  my @months = ("Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"
               );
  my $month = $months[$stamp[4]];
  my $year = $stamp[5] + 1900;
  my $login = getlogin || (getpwuid($<))[0] || "THE WIZARD OF OZ!!!";
  my $hour = $stamp[2];
  my $minute = $stamp[1];
  if ($minute == 0) {
    $minute = "00";
  } elsif ($minute < 10) {
    $minute = "0" . $minute;
  }
  my $second = $stamp[0];
  if ($second == 0) {
    $second = "00";
  } elsif ($second < 10) {
    $second = "0" . $second;
  }
  my $mytime = $hour . ":" . $minute . ":" . $second;

  print "################################################################################\n";
  print "###\n";
  print "###       Sort and categorize timing report files - by Kent Dozier\n";
  print "###\n";
  print "###    o  Mode: " . (($MODE == $TOPLEVELMODE) ? "full chip sort" : "tile level sort") . "\n";
  print "###    o  Path file(s):\n";
  foreach my $item (@ARGV) {
    my ($margin,$reason) = GetSlackMarginForFile($item);
    print "###         $item  - slack margin is $margin ($reason)\n";
  }
  my $limitprint = (defined $limit) ? $limit : 0;
  print "###    o  Reporting paths with slack less than ${limitprint}${library_time_units} (multi) or ${limitSingleTile}${library_time_units} (single)\n";
  if ($uniquify) {
    print "###    o  Uniquifying with \"$algorithm\" algorithm\n";
  }

  print "###    o  Prefix/Suffix: `$prefix' `$suffix'\n";
  print "###    o  Output file path: `$outdir'\n";
  print "###    o  Report filename: `$reportFile'\n";
  print "###\n";
  print "###    o  Generated by  $login  with $0  on $month $stamp[3], $year  at  $mytime\n";
  print "###    o  Command line:\n";
  print "###       $0 $ALL_OPTIONS\n";
  print "###\n";
  print "################################################################################\n";
  print "\n";

  select STDOUT;
}


# Parse a path, find all needed info, and send it to the appropriate output file
sub ProcessPath {
    my ($filenum, $linenum, $lines, $slack) = @_;
    #print STDERR "DEBUG258: Processing path at line $linenum of $filenames[$filenum] with slack $slack\n";

    ############################################################################
    #
    # For each timing path, we need to collect a bunch of info.  Some of that
    # information depends on other information in the file.  Here is the
    # information that is required:
    #
    # Startpoint/Endpoint
    #   Startpoint is a top level input?
    #   Endpoint is a top level output?  # Starttile/Endtile
    # 1-TILE or 2-TILE path (used to make tile path)
    #   For tile sorting, 2-TILE means "IO path" and 1-TILE means "internal path"
    # Endpoint clock on path, used to find worst clock per tile path
    # Skew on path, requires the following:
    #   Insertion delay on launch clock
    #   Insertion dleay on capture clock
    #   Clock edge on launch clock
    #   Clock edge on capture clock
    #
    ############################################################################

    # Do a first pass through all the lines, marking the start and end of the
    #   actual data path and collecting all simple information.
    $path_begin_line = undef;   # First line after launch clock path
    $path_end_line = undef;     # Last line of actual data path
    $capture_last_line = 0; # Last line of capture clock path to get capture insertion delay
    $found_endpoint = 0;
    $found_arrival_time = 0;
    $found_pathgroup = 0;
    $found_minmax = 0;
    $skip_one_ins_dly = 0;
    $launchSkipInsDly = 0;
    $captureSkipInsDly = 0;
    $startpoint = undef;
    $endpoint = undef;
    $endpoint_regexp = undef;
    $startpoint_regexp = undef;
    $startpoint_found_counter = 0;
    $startpoint_equals_endpoint = 0;
    $pathClock = undef;
    $starttile = undef;
    $endtile = undef;
    $launchInsDly = undef;
    $captureInsDly = undef;
    $launchEdge = undef;
    $captureEdge = undef;
    $skew = undef;

    if (defined $scaling and ($scaling > 0 )){
        $tns = (($slack - $margin)/$scaling);
    } else {
        $tns = ($slack - $margin);
    }

    $is_hold = 0;
    $is_input = 0;
    $is_output = 0;
    $is_unclocked_path = 0;

    # If it starts and ends in the same tile, we need to check if it ascended to the top level
    # anywhere in the path.  If not, it's a 1-TILE path.
    my $num_tiles = 1;


    my $i = -1;                 # Path line counter
    foreach my $t (@{$lines}) {
        $i++;
        if ($i <= 7) {
            # Grab the startpoint/endpoint info from the first 7 lines of the path
            # Also the clock info, the path group, the start/end tiles, and if derating is turned on

            if (!$found_endpoint) {
                if ($t =~ /^\s*Endpoint:\s+(\S+)\s*.*$/) {
                    $found_endpoint=1;
                    $endpoint = $1;
                    $endpoint_regexp = Point2Regex($endpoint);

                    $startpoint_equals_endpoint = 1 if ($startpoint eq $endpoint);
                    $endtile = getTile($endpoint) if ($MODE == $TOPLEVELMODE);
                }
            }
            # Once the endpoint is found, there's no point looking for startpoint because it happens before the endpoint line
            if (!$found_endpoint) {
                if ($t =~ /^\s*Startpoint:\s+(\S+)\s*.*$/) {
                    $startpoint = $1;
                    $startpoint_regexp = Point2Regex($startpoint);
                    $startpoint_found_counter = 0;
                    $starttile = getTile($startpoint) if ($MODE == $TOPLEVELMODE);
                }
                if ($t =~ /\((?:input|inout) port/) {
                    $starttile = indexTile($startpoint, $startpoint, $input_port_tilename);
                    $num_tiles = ($MODE == $TILELEVELMODE) ? 2 : 3;
                    $is_input = 1;
                    $skew = 0; # Skew doesn't apply on in/out paths (impossible since can't see clock on other side)
                } elsif ($t =~ /\(clock source .\S+.\)/) {
                    $starttile = indexTile($startpoint, $startpoint, "clock_source");
                    $num_tiles = ($MODE == $TILELEVELMODE) ? 2 : 3;
                    $is_input = 1;
                    $skew = 0; # Skew doesn't apply on in/out paths (impossible since can't see clock on other side)
                }
            } else {
                # We found the endpoint already
                if ($t =~ /\((?:output|inout) port/) {
                    $endtile = indexTile($endpoint, $endpoint, $output_port_tilename);
                    $num_tiles = ($MODE == $TILELEVELMODE) ? 2 : 3;
                    $is_output = 1;
                    $skew = 0; # Skew doesn't apply on in/out paths (impossible since can't see clock on other side)
                }
            }
            #print STDERR "S=$startpoint E=$endpoint ST=$starttile ET=$endtile\n";

            #      if ($showClockAndSkew or $splitIntoPathGroups or $genPlots) {   # Previously we did not always get the clock
            # Always get the clock so the metrics parser can easily figure out the clock
            if (1) {
                if ($t =~ /clocked by (\S+)\)/) {
                    $pathClock = NoTicks($1);
                } elsif ($t =~ /clock source \'(\S+)\'/) {
                    $pathClock = NoTicks($1);
                    $skew = 0; # Don't need to calculate skew on clock source paths
                }
            }


            if ($i > 1 and $found_endpoint) {
                if (!$found_pathgroup and !$getPathGroupFromFileName and $t =~ /^\s*Path Group:\s+([\w\*]+)/) {
                    #  Path Group: MCLK_A
                    $pathGroup = GetPathGroup($1);
                    $found_pathgroup = 1;

                    # If we're in tile mode, mark this is a multi-tile path if it touches io
                    if ($MODE == $TILELEVELMODE and $pathGroup =~ /^io_to|_to_io$/) {
                        $num_tiles = 2;
                    }

                    if (not defined $pathClock or $pathGroup eq "default") {
                        # For "default" paths from set_min_delay and set_max_delay, there is no clock info
                        $is_unclocked_path = 1;
                        $pathClock = "default" if not defined $pathClock;

                        # Don't try to find insertion delay for unclocked paths
                        $launchSkipInsDly = 1;
                        $captureSkipInsDly = 1;
                    }

                } elsif (!$found_minmax and ($findBothSetupAndHold or $uniquify or $splitIntoPathGroups) and $t =~ /^\s*Path Type: (min|max)/) {
                    $is_hold = ($1 eq "min"); # Otherwise it's setup
                    $found_minmax = 1;
                }

            }

        } else {                # After the first 7 lines

            # Look for the start and end of the actual data path, and the capture clock line

            if (!$found_arrival_time) {

                # In launch section

                # Still in the launch section, so check for capture section (after arrival time line)
                if ($t =~ /^\s*data arrival time\s+(-?[\d\.]+)/) {
                    $found_arrival_time = 1;
                    $path_end_line = ($i-1);
                    my $ep_on_lanuch_path = $lines->[$path_end_line];
                    my $endpoint_in_path_header_is_pin = 0;
                    $ep_on_lanuch_path =~ s/\s*(\S+)\s+.*$/$1/g;
                    if ($ep_on_lanuch_path =~ /^$endpoint_regexp$/) {
                    $endpoint_in_path_header_is_pin = 1;
                    }
                    if ($ep_on_lanuch_path !~ /(\S+\/\S+)\S+/) {
                    #this endpoint is output port 
                    $endpoint_in_path_header_is_pin = 0;
                    }
                    $endpoint_regexp =~ s/(\S+)\/(\S+)/$1/g if ($endpoint_in_path_header_is_pin);
                    next;
                }
                
                # Still in launch section, look for lines with the startpoint on them 
                # Use split and foreach instead of regex to improve runtime
                if (!($startpoint_equals_endpoint and $startpoint_found_counter >= 2) and $t =~ /^\s*$startpoint_regexp(?:\s+|\/)/) {
                    my @fields = split /\s+/,$t;
                    my $n;
                    my $rf_found = 0;
                    for ($n = $#fields;$n>=0;$n--) {
                        if ($fields[$n] eq "r" or $fields[$n] eq "f") {
                            $rf_found = 1;
                            last;
                        }
                    }
                    if ($rf_found) {
                        $path_begin_line = $i;
                        $launchInsDly = $fields[$n-1] unless ($skip_one_ins_dly or $launchSkipInsDly);
                        $skip_one_ins_dly = 1 - $skip_one_ins_dly; # Never take the second one in a row since it's the ouptut pin
                        $startpoint_found_counter++;
                    }
                    #print STDERR "launchInsDly = $launchInsDly from line: $t";

                } elsif ($showClockAndSkew or $extraPathInfo) {
                    if (!$launchSkipInsDly and $t =~ /^\s*clock network delay \((?:ideal|propagated)\)\s+(\S+)\s+/) {
                        $launchInsDly = $1;
                        $launchEdge = 0; # No edge needed when path does not include clock tree
                        $launchSkipInsDly = 1; # Stop looking for launch insertion delay
                    } elsif (not defined $launchEdge and $t =~ /^\s*clock \S+ \((?:rise|fall) edge\).*\s+(\S+)\s+\S+\s*$/) {
                        $launchEdge = $1;
                    }
                }
            } else {            # if found arrival time
                # In capture section   ### [\s\d\.]+ was added to match the potential voltage value ###
                if ($t =~ /^\s*$endpoint_regexp(?:(?:\s\(\S+\)\s+.*)|(?:\/[^\/\s]+\s+\(\S+\)\s+(?:(?:\S+\s+){1,8}\S+ .?\s*)?))\s+(\S+)\s+(?:r|f)[\s\d\.]*/) {
                    $captureInsDly = $1 unless $captureSkipInsDly;
                } elsif ($t =~ /^\s*(max|min)_delay\s+/) {
                    # It's a path from set_min_delay/set_max_delay, so don't try to get the skew
                    $is_unclocked_path = 1;
                    $pathClock = "default" if not defined $pathClock;

                    # Don't try to find insertion delay for unclocked paths
                    $launchSkipInsDly = 1;
                    $captureSkipInsDly = 1;
                } elsif ($t =~ /^\s*time required through endpoint/) {
                    $is_unclocked_path = 1;
                    $pathClock = "default" if not defined $pathClock;
                    
                    # Don't try to find insertion delay for unclocked paths
                    $launchSkipInsDly = 1;
                    $captureSkipInsDly = 1;
                } elsif ($showClockAndSkew or $extraPathInfo) {
                    if (!$captureSkipInsDly and $t =~ /^\s*clock network delay \((?:ideal|propagated)\)\s+(\S+)\s+/) {
                        $captureInsDly = $1;
                        $captureEdge = 0; # No edge needed when path does not include clock tree
                        $captureSkipInsDly = 1; # Stop looking for launch insertion delay
                    } elsif (!$captureSkipInsDly and $t =~ /^\s*output\s+external\s+delay\s+(\S+)/) {
                        $captureInsDly = $1;
                    } elsif (not defined $captureEdge and $t =~ /^\s*clock \S+ \((?:rise|fall) edge\).*\s+(\S+)\s+\S+\s*$/) {
                        $captureEdge = $1;
                    } elsif ( $t =~ /^\s*clock reconvergence pessimism\s+(\S+)\s+\S+\s*$/) {
                        $crp = $1;
                    }
                }

            }                   # If not found arrival time

        }                       # After the first 7 lines

    }                           # Foreach line of file

    # Get tile names from the path if they couldn't be found from the start/end points
    $starttile = getTile(trim($lines->[$path_begin_line])) if ($MODE == $TOPLEVELMODE and not defined $starttile);
    $endtile   = getTile(trim($lines->[$path_end_line]))   if ($MODE == $TOPLEVELMODE and not defined $endtile);

    # Debug print everything about this path
    # Make sure everything is defined
    my $show_debug = 0;
    if (not defined $path_begin_line or not defined $path_end_line or not defined $capture_last_line or not defined $found_endpoint or not defined $found_arrival_time or not defined $startpoint or not defined $endpoint or ($showClockAndSkew and not defined $pathClock) or (not defined $skew and ($showClockAndSkew  or $extraPathInfo) and !$is_unclocked_path and (not defined $launchInsDly or not defined $captureInsDly or not defined $launchEdge or not defined $captureEdge))) {
        $show_debug = 2;
    }

    if ($show_debug) {
        my $message = ($show_debug == 2) ? "" : "DEBUG: ";
        print STDERR "${message}Processed path at line $linenum of $filenames[$filenum] with slack $slack\n";
        print STDERR "${message}  path_begin_line = $path_begin_line\n";
        print STDERR "${message}  path_end_line = $path_end_line\n";
        print STDERR "${message}  capture_last_line = $capture_last_line\n";
        print STDERR "${message}  found_endpoint = $found_endpoint\n";
        print STDERR "${message}  found_arrival_time = $found_arrival_time\n";
        print STDERR "${message}  startpoint = $startpoint\n";
        print STDERR "${message}  endpoint = $endpoint\n";
        if ($showClockAndSkew) {
            print STDERR "${message}  pathClock = $pathClock\n";
        }
        if ($MODE == $TOPLEVELMODE) {
            print STDERR "${message}  starttile = " . ((defined $starttile) ? $starttile : "NOT DEFINED") . "\n";
            print STDERR "${message}  endtile = " . ((defined $endtile) ? $endtile : "NOT DEFINED") . "\n";
        }
        unless (defined $skew or (!$showClockAndSkew and !$extraPathInfo) or $is_unclocked_path) {
            print STDERR "${message}  launchInsDly = ". (defined($launchInsDly) ? $launchInsDly : "NOT DEFINED") ."\n";
            print STDERR "${message}  captureInsDly = ". (defined($captureInsDly) ? $captureInsDly : "NOT DEFINED") ."\n";
            print STDERR "${message}  launchEdge = " . (defined($launchEdge) ? $launchEdge : "NOT DEFINED") ."\n";
            print STDERR "${message}  captureEdge = " . (defined($captureEdge) ? $captureEdge : "NOT DEFINED") ."\n";
            print STDERR "${message}  crp = " . (defined($crp) ? $crp : "NOT DEFINED") ."\n";
        }
        warn "ERROR: Could not determine basic data from timing path at line $linenum of $filenames[$filenum].  Something above was not defined (\$\. = line $.)\n" if ($show_debug == 2);
        return 0;
    }

    # Calculate the skew
    $captureInsDly = 0 if not defined $captureInsDly;
    $captureEdge   = 0 if not defined $captureEdge;
    $launchInsDly  = 0 if not defined $launchInsDly;
    $launchEdge    = 0 if not defined $launchEdge;
    $skew = (($captureInsDly-$captureEdge)-($launchInsDly-$launchEdge)) unless defined $skew;
    $skew = $skew + $crp if ( $skew_crpr );
    $skew = sprintf("%.3f", $skew);
    print STDERR "DEBUG:   skew = $skew\n" if $show_debug;

    # Get the startpoint and endpoint IDs
    if (exists $StartEndPoints{$startpoint}) {
        $startpoint_id = $StartEndPoints{$startpoint};
    } else {
        $StartEndPointsCounter++;
        $startpoint_id = $StartEndPointsCounter;
        $StartEndPoints{$startpoint} = $StartEndPointsCounter;
    }
    if (exists $StartEndPoints{$endpoint}) {
        $endpoint_id = $StartEndPoints{$endpoint};
    } else {
        $StartEndPointsCounter++;
        $endpoint_id = $StartEndPointsCounter;
        $StartEndPoints{$endpoint} = $StartEndPointsCounter;
    }

    my $tilepath;
    if ($MODE == $TOPLEVELMODE) {
        if (not defined $starttile and not defined $endtile) {
            #print STDERR "WARNING: Could not determine start or end tile for path at line $linenum of $filenames[$filenum] with slack $slack (startpoint=$startpoint, endpoint=$endpoint)\n";

            # Don't die here - create a new tile group and use that - report these at the end using a hash
            $num_tiles = 2;
            $tilepath = "UNKNOWN.UNKNOWN";

        } elsif (not defined $endtile) {
            if ($starttile eq $input_port_tilename) {
                $num_tiles = 3;
                $tilepath = "$starttile.UNKNOWN";
            } else {
                $tilepath = $starttile;
            }

        } elsif (not defined $starttile) {
            if ($endtile eq $output_port_tilename) {
                $num_tiles = 3;
                $tilepath = "UNKNOWN.$endtile";
            } else {
                $tilepath = $endtile;
            }

        } elsif (defined $starttile and defined $endtile) {
            $tilepath = "$starttile";

            if ($starttile ne $endtile) {
                $num_tiles = 2;
                $tilepath = "$starttile.$endtile";

            } else {

                # Figure out the text to use to match lines with the first line of the path
                my $starttile_matcher = undef;
                my $starttile_matcher_length = 1e99;
                foreach my $patt (keys %{$reverseTileMap{$starttile}}) {
                    my $line = $lines->[$path_begin_line];
                    $line =~ s/^\s+//;
                    if (substr($line, 0, length($patt)) eq $patt and length($patt) < $starttile_matcher_length) {
                        $starttile_matcher = $patt;
                        $starttile_matcher_length = length($patt);
                    }
                }
                if (not defined $starttile_matcher) {
                    die "ERROR: Could not figure out what text to look for when examining tile $starttile\n";
                }

                # Check for reaching top level or otherwise exiting the tile at any point
                my $len = length($starttile_matcher);
                my $inside_transparency_window = 0;
                for (my $x=$path_begin_line+1; $x<=$path_end_line; $x++) {
                    #print STDERR "ACTUAL PATH: $lines->[$x]";
                    next if (!defined($lines->[$x]) or $lines->[$x] =~ /^\s*$/);
                    if ($lines->[$x] =~ /^\s*-+\s*$/) {
                        $inside_transparency_window = ($inside_transparency_window == 0) ? 1 : 0;
                        next;
                    }
                    next if $inside_transparency_window;
                    my $substr = substr($lines->[$x],2,$len);
                    print STDERR "HELO: $lines->[$x]\n" if (!defined($substr));
                    if (substr($lines->[$x],2,$len) ne $starttile_matcher) {
                        if ( not (defined $not_top_level_regexp and $lines->[$x] =~ /$not_top_level_regexp/) ) {
                            # Even though starttile == endtile, if the code runs through here means some point in this timing path went out of this tile, routed into TOP_MODULE or other tiles, and then came back
                            # so change $num_tiles to 2
                            $num_tiles = 2; #Changing this; why would num_tiles=2 if starttile == endtile?
                            $tilepath = "$starttile.$endtile";
                            if ($show_debug) {
                                my $thisline = $x + $linenum;
                                print STDERR "DEBUG:   Path is not single tile due to line $thisline: $lines->[$x]";
                                last;
                            }
                        }
                    }
                }
            }
        }

    } elsif ($MODE == $TILELEVELMODE) {
        if ($num_tiles == 1) {
            $tilepath = $TILEMODETEXT[1];
        } else {
            $tilepath = $TILEMODETEXT[2];
        }
    }


    # At this point the interesting part of the data path is contained in @{$lines} from
    # $path_begin_line to $path_end_line.  In this section we will find all nodes, nets
    # and incremenetal delays that can be used to uniquify and tabulate TNS per corner.
    if ($findBothSetupAndHold or $uniquify or $extraPathInfo or $get_corner_scaling) {
        ProcessNodes($filenum, $linenum, $lines, $slack, $path_begin_line, $path_end_line, $num_tiles, $skew);
    }


    # Increment the path pointers (for the "met" column)
    $numPathsByBin[$num_tiles]++;
    $numPathsByBin[$ALL]++;

    # Check the slack against the correct limit based on the number of tiles
    # Also check path group limits and min limits
    $totalcount{$tilepath}++;
    if (not exists $NumTilesForPath{$tilepath}) {
        $NumTilesForPath{$tilepath} = $num_tiles;
    }

    my $is_violating = &CheckForViolatingPath($slack,$num_tiles);
    if ($is_violating or $keep_passing_paths) {
        # Any path that violates timing or all paths when "keep_passing_paths" is turned on
        # will enter this code path and get written to a temporary file with unordered slacks
        # which will later be re-ordered in the final files written by this program.

        if ($is_violating) {
            # This path meets all requirements to be counted as a violation
            $violationcount{$tilepath}++;
            $numViolatorsByBin[$ALL]++;
            $numViolatorsByBin[$num_tiles]++;
        } else {
            # This path does not violate the provided slack limits
            $ignorecount{$tilepath}++;
        }

        # Track the best and worst times per category of path (1-tile,2-tile,all)
        foreach my $category ($num_tiles,$ALL) {
            if (not exists $worst[$category] or $slack < $worst[$category]) {
                $worst[$category] = $slack;
                $wtns[$category] = $tns;
                if ($showClockAndSkew and defined $pathClock) {
                    $pathskew[$category] = $skew;
                    $pathclock[$category] = $pathClock;
                }
            }
            if (not exists $best[$category] or $slack > $best[$category]) {
                $best[$category] = $slack; # Stored for histogram range
            }
        }

        # Track the worst slack per tile path to see if it's out of order
        if (not exists $TNSOfWorst{$tilepath}) {
            $TNSOfWorst{$tilepath} = $tns;
            $WNSOfWorst{$tilepath} = $slack;
            $skewOfWorst{$tilepath} = $skew;
            $clockOfWorst{$tilepath} = $pathClock;
        } else {
            if ($tns < $TNSOfWorst{$tilepath}) {
                $TNSOutOfOrder{$tilepath}++; # If it was always perfect, it would have been worst-to-best
                $TNSOfWorst{$tilepath} = $tns;
                $WNSOfWorst{$tilepath} = $slack;
                $skewOfWorst{$tilepath} = $skew;
                $clockOfWorst{$tilepath} = $pathClock;

            } elsif ($tns < $PreviousTNS{$tilepath}) {
                # This means the TNS got worse from one to the next, hence out of order
                $TNSOutOfOrder{$tilepath}++; # If it was always perfect, it would have been worst-to-best
            }
        }

        # For checking if the slacks are out of order or not
        $PreviousTNS{$tilepath} = $tns;

    }  else {

        # This path does not violate the provided slack limits
        $ignorecount{$tilepath}++;
        return;
    }


    # Get an index number for this path
    $perFile_counter[$filenum]++;
    my $id_letter = $perFile_letter[$filenum];
    my $id_number = $perFile_counter[$filenum];


    # Write the path contents to the correct temp file for the tile path
    if (not exists $fh{$tilepath}) {
        $fh{$tilepath} = new FileHandle;
        $filename{$tilepath} = "$prefix.$tilepath.$suffix";
        my $filename = $filename{$tilepath} . ".unordered";
        $fh{$tilepath}->open(">$tmpdir/$filename") or die "ERROR: Can't write to $tmpdir/$filename\n";
    }
    my $position_before = $fh{$tilepath}->tell();
    my $margin_txt = ", margin = $margin";
    $fh{$tilepath}->printf("$comm Path from $filenames[$filenum] line $linenum, ID= ${id_letter}-${id_number}, slack = %5f, tns = %5f$margin_txt, clock = $pathClock\n", $slack, $tns);
    my @extralines = ();
    if ($extraPathInfo) {
        if (defined $skew and $skew != 0) {
            push @extralines, sprintf("#\t\tClock Skew   = %.3f\n", $skew);
        }

        for (my $ep = 0; $ep < scalar(@extraPathText); $ep++) {
            my $description = $extraPathText[$ep];
            if (defined $extraPathInfo{$filenum}{$linenum}[$ep]) {
                if ($ep != 3) {
                    # Decimal
                    push @extralines, sprintf("#\t\t$description = %d\n", $extraPathInfo{$filenum}{$linenum}[$ep]);
                } else {
                    # Floating point

                    # Do not print the skew twice
                    if (defined $skew and $skew != 0 and ($skew == $extraPathInfo{$filenum}{$linenum}[$ep])) {
                        # Skip print skew twice
                    } else {
                        push @extralines, sprintf("#\t\t$description = %.3f\n", $extraPathInfo{$filenum}{$linenum}[$ep]);
                    }
                }
            }
        }
        $fh{$tilepath}->print(@extralines) if @extralines;
    }
    $fh{$tilepath}->print(@{$lines});
    $fh{$tilepath}->print("\n");
    my $numlines = scalar(@{$lines}) + scalar(@extralines);

    # Store critical information about this path for sorting the tilepath later
    # We need the slack, seek position, and number of lines
    my @data = ($filenum,$linenum,$tns,$slack,$position_before,$numlines,$is_hold,$startpoint_id,$endpoint_id);
    if ($uniquify or $splitIntoPathGroups) {
        push @data, $pathGroup;
    }
    push @{$pathdata{$tilepath}}, \@data;


    # Track the number of violations per corner (if more than one file)
    if ($reportNumPerCorner) {
        $violsPerFile[$filenum]++;
        if (not exists $StartpointEndpoint{$is_hold}{$startpoint_id}{$endpoint_id}) {
            $sp_ep_worst_corner{$filenum}{$linenum} = 1;
            @{$StartpointEndpoint{$is_hold}{$startpoint_id}{$endpoint_id}} = ($slack,$filenum,$linenum,$tns);
        } else {
            my ($other_slack, $other_fn, $other_ln, $other_tns) = @{$StartpointEndpoint{$is_hold}{$startpoint_id}{$endpoint_id}};

            if ($other_fn != $filenum) {
                $sp_ep_not_unique{$filenum}{$linenum} = 1; # Shows it was found in more than one file
                $sp_ep_not_unique{$other_fn}{$other_ln} = 1; # The "other" one is not unique either
            }

            if ($tns < $other_tns) {
                if ($other_fn != $filenum) {
                    $sp_ep_worst_corner{$other_fn}{$other_ln} = 0; # Reset the old one to no longer being the worst for this corner
                    $sp_ep_worst_corner{$filenum}{$linenum} = 1;
                }
                @{$StartpointEndpoint{$is_hold}{$startpoint_id}{$endpoint_id}} = ($slack,$filenum,$linenum,$tns);
            }
        }
    }

    # Generate plotting data
    if ($genPlots) {
        # my $plotData = (); # $plotData{$clock}{$endpoint_id}{$startpoint_id}{$filenum} = $tns

        # Only store ones that are violating by 1ps or more
        if ($tns <= -0.001) {
            if (not exists $plotData{$pathClock}{$endpoint_id}{$startpoint_id}{$filecounter} or
                $tns < $plotData{$pathClock}{$endpoint_id}{$startpoint_id}{$filecounter}) {
                $plotData{$pathClock}{$endpoint_id}{$startpoint_id}{$filecounter} = $tns;
                #print STDERR "TNS for clock $pathClock in file $filecounter is $tns\n";
            }
        }
    }


}                               # sub ProcessPath


# Parse incremental delays and cells/nets, uniquifying if needed
# and identifying bottlenecks and nodes in both setup and hold paths
sub ProcessNodes {
  my ($filenum, $linenum, $lines, $slack, $path_begin_line, $path_end_line, $num_tiles, $skew) = @_;

  # At this point the interesting part of the data path is contained in @{$lines} from
  # $path_begin_line to $path_end_line.  In this section we will find all nodes, nets
  # and incremenetal delays that can be used to uniquify and tabulate TNS per corner.
  # The variable $is_hold is set to 1 for hold (min) paths and 0 for setup (max).

  # To speed up parsing, figure out the exact set of characters on each line (the columns)
  # that begin and end the incremental delay time.
  my $incr_bgn_col = 0;
  my $incr_length = 0;
  my @nets = ();
  my @cells = ();
  my $input_pin = undef;
  my $startcellpin;
  my $endcellpin;
  my $lastnetname;
  my $lastnetnamelength;
  my $lastnetincr;
  my $lastwasnet = 0;
  my $max_fanout = 0;

  if ($lines->[$path_begin_line] =~ /^(  (\S+)\s+\(\S+\)\s+\S+\s+)(\S+)\s/) {
    $startcellpin = $2;
    $incr_bgn_col = length($1) - 1;
    my $incr_end_col = length($1) + length($3);
    $incr_length = ($incr_end_col - $incr_bgn_col);
  }
  if ($lines->[$path_end_line] =~ /^  (\S+)/) {
    $endcellpin = $1;
  }

  # For nets, get the net name and incremental delay
  # For cells, get the cell/pin name, cell type, and incremental delay
  for (my $x=$path_begin_line; $x<=$path_end_line; $x++) {
    if (length($lines->[$x]) > $incr_bgn_col) {
      my $incr = substr($lines->[$x],$incr_bgn_col,$incr_length);
      if ($x==$path_end_line) {
        # The last line is always a net delay to the input pin of the destination cell
        push @nets, [$lastnetname, $incr];

        # However, we still want to get the endpoint cell (and assign it zero delay)
        if ($lines->[$x] =~ /^  (\S+) \((\S+)\)/) {
          push @cells, [$1, $2, 0,$input_pin]; # Name, cell type, incremental delay, input pin
        }

      } elsif ($lines->[$x] =~ /^  (\S+) \((\S+)\)/) {
        if ($lastwasnet) {
          # The one following a net is the input port, so credit the delay to the net, not the cell
          # Delay saving the data until we find a cell, to prevent storing hierarchical nets - store
          # the name of the shortest net since that's the highest hierarchy
          $lastwasnet = 0;
          $lastnetincr = $incr;

          # If we are getting net/cell scaling factors, capture the input pin on the cell transition
          if ($get_corner_scaling) {
            if ($1 =~ /.*\/(.*?)$/) {
              $input_pin = $1;
            }
          }

        } else {
          # Store the net delay for the previous net
          if (defined $lastnetname) {
            push @nets, [$lastnetname, $lastnetincr];
            $lastnetname = undef;
          }

          # The cell delays are always after a line with the input pin, not with "(net)" after the name
          push @cells, [$1,$2,$incr,$input_pin]; # Name, cell type, incremental delay, input pin
        }
      }
    } elsif ($lines->[$x] =~ /^  (\S+) \(net\)(.*)/) {
      $lastwasnet = 1;
      my $netlength = length($1);
      if (not defined $lastnetname or $netlength < $lastnetnamelength) {
        $lastnetname = $1;
        $lastnetnamelength = $netlength;
      }
      if ($extraPathInfo and $2 =~ /\s+(\d+)\s+/) {
        $max_fanout = $1 if ($1 > $max_fanout);
      }
    } else {
      $lastwasnet = 0;
      $lastnetname = undef;
    }
  }

  # For debugging, put a conditional here to display all data about all paths or certain paths
  if (0) {
    my $setup_or_hold_text = ($is_hold) ? "hold" : "setup";
    my $cellcount = scalar(@cells);
    my $netcount = scalar(@nets);
    print STDERR "=== PATH FROM FILE #$filenum ($filenames[$filenum]) LINE $linenum TYPE $setup_or_hold_text ===\n";
    print STDERR "  START: $startcellpin\n    END: $endcellpin\n";
    print STDERR "  SLACK: $slack  \tTNS: $tns  \tCELLS: $cellcount  \tNETS: $netcount\n  CELLS:\n";
    foreach my $cell (@cells) {
      my $inpin = (defined $cell->[3]) ? " INPUT:" . $cell->[3] : "";
      print STDERR "    $cell->[2] ($cell->[1]) : $cell->[0]$inpin\n";
    }
    print STDERR "  NETS:\n";
    foreach my $net (@nets) {
      print STDERR "    $net->[1] : $net->[0]\n";
    }
  }

  if ($extraPathInfo) {
    # Call function to collect extra info (HVT cells, OCV, CRPR, Logic levels, max fanout, etc)
    &extraPathInfoDataGather($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,\@cells,\@nets, $max_fanout, $skew);
  }

  if ($findWireDominatedPaths) {
    # Call function to collect data about the relative wire vs. cell delay
    &WireDominatedDataGather($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,\@cells,\@nets);
  }

  if ($findBothSetupAndHold) {
    &BothSetupAndHoldDataGather($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,\@cells,\@nets);
  }

  if ($uniquify) {
    # Call uniquification data gathering function (actual uniquification happens later)
    &{$uniquify_data_gather_function}($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,\@cells,\@nets);
  }

  if ($get_corner_scaling) {
    # Call Function to gather corner scaling info
    &cornerScalingDataGather($filenum,\@cells,\@nets);
  }

} # sub ProcessNodes


sub cornerScalingDataGather {
  my ($filenum,$cells,$nets) = @_;

  foreach my $cell (@{$cells}) {
    # Need transition
    my ($name,$type,$incr,$input_pin) = @{$cell};
    next if ($incr == 0);

    # Total hack
    $input_pin = "CP" if not defined $input_pin;

#    print STDERR "file=$filenum name=$name pin=$input_pin incr=$incr\n";
    $corner_celldelay{$name}{$input_pin}{$filenum} = $incr unless (exists $corner_celldelay{$name}{$input_pin}{$filenum});
    $corner_celltype{$name} = $type;
  }

  foreach my $net (@{$nets}) {
    # Need load
    my ($name,$incr) = @{$net};
    next if (!$incr);
    $corner_netdelay{$name}{$filenum} = $incr unless (exists $corner_netdelay{$name}{$filenum});
  }
}


# Checks to see if a path is violating timing or not (returns 0 if not violating)
sub CheckForViolatingPath {
  my ($slack,$num_tiles) = @_;
  if (defined $minLimit and $slack <= $minLimit) {
    return 0;
  }
  if (defined $maxLimit and $slack >= $maxLimit) {
    return 0;
  }
  if (defined $limit) {
    if ($num_tiles == 1) {
      if ($slack >= $limitSingleTile) {
        return 0;
      } else {
        return 1;
      }
    } else {
      if ($slack >= $limit) {
        return 0;
      } else {
        return 1;
      }
    }
  }

  if (defined $pathGroup and exists $pathGroupLimit{$pathGroup}) {
    if ($slack >= $pathGroupLimit{$pathGroup}) {
      return 0;
    } else {
      return 1;
    }
  }
  if (defined $paramsFile) {
    if ($slack >= $margin) {
      return 0;
    } else {
      return 1;
    }
  }

  # Default fallback is to assume limit is zero (also Primetime's default)
  if ($slack >= 0) {
    return 0;
  } else {
    return 1;
  }
}


# Gets the slack margin for a file by figuring out the corner and library from the filename
sub GetSlackMarginForFile {
  my ($file) = @_;
  my $filecopy;

  if ($file =~ /Pt/) {
    $filecopy = $file;
  } else {
    $filecopy = `realabspath $file`;
  }

  $filecopy =~ s/^.*?(Pt[^\/]+).*?$/$1/;  # Get rid of "rpts/" and "/report_timing.rpt.gz"
  $filecopy =~ s/\..*//;                     # Get rid of ".gz" and ".rpt"
  my $setup_or_hold = ($filecopy =~ /ho?ld/i) ? "hold" : "setup";
  my $si_report = ($file =~ /si_/i);

  # Get the exact lib of this file
  my $exact_lib = (exists $cornerLibs{$filecopy}) ? $cornerLibs{$filecopy} : undef;
  #print STDERR "EXACT LIB for $filecopy is $exact_lib\n";

  # The priority order for slack margins is:
  #
  # 1. Command line margin (from -limit option)
  # 2. Specific corner margin (TIMING_PtTimIlmDtyHldFunc1p1vcbest0cff1p21v0cHld_HOLD_MARGIN = 0.050)
  # 3. Specific si library margin (TIMING_HOLD_ff0p99v0c_MARGIN = 0.030) (si reports only)
  # 4. Default si margin (TIMING_SETUP_MARGIN = 0.000) (si reports only)
  # 5. Specific library margin (TIMING_HOLD_ff0p99v0c_MARGIN = 0.030)
  # 6. Default margin (TIMING_SETUP_MARGIN = 0.000)
  # 7. Default to zero
  #

  # Check for the specific corner
  if (exists $paramLimits{$setup_or_hold}{$filecopy}) {
    return ($paramLimits{$setup_or_hold}{$filecopy},"Found param for this corner");
  }

  # Check for the specific library
  my $best_match = undef;
  my $best_lib = undef;
  my $match_count = 0;

  # si params
  if ($si_report) {
    if (defined $exact_lib) {
      if (exists $paramLimits{$setup_or_hold}{"LIB_SI:$exact_lib"}) {
        return ($paramLimits{$setup_or_hold}{"LIB_SI:$exact_lib"}, "Found si param for specific library $exact_lib");
      }
    } else {
    foreach my $libtext (sort keys %{$paramLimits{$setup_or_hold}}) {
      if ($libtext =~ /LIB_SI:(.*)/) {
        my $lib = $1;
        if ($filecopy =~ /$lib/i) {
          if ($match_count > 0) {
            if ($best_match < $paramLimits{$setup_or_hold}{$libtext}) {
                $best_match = $paramLimits{$setup_or_hold}{$libtext};
                $best_lib = $lib;
            }
          } else {
            $best_match = $paramLimits{$setup_or_hold}{$libtext};
            $best_lib = $lib;
            $match_count++;
          }
        }
      }
    }
    return ($best_match,"Found si param for library $best_lib") if ($match_count==1);
    die "ERROR: Timing corner $filecopy matches multiple libraries from si margin params (too risky to just go with one). Example: $best_match\n" if $match_count;
  }
  }

  if (exists $paramLimits{$setup_or_hold}{"DEFAULT_SI"} and $si_report) {
    return ($paramLimits{$setup_or_hold}{"DEFAULT_SI"},"Found default Si $setup_or_hold param");
  }

  # non-si params
  if (defined $exact_lib) {
    if (exists $paramLimits{$setup_or_hold}{"LIB:$exact_lib"}) {
      return ($paramLimits{$setup_or_hold}{"LIB:$exact_lib"}, "Found param for specific library $exact_lib");
    }
  } else {
  foreach my $libtext (sort keys %{$paramLimits{$setup_or_hold}}) {
    if ($libtext =~ /LIB:(.*)/) {
      my $lib = $1;
      if ($filecopy =~ /$lib/i) {
        if ($match_count > 0) {
          if ($best_match < $paramLimits{$setup_or_hold}{$libtext}) {
              $best_match = $paramLimits{$setup_or_hold}{$libtext};
              $best_lib = $lib;
          }
        } else {
          $best_match = $paramLimits{$setup_or_hold}{$libtext};
          $best_lib = $lib;
          $match_count++;
        }
      }
    }
  }
  return ($best_match,"Found non-si param for library $best_lib") if ($match_count==1 and $si_report);
  return ($best_match,"Found param for library $best_lib") if ($match_count==1);
  die "ERROR: Timing corner $filecopy matches multiple libraries from margin params (too risky to just go with one). Example: $best_match\n" if $match_count;
  }

  # Check for the default margin
  if (exists $paramLimits{$setup_or_hold}{"DEFAULT"} and $si_report) {
    return ($paramLimits{$setup_or_hold}{"DEFAULT"},"Found default non-si $setup_or_hold param");
  } elsif (exists $paramLimits{$setup_or_hold}{"DEFAULT"}) {
    return ($paramLimits{$setup_or_hold}{"DEFAULT"},"Found default $setup_or_hold param");
  }

  # Return the command line margin
  if (defined $limit) {
    return ($limit,"from -limit option");
  } else {
    return (0,"default is zero");
  }
}


sub GetScalingForFile {
  my ($file) = @_;
  my $filecopy;

  if ($file =~ /Pt/) {
    $filecopy = $file;
  } else {
    $filecopy = `realabspath $file`;
  }

  $filecopy =~ s/^.*?(Pt[^\/]+).*?$/$1/;  # Get rid of "rpts/" and "/report_timing.rpt.gz"
  $filecopy =~ s/\..*//;                     # Get rid of ".gz" and ".rpt"
  my $setup_or_hold = ($filecopy =~ /ho?ld/i) ? "hold" : "setup";

  # The priority order for slack margins is:
  #
  # 1. Specific corner margin (TIMING_PtTimIlmDtyHldFunc1p1vcbest0cff1p21v0cHld_HOLD_MARGIN = 0.050)
  # 2. Specific library margin (TIMING_HOLD_ff0p99v0c_MARGIN = 0.030)
  # 3. Default margin (TIMING_SETUP_MARGIN = 0.000)
  # 4. Command line margin (from -limit option)
  #

  # Check for the specific corner
  if (exists $paramScaling{$setup_or_hold}{$filecopy}) {
    $show_scaling = 1 if ($paramScaling{$setup_or_hold}{$filecopy} != 0 and $paramScaling{$setup_or_hold}{$filecopy} != 1);
    return ($paramScaling{$setup_or_hold}{$filecopy},"Found param for this corner");
  }

  # Check for the specific library
  my $best_match = undef;
  my $best_lib = undef;
  my $match_count = 0;
  foreach my $libtext (sort keys %{$paramScaling{$setup_or_hold}}) {
    next if ($libtext eq "DEFAULT");
    if ($libtext =~ /LIB:(.*)/) {
      my $lib = $1;
      if ($filecopy =~ /$lib/) {
        if ($match_count > 0) {
          if ($best_match < $paramLimits{$setup_or_hold}{$libtext}) {
              $best_match = $paramLimits{$setup_or_hold}{$libtext};
              $best_lib = $lib;
          }
        } else {
          $best_match = $paramScaling{$setup_or_hold}{$libtext};
          $best_lib = $lib;
          $match_count++;
        }
      }
    }
  }
  if ($match_count == 1) {
    $show_scaling = 1 if ($best_match != 0 and $best_match != 1);
    return ($best_match,"Found param for library $best_lib");
  }
  die "ERROR: Timing corner $filecopy matches multiple libraries from scaling params (too risky to just go with one). Example: $best_match\n" if $match_count;

  # Check for the default scaling
  if (exists $paramScaling{$setup_or_hold}{"DEFAULT"}) {
    $show_scaling = 1 if ($paramScaling{$setup_or_hold}{"DEFAULT"} != 0 and $paramScaling{$setup_or_hold}{"DEFAULT"} != 1);
    return ($paramScaling{$setup_or_hold}{"DEFAULT"},"Found default $setup_or_hold param");
  }

  # Return the command line margin
  return (1,"defaults to 1");
}



# Generate a histogram from a hash
sub histogram_it() {
  my ($data,$max,$min) = @_;

  # Customize the output
  my $max_stars = 80;	# The max number of asterisks to display in each bucket (controls width)
  my $max_buckets = 50; # The number of buckets (controls height)

  my $mylimit = (defined $limit) ? $limit : 0;

  my ($datamin,$datamax) = ($min,$max);
  if ( ($datamin > $mylimit and $datamax > $mylimit) or
       ($datamin < $mylimit and $datamax < $mylimit) ) {
    if ( abs($datamin-$mylimit) < abs($datamax-$mylimit) ) {
      $datamin = $mylimit;
    } else {
      $datamax = $mylimit;
    }
  }
  my ($buckmin,$buckmax,$bucksize) = find_best_histo($datamin,$datamax,$max_buckets);

  my $range = $buckmax - $buckmin;
  my $buckets = $max_buckets;
  my $total = scalar(@{$data});

  if ($total > 0) {
    # Make sure our total isn't too huge
    my $divisor = 1;
    my $max_total = $max_buckets * $max_stars;
    while ($total/$divisor > $max_total/2) {
      my $old_d = $divisor;
      $divisor = $old_d * 2;
      if ($total/$divisor > $max_total/2) {
	$divisor = $old_d * 5;
      }
      if ($total/$divisor > $max_total/2) {
	$divisor = $old_d * 10;
      }
    }

    # Figure out the bucket ranges
    my (@min, @max, @count);
    for (my $c=0; $c<$buckets; $c++) {
      $min[$c] = $buckmin;
      $buckmin += $bucksize;
      $max[$c] = $buckmin;
      $count[$c] = 0;
    }

    $max[$buckets-1] = $buckmax + 0.00001;

    # Adjust the buckets based on formatting that
    # will be done later
    my (@min_drop, @max_drop);
    for (my $c=0; $c<$buckets; $c++) {
      if ($c>0) {
	$min_drop[$c] = renumify(format_num($min[$c],3)) + 0.0;
      } else {
	$min_drop[$c] = $min[$c];
      }
      if ($c<($buckets-1)) {
	$max_drop[$c] = renumify(format_num($max[$c],3)) + 0.0;
      } else {
	$max_drop[$c] = $max[$c];
      }
    }

    # Drop things in buckets
    my $maxcount = 0;
    my $minvalue = $min_drop[0];
    for (my $i=0; $i < $total; $i++) {
      # Calculate the bucket directly
      my $drop_bucket = int( ($data->[$i] - $minvalue ) / $bucksize);
      $count[$drop_bucket]++;
      if ($count[$drop_bucket] > $maxcount) {
        $maxcount = $count[$drop_bucket];
      }
    }

    # Print total in each bucket (the histogram)
    my $postfix;
    my $postfix_amt = $maxcount - 2;
    if ($maxcount > $max_stars) {
      $postfix_amt = $max_stars - 2;
    }
    if ($postfix_amt > 0) {
      $postfix = '-' x $postfix_amt;
    } else {
      $postfix = "";
    }
    print "\n";
    if ($divisor > 1) {
      print "-------------------------------$postfix\n";
      print "  * Asterisks represent $divisor items * \n";
    }
    print "---------+---------+-----------$postfix\n";
    print " Lo Viol | Hi Viol | Amount ($total)\n";
    print "---------+---------+-----------$postfix\n";
    my $stars;
    for (my $c=0; $c<$buckets; $c++) {
      my $min_s = format_num($min[$c],3);
      my $max_s = format_num($max[$c],3);
      my $cnt = int ($count[$c] / $divisor + .5);
      if ($cnt == 0 and $count[$c] > 0) {
	$stars = '.'; 
      } elsif ($cnt <= $max_stars) {
	$stars = '*' x $cnt;
      } else {
	$stars = '*' x $max_stars . '+';
      } 
      print " $max_s | $min_s | $stars ";
      if ($count[$c] > 4 or ($divisor > 1 and $count[$c] > 0)) {
	print "($count[$c])";
      }
      print "\n";
    }
    print "---------+---------+-----------$postfix\n\n";

  }
}


sub find_best_histo {
  my ( $lo, $hi, $bins ) = @_;

  my $range = 1000*abs($hi-$lo);

  my @target_sizes_in_ps = (1,2,5,10,20,25,50,100,200,250,500,1000,2000,2500,5000,10000,2000,25000,50000,100000,500000,1000000,5000000,10000000,50000000,100000000,500000000,1000000000,5000000000,10000000000,50000000000,100000000000);
  my $bin_size;
  foreach my $target_size_in_ps (@target_sizes_in_ps) {
    my $max_range = $bins * $target_size_in_ps;
    if ($max_range >= $range) {
      $bin_size = $target_size_in_ps;
      last;
    }
  }
  if (not defined $bin_size) {
    die "ERROR: Could not fit range from $lo to $hi in $bins bins\n";
  }

  # Round the lowest value to one bin length in either direction
  my $hi_in_ns = $hi * 1000000;
  my $remainder = $hi_in_ns % (1000*$bin_size);
  my $hival = ($remainder == 0) ? 0.000001 * $hi_in_ns : 0.000001 * ($hi_in_ns - $remainder) + 0.001 * $bin_size;
  my $loval = $hival - ($bins * 0.001 * $bin_size);
  $bin_size = 0.001 * $bin_size;

  # Prevent funny rounding artifacts (floating point garbage like -2.77555756156289e-17 which is really 0.0)
  $loval = sprintf("%.12f", $loval) + 0.0;
  $hival = sprintf("%.12f", $hival) + 0.0;
  $bin_size = sprintf("%.12f", $bin_size) + 0.0;

  #print STDERR "BEST_HISTO for (lo=$lo hi=$hi bins=$bins) = ($loval,$hival,$bin_size)\n";
  return ($loval, $hival, $bin_size);

}

# Trim whitespace from the beginning and end of a string
sub trim {
  my ($in) = @_;
  if ($in =~ /^\s*(\S+)\s*/) {
    return $1;
  } else {
    chomp $in;
    return $in;
  }
}


# Find a tile name, given an arbitrary string of verilog-style hierarchy.
sub getTile {
  my ($item) = @_;

  # Check previously found tiles for matches (quick length-based check)
  # Uses data stored from calls to indexTile
  my $itemlen = length($item);
  my $max_length_to_check = $itemlen - 2;
    foreach my $len (@sorted_tileLengths) {
    last if ($len > $itemlen);
    if ($itemlen == $len or ($len <= $max_length_to_check and substr($item,$len,1) eq '/')) {
      # There is a slash there so check the stuff before it
      my $stuff_before_slash = substr($item,0,$len);
      if (exists $tileLengths{$len}{$stuff_before_slash}) {
        return $tileLengths{$len}{$stuff_before_slash};
        }
      }
    }

  # Check the patterns in @tilePatterns to see if there is a match
  foreach my $pat (@tilePatterns) {
    if ($item =~ /$pat/) {
      my $tile = $1;  # There must be a parentheses somewhere in the pattern for this to work (forced earlier in script)
      my $origtile = $tile;
      $tile =~ s/\//:/g; # Turn slashes into colons
      $tile =~ s/://g;
      chomp $tile;
      return indexTile($item, $origtile, $tile);
      }
    }

  # Take the first level of hierarchy found
  if ($item =~ /^([^\/]+)\//) {
    indexTile($1, $1, $1);
    return indexTile($item, $item, $1);
  }

  # Take the item as-is
  return indexTile($item,$item,$item);
}

# Index a tile and return the string to display and use for the tile in filenames
# Indexing stores the tile in a hash based on string length for fast lookup later
sub indexTile {
  my ($item, $text, $tile) = @_;  # Text can have slashes, tile cannot (compute_array1/tcpt1 vs compute_array1:tcpt1)

  my $textmap = $text;
  $textmap =~ s/([\[\]\/\\\(\)\.\{\}\*])/\\$1/g; # Escape all special characters
  if ($item =~ /^(.*?$textmap).*$/) {
    my $item_text_that_yields_tile = $1;
    my $item_text_length = length($item_text_that_yields_tile);
    # For each length of string that yielded a certain tile result, store the string plus the tile result for quick lookups
    $tileLengths{$item_text_length}{$item_text_that_yields_tile} = $tile;  # For example, tileLengths{10}{"core/tcpt1"} = "tcpt1";
    @sorted_tileLengths = (sort {$a <=> $b} keys %tileLengths);
    $reverseTileMap{$tile}{$item_text_that_yields_tile} = 1;
  } else {
    print STDERR "ERROR: Failed to find rexexp \"$textmap\" on line \"$item\" (tile=$tile) while indexing tile name\n";
    die "ERROR: This should never occur (while trying to index a tile name during tile name detection)";
  }

  return $tile;
}

# Gets the path group from the group line - clock gating ones get turned into the pathClock instead
sub GetPathGroup {
  my ($in) = @_;
  if (substr($in,0,1) eq "*") {
    # Special groups strip off the stars
    if ($in =~ /^\*\*(.*)\*\*$/) {
      if ($1 eq "clock_gating_default") {
        #print STDERR "Found $1, so setting it to $pathClock\n";
        return $pathClock;
      } else {
        #print STDERR "OTHER: $in ($1)\n";
        return $1;
      }
    } else {
      die "ERROR: Funky path group found: $in (at line $.)\n";
    }
    die;
  } else {
    # Normal groups are just the clock name
    return $in;
  }
}


# Escape special characters to yield a regexp
sub Point2Regex {
  my ($in) = @_;

  # Turn cellname[0] into cellname\[0\] so it will match in regexp
  # Also escape any backslashes so they match
  $in =~ s/([\\\[\]])/\\$1/g;
  if ($ignore_header_pins) {
    $in =~ s#\/[^\/]+$##g;
  }


  return $in;
}





# Inputs to the data gathering functions for uniquification are:
#
# $filenum      - the index of the file where the path was found
# $linenum      - the line number in the file where the path begins
# $startcellpin - startpoint with pin (more than just the stuff on the startpoint line)
# $endcellpin   - endpoint   with pin (more than just the stuff on the startpoint line)
# $slack        - slack of the path (directly from slack line)
# $tns          - total negative slack, which is ($slack-$margin)
# $is_hold      - 0 for setup paths, 1 for hold paths
# $is_input     - 0 for normal paths, 1 for paths from input ports
# $is_output    - 0 for normal paths, 1 for paths to output ports
# $num_tiles    - In chip mode, 1 for internal path, 2 for multi-tile path
#                 In tile mode, 1 for internal path, 2 for IO path
# $cells        - reference to array with cells, each item is an anonymous array with:
#                 [cellname, celltype, incremental delay for cell]
# $nets         - reference to array with nets, each item is an anonymous array with:
#                 [netname, incremental delay for net]

sub data_gather_worst_slack_per_cell {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my @indexes = @{GetCellNameIndexes($cells)};

  # For each cell:
  #   - store the worst TNS found in any path containing that cell, as well as the path number
  #   - store the total number of paths with negative TNS containing the cell
  #   - if justify is turned on, store a hash of paths with negative TNS containing this cell
  #   - store the total TNS for this cell

  if ($tns < 0) {
    my $count = scalar(@indexes);
    $numItemsPerPath{$filenum}{$linenum} = $count;
    for (my $index_num = 0; $index_num < $count; $index_num++) {
      my $index = $indexes[$index_num];
      my $is_endpoint = ($index_num == ($count-1));
      if (not defined $worstTNSbyIndex{$is_hold}{$index} or ($tns < $worstTNSbyIndex{$is_hold}{$index})) {
        # The TNS for this path is the worst so far for this cell index
        $worstTNSbyIndex{$is_hold}{$index} = $tns;
        $worstTNSfilenum{$is_hold}{$index} = $filenum;
        $worstTNSlinenum{$is_hold}{$index} = $linenum;
        $numPathsByIndex{$is_hold}{$index}++;
        $totalTNSbyIndex{$is_hold}{$index} += $tns;
        $isIndexEndpoint{$is_hold}{$index} = 1 if ($is_endpoint);

        if ($justify) {
          # Store a hash of violating paths containing this node
          $violatingPathsWithIndex{$is_hold}{$index}{$filenum}{$linenum} = 1;
        }
      }
    }
  }

  return;
}

# Set %unique and %justify (both hashed by filenum and linenum) for all paths
# Use the data set in subroutine "data_gather_worst_slack_per_*"
sub uniquify_worst_slack_per {

  # Hold paths are always unique if the endpoint has the worst TNS for that node
  if (exists $isIndexEndpoint{1}) {
    foreach my $index (keys %{$isIndexEndpoint{1}}) {
      my ($filenum,$linenum) = ($worstTNSfilenum{1}{$index}, $worstTNSlinenum{1}{$index});
      if (not exists $unique{$filenum}{$linenum} or !$unique{$filenum}{$linenum}) {
        $unique{$filenum}{$linenum} = 1;
        if ($justify) {
          my $reason_id = 0; # Reason number 0 for being unique is the worst TNS for a hold endpoint
          @{$justify{$filenum}{$linenum}} = (\&get_justify_text_worst_slack_per,[1, $reason_id]);
        }
      }
    }
  }

  # A path might be unique if any node in the path has the worst TNS for that node
  foreach my $is_hold (keys %worstTNSbyIndex) {
    my %score = ();
    foreach my $index (keys %{$worstTNSbyIndex{$is_hold}}) {
      my $worst_tns = $worstTNSbyIndex{$is_hold}{$index};
      my $filenum   = $worstTNSfilenum{$is_hold}{$index};
      my $linenum   = $worstTNSlinenum{$is_hold}{$index};
      my $num_items = $numItemsPerPath{$filenum}{$linenum};
      my $num_paths = $numPathsByIndex{$is_hold}{$index};
      my $total_tns = $totalTNSbyIndex{$is_hold}{$index};

      if (not exists $unique{$filenum}{$linenum} or !$unique{$filenum}{$linenum}) {
        if ($num_paths > 10 or (!$is_hold and $num_items < 5) or $total_tns < -1) {
          $unique{$filenum}{$linenum} = 1;
          if ($justify) {
            my $reason_id = 1; # Reason number 1 for being unique is a node that stands out
            @{$justify{$filenum}{$linenum}} = (\&get_justify_text_worst_slack_per,[1, $reason_id, $is_hold, $index]);
          }

        }
      }


      # Not enough unique paths come from this algorithm so far:

# ./sortTimingPaths /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/rpts/PtTimFuncTT0p9vtyprc110ctt0p9v110cRouteSxStp/report_timing.rpt.gz -params /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/tile.params -extrainfo -uniquify -justify -algorithm "worst_slack_per_net" -prefix xbr_pernet
# ./sortTimingPaths /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/rpts/PtTimFuncTT0p9vtyprc110ctt0p9v110cRouteSxStp/report_timing.rpt.gz -params /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/tile.params -extrainfo -uniquify -justify -algorithm "worst_slack_per_cell" -prefix xbr_percell
# ./sortTimingPaths /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/rpts/PtTimFuncTT0p9vtyprc110ctt0p9v110cRouteSxStp/report_timing.rpt.gz -params /proj/cypress-pd2-nobackup/lani/TILES/fastpath_xbr/from_dszasz_1030/main/pd/tiles/NL2p1_newSP/tile.params -extrainfo -uniquify -justify -prefix xbr_default
#
# xbr_default.report:### Unique counts per category (WNS/TNS/etc are for unique only)
# xbr_default.report-
# xbr_default.report- Type    Path       Total    Unique  Non-Uniq      WNS  Wst TNS     Total TNS  Margin  Clock Group
# xbr_default.report------  --------  --------  --------  --------  -------  -------  ------------  ------  -----------
# xbr_default.report-SETUP       ALL     21271       784     20487   -0.283   -0.283       -60.450   0.000  ALL
# xbr_default.report-SETUP  INTERNAL     20000       134     19866   -0.283   -0.283       -24.706   0.000  ALL
# xbr_default.report-SETUP  EXTERNAL      1271       650       621   -0.277   -0.277       -35.744   0.000  ALL
# xbr_default.report-
# --
# xbr_percell.report:### Unique counts per category (WNS/TNS/etc are for unique only)
# xbr_percell.report-
# xbr_percell.report- Type    Path       Total    Unique  Non-Uniq      WNS  Wst TNS     Total TNS  Margin  Clock Group
# xbr_percell.report------  --------  --------  --------  --------  -------  -------  ------------  ------  -----------
# xbr_percell.report-SETUP       ALL     21271        47     21224   -0.197   -0.197        -1.406   0.000  ALL
# xbr_percell.report-SETUP  INTERNAL     20000         0     20000    0.000    0.000         0.000   0.000  ALL
# xbr_percell.report-SETUP  EXTERNAL      1271        47      1224   -0.197   -0.197        -1.406   0.000  ALL
# xbr_percell.report-
# --
# xbr_pernet.report:### Unique counts per category (WNS/TNS/etc are for unique only)
# xbr_pernet.report-
# xbr_pernet.report- Type    Path       Total    Unique  Non-Uniq      WNS  Wst TNS     Total TNS  Margin  Clock Group
# xbr_pernet.report------  --------  --------  --------  --------  -------  -------  ------------  ------  -----------
# xbr_pernet.report-SETUP       ALL     21271        58     21213   -0.197   -0.197        -1.865   0.000  ALL
# xbr_pernet.report-SETUP  INTERNAL     20000         0     20000    0.000    0.000         0.000   0.000  ALL
# xbr_pernet.report-SETUP  EXTERNAL      1271        58      1213   -0.197   -0.197        -1.865   0.000  ALL
# xbr_pernet.report-



    }
  }

}


sub data_gather_worst_slack_per_net {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my @indexes  =  @{GetNetNameIndexes($nets)};

  # The rest is identical to worst_slack_per_cell

  # For each net:
  #   - store the worst TNS found in any path containing that net, as well as the path number
  #   - store the total number of paths with negative TNS containing the net
  #   - if justify is turned on, store a hash of paths with negative TNS containing this net
  #   - store the total TNS for this net

  if ($tns < 0) {
    my $count = scalar(@indexes);
    $numItemsPerPath{$filenum}{$linenum} = $count;
    for (my $index_num = 0; $index_num < $count; $index_num++) {
      my $index = $indexes[$index_num];
      my $is_endpoint = ($index_num == ($count-1));
      if (not defined $worstTNSbyIndex{$is_hold}{$index} or ($tns < $worstTNSbyIndex{$is_hold}{$index})) {
        # The TNS for this path is the worst so far for this net index
        $worstTNSbyIndex{$is_hold}{$index} = $tns;
        $worstTNSfilenum{$is_hold}{$index} = $filenum;
        $worstTNSlinenum{$is_hold}{$index} = $linenum;
        $numPathsByIndex{$is_hold}{$index}++;
        $totalTNSbyIndex{$is_hold}{$index} += $tns;
        $isIndexEndpoint{$is_hold}{$index} = 1 if ($is_endpoint);

        if ($justify) {
          # Store a hash of violating paths containing this node
          $violatingPathsWithIndex{$is_hold}{$index}{$filenum}{$linenum} = 1;
        }
      }
    }
  }

  return;
}



sub data_gather_worst_slack_per_start_end_pair {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my $index = "$startcellpin $endcellpin";

  # For each startpoint/endpoint pair:
  #   - store the worst TNS found in any path with this startpoint/endpoint pair, as well as the path number
  #   - store the total number of paths with negative TNS with this startpoint/endpoint pair
  #   - if justify is turned on, store a hash of paths with negative TNS with this startpoint/endpoint pair
  #   - store the total TNS for this startpoint/endpoint pair

  if ($tns < 0) {
    if (not defined $worstTNSbyIndex{$is_hold}{$index} or ($tns < $worstTNSbyIndex{$is_hold}{$index})) {
      # The TNS for this path is the worst so far for this startpoint/endpoint pair index
      $numItemsPerPath{$filenum}{$linenum} = 1;
      $worstTNSbyIndex{$is_hold}{$index} = $tns;
      $worstTNSfilenum{$is_hold}{$index} = $filenum;
      $worstTNSlinenum{$is_hold}{$index} = $linenum;
      $numPathsByIndex{$is_hold}{$index}++;
      $totalTNSbyIndex{$is_hold}{$index} += $tns;

      if ($justify) {
        # Store a hash of violating paths containing this node
        $violatingPathsWithIndex{$is_hold}{$index}{$filenum}{$linenum} = 1;
      }
    }
  }

  return;
}



# Uniquify using 4-consecutive-node algorithm, like the old sort_and_uniquify
sub data_gather_consecutive_nodes {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my @cells = @{GetCellNameIndexes($cells)};
  my @nets  =  @{GetNetNameIndexes($nets)};

  my $num_nodes = scalar(@cells)+scalar(@nets);
  my $counter = 0;
  my @nodes = ();
  while (defined $cells[$counter] or defined $nets[$counter]) {
    push @nodes, "C.$cells[$counter]" if defined $cells[$counter];
    push @nodes, "N.$nets[$counter]" if defined $nets[$counter];
    $counter++;
  }

  my @segments;
  my $segment;
  if ($num_nodes < $num_consecutive_nodes) {
    $segment = (join ":", @nodes);
    push @segments, $segment;

  } else {
    for (my $i=0; $i <= ($num_nodes-$num_consecutive_nodes); $i++) {
      $segment = $nodes[$i];
      for (my $j=$i+1; $j < ($i + $num_consecutive_nodes); $j++) {
        $segment .= ":" . $nodes[$j];
      }
      push @segments, $segment;
    }
  }


  # Add segments for input or output ports to make sure the worst path for any port
  # shows up as a unique path no matter what.
  push @segments, "I:$startcellpin" if $is_input;
  push @segments, "O:$endcellpin" if $is_output;
  push @segments, "IO:$startcellpin:$endcellpin" if ($is_input and $is_output);

  $consecutiveSegments{$filenum}{$linenum} = \@segments;
  foreach my $segment (@segments) {
    if (not exists $worstConsecutiveCellTNS{$is_hold}{$segment}) {
      $worstConsecutiveCellTNS{$is_hold}{$segment} = $tns;
      $worstConsecutiveCellPath{$is_hold}{$segment} = [$filenum,$linenum];
      #print STDERR "WORST FOR $segment is [$filenum,$linenum]\n";

    } elsif ($tns < $worstConsecutiveCellTNS{$is_hold}{$segment}) {
      # If justify is turned on, add justification info for the OLD worst path for this segment
      if ($justify) {
        my ($oldfile,$oldline) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
        if (not exists $justify{$oldfile}{$oldline}) {
          @{$justify{$oldfile}{$oldline}} = (\&get_justify_text_consec_segment_found_nodes,[0,$oldfile,$oldline,$segment]);
        }
      }

      # Mark this path as having the worst tns for this segment
      $worstConsecutiveCellTNS{$is_hold}{$segment} = $tns;
      $worstConsecutiveCellPath{$is_hold}{$segment} = [$filenum,$linenum];
      #print STDERR "WORST FOR $segment is [$filenum,$linenum]\n";

    } elsif ($justify and not exists $justify{$filenum}{$linenum}) {
      @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_nodes,[0,@{$worstConsecutiveCellPath{$is_hold}{$segment}},$segment]);
    }
  }

  return;
}

# Uniquify using the old 4-consecutive node algorithm from sort_and_uniquify
#
# Data we will use in the consecutive cell uniquification function is:
# %cellNameIndex  - tells the index into the cellNameListArray to find the cell name by index
# @cellNameList   - a simple list of cell names, with the array index used in the other data
# %worstConsecutiveCellPath - The [filenum,linenum] with the worst TNS for a given ordered set of cells
# %worstConsecutiveCellTNS  - The TNS of the worst path having the given ordered set of cells
# %consecutiveSegments      - List of sets of consecutive segments for a path
#
sub uniquify_consecutive_nodes {
  my %found_segments = ();
  foreach my $is_hold (sort keys %worstConsecutiveCellTNS) {
    foreach my $segment (sort {$worstConsecutiveCellTNS{$is_hold}{$a} <=> $worstConsecutiveCellTNS{$is_hold}{$b} or $a cmp $b} keys %{$worstConsecutiveCellTNS{$is_hold}}) {
      my ($filenum,$linenum) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
      next if (exists $unique{$filenum}{$linenum});

      # Go through each segment.  Unique paths block other paths from using any shared segments
      my $any_already_found = 0;
      my ($uniqfilenum,$uniqlinenum);
      foreach my $segment (@{$consecutiveSegments{$filenum}{$linenum}}) {
        if (exists $found_segments{$is_hold}{$segment}) {
          ($uniqfilenum,$uniqlinenum) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
          $any_already_found = 1;
          $unique{$filenum}{$linenum} = 0;
          @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_nodes,[0,$uniqfilenum,$uniqlinenum,$segment]) if $justify;
          last;
        }
      }

      if ($any_already_found) {
        #print STDERR "NON-UNIQUE PATH AT LINE $linenum of $filenames[$filenum] due to path at line $uniqlinenum of $filenames[$uniqfilenum]\n";
      } else {
        #print STDERR "UNIQUE PATH AT LINE $linenum of $filenames[$filenum]\n";
        $unique{$filenum}{$linenum} = 1; # so it won't find the same path twice
        @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_nodes,[1,0,0,$segment]) if $justify;

        # Mark the segments as found so no other paths can use them to be unique
        foreach my $segment (@{$consecutiveSegments{$filenum}{$linenum}}) {
          $found_segments{$is_hold}{$segment} = 1;
        }
      }

    } # foreach segment
  } # foreach is_hold
} # sub uniquify_consecutive_nodes



# Uniquify using consecutive-cell algorithm, like the old sort_and_uniquify except ignores nets
sub data_gather_consecutive_cells {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my @cells = @{GetCellNameIndexes($cells)};
  my $num_cells = scalar(@cells);

  my @segments;
  my $segment;
  if ($num_cells < $num_consecutive_cells) {
    $segment = (join ":", @cells);
    push @segments, $segment;

  } else {
    for (my $i=0; $i <= ($num_cells-$num_consecutive_cells); $i++) {
      $segment = $cells[$i];
      for (my $j=$i+1; $j < ($i + $num_consecutive_cells); $j++) {
        $segment .= ":" . $cells[$j];
      }
      push @segments, $segment;
    }
  }


  # Add segments for input or output ports to make sure the worst path for any port
  # shows up as a unique path no matter what.
  push @segments, "I:$startcellpin" if $is_input;
  push @segments, "O:$endcellpin" if $is_output;
  push @segments, "IO:$startcellpin:$endcellpin" if ($is_input and $is_output);

  $consecutiveSegments{$filenum}{$linenum} = \@segments;
  foreach my $segment (@segments) {
    if (not exists $worstConsecutiveCellTNS{$is_hold}{$segment}) {
      $worstConsecutiveCellTNS{$is_hold}{$segment} = $tns;
      $worstConsecutiveCellPath{$is_hold}{$segment} = [$filenum,$linenum];
      #print STDERR "WORST FOR $segment is [$filenum,$linenum]\n";

    } elsif ($tns < $worstConsecutiveCellTNS{$is_hold}{$segment}) {
      # If justify is turned on, add justification info for the OLD worst path for this segment
      if ($justify) {
        my ($oldfile,$oldline) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
        if (not exists $justify{$oldfile}{$oldline}) {
          @{$justify{$oldfile}{$oldline}} = (\&get_justify_text_consec_segment_found_nodes,[0,$oldfile,$oldline,$segment]);
        }
      }

      # Mark this path as having the worst tns for this segment
      $worstConsecutiveCellTNS{$is_hold}{$segment} = $tns;
      $worstConsecutiveCellPath{$is_hold}{$segment} = [$filenum,$linenum];
      #print STDERR "WORST FOR $segment is [$filenum,$linenum]\n";

    } elsif ($justify and not exists $justify{$filenum}{$linenum}) {
      @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_nodes,[0,@{$worstConsecutiveCellPath{$is_hold}{$segment}},$segment]);
    }
  }
  return;
}


# Uniquify using the old 4-consecutive node algorithm from sort_and_uniquify (except looking at only cells instead of both cells and nets)
#
# Data we will use in the consecutive cell uniquification function is:
# %cellNameIndex  - tells the index into the cellNameListArray to find the cell name by index
# @cellNameList   - a simple list of cell names, with the array index used in the other data
# %worstConsecutiveCellPath - The [filenum,linenum] with the worst TNS for a given ordered set of cells
# %worstConsecutiveCellTNS  - The TNS of the worst path having the given ordered set of cells
# %consecutiveSegments      - List of sets of consecutive segments for a path
#
sub uniquify_consecutive_cells {
  my %found_segments = ();
  foreach my $is_hold (sort keys %worstConsecutiveCellTNS) {
    foreach my $segment (sort {$worstConsecutiveCellTNS{$is_hold}{$a} <=> $worstConsecutiveCellTNS{$is_hold}{$b} or $a cmp $b} keys %{$worstConsecutiveCellTNS{$is_hold}}) {
      my ($filenum,$linenum) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
      next if (exists $unique{$filenum}{$linenum});

      # Go through each segment.  Unique paths block other paths from using any shared segments
      my $any_already_found = 0;
      my ($uniqfilenum,$uniqlinenum);
      foreach my $segment (@{$consecutiveSegments{$filenum}{$linenum}}) {
        if (exists $found_segments{$is_hold}{$segment}) {
          ($uniqfilenum,$uniqlinenum) = @{$worstConsecutiveCellPath{$is_hold}{$segment}};
          $any_already_found = 1;
          $unique{$filenum}{$linenum} = 0;
          @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_cells,[0,$uniqfilenum,$uniqlinenum,$segment]) if $justify;
          last;
        }
      }

      if ($any_already_found) {
        #print STDERR "NON-UNIQUE PATH AT LINE $linenum of $filenames[$filenum] due to path at line $uniqlinenum of $filenames[$uniqfilenum]\n";
      } else {
        #print STDERR "UNIQUE PATH AT LINE $linenum of $filenames[$filenum]\n";
        $unique{$filenum}{$linenum} = 1; # so it won't find the same path twice
        @{$justify{$filenum}{$linenum}} = (\&get_justify_text_consec_segment_found_cells,[1,0,0,$segment]) if $justify;

        # Mark the segments as found so no other paths can use them to be unique
        foreach my $segment (@{$consecutiveSegments{$filenum}{$linenum}}) {
          $found_segments{$is_hold}{$segment} = 1;
        }
      }

    } # foreach segment
  } # foreach is_hold
} # sub uniquify_consecutive_cells


# Build a comment that explains why a path was non-unique due to finding a worst path with the same segment
sub get_justify_text_consec_segment_found_nodes {
  my ($filenum,$linenum,$tns,$slack,$is_unique,$otherfilenum,$otherlinenum,$segment) = @_;

  my $text;
  if (!$is_unique) {
    $text = sprintf("### Path at line $linenum of $filenames[$filenum] (slack=%.5f,tns=%.5f) not unique since shares segment with", $slack,$tns);
    if ($filenum==$otherfilenum) {
      $text .= " path at line $otherlinenum:\n";
    } else {
      $text .= "\n# path at line $otherlinenum of $filenames[$otherfilenum]:\n";
    }
  } else {
    $text = "### This path is unique because it has the worst TNS for the following:\n";
  }

  if ($segment =~ /IO:(.*):(.*)/) {
    $text .= "#\tInput port: $1\n# Output port: $2\n";
  } elsif ($segment =~ /I:(.*)/) {
    $text .= "#\tInput port: $1\n";
  } elsif ($segment =~ /O:(.*)/) {
    $text .= "#\tOutput port: $1\n";
  } else {
    my @segs = (split ":", $segment);
    foreach my $seg (@segs) {
      if ($seg =~ /^N\.(\d+)$/) {
        $text .= "#\t$netNameList[$1]\n";
      } elsif ($seg =~ /^C\.(\d+)$/) {
        $text .= "#\t$cellNameList[$1]\n";
      } else {
        die "ERROR: Something other than a cell or net being treated as a node for uniquification\n";;
      }
    }
  }

  if ($is_unique) {
    $text .= "#\n";
  } else {
    $text .= "\n";
  }

  return $text;
}

# Build a comment that explains why a path was non-unique due to finding a worst path with the same segment
sub get_justify_text_consec_segment_found_cells {
  my ($filenum,$linenum,$tns,$slack,$is_unique,$otherfilenum,$otherlinenum,$segment) = @_;

  my $text;
  if (!$is_unique) {
    $text = sprintf("### Path at line $linenum of $filenames[$filenum] (slack=%.5f,tns=%.5f) not unique since shares segment with", $slack,$tns);
    if ($filenum==$otherfilenum) {
      $text .= " path at line $otherlinenum:\n";
    } else {
      $text .= "\n# path at line $otherlinenum of $filenames[$otherfilenum]:\n";
    }
  } else {
    $text = "### This path is unique because it has the worst TNS for the following:\n";
  }

  if ($segment =~ /IO:(.*):(.*)/) {
    $text .= "#\tInput port: $1\n# Output port: $2\n";
  } elsif ($segment =~ /I:(.*)/) {
    $text .= "#\tInput port: $1\n";
  } elsif ($segment =~ /O:(.*)/) {
    $text .= "#\tOutput port: $1\n";
  } else {
    my @segs = (split ":", $segment);
    foreach my $cell_index (@segs) {
      $text .= "#\t$cellNameList[$cell_index]\n";
    }
  }

  if ($is_unique) {
    $text .= "#\n";
  } else {
    $text .= "\n";
  }

  return $text;
}

# Build a comment that explains why a path was non-unique due to finding a worst path with the same segment
sub get_justify_text_worst_slack_per {
  my ($filenum,$linenum,$tns,$slack,$is_unique,$reason_id,$is_hold,$index) = @_;

  my $text;
  if ($is_unique and $reason_id == 0) {
    $text = "### This path is unique - has worst TNS for endpoint\n#\n";
  } elsif ($is_unique and $reason_id == 1) {
    my $typetext = "";
    if ($uniquify_type == 0) {
      # Cells
      $typetext = "cell $cellNameList[$index]";
    } elsif ($uniquify_type == 1) {
      # Nets
      $typetext = "net $netNameList[$index]";
    } else {
      # startpoint/endpoint pairs
      $typetext = "startpoint/endpoint $index";
    }
    my $num_paths = $numPathsByIndex{$is_hold}{$index};
    my $total_tns = $totalTNSbyIndex{$is_hold}{$index};
    $text = sprintf("### This path is unique - $typetext stands out (appears in $num_paths paths, total TNS = %.5f)\n#\n", $total_tns);
  }

  return $text;
}



# Gather data about the percentage of wire dominated data on a given path
sub WireDominatedDataGather {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  my $celldelay = 0;
  my $netdelay = 0;

  my $debug = 0;

  foreach my $net (@{$nets}) {
    $netdelay += $net->[1];  # [net name, incremental delay]
    print STDERR "Net delay = $netdelay from $net->[0] with delay $net->[1]\n" if $debug;
  }
  foreach my $cell (@{$cells}) {
    $celldelay += $cell->[2];  # [cell name, cell type, incremental delay]
    print STDERR "Cell delay = $celldelay from $cell->[0] ($cell->[1]) with delay $cell->[2]\n" if $debug;
  }

  if (defined $netdelay and defined $celldelay and (($celldelay+$netdelay)>0)) {
    my $ratio = $netdelay / ($netdelay+$celldelay);
    print STDERR "Ratio = $ratio\n" if $debug;

    if ($ratio >= $wireDomMinRatio) {
      $wireDominatedStats{$ratio}{$tns}{$filenum}{$linenum} = [$slack,$is_hold,$num_tiles,$netdelay,$celldelay];
    }
  }

}

# Gather extra information about each path for quicker debugging of problems
sub extraPathInfoDataGather {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets,$max_fanout, $skew) = @_;

  my $hvt = 0;
  foreach my $cell (@{$cells}) {
    $hvt++ if ($cell->[1] =~ /$hvt_celltype_pattern/);
  }
  $extraPathInfo{$filenum}{$linenum}[0] = $max_fanout;
  $extraPathInfo{$filenum}{$linenum}[1] = scalar(@{$cells});
  $extraPathInfo{$filenum}{$linenum}[2] = $hvt;
  $extraPathInfo{$filenum}{$linenum}[3] = (defined $skew and $skew != 0) ? $skew : undef;
}



# Gather data about cells and nets in both setup and hold violations
sub BothSetupAndHoldDataGather {
  my ($filenum,$linenum,$startcellpin,$endcellpin,$slack,$tns,$is_hold,$is_input,$is_output,$num_tiles,$cells,$nets) = @_;

  # Track the cells and nets per path, since we'll need this later to find the worst path
  # Also keep track of the total setup and hold TNS per cell and net

  my @cells = @{GetCellNameIndexes($cells)};
  my @nets  =  @{GetNetNameIndexes($nets)};

  foreach my $index (@nets) {
    $netTNS[$is_hold][$index] += $tns;
    push @{$pathNets[$filenum]{$linenum}}, $index;
  }
  foreach my $index (@cells) {
    $cellTNS[$is_hold][$index] += $tns;
    push @{$pathCells[$filenum]{$linenum}}, $index;
  }

  push @{$SLACK[$filenum]{$linenum}}, $slack;
}


# Index all cellnames not already indexed
sub GetCellNameIndexes {
  my ($cells) = @_;
  my @indexes = ();
  foreach my $cell (@{$cells}) {
    my $name = $cell->[0];
    my $index;
    if (not exists $cellNameIndex{$name}) {
      $cellNameList[$cellNameIndexCount] = $name;
      $cellNameIndex{$name} = $cellNameIndexCount;
      $index = $cellNameIndexCount;
      $cellNameIndexCount++;
    } else {
      $index = $cellNameIndex{$name};
    }
    push @indexes, $index;
  }
  return \@indexes;
}

# Index all netnames not already indexed
sub GetNetNameIndexes {
  my ($nets) = @_;
  my @indexes = ();
  foreach my $net (@{$nets}) {
    # [net name, incremental delay]
    my $name = $net->[0];
    my $index;
    if (not exists $netNameIndex{$name}) {
      $netNameList[$netNameIndexCount] = $name;
      $netNameIndex{$name} = $netNameIndexCount;
      $index = $netNameIndexCount;
      $netNameIndexCount++;
    } else {
      $index = $netNameIndex{$name};
    }
    push @indexes, $index;
  }
  return \@indexes;
}


sub format_num() {
  # $in - the number to format
  my $in = shift(@_);

  my $decimals = shift(@_);

  # Start with the sign
  my $out;
  if ($in < 0) {
    $out = "-";
    $in *= -1;
  } elsif ($in > 0) {
    $out = " ";
  } else {
    $out = " ";
  }
  
  # Round to $decimals decimals
  my $rounder = 10 ** $decimals;
  $in = int($in * $rounder + .5) / $rounder;
  
  # Add padding blanks if needed
  if ($in < 10) {
    $out .= " ";
  }
  
  # Add the pre-decimal portion, plus the decimal
  if ($in =~ /(.*)\./) {
    $out .= $1 . ".";
  } elsif ($in =~ /([\d]+)/) {
    $out .= $1;
    if ($decimals > 0) {
      $out .= '.';
    }
  } else {
    $out .= "0.";
  }
  
  # Add the rest
  if ($in =~ /(\..*)/ and $decimals > 0) {
    my $t_rounder = $1 * $rounder;
    if ($t_rounder < 100 and $decimals > 2) {
      $out .= "0";
    }
    if ($t_rounder < 10 and $decimals > 1) {
      $out .= "0";
    }
    $out .= $t_rounder;
  } else {
    $out .= '0' x $decimals;
  }
  
  # Add padding if decimals < 3
  $out .= ' ' x (3 - $decimals);
  if ($decimals == 0) {
    $out .= " ";
  }
  
  # Reduce length if went over
  my $ll = length($out);
  if ($ll > (4+$decimals)) {
    $out = substr($out,0,4+$decimals);
  }

  # Set the output
  return $out;
}


sub NoTicks() {
  my ($in) = @_;
  if ($in =~ /(.*)\'/) {
    $in = $1;
  }
  return $in;
}

sub renumify() {
  # $in - the text number to turn back into a number
  my $in = join '', @_;

  # Get rid of all whitespace
  $in =~ s/\s//;

  return ($in + 0);
}



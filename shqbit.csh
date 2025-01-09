
cd /proj/at2_til22_nobackup/doudouye/SHQBIT/1022_right_6/main/pd/tiles/df_rpt_right_6_t_shqbit_try_1_TileBuilder_Oct22_0615_63123_GUI; 
TileBuilderTerm; 
tilebuilderbranch; run FxPlace; 
TileBuilderBranch --startfrom FxPlace  --noreview --params jdon_branch_1227.params
~/shqbit.tcl


#  /proj/at2_til29_nobackup/jdon/at2/runtb.csh
#  /proj/at2_til29_nobackup/jdon/at2/setup_at2.tcl
vi override.controls override.params;
source setup_at2.tcl;
  # source /tools/aticad/1.0/src/sysadmin/cpd.cshrc
  # setenv FAMILY supra
  # setprj at2gmd
TileBuilderStart --params override.params --controls override.controls  
TileBuilderStart --params override.params --controls override.controls --ignore-hung-mounts

# /proj/at2_til29_nobackup/zihan/SHQBIT/df_rpt_right_6_t_NLBm2_FTI_spec_dis_edge_1018_1.csv
# /proj/at2_til22_nobackup/doudouye/SHQBIT/1022_right_6/main/pd/tiles/df_rpt_right_6_t_shqbit_try_1_TileBuilder_Oct22_0615_63123_GUI/jdon_branch_1227.params
/proj/at2_til29_nobackup/zihan/SHQBIT/df_rpt_right_6_t_1227.csv
 
 
#  /proj/at2_til42_nobackup/jdon/at2/
cd /proj/at2_til42_nobackup/jdon/at2; mkdir soc_rep_1_t; vi over*s; mkdir umc_rep_bot_0_t; vi over*s; "NICKNAME = shqbid_jdon_main"" ;
cpd; setprj at2gmd; TileBuilderStart --controls override.controls --params override.params;

/proj/at2_til42_nobackup/jdon/at2/soc_rep_1_t/main/pd/tiles/socrep1t/logs/GetSdc.log.gz
/proj/at2_til42_nobackup/jdon/at2/umc_rep_bot_0_t/main/pd/tiles/rep0/logs/GetSdc.log.gz

/proj/at2_til42_nobackup/jdon/at2/soc_rep_1_t/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params;
/proj/at2_til42_nobackup/jdon/at2/umc_rep_bot_0_t/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params;


#### sync up sdc files
FCT updated SDC , please sync flow to get sdc update and run from Place 
Update placenroute.params into #232; 
cd soc_rep_1_t;     p4 sync //gpuI/at2_gmd/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params#232
cd umc_rep_bot_0_t; p4 sync //gpuI/at2_gmd/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params#232
# p4 have //gpuI/at2_gmd/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params ; placenroute.params#227, sync flow results OK;
source $ALLTILES_DIR/scripts/TBUtility/skip_green_target.csh ; # serascmd --find_jobs "status==PASSED" --action "skip"
source $ALLTILES_DIR/scripts/tile_flow/SyncAllFlowEnvironment.csh; # p4 sync @TILEBUILDER_FREEZEFLOWRELEASE; @TILEBUILDER_FREEZEDATARELEASE; @TILEBUILDER_FREEZESTACKDATARELEASE
TileBuilderGenParams;TileBuilderMake; Rerun GenerateAllCommands &  GetSdc targets;
Run from place , for All tiles in NLA milestone ;
Please check GetSdc log . make sure you get sdc from FCFP release rundir .

## data/sdc : 
     setup.FuncFFg1p05v.sdc;      setup.FuncSSg0p6v.sdc; setup.FuncTT0p65v.sdc; setup.FuncTT0p9v.sdc;
setup.ScanshiftFFg1p05v.sdc; setup.ScanshiftSSg0p6v.sdc;


# SHQBIT tcl scripts
fxmacro; # open  FpPlaceMacros.nlib
fc> source -e -v /tool/aticad/1.0/src/zoo/SHQBIT/SHQBIT_ImplementBuses.tcl; # create BusPlanning menu, SHQBIT sub-menu;
fc> BusPlanning/SHQBIT: open /proj/at2_til29_nobackup/zihan/SHQBIT/df_rpt_right_6_t_NLBm2_FTI_spec_dis_edge_1018_1.csv;

#### df tiles sync flow; to solve df_tiles fxplace blocking issue;
Incorrect params for DF tiles TIELOW_CELL = TIELNTGD4BWP143M117H3P48CPDULVTLL_LVT
1. make new run;
2. new_run> source $ALLTILES_DIR/scripts/TBUtility/skip_green_target.csh; # skip all green targets;
# serascmd --find_jobs "status==PASSED" --action "skip"
# serascmd --find_jobs "status==WARNING" --action "skip"
   new_run> source $ALLTILES_DIR/scripts/tile_flow/SyncAllFlowEnvironment.csh; # sync flow environment; 
3. check sync flow results;
4. new_run> p4 have //gpuI/at2_gmd/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params
  if placenroute.params#227, sync flow results OK;
csh> cd /proj/at2_til42_nobackup/jdon/at2/soc_rep_1_t/main/pd/tiles/soc_rep_1_t_shqbit_jdon_main_TileBuilder_Dec31_0035_6750_GUI;
csh> p4 filelog //gpuI/at2_gmd/main/pd/tiles/params/supra/personality/at2gmd/a0/placenroute.params
... #228 change 7254692 edit on 2024/12/31 by dongsche@at2gmd-dongsche-dec30_212328-pd-88609 (text+C) 'update ENABLE_FLOW_EFFORT_MEGA_'
... #227 change 7254238 edit on 2024/12/30 by dongsche@at2gmd-dongsche-dec30_040126-pd-80770 (text+C) 'comment TIEHIGH_CELL'
... #226 change 7253101 edit on 2024/12/30 by dongsche@at2gmd-dongsche-dec25_085046-pd-66388 (text+C) 'update RAPID_SYNTHESIS_DIR'

5. new_run> TileBuilderGenParams; rerun floorplan targets;
6. link run to /proj/at2_til42_nobackup/huiyinli/link_real, name as <tile_name>_flowupdate

### 
create_grid -x_step 0.048 -y_step 0.286 -x_offset 0.0 -y_offset 0.0 -orientations {R0 MY MX R180} testGrid1
snap_cells_to_block_grid -grid testGrid1 -cells [get_cells -hierarchical -filter "is_hard_macro"]
# if snaped inside 117 
create_grid -x_step 0.048 -y_step 0.286 -x_offset 0.0 -y_offset 0.143 -orientations {R0 MY MX R180} testGrid2
snap_cells_to_block_grid -grid testGrid2 -cells [get_cells -hierarchical -filter "is_hard_macro"]


1. load icc/fc (data/floorplan.nlib)
2. source -e -v /tool/aticad/1.0/src/zoo/SHQBIT/SHQBIT_ImplementBuses.tcl
3. at icc GUI: 
ic compiler II -> blockwindow.1 - design planning : menu of bus planning, SHQBIT spec based plan, excel_rpocess, define full path to excel files;
4. after complete, SPEC GUI is updated with infos
clicking Next Bus/Prev Bus, user can see changes in highlighted boxes, by default, flow will go for auto mode;
5. click "plan bus", complete "plan bus" for the first time, then click "plan bus" again. (1st time to create track, 2nd time to create tcl)
6. click "generate command"  to generate tcl file, save tcl file as ~/hahah.tcl;
7. in FxPlace, source hahah.tcl, check place result;

# SHQBIT spec based plan, read excel,




#### email: floorplan_fpplacemacros_script
color_term> TileBuilderIntFX  data/FpPlaceMacros.nlib; #  fc open placemcrao.nlib;
fc_shell> adjust floorplan, then : source
fc_shell> source ../../../../scripts/tile_flow/saveRam_ICC2.tcl
fc_shell> source /proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/scripts/tile_flow/saveRam_ICC2.tcl
 cp <tile_name>.tcl   /proj/at2_til29_nobackup/jdon/at2/main/pd/tiles/gc_gl1ac_t_1211_jdon_TileBuilder_Dec11_0031_34274_GUI/tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl
# return results should be: 
# INFO: sourcing tcl 
# method1: use proc placeram_icc2 halo outfile
# write mem macros ...
# write other macros ...
# ####
# All macros saved successfully
# You could copy gc_ea_rep_3_t.tcl to ../../../tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl
# command as below:
# sh cp -f gc_ea_rep_3_t.tcl  ../../../tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl
csh> mkdir tune/FxFpPlaceMacros;  cp <tile_name>.tcl  tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl ;  # gvim FxFpPlaceMacros.placerams.tcl to verify it.
TileBulderConsole> reset FxFpPlaceMacros; rerun FxFpPlaceMacros; FC open FxFpPlaceMacros.nlib to check;

#### AT2_N3P_floorplan_guideline.pdf
143MH117 : height is 117, low speed short cell with 1n+1p fins, small area;
143MH169 : height is 169, high speed tall cell with 2n+2p fins, 
143MH286 : height is 117+169=286;
hibrid row: first and last row should be 117, first row must be R0,  117 and 169 rows alternatively;
# flow will automatically add halo and placement blockage for all macros (IPs, SRAMs), refer to files below to verify all macros are snapped to 1CPP site and middle of 169 row; 
/proj/at2-pdpv1-nobackup/PV/fcpv_tune/tile/macro_halo_guidelines.txt; 


/proj/at2_til42_nobackup/zewechen/1230/umc_rep_bot_1_t/main/pd/tiles/umc_rep_bot_1_t_umc_rep_bot_1_t_df_1230_TileBuilder_Dec30_0406_85803_GUI/tune/project/FxFpPlaceMacros/FxFpPlaceMacros.postplace.tcl
cp -rf /proj/at2_til42_nobackup/zewechen/1230/umc_rep_bot_1_t/main/pd/tiles/umc_rep_bot_1_t_umc_rep_bot_1_t_df_1230_TileBuilder_Dec30_0406_85803_GUI/tune/project/FxFpPlaceMacros/FxFpPlaceMacros.postplace.tcl  tune/project/FxFpPlaceMacros/FxFpPlaceMacros.postplace.tcl

evince /tool/amd/rex/cad/release/tech/tsmc3_pdk/TSMC3NP/TileBuilder/PDK/1P15M1XA1XB1XC1XD1YA1YB4Y2YY2Z1ALRDL_v1d0b/icc2_shell/tCIC_scripts/icc2/Guide.pdf
# N3E CHIP INTERGATION DESIGN GUIDELINES:
https://confluence.amd.com/pages/viewpage.action?spaceKey=PDCAD&title=Training+material&preview=/263010176/571690084/Chip-Integration_Design_Guideline_N3E_AMD_v0d9_1_1_Official_07292022_wmc.pdf
# DRM:
https://logviewer-atl.amd.com/proj/dk/technology/TSMC/C3nm/3NP/1P19M1XA1XB1XC1XD1YA1YB8Y2YY2Z1ALRDL/mi400_aid_soc/PDK/PDK_doc/drm/TN03CLDR014_1_1_1.pdf
https://logviewer-atl.amd.com/proj/dk/technology/TSMC/C3nm/3NP/1P17M1XA1XB1XC1XD1YA1YB4Y4YY2Z1ALRDL/mi400_mid_soc/PDK/PDK_doc/drm/TN03CLDR014_1_1.pdf
# N3 training 
https://myteams.amd.com/sites/foundryoperations/tech/TSMCN3/Meetings/Training/N3%20Mar_2021_V0.9/chip-integration.pdf
https://myteams.amd.com/sites/foundryoperations/tech/TSMCN3/Meetings/Training/N3%20Mar_2021_V0.9/chip-implementation.pdf
# CAD: 
https://confluence.amd.com/pages/viewpage.action?spaceKey=PDCAD&title=Training+material
# TCIC GUIDE:
/tool/amd/rex/cad/release/tech/tsmc3_pdk/TSMC3NE/TileBuilder/PDK/1P17M1XA1XB1XC1XD1YA1YB4Y4YY2Z1ALRDL_v0d9a/icc2_shell/tCIC_scripts/icc2/Guide.pdf
# tsmc sram types: 2prf hsspsram rom spmbsram spsbsram uhd2prf l1cache hdspmbsram 
# sram naming rules, {vt}: svt, lvt, ulvt;  depth: 0:9(8-16384} width [0:9] (8-288) mux [0:9](1,2,4,8,16) seg: s/f/q  
# uhd2prf: ts6n03{vt}b{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# 2prf:    ts6n03{vt}a{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# rom:     ts3n03{vt}a{depth}x{width}m{mux}{seg}bz{o}
# hssp: ts1n03hs{vt}a{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# spmb: ts1n03mb{vt}a{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# spsb: ts1n03sb{vt}a{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# spmb: ts1n03lmb{vt}b{depth}x{width}m{mux}{seg}{w}bz{h}{o}{d}{cp} 
# l1cache: ts1n03l1{vt}a{depth}x{width}m{mux}{seg}{w}{o}{d} 
ESD
Efuse
DTCD/ICOVL

source ~sdhe/loop_action.csh
report_keepout_margins [get_keepout_margins -of_objects [get_cells -hierarchical -filter "is_hard_macro == true"]]

1. open initial DEF in fc, manually place macros in fc_shell;
2. snap macros to 1CPP site and half of 169 row grid;
create_grid -x_step 0.048 -y_step 0.286 -x_offset 0.0 -y_offset 0.0 -orientations {R0 MY MX R180} testGrid1
snap_cells_to_block_grid -grid testGrid1 -cells [get_cells -hierarchical -filter "is_hard_macro"]
3. run FxFpPlaceMacros;  # flow will create defaulthalo and placement blockage for all macros,
# if macros are not place on required grid, physical cell insertion will fail since flow will not auto-snap placement blockage to site-row grid
Report of tCIC checker “chip_integration_check.err” can be found in the path:
  rpts/FxFpPlaceMacros/check_floorplan_rules.rpt.gz
Error database can be reviewed in the Error Brower like DRC
  rpts/FxFpPlaceMacros/chip_integration_check.err 	
Tile owner can also run “checkFoorplanRules” promptly and interactively in fc_shell after adjusting macro location.
fc> source $FLOW_DIR/supra/templates/icc2_shell/i2_common_procs.tcl
fc> checkFloorplanRules
routing blockage
MID tile flow has set routing blockage for SRAM/ICOVL/DTCD as the table and snapshots shown.
//gpuH/cumberland/main/pd/tiles/ProjectTune/a0/tune/FxFpPlaceMacros/FxFpPlaceMacros.postplace.tcl#6

# use this command to snap site&row
/proj/at2_til42_nobackup/huiyinli/floorplan_release
all runnings ,after CbBaseFPDRC target passed , macro and physical cell placement is OK ?  then link runnings to above directory, named as tilename; 
df tiles, after update flow, have not run till the target, if there is any failed target, no problem;

fc_shell> source /proj/at2_til42_nobackup/zhihan/shqbit/get.tcl at2 shqbit.xlsx
all the cells printed out, are the  existing cells;

1. if at2 shqbit trail is running, link running dir to: /proj/at2_til42_nobackup/huiyinli/at2_shqit_link  
2. skip GetSdc target in floorplan release running, then run 2 targets: FxFpGenRoutedLef, FxPixFloorplan;
/home/sdhe/check_release.pl

in override.params: RUN_SHQBIT_AT_PLACE_SPEC_FILE     = tune/FxPlace/shqbit.tcl; 
it is where shqbit.tcl script file should be located.

#### RTL ppa AI, code splitter; 
RTL code, use AI analyzer;such as code splitter;
RTL PPA Code Advisor, in Alpha stage, focusing on RTL coding for area & tns optimization  ; based on GPT4o and LLM, rewrite RTL code;
for big RTL files, use code splitter, to split into RAG;

# visualize M13 stripes before power grid generation, to guide macro placement;  in fc, source script, then run ‘show_pg_stripe’ to set offsets, pitch, and width of M13 fantom shapes. 	
source /tool/aticad/1.0/src/zoo/TileFlowScripts/tile_flow/project_tune_script/show_pg_stripe.tcl
fc> show_pg_stripe -offset 1.392 -pitch 1.824 -width 0.055
# To remove the fantom shapes:	
fc> gui_remove_all_annotations
# The snapshots are showing fantom M13 stripes generated by script.
ips: TMAC DTCD ICOVL  

#### email: at2gmd NLA flow

df tile owners
Please add below params in your override.params , TileBuilderGenParams ; TileBuilderMake retrace from GenerateAllCommands

ASSIGN_FIX_BUFFER       = BUFFD4BWP143M117H3P48CPDULVTLL
TIEHIGH_CELL            = TIEHNTGD4BWP143M117H3P48CPDULVTLL
TIELOW_CELL             = TIELNTGD4BWP143M117H3P48CPDULVTLL
TILE_IOBUF_FILLER_CELLS = DCAP4OPT3FXPRBWP143M286H3P48CPDULVTLL
TILE_IOBUF_INPUT_BUFFER = BUFFOPT3FD6BWP143M286H3P48CPDULVTLL

20241230, check results table, by huiyingli@amd.com
Please fill in the check result in the table below after completing the corresponding check item.
If passed, please fill in 'pass'. If failed, check the parmas setting and rerun
ETA:12/31 14:00


20241230, Update release schedules, by Dongsheng.Chen@amd.com
date  releases                       common
1.3  release floorplan data   neec check all drc 
1.6  fct sdc release to tile
1.8  relese place   data
1.14 relese route   data
1.17 relese reroute data


[AT2 GMD] NLA flow update 
Hi All ,
NLA netlist and def is ready , please start a new TB for this milestone (SDC will update later).
Non-er tile list: 
cf_clk_dfs2_t  cf_clk_dfs4_t cf_ctsen_0_t cf_ctsen_1_t cf_ucieclk_t df_cs_t df_gcm_t df_pie_t df_tcdxcn_t df_tcdxgc_t df_tcdxgccn_t df_tcdxr2p_t df_tcdxr4p_t df_tcdxr5p_t df_ucake_t dfx_dft_t  io_gpio18_t io_refclkiobuf_t io_t io_xvmin_t secip_fuse_t 
soc_rep_0_t soc_rep_1_t soc_rep_bot_0_t soc_rep_bot_1_t soc_rep_bot_2_t soc_rep_bot_3_t soc_rep_bot_4_t soc_rep_bot_5_t soc_rep_bot_6_t soc_rep_bot_7_t soc_rep_bot_8_t soc_rep_bot_9_t 
soc_rep_right_0_t soc_rep_right_1_t soc_rep_right_2_t soc_rep_top_0_t soc_rep_top_1_t soc_rep_top_2_t soc_rep_top_3_t soc_rep_top_4_t soc_rep_top_5_t soc_rep_top_6_t soc_rep_top_7_t 
umc_phy_t umc_rep_bot_0_t umc_rep_bot_1_t umc_rep_bot_2_t umc_rep_bot_4_t umc_rep_bot_5_t umc_rep_top_0_t umc_rep_top_1_t umc_rep_top_2_t umc_rep_top_3_t umc_rep_top_4_t umc_rep_top_5_t 
vdci_ats_df_t vdci_cake_ucis_t  vdci_twix_ssbdci_t
 
# er-tile list: umc_umcch_t 
# ER tile: same template ,but must start in ER disk 
 
Setup project :
source /tools/aticad/1.0/src/sysadmin/cpd.cshrc
setenv FAMILY supra
setprj at2gmd
 
TileBuilderStart --params override.params --controls override.controls | & tee tbs.log
 
override.params:
TILES_TO_RUN = gc_ch_t (Tile owner can modify)
NICKNAME     = test    (Tile owner can modify) 
 
PROJECT      = at2gmd
FAMILY       = supra
PERSONALITY  = placenroute
STD_CELL_LIB_NAME  = tsmc143n3p
TAPEOUT      = a0
TECHNO_NAME  = N3E
CHIP_RELEASE = NLA 
FLOORPLAN_POINTER = fp_00
 
 
TILEBUILDER_FREEZEFLOWRELEASE            = at2gmd_20241127_FLOW_U
TILEBUILDER_SEPARATE_STACK_PARAMS_LABEL  = at2gmd_20241127_STACK 
TILEBUILDER_FREEZEDATARELEASE            = at2gmd_20241127_DATA 
 
TILEBUILDER_SEPARATE_STACK_PARAMS_TREE   = soc_pd_n3e
TILEBUILDER_SEPARATE_STACK_PARAMS        = 1
STACK = soc_pd
 
Notice:
Please check your log, make sure your netlist from  FEI release area (for detail version , please check //gpuI/at2_gmd/main/pd/nl/prelayout/versions_soc.txt)
Please check your log . make sure your def file from FCFP release area.( /proj/at2_fcfp0_nobackup/FP_REL/NLA/$tile_name/fp_00/$tile_name.def.gz)
Please check your log . make sure your use correct lib.( flow config this in flow level : )
Release schedule  will update later 
 
/tool/aticad/1.0/src/zoo/at2gmd/tile/rel_script/at2gmd_release_NLA.pl -floorplan
/tool/aticad/1.0/src/zoo/at2gmd/tile/rel_script/at2gmd_release_NLA.pl -fp_clean
/tool/aticad/1.0/src/zoo/at2gmd/tile/rel_script/at2gmd_release_NLA.pl -place
/tool/aticad/1.0/src/zoo/at2gmd/tile/rel_script/at2gmd_release_NLA.pl -route
/tool/aticad/1.0/src/zoo/at2gmd/tile/rel_script/at2gmd_release_NLA.pl -reroute
 
N3_tile_level_floorplan_guidelines
https://confluence.amd.com/display/~dongsche/PhyV?preview=/1640149711/1640150506/AT2_N3P_FLOORPLAN_GUIDELINE_1030.pptx
 
Issue Report:
AT2 GMD:  AT2-Magnus GMD PD - INTERNAL
 
Rules: 
Check below items before file a JIRA.
a.       Please search if there were the same issue reported already in JIRA: 
b.       Please check tile flow bring up document and flow debug document
c.       Please check if your issue was fixed in last flow and last project tunes
    Issue is reported though JIRA, email or any method else is not efficient.
    JIRA is reported by tile lead. Any problem you met your tile lead is the first person to help you.
    When you find some issue with old flow/ tool version, please switch to latest flow label to reproduce before you rise issue.
    We need to distinguish flow issue and assign to correct person if it is about FCFP/FCT/Power etc.
    JIRA is not just for bug report. If you want some flow work to resolve/improve something, it is great to record your request in JIRA and let others to receive this info.
    Report JIRA with necessary elements and clean format.
    Issued target name, run directory, error message, related commands, log information must be filled while creating a JIRA
    Error message, commands, log information must be included in code format
    Pictures are welcomed to be attached or inserted when add comments
    Don't touch the run directory used to be debug before the issue was solved in JIRA
Template for 'Description' blank:'
Replace the highlighted yellow lines by your information. And don't touch the other lines
Issued tile list
Some target
ICC2_MODULE  = icc2/2017.09-SP5-T-20180704
/proj/vega20-pdtil9-nobackup/ 
{code:java}
check_route
{code}
{code:java}
Log information
{code}
xxxxxxxxxxxxxxxx
Scripts and Utility:

# Commit macro/ram placement
fc> source $ALLTILES_DIR/scripts/tile_flow/saveRam_ICC2.tcl
# It will output $tile_name.tcl, put it into tune/FxFpPlaceMacros/FxFpPlaceMacros.placerams.tcl 
# Skip all the green(valid) targets
csh> Source $ALLTILES_DIR/scripts/TBUtility/skip_green_target.csh
# Sync All flow environment
csh> Source $ALLTILES_DIR/scripts/tile_flow/SyncAllFlowEnvironment.csh
# Summary your tile status
csh> python3 $ALLTILES_DIR/scripts/python/extract_tile_timing_status.py

#### email by Fong 
1. some bus dont have pin blockage for flop;
Not all flops are indicated by pushdown blockage; example : 
# red highlighted are the placement blockage indicating flop region;  but we should have more flop region, some are not showing by blockage tcl
/proj/at2_fct1_nobackup/FCT_CENTER/SHQBIT/NLA/tile_blockage/soc_rep_top_4_t_blockage.tcl
rundir: /proj/at2_til29_nobackup/chenchai/AT2_NLA_1226/soc_rep_top_4_t_1228/main/pd/tiles/soc_rep_top_4_t_RUN001_TileBuilder_Dec27_2129_254992_GUI
2.  distance for the first flop in excel and pin blockage mismatch	
Found case csv first distance is 506.25, pin blockage ~343um from port
example rundir : /proj/at2_til43_nobackup/nomahmud/NLA_1226/umc_rep_top_0_t/main/pd/tiles/RUN001_test3
3.  RUN_SHQBIT_AT_PLACE_SPEC_FILE = tune/FxTargets/shqbit.tcl;  Need manual add param to enable shqbit flow -
example rundir :
/proj/at2_til29_nobackup/chenchai/AT2_NLA_1226/soc_rep_top_7_t/main/pd/tiles/RUN002_fprules
4.  maximum flop to flop distance ? follow excel flop2flop distance?	Initial flop placement will follow   In csv
if TO would like to adjust, what is the: 
1. max allowed flop to flop distance 
2. Max allowed flop to input port distance
3. Max allowed flop to output port distance.
4. Max allowed bus to port offset value	
Follow flop2flop distance in csv first
1. max allowed flop to flop distance : 1W2S 1200um, 1W2SH 1100um, 1W1S 900um;  if CVS setting is larger than above distance, we can follow csv
2. Max allowed flop to input port distance: 
if csv setting is larger 500um, pls makesure after move distance is smaller than csv number.
if csv setting is smaller than 500um and need to move away from port, keep it <500um

3. Max allowed flop to output port distance:
if csv setting is larger 500um, pls make sure after move distance is smaller than csv number.
if csv setting is smaller than 500um and need to move away from port, keep it <500um
4. What is the max allowed bus to port offset value:  20um








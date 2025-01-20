#### cdc script trial run
# NA /proj/mi400_hcf_vol3/user/jialwang/fcnlconstraints_hcfvcn2/main/pd/tiles/CHIP_MID/constraints/process_scripts/cdc_analysis;
cp -pr /home/jialwang/hcf_vcn/fp_analysis/ToF_calculator_polygon.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/combine_report_with_distances.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/extractor.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/summarize_report_with_tiles.pl
cp -pr /home/jialwang/hcf_vcn/fp_analysis/README

# CDC report csv
#NA /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/cdc_test/vcn/floorplan_analysis/unique.report.cdc.fail.vcn.csv
#NA /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/cdc_test/vcn/floorplan_analysis/fpcdcmaxdelay_vcn.csv
#NA # SYNC report csv 
#NA /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/sync/vcn/floorplan_analysis/unique.report.sync.fail.vcn.csv
#NA /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/sync/vcn/floorplan_analysis/fpsyncmaxdelay_vcn.csv

# CDCmaxdelay flow generated report FEINT analysis:
report.cdc.csv.gz 
report.sync.csv.gz
#  FEINT analysis script generated unique marker-based report per IP (please start here for script testing as it has a smaller data set)
VCN cdc: unique.report.cdc.fail.vcn.csv
VCN sync: unique.report.sync.fail.vcn.csv
# Running Floorplan Aware Analysis Scripts
perl ToF_calculator_polygon.pl   //calculates the longest distance within one tile and between two tiles, requires top def and tile def files under the run directory
perl extractor.pl //extract all the required  information from the provided report unique.report.cdc.fail.vcn.csv
perl summarize_report_with_tiles.pl //adding tile information into the data extracted in the previous step
perl combine_report_with_distances.pl <#ToFmm required to calculate ToF> //combines all the information we need to together

# Run Reports
#NA # HCF VCN NLBp8 Top Level DEF Location
#NA /proj/cmb_release_vol1/a0/rapid_fcfp_meta_data/hcf_vcn_mid/rel_NLC/hcf_vcn_mid/rapid_fcfp_01/hcf_vcn_mid.def.gz
#NA /proj/cmb_release_vol1/a0/rapid_fcfp_meta_data/hcf_vcn_mid/rel_NLC/vcn_*_0_t/rapid_fcfp_01/vcn_*_0_t.def.gz

# Scripts Location:
/proj/saw_fe_vol5/user/jialwang/fp_script/official
# Reports Location
# CDCmaxdelay flow generated report:
 /proj/saw_fe_vol5/user/jialwang/supra_vcn/main/pd/tiles/CHIP_feint_CDC_NLC_TileBuilder_Jun06_1502_39729_GUI/rpts/MergeCdcMaxResDefault/report.cdc.csv.gz
 /proj/saw_fe_vol5/user/jialwang/supra_vcn/main/pdfeint_SYNC_NLC/rpts/MergeCdcMaxResDefault/report.sync.csv.gz
# FEINT analysis script generated unique marker-based report for VCN IP:
 /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/cdc_test/vcn/floorplan_analysis/unique.report.cdc.fail.vcn.csv 
 /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/sync/vcn/floorplan_analysis/unique.report.sync.fail.vcn.csv
# Floorplan aware analysis script generated report:
 /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/cdc_test/vcn/floorplan_analysis/fpcdcmaxdelay_vcn.csv
 /proj/saw_fe_vol5/user/jialwang/supra_hcfvcn/analysis/NLC/tt0p65/feint/sdc0001/sync/vcn/floorplan_analysis/fpsyncmaxdelay_vcn.csv


# please find information for #2 distance based GateCDC analysis
# HCF_VCN_FPcdcmaxdelay.pptx : ppt for fpaware CDC delay analysis
# after CDC max delay run is done, reports are
/proj/saw_fct_vol5/a0/fct_runs/CDCMaxdelay/run1_AIGC_NLB_sync/main/pd/tiles/hcf_aigc_aid_CDC_AIGC_NLB_TileBuilder_Aug02_1018_115633_GUI/rpts/MergeCdcMaxResDefault/reports.sync.csv.gz
# use scripts to obtain results
/home/akarna/gateCDC/extractor.pl
/home/akarna/gateCDC/summarize_report_with_tiles.pl
/home/akarna/gateCDC/modified_FP_script.pl    ; # usage: -t <module_name> -o <output_filename> -d <DEF release area dir> -h(elp) -u (prog info)
/home/akarna/gateCDC/combine_report_with_distances.pl
You will get a csv file with all info:
/proj/saw_fct_vol5/a0/fct_runs/CDCMaxdelay/run1_AIGC_NLB_sync/main/pd/tiles/hcf_aigc_aid_CDC_AIGC_NLB_TileBuilder_Aug02_1018_115633_GUI/rpts/MergeCdcMaxResDefault/fpcdcmaxdelay.csv
# if required fix value >1, those can be sent to IP to check if need changes




#### gl1ac_t
#### 
# gl1ac sorted timing report, gc_rlc_t.gc_gl1ac_t timing path, top net,  grep pd_repeater.xml: current repeaters constraints, current repeaters, bundles 
# rlc.gl1ac
gc_rlc_t.gc_gl1ac_t: 76 vios, slack: -639 ~ -476  top_net: FE_FEEDX_SHARE*gc*gc*_mem_power_ctrl_8   rep_constraints:EQ0  current_repeaters: 0;  bundles;
  FE_FEEDX_SHARE__gc_rlc_t__gc_sdma_t__mem_power_ctrl__8 (net) 
  FE_FEEDX_SHARE__gc_pa_spi_m_ra_t0__gc_gl1ac_t0__mem_power_ctrl__8 (net) 

<no_rep bundle="gc__mem" container="gc_top_t" name="gc__mem_power_ctrl[8]" orig_bundle="mem" reason="MCI">
  <bundle_connection>
      <end_block_info block_inst="gc_rlc_t" port="gc__mem" port_blkport="transmit" />
      <end_block_info block_inst="gc_gl1ac_t0" port="mem" port_blkport="receive" />
  </bundle_connection>
</no_rep>
# gl1ac.rlc: ask ip/sdc team  to confirm SDC;
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


/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/pd_repeaters.xml
/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/nl_repeaters.xml
/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/pd_repeaters.xml
/proj/canis_pd_gfx_fct01/FCT/rep_xml/latest/rep_info_file.lscm.txt  
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/rep_info_file.lscm.txt  

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vReRouteFlatTyprc100cTT0P65V0CStpTiming

# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_pa_spi_m_ra_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_pc_sx_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_rb_t011.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_gl1ac_t0.gc_rlc_t.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_pa_spi_m_ra_t0.gc_gl1ac_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rb_t000.gc_gl1ac_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rb_t011.gc_gl1ac_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rlc_t.gc_gl1ac_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_rts_0_t0000.gc_gl1ac_t0.sorted.gz
# /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.Grp.GC_GFXCLK.gc_spi_s_bci0_cac_t0.gc_gl1ac_t0.sorted.gz

#done -25ps /proj/canis_pd_gfx_fct04/fct_release/ FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Cts_LSB10/ rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_pa_spi_m_ra_t0.sorted.gz

#done -25ps /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_gl1ac_t0.gc_pa_spi_m_ra_t0.sorted.gz
  se0__GL1_PA_64B_RD_ret_clken (net) 
  se0__GL1_PA_64B_WR_ret_tag[0] (net) 
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
/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rb_t011.gc_gl1ac_t0.sorted.gz
#done /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rlc_t.gc_gl1ac_t0.sorted.gz
#todo /proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_rts_0_t0000.gc_gl1ac_t0.sorted.gz
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__35 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__5 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_compression_key__0 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_compression_key__2 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_micro_tile_mode__0 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_size__0 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_speculative_data_read__0 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_tag__3 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_tag__7 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__0 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__6 (net) 
  FE_FEEDX_MFT__10__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__7 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__35 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_addr__5 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_compression_key__0 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_compression_key__2 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_micro_tile_mode__0 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_size__0 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_speculative_data_read__0 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_tag__3 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_tag__7 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__0 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__6 (net) 
  FE_FEEDX_MFT__11__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_3_TCP1_GL1_req_wg_mask__7 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__10 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__43 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__44 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__6 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__8 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_bc__0 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cid__3 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__0 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__2 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__3 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compressed (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compressed_write_enable (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compression_key__0 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compression_key__2 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compression_key__5 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_compression_mode__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_data_format__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_data_format__3 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_data_format__4 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_data_format__6 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_fill_ctrl__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_gpa__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_micro_tile_mode__2 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_op__1 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_tag__5 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_temporal__2 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_vmid__0 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_vmid__2 (net) 
  FE_FEEDX_MFT__7__gc_rts_0_t_0__gc_pc_sx_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_vmid__3 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__10 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__43 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__44 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__6 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_addr__8 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_bc__0 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cid__3 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__0 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__1 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__2 (net) 
  FE_FEEDX_MFT__8__gc_pc_sx_t__gc_gl1ac_t__se0__WGP_SA0_WGP0_2_TCP1_GL1_req_cluster_id__3 (net) 

/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/rpts/sort_rpts/SortPtGfxFuncTT0p65vPlaceFlatTyprc100cTT0P65V0CStpTiming_2t/fullchip.gc_spi_s_bci0_cac_t0.gc_gl1ac_t0.sorted.gz





# vigitpy dir: gvim git python packages; 
# 
jdon: git add pythonall.csh(with py310 download links);  
guojia: install gvim, git,py310; chat: outlook mails save into can_mail.csh;

# other clock no violation, all runs will auto-sort, nosp & nospflush is tuning flow, nosp to check violation.
# review _2tile


# pathform scripts
color_xterm> /tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py
# pathform;
select _2tile report file, check my_path; acv clock by owners; add comments; inherate comments; ref_comments:
1st round: all violations, 2nd round: new violations
default: 200 warnings; fanout lol si,
machine_learning_comments: machine learning targets;

ask kyle and cannie on pathform;
cd fct04/rel61;
usage: pathform.py [-h] [--rundir RUNDIR] [--config CONFIG] [--report REPORT]
                   [--rep_xml REP_XML] [--ft_xml FT_XML] [--inst_map INST_MAP] [--gen_db_only] [--dump_summary]
Parse timing reports and show with a friendly way. just run it under rundir.

optional arguments:
  -h, --help           show this help message and exit
  --rundir RUNDIR      FCT or Tile rundir
  --config CONFIG      pathform config file.           read from rundir/pathform.conf by default.
  --rep_xml REP_XML    repeater contract XML file.     read from rundir/pd_repeaters.xml by default.
  --ft_xml FT_XML      feedthru_connectivity.xml file. read from rundir/feedthru_connectivity.xml by default.
  --inst_map INST_MAP  instance map file.              read from rundir/inst_tile.map by default.
  --report REPORT      only process specified report.
  --gen_db_only        Only generate database mode, No GUI
  --dump_summary       Dump status summary to central file.

/proj/canis_pd_gfx_fct01/guanwang/work/gc_rlct_long_nets.rpt.gz

0114 meeting:
place run: 061, 062;  ask other team for branch run;
cts database;  propagate clock;
route database;
pretiming 
clock design check;
budget run status: running 32 hours;
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



Feb 10, fcfp ready, 
Feb 12, synthesis netlist ready, release function sdc;
Feb 17, budgeting run; to release budgeting sdc;
nlc: repeater, sdc, feedx, pin/point assignment;
(nlc.?): 
nld: 
eco:

0115 discussion: 
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
# /proj/canis/a0/floorplan/rel_LSCm_GFX/gc/fp_latest/fcfp.Final.pkg
# LSB.10 fcfp package
# /proj/canis_pd_gfx_fcfp01/qilinren/release/LSCm_1209/gc/fp_00/fcfp.Final.pkg

fcfp_explorer /proj/canis_pd_gfx_fcfp01/qilinren/LSC/1230/main/pd/tiles/run5_hollow/gfx.pkg
# repeater insertion already have;

fct use fct_explorer; to check tile path directions;

# xml file, MCI, by kyle
/proj/canis_pd_gfx_fct01/FCT/rep_xml/NLC_fp00/pd_repeater.xml


# gl1ac timing paths;
top net
current repeater constraints;
How many repeater inserted in current design;

# freeze 
mem_power_ctrl[0]
mem_power_ctrl[16]
MEM_POWER_CTRL[]


#### xml file, by michael
# - xml file before insert repeater
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/nl_repeaters.xml   
# - xml file after repeater inserted  (for fct, no big difference between 2 files, as we any check the bundle name and repeater constraints from the file)
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/pd_repeaters.xml  
# exract the net info from xml file (format: net name, bundle name, repeater constraints, pd inserted repeater number, related clock name)
/proj/canis_pd_gfx_fct01/FCT/rep_xml/LSB10_fp00/rep_info_file.lscm.txt  

/proj/canis_pd_gfx_fct01/FCT/feedthru_xml/latest/feedthru_connectivity.xml


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


#### Creating a repeater trace from GenEnhanced xmls file

The quickest way to create an FCFP repeater trace is from the GenEnhancedRepeater XML. 
This is done using the following script (typically included as a FINISH script to the repeater insertion target).

/tool/aticad/1.0/src/zoo/azmohamm/scripts/gen_early_trace.py -x data/GenEnhancedRepeaterXML.xml -t <top_module>  > data/early_trace_preopt.txt
/tool/aticad/1.0/src/zoo/azmohamm/scripts/gen_early_trace.py -x /proj/canis/a0/floorplan/rel_LSCm_GFX/gc/fp_latest/doc/nl_repeaters.xml  -t gc > data/early_trace_preopt.txt


/proj/canis_pd_gfx_fct04/fct_release/FCT0061_20250113_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_Place_LSB10/ 
-t <top_module>  > data/early_trace_preopt.txt
# pd_repeaters.xml
top_module can be "gc", "mpu" or even "", runs fast and  pre-collapse. 
not possible to merge super tiles (any sub-hierarchies like SE in case of graphics IP), hence there is some loss of accuracy at the interface of super tiles if any.
# Creating a repeater trace from def files
It is very useful to check the repeater positioning just after tile placement data is available. 
This will help us understand if there are any large repeater distance violations after tile placement. 
The design input in this case is the list of def files.  Floorplan def files can also be used for this purpose.
These def files can be the final def files, after collapse. 
Super tiles are flattened at this stage, hence this offers a true picture at the interface of the tiles. 
Other inputs are configured via the measure_xmls.py file which is located in the current run directory. An example is provided here:
/tool/aticad/1.0/src/zoo/azmohamm/doc/measure_xmls.py
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
/tool/aticad/1.0/src/zoo/azmohamm/scripts/measure_rep_dist.py -d clk -l def_list -f fcfp.csv -c ./all_conn  -t trace.out -p measure_xmls.py
clk here is a regex for the clocks of interest ("." will get the trace for all the clocks)
def_list is a comma separate values of tile,path_to_def
trace.out is the name of the trace file generated
measure_xmls.py is the full path of the location of the configuration file (default is to look for this in the current directory< br> all_conn is a file needed only when there are sub-hierarchies involved. It is a file that shows how the sub-hierarchies are connected to the top level. It is generated in a prelayout timing session using the following tcl snippet (assuming se0 and se1 are the instance names of the sub-hierarchies)
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
/tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m trace_fp_nlc > trace_fp_nlc_max
Raw viewEdit
Optimizing the trace
The trace file generated at the floorplan stage uses placement locations which are going to be quite different from the final placement. This is likely to show lots of distance violations which are not real since the placement of repeaters within the tile is not optimal. To find out the real violations, we simulate the best case - this is called the optimization step. The repeaters within the tile are relocated to fix the repeater distance violations. It is important to point out that the repeater topology is not changed - that is, the trace flow never moves a repeater from one tile to another.
/tool/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -p 750 > trace_opt_nlc
The value of 750 passed as argument p here is the repeater distance which we aim to achieve. The optimization + sorting is doable in a single step:
/tool/aticad/1.0/src/zoo/azmohamm/scripts/arrange_reps.py -i trace_fp_nlc_max -a algo3 -p 750 | \
          /tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m > trace_opt_nlc_max
Raw viewEdit
Generating the relpos file
The relpos file is consumed by the budgeting step. However, there is another important reason to run this step. Until the previous stage, repeaters are all considered unique. This might create some optimism in case of reuse tiles (the effect of collapse isn't captured). It is at this stage that the reuse repeaters are de-uniquified. The final trace and the relpos file are generated with this command:

/tool/aticad/1.0/src/zoo/azmohamm/scripts/gen_rel_pos.py -i trace_opt_nlc_max -o repeaterRelPos.txt -d relpos.dbg -t rel_trace_opt_nlc 
/tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m rel_trace_opt_nlc > rel_trace_opt_nlc_max
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
/tool/aticad/1.0/azmohamm/scripts/arrange_reps.py  -i trace_lclk_smnclk -p 1150 -f   /home/azmohamm/mero/fcfp.csv   |  \
      /tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_lclk_smnclk_opt

/tool/aticad/1.0/zoo/azmohamm/scripts/arrange_reps.py  -i trace_dclk -p 1300 -f   /home/azmohamm/mero/fcfp.csv   |  \
       /tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_dclk_opt

/tool/aticad/1.0/zoo/azmohamm/scripts/arrange_reps.py  -i trace_hsp_shubclk -p 1500 -f   /home/azmohamm/mero/fcfp.csv   |  \
       /tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  > trace_hsp_shubclk_opt

cat trace_lclk_smnclk_opt trace_dclk_opt trace_hsp_shubclk_opt > trace_for_rel
/tool/aticad/1.0/src/zoo/azmohamm/scripts/gen_rel_pos.py -i trace_for_rel -o full_relpos.txt -d relpos.dbg -t trace_postrel

/tool/aticad/1.0/src/zoo/azmohamm/scripts/sort_trace.pl -m  trace_postrel >  trace_postrel_max
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

# Seras
cd /proj/canis_pd_gfx_fct04/fct_runs/FCT0042_20241220_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp_flushflow;
color_term> tbc; 
gvim 
/proj/canis_pd_gfx_fct04/fct_runs/FCT0042_20241220_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp_flushflow/cmds/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming.cmd

realpath shqbit.tcl

  1	1:25	ls -lrt
     2	1:12	cd /proj/canis_pd_gfx_fct01/
     3	1:16	gvim /home/zyang2/home_backup/DRV.csh
     4	1:17	gvim /home/zyang2/home_backup/Navi31/get_distance_from_def.pl
     5	2:00	gvim /home/zyang2/home_backup/Navi31/SPT/MCD_2tile/asynfifo.csh
     6	2:05	gvim /proj/canis_pd_gfx_fct04/fct_release/FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/rpts/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/GC_FCLK_max.rpt.gz
     7	2:06	gvim /proj/canis_pd_gfx_fct04/fct_release/FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/rpts/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/GC_ACVCLK_max.rpt.gz
     8	2:20	cd /proj/canis_pd_gfx_fct04/fct_release/FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/
     9	2:20	gvim cmds/PtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming.cmd
    10	2:26	cd ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/fullchip.Grp.GC_CPUGFX_REF_ROCLK_400.gc_imu_t.gc_dldo_t.sorted.gz
    11	2:26	gvim ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/fullchip.Grp.GC_CPUGFX_REF_ROCLK_400.gc_imu_t.gc_dldo_t.sorted.gz
    12	2:28	cd ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/
    13	2:28	ls
    14	2:30	gvim SortPtGfxFuncTT0p6vReRouteFlatTyprc100cTT0P6V0CStpTiming/fullchip.Grp.GC_MTAP_Wrck.gc_vmem_rt_0_t0000.sorted.gz
    15	2:36	cd ../../../FCT0038_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB/
    17	2:38	resolve ../FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/rpts/sort_rpts/SortPtGfxFuncTT0p75vReRouteFlatTyprc100cTT0P75V100CStpTiming/fullchip.
    18	2:42	/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py
    19	2:50	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=32000]   select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py . &'
    20	2:56	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py . &'
    21	22:14	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py .&'
    22	22:15	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=3200]   select[type==RHEL7_64||type==RHEL6_64]' '/tool/aticad/1.0/src/zoo/SCBU_PD/TSG/pathform/scripts/pathform.py'
    23	22:15	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=32000]   select[type==RHEL7_64||type==RHEL6_64]' 'Term'
    24	21:39	bsub -Ip -q regr_high -P canis-pd -R 'rusage[mem=32000]   select[type==RHEL7_64||type==RHEL6_64]' 'erm'
    25	22:08	cd /proj/canis_pd_gfx_fct04/fct_release/FCT0040_20241216_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_ReRoute_NLB_nosp/
    26	22:08	TileBuilderTerm
    27	3:57	pwd
    28	3:57	history 30
    29	3:58	history 30 >> ~/soc/canis3.csh

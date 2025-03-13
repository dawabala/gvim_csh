\\\\\\\\\\\\\\\\\\\\\\\\

find *rel

\\\\ cdc_rel_0105
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.maxdelay_setting.rpt.gz
# CDCEFPM  : cdc enhanced flipflop with metastability;
# set maxdelay = max (CdcDestSetup, DestClkCnt * the period of its fastest fanout clocks)
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.relaxed_delay_inst.rpt.gz
~/soc/rpts/cdc_rel_0105/CdcTiming/
~/soc/rpts/cdc_rel_0105/CdcTiming/cdc.maxdelay_setting.rpt.gz


\\\\ cdc_rel_0143
/proj/canis_pd_gfx_fct04/fct_release/FCT0143_20250310_SOC_FUNCSCAN_GFX_FLAT_GFX_ONLY_CDC_Place_NLC

\\\\ cdc_0p6v_rel_0143
~/soc/rpts/cdc_0p6v_rel_0143/CdcTiming/report.cdc.summary.rpt.gz
~/soc/rpts/cdc_0p6v_rel_0143/CdcTiming/report.sync.summary.rpt.gz
~/soc/rpts/cdc_0p6v_rel_0143/CdcTiming/
\\\\ cdc_0p65v_rel_0143
~/soc/rpts/cdc_0p65v_rel_0143/CdcTiming/report.cdc.summary.rpt.gz
~/soc/rpts/cdc_0p65v_rel_0143/CdcTiming/report.sync.summary.rpt.gz
~/soc/rpts/cdc_0p65v_rel_0143/CdcTiming/
\\\\ cdc_0p9v_rel_0143
~/soc/rpts/cdc_0p9v_rel_0143/CdcTiming/report.cdc.summary.rpt.gz
~/soc/rpts/cdc_0p9v_rel_0143/CdcTiming/report.sync.summary.rpt.gz
~/soc/rpts/cdc_0p9v_rel_0143/CdcTiming/

gvimdiff ~/soc/rpts/cdc_0p*_rel*/CdcTiming/report.sync.summary.rpt.gz
gvimdiff ~/soc/rpts/cdc_0p*_rel*/CdcTiming/report.cdc.summary.rpt.gz

~/soc/canis31.csh


\\\\\\\\ timing verification CDC SOC .doc
Timing Verification for CDC Paths in Large-scale SOCs
Sambasivan Narayan, Michael J. Tresidder, AMD, Boxborough, Mass., USA and Markham, Ont., Canada ,www.amd.com

ABSTRACT
Signals undergoing asynchronous transfers and crossing clock-domain boundaries are typically flagged and checked with static tools at the register-transfer or gate level. The conventional methodology of false-pathing these signals during implementation and STA stages potentially violates certain temporal assumptions associated with these crossings that need to be met to produce an error-free design. Manually verifying these assumptions is not a scalable approach for a large SOC with millions of such signals. In this paper, we detail our methodology of embedding these timing assumptions into the RTL, which allows the timing requirements to be verified during functional simulation and carried forward into the implementation and STA stages, and focus on our approach to timing these paths efficiently using virtual clocks in PrimeTime for very large SOC designs.
 
Table of Contents

1.	Introduction	3
2.	Requirements during RTL Creation	3
3.	Requirements during Synthesis and Physical Design	7
4.	Requirements during Logical Equivalence Checking	7
5.	Performing STA Analysis	8
6.	Gray-coded Pointer checking	11
7.	Summary	12
8.	References	12

Table of Figures

Figure 1 : Use of CDCBUFEN Cells in Conjunction With SYNCHRONIZERS.	4
Figure 2 : Timing for Circuit of Figure 1.	5
Figure 3 : Use of input delay on synchronizers.	6

 
Introduction

Our SOC designs contain a variety of IPs created by independent teams using different methodologies during non-overlapping time periods. As a result, in a typical SOC, there are multiple cases of clock-domain crossings signals (CDC paths) employing differing synchronization schemes [1]. An error-free tapeout requires that these paths and synchronization schemes undergo structural and static checking [3] and be modeled with appropriate uncertainty during the RTL functional verification [2].

Traditionally, during the static timing analysis (STA) stage these paths have been treated as false paths requiring error-prone manual checks, entailing schedule burden or risk to the final silicon. As SOC complexity scales up, there is a need to provide automated solutions that address the timing requirements of these clock-domain crossing paths in a manner that is consistent with the assumptions used at the front-end and functional-verification stages.

In this paper, we outline our methodology that embeds the requirements for the CDC paths during the RTL creation stage, allowing the automation of the necessary functional verification and structural checking in the front end of the design. We explain the requirements as the design progresses to the final STA step and the technique adapted to ensure these paths are automatically timed in a scalable fashion, consistent with the front-end assumptions.

1.	Requirements during RTL Creation 

When the RTL for the design is created, the designers are required to deploy specific marker cells in the CDC paths based on their underlying functionality (pseudo-static, asynchronous, or domain-crossing signal) and the synchronization scheme that is being used. These cells cover the traditional multi-stage flip-flop synchronizer (SYNCHRONIZER) and special elements called CDCBUF and CDCBUFEN, which logically act as combinational BUFFER and AND gates. Behaviorally, each marker allows for the modeling of the inherent uncertainty in the paths during functional simulation [7]. The marker instances are parameterized to support multi-bit usage and act appropriately when used as such, for example in cases like gray-coded pointers [2]. Associated with these marker cells, the designer sets parameters representing the nature of, and period of uncertainty to be modeled in the path [7]. Figures (1) and (2) illustrate some representative use cases.

When this RTL is checked with the static CDC tools, the marker cells are appropriately recognized as valid synchronizer cells and no missing synchronizer errors are generated. Further, the fanin and fanout of these paths are checked for any additional structural issues [4].

During the functional simulation, the uncertainty parameters in the marker cells are used by the associated behavioral view to introduce equivalent periods of uncertainty to the output of these marker cells whenever their inputs transition [2]. Associated assertion-checking ensures that the synchronization scheme does not fall prey to undersampling issues nor does the scheme allow the capture of any data during the periods of uncertainty. For example, for the circuit in Figure (1), the CDCBUFEN behavioral model can check to ensure that when the EN pin is asserted, the input data DATA_S0 is stable and outside its uncertainty window when sampled by the destination clock, Figure (2). For the purposes of audit and review, these parameters are further logged into the output file of the simulation.

Based on the uncertainty parameters, at the onset of physical implementation, each marker cell has an associated time period that was exercised in functional simulation to ensure that the synchronization scheme is robust within that period of uncertainty and the circuit has undergone static analysis with sign-off by the RTL designer. To ensure proper design closure and to avoid repeating the checks at the gate level, the implementation in physical design must avoid introducing any additional structural violation and ensure that the timing never exceeds the uncertainty period qualified during functional simulation.


Figure 1 : Use of CDCBUFEN Cells in Conjunction With SYNCHRONIZERS.
As a general guideline, CDCBUF and CDCBUFEN cells are used for domain crossing on the datapath and synchronizers are used on the control path. CDCBUF and CDCBUFEN cells provide the structural integrity of the datapath under the assumption of stability while the SYNCHRONIZER communicates stability of the data.
Ignoring clock skews in the source domain between the control and data launch registers, the time requirement through the DATA_D0 and DATA_D1 marker cells is:
Delay(DATA_S0->DATA_D0) < delay(RDY_S) + 3 cycles of DEST_CLK
 
Figure 2 : Timing for Circuit of Figure 1.
RDY_S and RDY_D signals serve as a handshake between source and destination domains, indicating when data is available for transfer.
Proper transfer of data requires that the data at the output of the CDCBUFEN be stable whenever sampled in the destination domain. When the EN pin is asserted, the propagated DATA_S* must have settled prior to DATA_D* being sampled in the destination domain.
The total propagation time available for each DATA_S* to DATA_D* depends on the minimum latency through the synchronizer.
Here the  minimum latency of the synchronizer is two clock cycles, plus an allotment of just less than the following setup cycle.

Figure 3 : Use of Input Delay on SYNCHRONIZERS.
In a real, physical implementation signals take time to propagate from the source launch flop to where it is first sampled in the destination domain. In many cases, the physical separation of the SYNCHRONIZER from the launch flop is small and the propagation time is insignificant. However, where separation distances are significant, the uncertainty in this propagation must also be taken into consideration. While this is true for performance modeling of singularly synchronized signals, its effect is most poignant when a signal is fanned out to multiple synchronization points.
Here, consider the case in which multiple fanouts of a single signal are synchronized into multiple IPs throughout the SOC. The arrival time difference between the two IPs could cause simulation of inter-IP communication to be modeled incorrectly. In addition to the synchronization uncertainty, the arrival uncertainty at the input of the SYNCHRONIZER should also be modeled where it is significant enough to potentially create additional skew relative to the DEST_CLK period.
For this reason, the propagation time to the SYNCHRONIZER input is modeled as a delay parameter to the input of the SYNCHRONIZER. Additional cycles of uncertainty, up to the limit of the delay parameter, can be added to signal propagation latency during functional simulation.


2.	Requirements during Synthesis and Physical Design

In the synthesis view, the modules representing the marker cells translate into instances of special gate cells from the technology library. These gate cells are recognized as dont_touch by the synthesis tools and flows, and thus any logic restructuring across these marker cells is avoided.

To facilitate the association of the RTL delay values with the gate instances, we also exploit the in-built naming scheme used by most synthesis tools when expanding parameterized modules; namely, the parameter values are appended to the expanded gate module name in the gate netlist.

// Source RTL for the marker cell model
module cdcbuf_wrapper(A,Z,DSTCLK);
parameter delay = 100000;  // large default
input A, DSTCLK; 
output Z;
`ifndef SYNTHESIS
// behavioral model that randomizes the output on every input   // transition for `delay` timesteps
`else
// Note the RTL only pin DSTCLK pin that allows recognizing 
//	this as a synchronizer during the static checks and not
// used in the gate view
		cdcbff1x d0nt_CDCFPM(.A(A), .Z(Z));
`endif
endmodule

// IP named IPX‘s RTL excerpt that instantiates the module
cdcbuf_wrapper #(.delay(300)) inst33(.A(src_data), .Z(dst_data), .DSTCLK(clk2));

// Synthesized gate netlist
module IPX_cdcbuf_wrapper_delay300(A, Z);
input A;
output Z;
cdcbff1x d0nt_CDCFPM(.A(A), .Z(Z));
endmodule

// Finally the synthesized instance inside IPX module
cdcbuf_wrapper_delay300 inst33(.A(src_data), .Z(dst_data));


3.	Requirements during Logical Equivalence Checking

Any logic restructuring that occurs across the input of the marker cells could introduce gate-specific structural violations that invalidate the sign-off that occurred in the front end. By treating the marker cells as dont_touch during synthesis, we can avoid the repetition of the CDC structural checking at the gate level. There is still the case of designs implemented using custom methodologies or potential tool or flow bugs that disregard the dont_touch attribute. Hence, a check is introduced in the logical equivalence step that treats these marker cell inputs as cutpoints or black boxes, and the logic at the fanin and fanout cone of the marker cells is matched between the RTL and gate implementation.

As part of this logical equivalence checking, a report that maps the gate and RTL instances of the marker cells is produced. This facilitates the mapping of RTL delay values to gates for custom or other non-standard designs in which the module name encoding did not occur by allowing us to look up these values in the simulation output file for each RTL instance.

4.	Performing STA Analysis

When we begin STA analysis, we have the gate netlist with instances of the marker cells and their associated delay values. During regular STA, the CDC paths through these marker cells are typically false-pathed due to the presence of inter-clock set_false_path commands or, increasingly, the set_clock_groups command. The delay values associated with the marker cells can notionally be expressed as set_max_delay values. This requires that the clock insertion delays at the source and destination points be discarded by declaring the clocks as ideal. Further, the false paths between the clocks must be disabled for the max_delay to apply. This approach does not lend itself to automation without affecting follow-on steps and reports. In particular, the removal of the false paths causes a dramatic and unacceptable increase in run-time and memory usage.

Our technique to time these paths in STA is based on creating a virtual clock and constraining the CDC paths on this virtual clock using a combination of set_max_delay or set_multicycle_path through the markers and set_input_delay and set_output_delay on the startpoint and endpoints of the path. The steps involved are as follows:

1.	Collect and create a collection of the marker pins. The filter command is shown only for a subset of cell types for brevity.

set MARKER_PINS [get_pins –of \
[get_cells –h .* -regexp \
–filter {ref_name =~ cdc.*}] \
     –filter {pin_name == A}]

2.	Define a new virtual clock named CDC_VIRTCLOCK with no clock network or clock latencies. Any pre-existing inter-clock set_false_path or set_clock_group would not apply to this clock.

create_clock –name CDC_VIRTCLOCK –period $PERIOD

3.	Declare this clock as physically_exclusive to avoid creating interfering arrival windows during SI analysis or impacting the timing of the real design clocks.

set_physically_exclusive –group CDC_VIRTCLOCK

4.	Set the input delay on the startpoints of the CDC paths to zero (including ports and CLK pin of registers). This allows the timing to be performed without including any clock latencies at the startpoint in the delay calculation.

set_input_delay 0 –add_delay –clock CDC_VIRTCLOCK \
							[all_fanins –startpoints –flat –to $MARKER_PINS]

5.	Set the output delay on the endpoints of the CDC paths to zero (including ports and D pins of registers). This allows the timing to be performed without including any clock latencies at the endpoint in the delay calculation. 

set_output_delay 0 –add_delay –clock CDC_VIRTCLOCK \
[all_fanouts –endpoints –flat –from $MARKER_PINS]

6.	Set the timing requirement for the paths through the marker cells using set_max_delay to match the RTL value. The TCL procedure lookup_delay_value accomplishes this by parsing the module name of the parent module of the marker cell or using the simulation output and the logical equivalence mapping file mentioned before.

# The following returns 300 in simulation time units
# [get_attr $cell full_name]
# 											 = UNITX0/IPX0/inst33/d0nt_CDCFPM
# [file dirname ...] = UNITX0/IPX0/inst33
# [get_attr [get_cell ...] ref_name] 
# 									 	   = IPX_cdcbuf_wrapper_delay300
# lookup_delay_value \
# 		[get_pin UNITX0/IPX0/inst33/d0nt_CDCFPM]

proc lookup_delay_value { cell } {
regexp {cdcbuf_wrapper_delay(\d+)$} \
[get_attr \
[get_cell [file dirname [get_attr $cell full_name]]] \
 ref_name] => delay_value
return $delay_value	
}

foreach_in_collection pin $MARKER_PINS {
set_max_delay –from CDC_VIRTCLOCK \
–through $pin –to CDC_VIRTCLOCK \
[lookup_delay_value [get_cell –of $pin]]
     }
	 
7.	The constraints created in steps (2) through (6) get written out to a file that gets sourced just before the main update_timing step occurs to avoid any unnecessary updates to the timing graph due to the all_fanin and all_fanout commands.

# source <virtual constraints file>
update_timing

8.	Gather all the paths violating the timing requirements that have only inter-clock false paths between their source and destination real clocks. This step effectively converts the CDC timing problem from one involving false paths and manual calculation of slacks (see the next step) to that of reporting the slack for the virtual clock group, which is performed very efficiently in Primetime.

set paths1 [get_timing_path –slack_lesser_than 0 \
-to [all_fanout –endpoints ...]
–group CDC_VIRTCLOCK –max_paths $BIGNUM]

9.	Checks paths with other kinds of false paths (Ex. set_false_path –through pins, set_false_path –from pins, etc.) that will continue to apply to the virtual clock group. 

set paths2 [get_timing_path –slack_greater_than 99999 \
-to [remove_from_collection \
[all_fanout –endpoints ...] \
[get_attr $paths1 endpoint]] \
                    –group CDC_VIRTCLOCK –max_paths $BIGNUM]

10.	The paths generated in Step (9) will always have a slack of INFINITY and the slack must be calculated using the arrival and points attributes of the timing_path object.
set pts [get_attr $path points]
set fp_time [get_attr \
[index_collection $pts \
[expr [sizeof_collection $pts] – 1]] \
						[get_attr [index_collection $pts 0] arrival]
set marker_pins {}
     foreach_in_collection pin \
[filter_collection \
[get_attr [get_attr $path points] object] \
{object_class == pin}] {
if { 0 != [sizeof_collection \
[filter_collection [get_cell –of $pin] \
–regexp {ref_name =~ cdc.*}]] } {
	append_to_collection marker_pins $pin
}
}
set slack [expr $fp_time - \
[lookup_delay_value $marker_pins]]

Note that this command can be used repeatedly without utilizing this virtual clock methodology to perform the same check, albeit with significant runtime penalty.

These steps perform timing to the D pin of registers only and the associated setup time of the register does not get included in the slack calculation. This can be handled by margining the calculated slack on the paths or using the following refinement:

a.	Collect the fanouts that are pin endpoints to facilitate the get_timing_arcs command. 

set fanouts [filter_collection \
[all_fanout –from $MARKER_PINS –flat \
–endpoints_only] \
{object_class == pin}]

b.	Collect the setup arcs (all the possible arcs senses are not shown for brevity) and the setup times associated with each endpoint and store it in the MAX_SETUP_TIMES array.

set MAX_SETUP_TIMES *
foreach_in_collection arc \
[get_timing_arcs –to $fanouts \
–filter {is_cell_arc && (sense == setup_clk_rise ||
sense == setup_clk_fall || … )}] {
lappend MAX_SETUP_TIMES([get_attr $arc to_pin]) \
[get_attr $arc delay_max_rise]
		 lappend MAX_SETUP_TIMES([get_attr $arc to_pin]) \
[get_attr $arc delay_max_fall]
}

c.	The maximum (or average) of these setup times can now be used with the set_output_delay command at the endpoints in step (5) above.

foreach {ep values} [array get MAX_SETUP_TIMES] {
set_output_delay [lindex [lsort –real $values] end] \
–add_delay –clock CDC_VIRTCLOCK			
     }

Querying the timing_arc attributes may induce a timing_update, so the setup time is better margined into the slack than explicitly calculated.

Lastly, to facilitate review of the results, the reporting is done using the actual design clocks on the startpoint and endpoint rather than the virtual clock. This step also allows filtering out paths between mutually exclusive clocks or paths that have the same or synchronous source and capture clocks, which get timed synchronously.

5.	Gray-coded Pointer checking

The case of synchronizers used for gray-coded pointers has been covered in several recent publications [5] [6]. In general, the concept of the delay associated with arrival at individual synchronizers no longer applies to gray-coded pointers (or any unit-coded pointers synchronized with multi-bit synchronizers). Instead, the check has to focus on ensuring that the overall skew does not cause the consecutive bit changes at the source domain from being reordered at the destination domain.

6.	Summary

Our approach to timing these circuits was tested on a recent SOC with nearly 2 million marker cells and more than 50 million paths. The runtime was 15 times faster compared to previous techniques (which was to use Step 9 iteratively), allowing us to perform this timing with a 10-20% runtime penalty and insignificant increase in memory usage. Even this additional run-time is dominated by Step 9; namely, extracting paths with false paths that do not specify clocks (nearly 80% of the additional run-time). This shows that the elimination of broad false paths, especially those that do not specify the associated source and destination clocks, enables very efficient runtime for these checks.

Looking ahead to potential software enhancements, we echo the suggestion in [5] to enhance the set_max_delay and set_multicycle_path commands to ignore clock insertion delays. Ideally, the design intent captured by the set_clock_groups command should be leveraged and the clock insertion delays ignored when the source or destination clocks are defined to be asynchronous.

7.	References

# [1] W. Dally & J. Poulton, Digital System Engineering, Chapter 10, Cambridge University Press 1998.
[2] P. Parakh & S. J. Kommrusch, “A Smart Synchronizer – Pragmatic way to cross asynchronous clock domains,” DVCON 2010.
[3] P. Parakh, “Achieving CDC Verification in the Billion-Transistor Chip Era,” Electronic Design, April 19, 2011. 
[4] R. Ginosar, “Fourteen ways to fool your Synchronizer,” Proceedings, Ninth International Symposium on Asynchronous Circuits & Systems, 2003.
[5] P. Zimmer, “No Man’s Land – Constraining Async Clock Domain Crossings,” SNUG 2013.
[6] E. Masson, “An efficient timing method for checking asynchronous gray code transfers,” SNUG 2007.
[7] M. J. Osborn, M. J. Tresidder, A. J. Grenat, J. Kidd, P. Parakh, & S. J. Kommrusch, “Clock domain crossing buffer,” USPTO Application 12/938,125, https://www.google.com/patents/US20120110529.

\\\\ a smart synchronizer pragmatic
A Smart Synchronizer - Pragmatic way to cross asynchronous clock domains.
Priyank Parakh Advanced Micro Devices, Inc.  90 Central Street, Boxborough, MA, USA.  (1)-978-795-2500
Steven J Kommrusch Advanced Micro Devices, Inc.  2950 E. Harmony Rd, Fort Collins, Co 80582 (1)-970-226-9500

ABSTRACT
In order to achieve satisfactory verification coverage in an asynchronous design, it is highly desirable to model a synchronizer with all the checks that can help catch the problem. 
Modeling uncertainty caused by metastable values at the output of the synchronizer is one of them. 
Due to the inherent determinism in RTL-level simulations, it is necessary to take explicit steps to model the inbuilt uncertainty associated with the act of synchronization.
However, the task of effectively modeling this uncertainty in a manner that draws out design flaws can be a challenge.
Many papers published so far have emphasized the usage of very aggressive ways to model various checks inside the synchronizer but what they failed to do is to consider the overhead, 
like performance issues, false negatives etc, caused by these aggressive techniques.
This paper explains a more balanced approach which is smart enough to regulate the aggression of the synchronizer based on different synchronization activities.

Keywords:
Metastability, clock domain crossing, random delay, aggressive techniques, gray-encoded pointers, FIFO.

1. INTRODUCTION
Clock domain crossing (CDC) verification of the current generation of complex, deep sub-micron (DSM) designs has become a critical step in the design process. 
Today’s large silicon devices are comprised of a growing number of IPs which in turn contain an ever increasing number of asynchronous clock domains from which stem
a large number of cross over signals and a variety of design styles for synchronization of CDC signals. 
In order to achieve adequate verification coverage in a design like this, it is highly desirable to model a synchronizer with all the checks that can help catch problems. 
In hardware, the effects of metastabilty [1-6] are unpredictable, but normal simulation provides predictable results.
Hence, due to the inherent determinism in RTL-level simulations, it is necessary to take explicit steps to model the inbuilt uncertainty associated with the act of synchronization.

2. PROBLEM STATEMENT
Modeling a clock-domain-crossing (CDC) synchronizer is a more involved process than initially meets the eye. 
Generally speaking, modeling techniques must strive to meet multiple goals, some of which can be at odds with each other. 
In addition, since simulation is a crucial medium to validate and debug design flaws, it is essential that reproducibility be an innate characteristic of the solution chosen.
Various design teams across different companies have handled this task in a variety of ways which has caused misunderstandings and bugs found late in the design process. 
Many papers published so far have emphasized the usage of very aggressive ways to model various checks inside the synchronizer but what they failed to do is to consider the overhead caused by these aggressive techniques. 
For example, the most aggressive way to model a synchronization event is to randomly introduce an extra latency of one destination clock-cycle when propagating any transition. 
Unlike the real-life behavior of flip-flops, using this behavior will introduce synchronization uncertainty in cases well outside the “setup/hold” window that characterizes the physical design. 
This technique can be very effective for simple synchronization activities, but for more sophisticated ones like a “bussed” event with gray encoding this technique is at odds with the property that makes gray-coded counters so effective – only one bit changes per update.

2.1 Aggressive technique
Ultimately, the goal of a synchronizer model is to expose all clock domain crossing design flaws as quickly and efficiently as possible.
In order to accomplish this goal, it is necessary to strive for an aggressive behavior in the model in case the design is left with undiscovered flaws. 
Out of all the modeling techniques discussed so far in the design world, one of the most commonly used techniques is to randomize the data with respect to the destination clock.

always @( posedge CK )
prevD <= currD;
currD <= D;
// The net effect of this is to randomly decide whether to
// take the current value of the signal to be synchronized,
// or the value that was presented before the last transition.
//
Q <= ( random_evaluation ) ? prevD : currD;
Using this simplistic technique can be very effective for simple
synchronization activities, but simplistic synchronization techniques
tend to lead to design inefficiencies that can result in performance
limitations or bloat to the design in an effort to recoup performance.
To combat this, designers will often leverage properties of “bussed”
events to achieve their CDC synchronization goals. A common
example of a “bussed” event that is leveraged is that of gray-coded
counters. Unfortunately, the simple technique described above is at
odds with exactly the property that makes gray-coded counters so
effective – only one bit changes per update.
3. SOLUTION
When considering an approach to modelling a synchronizer, two
important criteria must be taken into account. To begin with we must
know when to model the uncertainty and then how to model the
uncertainty.
3.1 Modelling Uncertainty
It is the belief of the authors that the proposal outlined below
achieves the goals in a manner that is as aggressive as possible while
still yielding to the properties that are leveraged for “bussed” events.
The proposal is divided into two layers. Basic layer which essentially
is a single-bit synchronizer that classifies candidate events for
randomized uncertainty modelling, and a filter layer which is a
multi-bit level that provides a filter to qualify the candidates elected
by the basic level. Each of these levels will be described using
pseudo code, but the intent of the code snippet is to impart an
understanding of the technique and not to present final code.
Basic layer
reg currD;
reg prevD;
reg prevVld;
initial begin
currD = D;
prevD = D;
prevVld = 1'b0;
end
always @( D or posedge CK ) begin
if ( posedge CK )
// We are taking a sample, so past transitions are moot
// for future samples as they would be stable by the time
// that the next sample edge arrives.
prevVld <= 1'b0; // clear our candidacy for uncertainty
else begin
// When we see a transition in the data, we mark our
// candidacy for uncertainty modeling. This is our aggressive
// mode of modeling.
//
// Note, the use of non-blocking assignments. Since the
// clock edge takes precedence, we are not executing this
// code concurrently with a clock edge. Consequently, the
// choice of blocking vs. non-blocking should be a matter
// of which simulates faster.
prevVld <= 1'b1;
prevD <= currD;
currD <= D;
end
end
always @( posedge CK )
// Note, the signal 'transitionVld' is an input to this
// level of the model and is the hook for the higher-level
// filter to "dial-back"; the aggressiveness of the modeling
// of "when"; to apply randomized uncertainty in the delay.
if ( prevVld && transitionVld ) begin
// Here, the technique for the random evaluation is not
// detailed. The technique for this is discussed later.
//
// Nevertheless, it is important, for performance reasons,
// to understand that the random stream should only be
// pulled when an actual randomization decision is required.
//
// The net effect of this is to randomly decide whether to
// take the current value of the signal to be synchronized,
// or the value that was presented before the last transition.
//
// Note, it would have been simpler to use ~CurrD without
// storing prevD, but that technique limits
// us to { 0, 1 } as signal values, whereas the technique
// outlined here is specifically capable of dealing with
// { 0, 1, X } as signal values without polluting the results.
Q <= ( random_evaluation ) ? prevD : CurrD;
end else
// Data not flagged for randomization was stable at ‘currD’
Q <= CurrD;
Multi-bit filter
input [(VEC_SIZE-1):0] D;
...
reg [(VEC_SIZE-1):0] currD;
reg [(VEC_SIZE-1):0] prevD;
reg [(VEC_SIZE-1):0] transitionVld;
integer idx;
initial begin
currD = D;
prevD = D;
end
always @( D ) begin
prevD = currD;
currD <= D;
for ( idx = 0; idx < VEC_SIZE; idx = idx+1 )
// any bit that has changed since the last time the
// data vector changed will be marked as a valid bit
// for synchronization candidacy. Any bit that remains
// unchanged will have its "candidacy" overridden since
// it is known to be stable, thus preserving the
// leveraged property of the "bussed" event.
//
// this signal is then passed down to the individual
// lower-level synchronization models.
transitionVld[idx] = ( prevD[idx] !== currD[idx] );
end
As can be seen from the code samples above, transitions on the input
data are the primary means for determining when the capture should
or should not be randomized. By sensitizing the code to transitions
of the input data, we are inferring the source clock domain since
each data transition should follow a clock edge in the source clock
domain. Using this property, the aggression is “dialed-back” for
bussed synchronization events by permitting randomization for only
those bits that have changed in the most recent update. Any bits that
have remained stable during the most recent update are blocked from
having their capture randomized, even if the lower-level
synchronizer has detected a transition since the last capture edge.
This “filter” leverages the fact the property that a signal that has
been stable for at least one source clock cycle will have been stable
at the sample flop for a sufficiently long time that its capture will be
certain.
4. CASE STUDY
Consider a FIFO, as shown above, used to transfer multi-bit data
across a clock domain. Now, imagine a scenario where the
destination clock is known to always be at least half as fast as the
source clock. The designer might assume that the gray code counter
could never change by more than two counts. But if the source clock
is writing every cycle and destination clock is exactly half the source
clock rate, then in real silicon, we might see a case where the counter
jumps three counts in one cycle.
If the designer is using the aggressive technique described in this
paper, his randomizer will try to process the data at every edge of the
destination clock and will randomize any changed bit at the capture
time.
Now as can be seen above, the simulation data at the first destination
clock is 000 and in the consecutive edge, due to the frequency
relationship between the clock and the fact that we are gray encoded
the pointers, the simulation data will be 011. This implies that in
between two destination clock transition two bits have changed
which means after standard aggressive randomization, simulation
can see any of the four shown choices 000, 001, 010 and 011. If the
simulation were to process 010 then it might eventually lead to false
functional failures as that entry has not even been written yet. This
false negative might cause simulation errors and might consume both
time and resource to fix.
To avoid this overhead, a designer sometimes takes a “drastic step”
including shutting down the randomization model completely, hence
using just back to back flops and gray encoded pointers. Following is
the waveform of the “Resolved” value with randomization disabled.
Shown below is the case which might slip through the cracks if we
were to follow the “drastic step” and how our synchronizer model
will expose that.
In zero time delay simulation, the first Rd Clk rising edge sees 000
from the source domain, but the last bit to change was 1 (from 100),
so in silicon, this bit might go metastable and hence our smart
synchronizer will capture the transition and will introduce a random
delay and will produce either 000 or 100. Similarly when the Rd clk
captures 011, the actual value could be 001 or 011 and then the next
destination clock cycle might produce 001 or 011, and the next
might produce 010 or 110. So there is a random way to produce the
sequence 000, 001, 110. This could actually happen in real silicon
based on metastability resolution and so our smart synchronizer will
correctly expose a design problem if the design could not handle a 3-
step increment in the counter
5. SUMMARY
With a growing number of clocks in today’s SOC designs, increased
design complexity, and pressure for first silicon success, all clock
and timing issues have become a verification challenge.
Existing techniques used to model uncertainty in synchronizers are
too aggressive to be used effectively with all different
synchronization schemes forcing the user to make a choice when it is
safe to turn off and on this feature. The technique presented in this
paper eliminates that decision making process and makes clock
domain verification more stable and sustainable.
6. ACKNOWLEDGEMENT
The authors are grateful to the many imaginative designers whose
innovations ended up in this paper. Their names are kept in
confidence. The anonymous referees have provided interesting
viewpoints which together have improved the quality of the paper;
the authors alone should be blamed for any remaining mistake.
7. REFERENCE
[1] Chris Kwok, et al, “Using Assertion based Verification to verify Clock domain crossing”, DVCON 2003
[2] Clifford E. Cummings, “Clock domain crossing design and
Verification techniques using System Verilog”, SNUG 2008
[3] Clifford E. Cummings, “Synthesis and Scripting techniques for
Designing Multi- Asynchronous clock designs”, SNUG 2001.
[4] Ginsor Ran, “Fourteen ways to fool your synchronizer”
Asynchronous Circuits and Systems, 2003.
[5] Parakh Priyank, Sabbagh Roger, “Clock domain crossing
verification of a CPU/GPU design”, DVCON 2010.
[6] Patil, Girish, IFV Division, Cadence Design Systems. Clock
Synchronization Issues and Static Verification Techniques. Cadence
Technical Conference 2004

'

\\\\\\\\\ fourteen ways

Fourteen Ways to Fool Your Synchronizer
Ran Ginosar VLSI Systems Research Center, Technion—Israel Institute of Technology Haifa 32000, Israel
[ran@ee.technion.ac.il]

Abstract
Transferring data between mutually asynchronous clock domains requires safe synchronization. 
However, the exact nature of synchronization sometimes eludes designers, and as a result synchronization circuits get “optimized” to the point where they do no longer operate correctly. 
This paper reviews a number of such cases, analyzes the causes of the errors, and offers a correct synchronizer circuit for each case. 
A correct two-flop synchronizer is presented. 
After discussing cases that avoid synchronization, the following synchronizers are reviewed: 
one flop, sneaky path, greedy path, wrong protocol, global reset, async clear, DFT leakage, pulse, slow-to-fast, metastability blocker, parallel and shared flop synchronizers.

1. Introduction
Transferring data between mutually asynchronous clock domains requires safe synchronization [1-6]. 
The operation of synchronization circuits has been recognized for a long time as being delicate and easy to disturb [1-3, 7-12], 
but at the same time robust synchronizer design does guarantee safe operation for all practical purposes.
However, the exact nature of synchronization sometimes eludes designers, and as a result synchronization circuits get “optimized” to the point where they do no longer operate correctly. 
This paper reviews a number of such cases, analyzes the causes of the errors, and offers a correct synchronizer circuit for each case. 
The author has encountered those interesting cases while teaching, while working with various SOC (System on Chip) design teams, and while reviewing certain papers submitted for publication.
The paper starts by presenting a (hopefully) correct two-flop synchronizer. Validation means and tools are discussed. 
Section 3 describes the various synchronizers, analyzes the errors and pitfalls, and offers suggestions.
This paper focuses on the most general synchronization of two mutually-asynchronous clock domains. 
More aggressive synchronization circuits, which achieve high throughput data transfer between clock domains having the same or related frequencies, are not discussed here.

2. A Correct Two Flop Synchronizer
The simplest and safest method for the transfer of data between two mutually-asynchronous clock domains requires a two-flop synchronizer [2-4]. 
A “push” synchronizer is shown in Figure 1, but the principles apply also to pull, push-pull, and control-only synchronizers.
SENDER RECEIVER R A
Figure 1: A push synchronizer

Bundled data is employed. The “synchronizer” actually comprises two synchronization circuits that envelope the data lines, implementing a complete handshake protocol. 
The Request (R) and Acknowledge (A) lines are synchronized by the receiver and sender, respectively. 
The settling window T (namely the time separation between the two clock inputs to the two flops of the synchronizers) could be a whole clock cycle or a fraction thereof, and could be different for each side, 
as long as the desired reliability is obtained. 
Synchronizer reliability is typically expressed in terms of Mean Time Between Failures [2]:
MTBF = e **(T/τ) /(Tw * fA *fD )
where τ is the settling time constant of the flop, TW a parameter related to its time window of susceptibility, 
fA the synchronizer’s clock frequency (the receiver’s clock frequency for the R synchronizer and the sender’s for the A synchronizer), and fD is the frequency of pushing data across the clock domain boundary. 
Typically, MTBF is designed to be at least ten times the expected life of the product. If latency is not an issue, T is simply set to be a
# Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03) 1522-8681/03 $17.00 © 2003 IEEE Authorized licensed use limited to: XILINX. 
# Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
whole clock cycle, and for most SOCs it implies MTBF of many eons.
The two synchronizers connect two simple finite state
machines that implement the required protocol. A fourphase
protocol is specified by means of a generalized STG
in Figure 2, where “DD” means that the data is available
(at the sender), “UU” means that it may be removed, and
“LL” means data latched by the receiver. (A two-phase
protocol may also be employed; the circuits are a bit more
complex [13, 14], and this is typically used in order to
minimize latency on long lines.) The complete logic and
FSM are shown in Figure 3. A send request (V, true for a
single cycle) latches data into REGS and starts the
sender’s FSM. The synchronized request (R2) latches the
data into REGR and triggers the receiver’s FSM. The
receiver is given a single-cycle “data received” (D) signal.
The protocol is sometimes modified so that A is set as
soon as the received data are latched, but removed only
after the receiver has had an opportunity to use the data.

R+ DD A+ UU RAR+ LL A+ RAFigure

2: Four-phase handshake push synchronization protocol STG 
To consider the synchronizer’s behavior in cases of conflicts, assume that T equals a whole clock cycle. 
Upon a potential clock-data conflict on R, one of three possible outcomes may happen (Figure 4):
a. The rising edge of R is sampled high. R2 goes high on cycle 2, and data is latched into REGR by the beginning of cycle 3.
b. The rising edge of R is sampled low. Since the protocol assures that R stays high as long is A is low,
it will be sampled high on cycle 2, when it is surely stable high. R2 will go high on cycle 3, and data is latched into REGR by cycle 4.
c. The first flop goes metastable. With a probability of 1-e-T/τ (which is infinitesimally close to 1), the flop
has exited metastability by the next clock, and has arbitrarily settled to either high or low (the thick traces of R1 in the figure). 
If high, then R2 goes high on cycle 2. If low, it will surely go high on the next cycle, when the input R is already stable high, and R2 goes high on cycle 3.

A word of caution is due here: Although outcome c
above implies that metastability typically disappears
within a single clock cycle, the second flop is still
required. An exception is discussed in Section 3.2 below.
REG S R A RX FSM TX R2 FSM A2 V L IDLE REQ/R=1 V WAIT A2 IDLE ACK/A=1 R2 R2 D F R1 A1 REG R L A2
Figure 3: Push synchronizer logic and
protocol FSM
CLOCK R R1 R2
CYCLE 1 CYCLE 2 CYCLE 3
a b c a b c c
Figure 4: Three synchronization scenarios

A VHDL specification of the synchronizer is shown in Figure 5. This is a highly sensitive code, where minor modifications may render the synchronizer useless. 
Some such innovative but often fatal modifications are reviewed in the rest of this paper.
Logic validation tools are typically incapable of detecting any errors in such synchronizers. 
When reasonable logic assumptions are made, many erroneous synchronizers appear to operate perfectly well.
Synchronizer-specific verification algorithms are required for this analysis.
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
3
-- TRANSMITTER (inputs V, A, output R)
if rising_edge(tx_clock) then
A2 <= A1; A1 <= A; -- 2 flop
A3 <= A2; F <= not A3 and A2; -- 1 shot
case (tx_fsm_state) is
when idle =>
if (V = '1') then
tx_fsm_state <= req;
R <= '1';
end if;
when req =>
if (A2 = '1') then
tx_fsm_state <= waiting;
R <= '0';
end if;
when waiting =>
if (A2 = '0') then
tx_fsm_state <= idle;
end if;
when others =>
tx_fsm_state <= idle;
R <= '0';
end case;
end if;
-- RECEIVER (input R, output A)
if rising_edge(rx_clock) then
R2 <= R1; R1 <= R; -- 2 flop
R3 <= R2; D <= not R3 and R2; -- 1 shot
case (rx_fsm_state) is
when idle =>
if (R2 = '1') then
rx_fsm_state <= ack;
A <= '1';
end if;
when ack =>
if (R2 = ‘0') then
rx_fsm_state <= idle;
A <= '0';
end if;
when others =>
rx_fsm_state <= idle;
A <= '0';
end case;
end if;
Figure 5: Push 2-way 4-phase synchronizer
VHDL specification
One tool has been developed specifically for validating
synchronization. The Avant! Clock Domain Checker [15]
is a decent first attempt at addressing this issue. However,
it has a number of drawbacks: First, the control and data
signals that cross domain boundaries must be named in a
manner that facilitates these checks. Second, it validates
only one-sided transfers and does not examine complete
two-sided protocols and the protocol state machines.
Third, it only validates a limited set of pre-defined rules,
mostly covering a simple two-flop synchronizer and data
lines protected by it; for instance, it does not check the
synchronization of asynchronous reset. Fourth, it only
handles “push” (and control-only) synchronizers, but
neither “pull” nor “push-pull” ones. Another such tool is
@Verifier from @HDL [16].
3. The Interesting Synchronizers
3.1 Avoiding the Synchronizer
The most common synchronization error is the transfer
of a signal from one clock domain into another without
any synchronization. In some cases the designer felt that
failure probability was too low to worry about (he has
learned about MTBF in the range of 10100 years, so why
bother?). In other cases, the receiver operated at a much
higher clock frequency than the sender, and the designer
felt that the receiver would always be fast enough to catch
the signal.
The incoming data is used as a combinational input to
a combinational circuit, which eventually feeds into a flipflop.
Since the timing of the input is unknown, there is no
way to guarantee the timing of the output of the
combinational circuit. In particular, it may change
simultaneously with the sampling edge of the clock, and
the receiving flip-flop may enter metastability or take
excessively long time to respond, hampering correct
operation of the next stage of logic [2].
How often does the receiving flop enter metastability?
The rate of entering metastability is TW×fD×fC. For a
0.18μm SOC (where TW≈50ps) with a clock domain
operating at 200MHz and receiving data every 1000
cycles, that rate is 2000/sec, namely two metastability
events every millisecond. Ignoring such a high rate does
take some courage!
This error can sometimes evade detection by normal
logic validation tools. Simulations may assume such
timing relations among the different clocks that all timing
constraints are met. Static timing analysis would generate
setup and hold violation warnings for every signal that
crosses domain boundaries, but due to the typically huge
number of such warnings most designers treat them as
chaff and ignore them, assuming that the synchronizers
will handle all those issues anyway. Consequently,
legitimate warnings can easily be overlooked.
The error can be detected by the following clock
domain crossing analysis, which can be performed using
standard path analysis, e.g. as offered by logic
synthesizers and by static timing analyzers. All possible
pairs of clocks must be identified. For each pair, the CAD
tool is made to report all logic paths that begin in a flop
driven by the first clock and end in a flop driven by the
second clock. The resulting list should be studied, either
manually or with an automated script, and every reported
path must be approved. Typically, the crossing lists are
carefully maintained and are used as ‘false-path’
specifications, instructing the analysis tool to ignore crossdomain
paths that are already verified.
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
4
3.2 One Flop Synchronizer
A deceptively effective means of cutting down on the
two-flop synchronizer’s latency is to remove one of the
flops (Figure 6).
R
A
SENDER RECEIVER
Figure 6: One-flop “synchronizer”
The problem comes about, of course, when there is a
clock-data conflict. As explained above, the synchronizing
flop may take an excessively long time to respond [2]. Its
output may be used in a standard combinational logic
stage (the cloud in the figure), whose nominal propagation
delay is typically close to a whole clock cycle. When the
synchronizing flop fails (responding slowly), the input to
the next flop will not be ready in time for the next clock
cycle.
The one-flop synchronizer can be detected by
extending the analysis described above. The added step
should validate that the output of every synchronizing flop
feeds directly into the input of exactly one flop (driven by
the same clock), without any logic in between.
The one-flop synchronizer is acceptable when
designed correctly. If the delay through the combinational
‘cloud’ in Figure 6 is d, the settling time is T-d. If that
time is sufficient to assure the required MTBF, then this
synchronizer is legal.
3.3 Sneaky Path
Occasionally, a signal sneaks through a clock domain
boundary unintentionally and unsynchronized. For
instance, a signal has been moved from one clock domain
to another as part of redesign, and some uses of the signal
in its old domain are overlooked. It has also happened
when a designer was unaware that a specific signal
belonged to a different clock domain. In yet other cases, a
signal S from a different clock domain is synchronized
and renamed S_sync, but the designer has used S rather
than S_sync by mistake.
The situation is similar to case 3.1 above, and so are
the solutions.
3.4 Greedy Path Synchronizer
The designer employed a good two-flop synchronizer,
but decided to save a little latency with the arrival
detector: D= R1× R2 (Figure 7). This is quite similar to
the one-flop synchronizer: The problem is that D is used
with additional combinational logic, and the timing of that
combinational path is typically designed to fit within a
single clock cycle. But in cases of clock-data conflict of
R, R1 may take longer than the normal flop tPD to
stabilize, and consequently the entire combinational path
from R1 through D and to the last flop fails to converge
during a single cycle. The right solution, obviously, is to
add a flop and set D= R2× R3 (as in Figure 3).
SENDER RECEIVER
R
R2
D
R1
Figure 7: Greedy path “synchronizer”
3.5 Wrong Protocol
Consider the following example. The sender in a push
synchronizer is a CPU that can be tuned to operate in the
range of 60-100 MHz. The receiver is a communication
modem based on a 55MHz clock. A push synchronizer is
used to transfer data from the CPU to the modem. The
designer has correctly realized that, once R is set, it would
take at most four cycles of the receiver’s clock to latch the
data into REGR (as in Figure 4). Based on the relative
speeds, this would mean up to eight cycles of the faster
sender’s clock. To save time and logic, the designer
eliminated the A line and its synchronizer; instead, he
inserted a nine-cycle delay in the sender’s FSM. After the
delay, R is reset and the transfer is assumed finished.
There were two problems with that novel design. First,
the designer did not realize that he had violated the safety
(or 1-boundedness) requirement of the protocol (namely,
transitions must be acknowledged, or else an STG arc
might accumulate multiple tokens [17, 18]). Although the
data was safely latched into REGR, at times the receiver
was busy doing something else and did not manage to
make use of the data before a new set of data has arrived,
over-writing the old.
Second, while the modem remained at 55MHz, the
CPU in a later chip generation was sped up to 200MHz.
At that rate, nine sender’s clock cycles weren’t enough
any more to cover four modem cycles, and the
synchronizer broke down.
There are other ways by which the protocol can be
violated. A powerful protocol verification algorithm might
provide a useful tool to weed out such innovations.
3.6 Global Reset Synchronizer
In a multi-frequency GALS (Globally Asynchronous,
Locally Synchronous) SOC, a global reset signal is
naturally asynchronous to at least some of the clock
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
5
domains. The leading edge of the reset signal is harmless,
as it forces all circuits to a known starting state. The
trailing edge, on the other hand, is the culprit in some
chips. During global reset all the various clocks are started
and all PLLs settle into their respective different
frequencies. When the reset is removed, it can happen
simultaneously with the sampling edge of one of the
clocks. The global reset is typically connected into the
asynchronous clear (or preset) input of many flip-flops,
and its trailing edge must respect a setup constraint, or
else the flops may enter metastability.
A safe interface is shown in Figure 8. It belongs with
each of the several clock generators of the SOC. While the
leading edge is transferred without delay (when the clocks
may be inoperative), the trailing edge is synchronized.
RESET
CLOCK
RESET WITH
SYNCHRONIZED
TRAILING EDGE
Figure 8: Global reset synchronizer
3.7 Async Clear Synchronizer
Occasionally (and contrary to the wisdom of typical
synchronous design methodologies) asynchronous clear or
preset of a flop may be employed as part of the logic
(rather than for global reset, as discussed in Section 3.6).
Some designers feel that, since this is an asynchronous
clear, it needs not be synchronized even when it crosses
clock domain boundaries (Figure 9).
The problem is very similar to that described in
Section 3.6: Removal of the asynchronous clear signal
may concur with the rising edge of the receiver’s clock,
potentially leading to metastability. The solution is either
to synchronize the reset signal with two flops, or (when
the leading edge must not be delayed) design an
asymmetric synchronizer as in Figure 10.
CLR
RESET
Figure 9: Asynchronous clear
CLR
RESET
Figure 10: Synchronized-trail clear
3.8 DFT Leakage
Simple production testers may have only a single
clock. To test a GALS SOC on such testers, all clocks are
shorted together. Static faults (such as stuck-at) and some
dynamic faults (speed testing of the individual clock
domains) are properly tested that way. The clock shorts of
course must be ignored during path analysis (by means of
manually assembled ‘false-path’ lists or by instructing the
analysis to ignore all paths that are conditioned upon a
test-enable signal). But certain changes of the design may
result in an error (sneaky) path masked by the list.
The solution is to recheck the entire false-path list as a
final check, after all design changes are completed.
3.9 Pulse Synchronizer
The pulse synchronizer (Figure 11) is designed to pass
a single “pulse” (a logic signal that is set to ‘1’ for only a
single clock cycle) from one clock domain to another. A
pulse on P causes the sender’s flop to toggle. Eventually,
D is set high for a single cycle of the receiver’s clock as a
result.
The designer was lucky to discover the problem when
the circuit was tried on an FPGA, prior to tapeout.
Sometimes the P input was set to ‘1’ for two consecutive
cycles. At other times two pulses came in succession, with
only one cycle in between. In both cases the synchronizer
has generated undesirable results. The astute reader can
easily figure out what they were. The situation was
mended by replacing this with a standard control-only
synchronizer, operating with a standard two—phase
protocol.
SENDER RECEIVER
D
P EN
Figure 11: Pulse “synchronizer”
3.10 Slow-to-Fast Synchronizer
When the sender uses a slower clock than the receiver,
designers can simplify the handshake protocol: The R line,
when set for a single cycle of the sender’s clock, is
sampled by at least two edges of the receiver’s clock. If
the first edge misses, the second one is guaranteed to
sample R. If the first one succeeds, further sampling is
blocked (Figure 12), so that metastability during the
second edge is avoided.
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
6
SLOW
SENDER
FAST
RECEIVER
EN
R
Figure 12: Slow-to-fast “synchronizer”
Such a simplified synchronizer typically works just
fine. Except that SOCs tend to evolve and change clock
frequencies. Sometimes clocks are changed during the
design, when certain frequencies turn out to be too fast. In
other cases, when a new product generation is launched or
when the SOC is ported to a different fabrication process,
slow domains may be sped up, and the assumption of
who’s faster may no longer hold. Hopefully the
assumption has not been forgotten in the meantime, and
the only adverse effect is that the chip needs to undergo a
new logic and physical design, merely due to the
‘optimized’ synchronizer.
3.11 Metastability Blocker
A designer has suggested blocking metastability by the
circuit of Figure 13. RESET clears the SR latch and the
synchronizing flop. When the clock is high, if INPUT
rises, the latch is set. When the clock goes low, the
asynchronous input is blocked and only the SR latch
output is connected to the flop. When the clock rises, it
samples the synchronous output of the latch, rather than
the asynchronous input.
MUX
0
1
R
S
CLR
D Q
INPUT
RESET SYNCHRONIZED
INPUT
CLOCK
Figure 13: Metastability “blocker”
The designer has missed two problem scenarios,
though. If INPUT rises exactly when the clock goes low,
the SR latch can become metastable. It will most likely
settle by the next rising edge of the clock. In other words,
the metastability risk has simply been transferred from the
flop to the latch, and one-half clock cycle is allowed for
settling. If the proper protocol is employed (e.g., INPUT
stays high until acknowledged), the synchronization will
function correctly.
The second scenario is more dangerous. If INPUT
rises exactly when the clock rises, the SR latch will
probably miss it but the flop may become metastable.
While the first scenario seems to be handled properly by
the circuit (in spite of the designer’s ignorance), the latter
case may cause damage in the circuit that follows the flop.
Various “metastability blockers” or circuits that
“eliminate” metastability are repeatedly reinvented and
occasionally get published. Fortunately, most practitioners
have learned to take them with a grain of salt.
3.12 Parallel Synchronizer
A careful designer assumed that more is better and,
instead of using the recommended complex structure for a
push synchronizer, he inserted a separate two-flop
synchronizer on each data line (Figure 14). That scheme
also seems to save one cycle time (no need to wait one full
cycle after R2 is stable and until REGR latches the
incoming data, as in Figure 3).
...
Figure 14: Parallel “synchronizer”
This scheme is a yet another prescription for a sure
disaster. On clock-data conflict, each of the several data
synchronizers may end up doing something different:
Some may sample the new data, others may miss it and
retain the old data, while yet others may enter
metastability. Of the metastable ones, some may settle to
‘1’ while others may settle to ‘0’. There is no way of
telling which is which, as all four options are equally
legitimate and possible outcomes.
To emphasize the severity of failure, recall that a
typical single synchronizer may enter metastability twice
every millisecond, as computed in Section 3.1. Thus, a 32
bit parallel synchronizer faces a risk of failure every 16
microseconds!
Another incarnation of this problem employs three
parallel synchronizers and takes a vote of their outputs. Is
this any safer than the non-voting parallel synchronizer?
3.13 Shared Flop Synchronizer
The synchronization handshake protocol is sometimes
implemented with a signaling latch, set by the sender and
cleared by the receiver. A somewhat misleading example
based on two signaling flops has been published by a
leading FPGA vendor (Figure 15). The problem is that the
RECEIVE signal, which is driven by the sender’s clock, is
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
7
never synchronized by the receiver’s (at least not in the
schematics shown in the publication).
D Q
READY
1
CLR
Q D
ACK
1
CLR
DATA
TRANSMIT RECEIVE
Figure 15: Shared flop “synchronizer”
A better scheme for a shared latch synchronizer
(Figure 16) has been shown by Dike [19] and has been
employed successfully in a low-voltage product (low
supply voltage increases the risk of metastability). The
control signals generated by the shared latch are both
carefully synchronized with their respective clocks.
WRITE VALID
Q D Q D D Q D Q
S R
Q
WRITE
CLK
ACK
READ VALID
READ
CLK
REQ
Figure 16: A correct shared latch
synchronizer
3.14 Conservative Synchronizer
The careful designer occasionally wishes to be on the
safe side and, when synchronization latency is not an
issue, adds “just a few more stages” to the synchronizer
(Figure 17). While this is not an error, it is interesting to
learn what additional level of safety is thus obtained.
Considering an SOC with two clock domains where the
receiver operates at 200 MHz (a reasonable frequency for
the 0.18μm technology), and where data is exchanged
every ten clock cycles (as a worst case), and assuming
TW=50ps, τ=10ps (all ‘conservative’ numbers), the normal
two-flop MTBF is 500 5 204 e 2×10 = 10 years. This is rather
safe, when we recall that the age of the universe is 1010
years. The added cycle time provides an extra safety
factor of 500 e , achieving a more comforting level of 10420
years. Imagine how much better MTBF could have been if
you used four flops, rather than three!
SENDER RECEIVER
R
A
Figure 17: Conservative synchronizer
4. Conclusions
A few examples of synchronization design errors have
been presented and analyzed. As long as there are no foolproof
algorithms and tools to validate synchronizers, the
rules to safe design should be closely watched. A strict
design methodology and discipline should be enforced,
especially prohibiting arbitrary “improvements” of
synchronizers and shortcuts in their design and
implementation. Optimizations that may impede future
design reuse should be avoided. Knowledgeable rigorous
validation should be carried out to verify that all crossings
of clock domains are understood and legitimate. Global
signals that span multiple domains, such as reset and
clocks, should be examined carefully. Such validation
should be repeated after every design change and before
final design closure.
Present efforts to design synchronizer cell libraries and
to develop rigorous tools for synchronization validation
may help alleviate these issues and assure safe GALS
SOCs.
Synchronization issues may be more difficult to
examine and validate with third-party IP cores, and
especially “hard” cores whose internal logic design is
unknown to the SOC designer. The architect should insist
on at least a complete specification of their synchronizing
circuits.
A certain type of synchronizers has not been dealt with
in this paper, namely fast synchronizers for multi-sync
[20] or mesochronous [4, 5] clock domains. Their design
and validation are more complex and deserve another
paper.
Acknowledgement
The author is grateful to the many imaginative
designers whose innovations ended up in this paper. Their
names are kept in confidence. The anonymous referees
added some interesting examples to this catalog and
helped weed out some of the bugs; the author alone should
be blamed for any remaining mistakes.
Proceedings of the Ninth International Symposium on Asynchronous Circuits and Systems (ASYNC’03)
1522-8681/03 $17.00 © 2003 IEEE
Authorized licensed use limited to: XILINX. Downloaded on March 11,2025 at 03:21:49 UTC from IEEE Xplore. Restrictions apply.
8
References
[1] J. Jex and C. Dike, "A fast resolving BiNMOS synchronizer for parallel processor interconnect," IEEE Journal of Solid-State Circuits, vol. 30, pp.  133-139, 1995.
[2] C. Dike and E. Burton, "Miller and Noise Effects in a Synchronizing Flip-Flop," IEEE Journal of Solid-State Circuits, vol. 34, pp. 849-855, 1999.
[3] D. J. Kinniment, A. Bystrov, and A. Yakovlev, "Synchronization Circuit Performance," IEEE Journal of Solid-State Circuits, vol. 37, pp. 202-- 209, 2002.
[4] W. J. Dally and J. W. Poulton, Digital System Engineering(Eds.): Cambridge University Press, 1998.
[5] T. H.-Y. Meng, Synchronization Design for Digital Systems(Eds.): Kluwer Academic Publishers, 1991.
[6] D. J. Kinniment and J. V. Woods, "Synchronization and Arbitration Circuits in Digital Systems," Proceedings of the IEE, vol.  123, pp. 961--966, 1976.
[7] T. J. Chaney and C. E. Molnar, "Anomalous Behavior of Synchronizer and Arbiter Circuits," IEEE Transactions on Computers, vol. C-22, pp.  421--422, 1973.
[8] M. Pechoucek, "Anomalous Response Times of Input Synchronizers," IEEE Transactions on Computers, vol. 25, pp. 133--139, 1976.
[9] W. Fleischhammer and O. Dortok, "The anomalous behavior of flip-flops in synchronizer circuits," IEEE Transactions on Computers, vol.  28, pp. 273--276, 1979.
[10] H. J. M. Veendrick, "The Behavior of Flip-Flops Used as Synchronizers and Prediction of Their Failure Rate," IEEE Journal of Solid-State Circuits, vol. 15, pp. 169--176, 1980.
[11] L. Kleeman and A. Cantoni, "Can redundancy and masking improve the performance of synchronizers," IEEE Transactions on Computers, vol. 35, pp. 643--646, 1986.
[12] Y. Semiat and R. Ginosar, "Timing Measurements of Synchronization Circuits," under http://www.ee.technion.ac.il/~ran --> publications.
[13] P. Day and J. V. Woods, "Investigation into Micropipeline Latch Design Styles," IEEE Transactions on VLSI Systems, vol. 3, pp. 264-- 272, 1995.
[14] A. Peeters and K. v. Berkel, "Single-Rail Handshake Circuits," in Asynchronous Design Methodologies: IEEE Computer Society Press, 1995, pp. 53--62.
[15] "Clock Domain Checker User Manual," Avant!  Corporation v2001.3, 2001.
[16] atHDL, "Multiple Clock Domain Analysis," www.athdl.com.
[17] A. V. Yakovlev, "On Limitations and Extensions of STG model for Designing Asynchronous Control Circuits," in Proc. International Conf.  Computer Design (ICCD): IEEE Computer Society Press, 1992, pp. 396--400.
[18] Principles of Asynchronous Circuit Design: A Systems Perspective, S. Furber (Eds.): Kluwer Academic Publishers, 2001.
[19] C. Dike, "Sychronization Tutorial," presented at Sixth International Symposium on Advanced Research in Asynchronous Circuits and Systems (ASYNC2000), 2000.
[20] R. Ginosar and R. Kol, "Adaptive Synchronization," in Proc. International Conf.  Computer Design (ICCD), 1998, pp. 188--189.  

\\\\\\\\\\\\\\\\\\\\\\\\\\\






Gate Level Timing Checks for CDC Syncs & Markers -- Main.SambasivanNarayan - 15 Feb 2013
Motivation
Checks Supported
CDCMAX Timing through CDCBUF/CDCBUFEN cells
Example
Margining
SYNC Timing for synchronizers
Example
Waivable paths
CDCMAX Implementation Details

Motivation
During RTL creation, the IP owners mark the paths that span different clock domains with special marker cells (CDCBUF* family of cells, synchronizers) These cells have an associated behavorial model view that injects periods of uncertainty (X or 0/1 randomization) into the functional simulation. This period of uncertainty is manually specified by the IP owner or defaults to large values within the behavioral models.
In the PD netlist, the purpose of the checks is to ensure that signals are stable within the same time period that X randomization was performed during functional simulation. Since the paths are across different clock domains, the paths cannot be directly timed using primetime constraints (set_max_delay or set_multicycle) Further, these paths are usually false pathed either directly or using set_clock_groups relationships.

The purpose of the checks described here is to perform these timing checks as special timing checks inside the standard timing environment and ensure that physical design meets the same conditions that were used during functional simulation of these paths in the verification stage.

Checks Supported

CDCMAX Timing through CDCBUF/CDCBUFEN cells
This check ensures that the timing for a path through these cells matches either the absolute delay value (CdcDestSetup) or the destination clock periods (DestClkCnt) specified in the RTL.
Example
 In the above circuit, the data input to the capturing flop, NDATA_B should be stable when capturing clock rises. Since it is blocked by the READY_B signal from sync, it should be stable at ffb/D before the READY_B signal arrives at ffb/D. Since sync is a 3 stage synchronizer, NDATA_B should be stable within 2 capture clock (CLKB) cycles. The timing check is for the path from ffa/CLK to ffb/D to be less than 2 (number of cycles for control - 1) cycles of CLKB (or whatever value was used in the RTL model) If a value is not specified in RTL, the flow picks the most conservative value possible of 1 destination cycle.
NOTE: The check does not yet account for any potential clock skew between sync and the launching data flop ffad on the source domain CLKA. Similarly, it does not account for the setup time on the capturing flop ffbd. These should be suitably margined.

Margining
The check does not account for two additional factors that impact the proper functioning of the path:
The skew between the flops launching the data and the control on the source domain (CLKA)
The setup time on the capturing flop on the destination domain
Hence, the path delay must be additionally margined as follows:
margin > (clock insertion of data flop in source domain) - (clock insertion of control flop in source domain) + (setup time of capture flop in destination domain)

SYNC Timing for synchronizers
This check ensures that the timing into the input of the synchronizer meets the value specified in RTL (TransportDelay).

Example
 In the above circuit, there is a common signal IN that is getting synchronized into two different synchronizers, sync1 and sync2. The difference in arrival times between the two synchronizers would create a mismatch in the output of the two synchronizers when they reconverge in ian0 (Note because synchronizers have an intrinsic 1 cycle of uncertainty in their outputs, the two outputs can be mismatched for atleast one cycle. The differences between the clock insertion delays could further increase the period of mismatch)
In RTL simulations, circuits like this can be modeled with different TransportDelay values on the two synchronizers to ensure that the overall system can tolerate the additional periods of uncertainty.

NOTE: This example is not a good design practice (in fact a simple circuit like this would cause violation when the 0in tool is run) But this topology can easy occur in real designs. For example, the two synchronizers could in multiple tiles and on multiple clock domains. As long as the output of the synchronizer reconverges at any point there is a potential circuit risk. A real example would be reset signals that get synchronized into multiple domains/tiles and the mismatch in their arrival times could cause some parts of the system to arrive out of reset earlier than others.

Waivable paths
There a few use cases that can be automatically waived for this check.
If the signal that is synchronized has exactly one capturing synchronizer and no other flop or synchronizer endpoints, then the transport delay is irrelevant.
If the signal is being synchronized into multiple synchronizers all on the same clock domain, then the relevant timing value is the overall skew between the arrival times (transport delay) across all the synchronizers. If this is less than one destination cycle - setup time of the synchronizers , then the circuit can function safely (Note such a circuit should properly trigger a 0in violation)


CDCMAX Implementation Details
Because the paths of interest are CDC paths, they are not timed (or cannot be timed) directly in primetime. Instead this check has been performed indirectly using the following approaches:
Using a timing session containing no false paths - The CDC paths get timed by primetime but the actual check is performed by ignoring the clock insertion delays on the source and destination points. The primetime -start_end_pair can be used to exhaustively generate all the paths through the CDC cells.
foreach cdcpin in cdcpins
   foreach path in [get_timing_path -through $cdcpin -start_end_pair -slack_lesser_than BIGNUMBER]
      path_delay = [arrival time at last path point] - [arrival time at first path point]
   endfor
endfor

Using a regular primetime run, setting the variable timing_report_unconstrained_paths to true will allow us to generate paths through the CDC cells and the path can be queried to get the path delay. Briefly, the algorithm is:
foreach cdcpin in cdcpins
   foreach path in [get_timing_path -through $cdcpin -nworst BIGNUMBER -max_path BIGNUMBER]
      path_delay = [arrival time at last path point] - [arrival time at first path point]
   endfor
endfor
The -start_end_pair flag approach requires the creation of a custom primetime run and dropping false paths and generating this timing session is a non-trivial task with much higher runtime impact than a traditionl functional timing run. Further this flag also truncates the number of paths generated to 200000 and does not always guarantee that the worst set of paths get generated. Besides all this, the runtime impact of using this flag is non-trivial.

The -timing_report_unconstrained_paths approach has a much lower data requirement and can be run as a special report as part of the regular timing flow. This is how it was deployed for the 2011/2012 SOCs. It too suffers from some additional memory/runtime overheads.

In any approaches, it is impractical to iterate for every pin, so we iterate over sets of pins. When a single pin has a very large fanin/fanout count, there is no proper way to ensure that the worst set of paths get generated by the get_timing_path command. This is because get_timing_path is oriented towards efficiently generating and sorting paths based on the slacks and both approaches require circumventing this. Note that the slack calculated by primetime is invariably wrong because the clock edge separation it estimates for two asynchronous clocks is never correct. Further, the error is compounded by adjusting the slack for the clock insertion at the source and destination points.

The new implementation is as follows:

create virtual clock 'VCLK'
set 'VCLK' to be 'physically exclusive' to all other clocks
foreach cdcpin in cdcpins
   set_input_delay -clock VCLK 0 [all fanin points of cdcpin]
   set_output_delay -clock VCLK 0 [all fanout points of cdcpin]
   set_max_delay -from VCLK -through $cdcpin -to VCLK <VALUE FROM RTL>
endfor

update_timing

foreach fanout in [all fanouts of all cdcpins]
   foreach path in [get_timing_path -from VCLK -though cdcpins -to fanout -nworst BIGNUMBER -max_paths BIGNUMBER -slack_lesser_than 0]
      path_delay = [arrival time of path]
   endofr
endfor
The reason this works is:

The primary source of false paths on these paths is a clock to clock false path. Since both the fanin and fanout are on the virtual clock, the slack on the 'VCLK' path groups is calculated correctly.
By setting the input/output delays on the fanin/fanout points, there is no additional clock insertion delays that gets adjusted in the slack calculation.
Most of the paths are constrained to the RTL value for the slack calculation in the 'VCLK' domain (paths with back to back cells would still need adjustment since max delays are not additive)
Note the first foreach iteration can be performed before the first functional timing run completes and the update_timing call can piggy-back with the one in functional timing. This approach would neverthless trigger a update_logic) in the first step because of the calls to the fanin and fanout commands (nevertheless this update_logic gets reused when the update_timing executes)

This can also be run after the functional timing completes (aka standalone mode) where the first foreach loop will not trigger any update_logic in PT, but would have to incur the additional overhead of an unique update_timing. Further, for large designs, the creation of the virtual clock confuses the incremental nature of update_timing and a full update_timing is required (using v2011.06 of Primetime)

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
>GateCdcTimingChecks (2023-08-04, DavidNewmark) EditAttach
Gate Level Timing Checks for CDC Syncs & Markers

Purpose
Presentations
Implementation Details
Tilebuilder Parameters
Flow Specific guidelines
Tile Based flows
Simulation Log File (EDC_CDC_VCSLOG)
LEC Mapping File (EDC_CDC_LECMAP)
Enabling the check
Results
Report Format
File Versions
Handling Fails
Writing Waivers
Additional Notes
Calculation of required value
Using Tunable Values
Using LEC/SIMLOG mapping
Using Module names
Using Default Values
Multibit Synchronizer Checking
Setting up multibit groups
Parameters
Notes
Param back annotation from GateCDC to DV

Purpose
CDC cells (marker cells in the CDCBUF/CDCBUFEN family) and synchronizers (SYNC cells) require that the input paths meet certain timing values that are verified during functional simulation. In general, during functional simulation, the signal that crosses clock domains has a certain period of uncertainity (X or 0/1 randomization) and the circuit is supposed to not capture this uncertain value. The purpose of the timing check in gates is to ensure that the path delay does not exceed this period of uncertainity that was used during functional simulation.
Typically the CDC paths are false-pathed during regular STA timing in the gate netlist. Hence, a special flow is used to first extract the required path delays from RTL (via vcs simulation logfile or other mechanisms), then map the RTL and gate instances and finally create a custom timing report for these paths. This special flow is part of the GenericPtTiming that is used in all the supra personalities and can be run by setting some parameters during a timing run. It can also be run standalone by providing a ptsession as an input.

The following checks are performed in this flow:

Check that the input pin of all synchronizers (that are driven from a different clock domain) have a path delay from the driving flop or port less than number of cycles specified in TransportCycle parameter. If the TransportDelay parameter is specified for a synchronizer, then it is used. If both TransportCycle & TransportDelay parameters are specified as zero, then path delay will be checked against 0 value, which results in violation.
Check that the path through a CDCBUF or CDCBUFEN marker cell meets the timing value specified in RTL (either an absolute time specified as the CdcDestSetup parameter or relative to destination clock as the DestClkCnt parameter)
NEW Check that the skew between the inputs of a multibit synchronizer does not exceed a certain threshold leading to bit inversion.

Presentations
CDC max delay paper presented at BSNUG 2013
CDC max delay slides presented at BSNUG 2013
Latest cdc flow update and user tips at 2015_07_20

Implementation Details
CAD flow implementation details

Tilebuilder Parameters
Parameter Name	                      Type        Description
EDC_CDC_ENABLE_TIMING               Optional	Non-zero value enables the generation of CDC timing reports during a regular non-si timing run
EDC_CDC_ENABLE_TIMING_SI	        Optional	Non-zero value enables the generation of CDC timing reports during a si timing run
EDC_CDC_SKIP_CDC_TIMING	            Optional	Zero value enables the generation of CDC reports in GateCDC Run
EDC_CDC_SKIP_SYNC_TIMING	        Optional	Zero value enables the generation of SYNC reports in GateCDC Run
EDC_CDC_CONSIDER_CLOCK_GROUPS	    Optional	Non-zero value enables Skipping of exclusive clock paths & generates seperate report for sync-paths
EDC_CDC_VCSLOG	                    Optional	Filename that points to a VCS (RTL functional simulation) log file generated with the +logCdcBufTiming run flag
EDC_CDC_PTSESSION	                Optional	Primetime saved session directory
EDC_CDC_USE_STARTENDFLAG	        Optional	Primetime saved session where the false paths are disabled so that -start_end_pair can be used with the get_timing_path command
EDC_CDC_LECMAP	                    Optional	Mapping file generated using the formal equivalence flow between gate and RTL instances
EDC_CDC_ENABLE_ILM_MODEL	        Optional	Non-zero enables the creation and use of ILM model files to obtain the constraints for CDCBUF*/SYNC* in the boundary of ILMs. This should be enabled at the tile level as well as the SOC level.
EDC_CDC_FULLPATH_REPORT	            Optional	Enable to generate an additional report that dumps the full path for all failing paths
EDC_CDC_MULTIBIT_FULLPATH_REPORT	Optional	Enable to generate an additional report(report.multibit_sync.path.rpt.gz) that dumps the full path for all sync-cells, which are defined in group
EDC_CDC_INCLUDE_PASSPATH	        Optional	Generates a report including the passing paths (by default these are not reported)
EDC_CDC_FULLPATH_REPORT_OPTIONS	    Optional	UBTS552159, allow user options in report_timing
EDC_CDC_MULTIBIT_FULLPATH_REPORT_OPTIONS	Optional	Allow user options in report_timing for additional report(report.multibit_sync.path.rpt.gz)
EDC_CDC_VALID_CELLS	                Optional	Valid TCL command (ex. [get_cells] or [list]) that can be executed in primetime to get the list of cells for which the check is performed
EDC_CDC_USE_START_END	            Optional	Use -start_end_pairs option when thie param is set to 1. Normally we would recommend -cover_design (EDC_CDC_USE_START_END set to 0, this is the default value), -start_end_pairs will increase runtime. But signoff should be done with -start_end_pairs option
EDC_CDC_REPORT_ALL_PATHS_HFOUTCDC	Optional	Normally for regular runs, we would recommend to set this param to zero, as enabling this param will increase runtime. When we set this param to zero, only few paths(100) will be reported for high-fanout CDCBUF's. But signoff should be done by keeping this param to 1
EDC_CDC_CONSIDER_ADD_MULTI_CDC	    Optional	When this param is set to 1, flow will take the subtotal of all the delays of CDC-BUF's in the required timing-path
EDC_CDC_CONSIDER_ADD_CDC_SYNC	    Optional	was set to 1 in your override.params, then flow will take the total of the delays of CDC-BUF cells & SYNC - cell in the timing-paths
If EDC_CDC_CONSIDER_ADD_MULTI_CDC was set to 1 in your override.params, then flow will take the subtotal of all the delays of CDC-BUF's in the required timing-path. This param will add max_delays from a CDCBUF only (Not MCBUF). By Default, flow will take min of all the delays of CDC-BUF's in the required timing-path If one CDCBUF is using DestClkCnt and another CDCBUF is using CdcDestSetup, then flow will have below behaviour with EDC_CDC_CONSIDER_ADD_MULTI_CDC = 1

set total_cycles = DestClkCnt1 + DestClkCnt2 + ... + DestClkCntn for all the CDCBuf's defined DestClkCnt
set total_max-delays = CdcDestSetup1 + CdcDestSetup2 + ... + CdcDestSetupn for all the CDCBuf's defined CdcDestSetup

Final constrained max-delay = min ( $total_cycles*Dst_Clk_Cycle, total_max-delays)

If EDC_CDC_CONSIDER_ADD_CDC_SYNC was set to 1 in your override.params, then flow will take the total of the delays of CDC-BUF cells & SYNC - cell in the timing-paths. In General Gate-CDC treats synchronizer and CDCBuf timing checks as two separate checks. But there was a request to combine both delays, so that CDCBuf's in series with synchronizers have their Transport-Cycles & Max-delays added together and accounted for properly. Verification SIMs already do this addition causing a huge burden on the PD team to waive all of the synchronizer timing fails which happen to be driven by cdcbufs.


These parameters should be considered experimental at this point. More...

EDC_CDC_MAX_FANOUT_LIMIT	Optional	The spec to filter out the high fanout cdcs (UBTS624499)
EDC_CDC_PATH_NUMBER_FOR_HFOUT_CDC_BUF	Optional	The number of paths to be reported for the high fanout cdc buffers (UBTS624499)

The family.params is setup correctly with the other parameters necessary to run the flow and these are documented below: More...

Parameter Name	Description
EDC_CDC_CDCBUF_PATTERN	Regular expression pattern for the gate cell library marker cells. Value: hdcdc.* cdc.*
EDC_CDC_SYNC_PATTERN	Regular expression pattern for the gate cell library synchronizers. Value: hdsyn.* syn.*
EDC_CDC_CDCBUF_INPIN	Library pinname for the input pin of the CDCBUF/CDCBUFEN cells. Value: A
EDC_CDC_SYNC_INPIN	Library pinname for the input pin of the SYNC cells. Value: D

Flow Specific guidelines
Tile Based flows
For tile based flows (Tiles built using FEINT for synthesis and PLACENROUTE for placement and routing) The following parameter should be enabled in the parameter file for the tiles and SOC:
## override.params
EDC_CDC_ENABLE_TIMING = 1
EDC_CDC_ENABLE_ILM_MODEL = 1
# EDC_CDC_ENABLE_TIMING_SI = 1  # optional to enable the check for PTSI runs, not required
The first parameter enables the actual timing of cdc/sync paths during the regular timing run (PtTim targets) The second parameter enables the generation of an additional file during the ILM generation step (PtIlm targets) for tiles and the automatic usage of the ILM files for the tiles when available.

For the SOC, it is strongly recommended for runtime reasons to do the check using ILM model for the tiles.

Note: Without the tiles generating the additional file during their ILM generation step, the SOC timing using ILM models for tiles will be incorrect.


Simulation Log File (EDC_CDC_VCSLOG)
NOTE: This flow is needed only for legacy IPs that are not using the standard CDCBUF and SYNC cells in RTL. This log file should be generated by the team running functional simulation using the RTL for the design. The following requirements should be provided to that team:
Pass the +logCdcBufTiming switch in the command line.
Ensure that DEFINE_CDC_OVERRIDES is set.
Ensure that TECH__CDCBUF__DISABLE_BEHAVORIAL_VERILOG is not set.
The behavioral models for the CDCBUF*/SYNC* contain $display messages that get printed out to the logfile of the simulation. These are then parsed by the CDCMAX timing flow and used to associate the appropriate delay value for each instance in the gate netlist.


info: CDCBUFCLK pciew_top_pgd.upcie_pgd.ubif_core_wrapper_pgd.ubif_core_nbgfx.utx.utx_buf.uhdr_ctl.ucpl1_tag_buf.rdmx[30].mxsel.ucdcBufen_i.uefpm.DestClkCnt        =           2 : 0.0 ps

LEC Mapping File (EDC_CDC_LECMAP)
NOTE: This flow is needed only for legacy IPs that are not using the standard CDCBUF and SYNC cells in RTL. This file is specifically generated in the LEC step used by these flows. It provides a mapping between RTL and gate instances that can be used to map the parameter associated with the RTL instance (from the simulation log file) to the gate instance. The flow details for generating the CDCBUF LEC mapping file are documented here.

  POS_EQ    CDCBUF UNB_TOP/PA/PAFBX/CK_Cpu0CofBelowOrEqu4xRefClk_CDCBUF/Z cdcbfxss2ur UNBTOP/FUSEBOX_RLM/FUSEBOX/PAFBX__CK_Cpu0CofBelowOrEqu4xRefClk_CDCBUF/cb1/Z
  POS_EQ    CDCBUF UNB_TOP/PA/PAFBX/CK_Cpu1CofBelowOrEqu4xRefClk_CDCBUF/Z cdcbfxss2ur UNBTOP/FUSEBOX_RLM/FUSEBOX/PAFBX__CK_Cpu1CofBelowOrEqu4xRefClk_CDCBUF/cb1/Z

Enabling the check
The check can be enabled in multiple ways for the RLM based flows. If the parameter EDC_CDC_ENABLE_TIMING is enabled during a regular timing run (run_timing command) then the check will automatically execute. Otherwise, a standalone target can be run that will time the cdc/sync paths by using a primetime saved session.

## override.params
PERSONALITY = cdc_analysis 
## only one of EDC_CDC_PTSESSION or EDC_CDC_USE_STARTENDFLAG can be used for this purpose
EDC_CDC_PTSESSION = /proj/foo/ptsession
# EDC_CDC_USE_STARTENDFLAGS = /proj/foo/ptsession.nofp
EDC_CDC_LECMAP = /proj/foo/lecmap
EDC_CDC_VCSLOG = /proj/foo/sim.log


## override.controls
<:
run_edc( { runtype=>'cdcmax'});
:>

Results
The results are generated under a CdcTiming subdirectory in the rpts directory of your timing run or under the rpts/CdcMaxDefault target.
rpts/PtTimFuncSS0p72vtyprc0css0p72v0cReRouteSxStp/CdcTiming
rpts/CdcMaxDefault/
The following files are generated:

report.cdc.summary.rpt.gz -- The summary report of the cdc timing
report.sync.summary.rpt.gz -- The summary report of the sync cell timing
report.sync.csv.gz -- SYNC cell paths that fails to meet one cycle (or transport delay specified in RTL) to the input D pin.
report.cdc.csv.gz -- Paths that fails to meet the destination clock count or destination time value as determined above, through a CDCBUF* marker cell.
report.sync.waivers.csv.gz -- Waived SYNC cell paths.
report.cdc.waivers.csv.gz -- Waived CDC Paths.
report.sync.path.rpt.gz -- The detail path report for the failed sync path.
report.cdc.path.rpt.gz -- The detail path report for the failed sync path.
sync.maxdelay_setting.rpt.gz -- File containing parameter value used for each SYNC* cell.
cdc.maxdelay_setting.rpt.gz -- File containing parameter values used for each CDC* cell.
report.multibit.csv.gz -- The raw data for multibit check.
report.path.rpt.gz -- The detail report for the failed multibit groups.
report.cdc.warning.rpt.gz -- The warning message generated during cdc timing
report.sync.warning.rpt.gz -- The warning message generated during sync cell timing

The flow also generates several informational and warning messages. A clean RTL (0in clean) should not have any warnings. These messages are captured in the following files (or the CdcMaxDefault? .log file in standalone mode)

Sync_timing.log.gz -- Messages generated while checking SYNC cell paths.
Sync_timing.si.log.gz -- Same as above but generated during the timing using si run.
Cdc_timing.log.gz -- Messages generated while checking CDCBUF cell paths.
Cdc_timing.si.log.gz -- Same as above but generated during the timing using si run.

Report Format
Sync path to dci/udciclkgen/uCGTT_VGA/uCGTT_LOCAL/usync_override/sync_r/D:
  Startpoint: TEST_CLK_EN
    port clocked by: VCLK
  Endpoint: dci/udciclkgen/uCGTT_VGA/uCGTT_LOCAL/usync_override/sync_r/D
    pin clocked by: SCLK
  Slack:  -0.464
  Delay: 1.98 Reqd Max Delay: 0, Reqd Dest Cycles: 1 (Period:1.51, Value: 1.51)

CDC path through uvdm/uvdm_core/ecpu/vcpu/u_pmb/u_axi2axi_async/vcpu_axi_req_fifo/cdc_buf_en_3/cdcbufferEN/uefpm_34_/d0nt_CDCEFPM/A:
  Startpoint: uvdm/uvdm_core/ecpu/vcpu/u_pmb/u_axi2axi_async/vcpu_axi_req_fifo/CDCSE_fifo_memory_q_re
g_3__34_/CLK
    pin clocked by: VCLK, PCIE_REFCLK 
  Endpoint: uvdm/dbg_client_wrapper_1_mixed/dbg_client/Dbg_LocalData_Seg2Bit6_Flop_0_/Q_reg_0_/D
    pin clocked by: SCLK
  Slack: -0.279
  Delay: 0.379 Reqd Max Delay: 0, Reqd Dest Cycles: 2 (Period: 0.658, Value: 1.32)
The report is sorted in the increasing order of negative slack (worst path first). In the first example, the timing tried to meet 1 destination clock cycle to the input of a synchronizer (Sync path to) from a port (TEST_CLK_EN) to a synchronizer input clocked by SCLK.

All time values are printed in the same units as your primetime run.


File Versions
All necessary files are in the Tilebuilder perforce. Please use the last good label depending upon the personality you are using. For analysis personality, it is =TileBuilder1.0supraanalysisLastGood =.

Handling Fails
If there are fails in the report then the first course of action would be talk to the RTL owner(s) for the block(s) containing the path. It is possible for example that the synchronizer input path can safely have more than 1 destination cycle or the RTL owner overconstrained the CDCBUF* path by specifying an over-conservative DestClkCnt parameter. In general, if the CDCBUF* path fails and has a required value of 1 destination cycle, then it should first be checked with the RTL owner.
If a synchronizer input path fails, then the RTL owner should guide the PD team as to the significance. Pure asynchronous signals or signals that are part of a multibit bus are not sensitive to the transport delay (in the latter case, a separate timing check should be run to ensure that the skew between each of the bits does not exceed specific margins)


Writing Waivers
The flow supports writing waivers for the timing. The waivers are TCL commands (that is executed inside primetime) and take Primetime clock or pin or port objects are parameters. The waivers should be in a tunable file tune/EdcCdc/CdcTiming.waiver.tcl. The syntax for the waiver is as follows:
cdc::waive_cdc_timing -type [cdc | sync ] -from  -to 
Usage:
cdc::waive_cdc_timing # Waive timing for CDC/Sync paths by start/end clocks or start/end pins
   -type                  (whether it is a transport delay for Synchronizer (sync) or multicycle for cdcbuf (cdc): 
                           Values: sync, cdc)
   [-from from]           (Start pin/port for paths to waive)
   [-to to]               (End pin/port for paths to waive)
   [-through ]            (Through pin/port)
Examples:
cdc::waive_cdc_timing -type sync -from [get_port TEST_PORT] -to [get_pin core/bx_t/abc_d/e_f_sync/sync_r/D]
The above will waive the synchronizer input pin timing from the port TEST_PORT to the input pin.
cdc::waive_cdc_timing -type cdc -from [get_port FOO]
The above will waive all the paths paths that originate from the port FOO.
The tunable can also contain overrides to the timing value associates with each instance. The syntax for this command is as follows:

cdc::force_cdc_timing -type [ cdc | sync ] -timing [ max | multi ]  
Usage:
 cdc::force_cdc_timing # Force timing for a particular instance(s) to be the given value
   -type                  (whether to force for cdc or for sync: 
                           Values: sync, cdc)
   -timing                (whether the timing must be max or multicycle: 
                           Values: max, multi)
   [-comment comment]     (comment for this case)
   [-from startpoint]     (limit the force command to some paths that starts from startpoint)
   [-to endpoint]         (limit the force command to some paths that ends to endpoint)
   [-replace]             (Replace the multicycle params with this max value)
   instances              (primetime collection of cells that this applies to)
   value                  (value to use)

Examples:

cdc::force_cdc_timing -type cdc -timing max [get_cell FOO/BAR/DEBUG/CDCBUF*] 100
Set the timing through all CDCBUF* instances matching the name FOO/BAR/DEBUG/CDCBUF* to 100 time units.
cdc::force_cdc_timing -type cdc -timing max -from [get_pins sp] -to [get_pins ep] {}100
Set the paths start from sp, end to ep to 100 time units.
cdc::force_cdc_timing -type cdc -timing max -replace [get_cell FOO/BAR/DEBUG/CDCBUF*] 100
Override timing requirements to a fixed 100 for all paths through FOO/BAR/DEBUG/CDCBUF*. -replace is useful when the original timing requirement annotated on the cell name is multicycle, and it need to be overriden by a max value, as multicycle has a higher precedence, it cannot be overriden by a max value normally.
cdc::force_cdc_timing -type sync -timing multi -from [get_pins Tdr_reg_*_/CK] -to [get_pins fch/nbio_iohc_t/*hdsync3msfqxss1us_d0nt*/D]  {} 5 
When -from & -to are specified for force_cdc_timing, then instance field should be empty {} .

If you need to debug your waivers for correct syntax, load the script file in pt_shell and source the tcl commands for the waiver:

pt_shell> source CdcTiming.waiver.tcl

Additional Notes
The flow will skip paths that are already timed synchronously in primetime. Hence the input paths to syncdc cells are ignored.
The flow ignores paths where the launch and capture points are on the same clock. Since only the combinatorial path delay is used during the timing, the report file will list all input clocks that launch to a particular destination clock (since the destination clock period can be different for different clocks, each destination clock on the capture pont is reported separately)
The delay is calculated by ignoring clock insertion on the launch and capture flops. In general this is correct when dealing with clock domain crossing paths, but there maybe special cases where this is not correct. These special case paths should be timed manually.


Calculation of required value
The flow tries multiple ways to determine the required timing value for each SYNC/CDCBUF instance. These are tried in the following (priority) order:
Using Tunable Values
If the tunable contains cdc::force_cdc_timing values for specific instances, then it would be used first.
Using LEC/SIMLOG mapping
NOTE: This applies only to legacy IPs that are not using standard CDCBUF/SYNC cells in RTL. If the LEC/Simulation logfile is provided and the instances can be mapped between the two, then the values extracted from the simulation log file is used.
Using Module names
If the above steps fail, then the flow will try to extract the name based on how synthesis instantiates parameterized RTL modules. Typically synthesis (Design compiler) will expand out the parameters and append them to the module name of the marker cell. Hence the flow will determine based on the module name if it has the right syntax:
>set cell [get_cell sam/sam_core/am32/cache/rfifo/ret_tag_fifo/cdc_buf_en_5/cdcbufferEN/uefpm_2_]
>get_attribute [get_cell sam/sam_core/am32/cache/rfifo/ret_tag_fifo/cdc_buf_en_5/cdcbufferEN] ref_name
samu_t_techind_cdcefpm_size3_applyParams1_CdcDestSetup0_DestClkCnt2_AssertEnable1_5
In the above example, the RTL instance had a destination clock count (DestClkCnt? ) of 2.
Using Default Values
If all the above steps fail, then a default value of 1 destination clock cycle is used for the synchronizer input pin as well as the CDCBUF* paths.

Multibit Synchronizer Checking
This check ensures that the input into a multibit synchronizer does not undergo bit inversion due to the skew between the paths of the individual bits. The purpose is to ensure that the order in which the bits toggle on the launch flops on the source domain is the same order in which they reach the synchronizers on the capture domain.
The equation used is:

skew = max(path_delay + src clk insertion- dst clk insertion) - min(path_delay + src clk insertion - dst clk insertion)
The terms in the equation are as follows:
path_delay: The (wire) delay from the source flop launching a bit to the synchronizer input. When using sync4cdc/sync3cdc which have a builtin source flop, this becomes zero.
src clk insertion: The clock insertion delay on the source flop launching the bit
dst clk insertion: The clock insertion delay on the destination synchronizer capturing the bit
This skew must meet certain margin requirements. The terms that should be accounted for in the margin (not all inclusive):

The setup time of the synchronizer
OCV effects on each path
Clock jitter on the source/destination clocks
In the flow, the margin is specified as a percentage of the source clock rate.

For grey-coded synchronizers, the hard limit for skew is 1 source clock of skew between the various bits of the grey-code. Any more than this and the grey-code characteristic of the original source ends up being corrupted by the skew. Certain predictive FIFOs might hold to a tighter skew than this since this skew contributes to margin which translates to extra latency, but since low latency is a key metric for a predictive FIFO, a tighter skew is beneficial.

To guarantee these targets are met, the default skew target is 50% of the faster of the source and capture clocks. To relax this target, several different timing corners should be run to help prove that the hard skew limit is not violated.


Setting up multibit groups
In multibit run, please set EDC_CDC_MULTIBIT_SKEWCHECK_ONLY param to one and specify multibit groups in tune/EdcCdc/Sync.multibit.tcl file. Setting this param, will skip timing waivers and will do Multibit skew calculation EDC_CDC_MULTIBIT_SKEWCHECK_ONLY = 1
The main input necessary to perform this check involves grouping the synchronizers of a multibit bus correctly. This is done in a tunable file called tune/EdcCdc/Sync.multibit.tcl using a TCL command

Usage:

 cdc::set_multibit_sync_groups # Setup synchronizers to be part of multibit groups for doing timing
   instances              (primetime collection of cells that are treated as part of same multibit bus)
   -from from_pin         (optional, pin collection that multibit paths must start from)
   -through through_pins  (optional, pin collection that multibit paths must go theough)
   -exclude               (optional, pins that multibit paths should go around)
   -name                  (optional, valid only if -from and/or -through option is used)
   -launchclk            (Calculate skew threshold with LaunchClk period)
   -captureclk           (Calculate skew threshold with CaptureClk period)
If launchclk or captureclk is not specified for set_multibit_sync_groups, then flow will calculate skew w.r.t high frequency clock among launch & capture clocks

Example:

# Simple usage:
cdc::set_multibit_sync_groups [get_cells {sync1 sync2 sync3}]

#Skew Calculation has to be done w.r.t Launch_clk period
cdc::set_multibit_sync_groups -launchclk [get_cells {sync1 sync2 sync3}]

# All multibit paths must start from, and go through pins with certain pins:
cdc::set_multibit_sync_groups -from [get_pins {startpoints_list}] -through [get_pins {through_pins_list}] [get_cells {sync1 sync2 sync3}]

# fine-grain control on multibit paths:
# mark sync1, sync2 and sync3 as 1 group, and specify timing paths seperately
cdc::set_multibit_sync_groups -name A -from [get_pins {startpoint1}] -through [get_pins {through_pins_1}] [get_cells {sync1}]
cdc::set_multibit_sync_groups -name A -from [get_pins {startpoint2}] -through [get_pins {through_pins_2}] [get_cells {sync2}]
cdc::set_multibit_sync_groups -name A -from [get_pins {startpoint3}] -through [get_pins {through_pins_3}] [get_cells {sync3}]

Parameters
The main parameter to setup for this check is the skew threshold. It is set to default to 50% of the input clock period.
## in override.params, set a percentage of the input clock period
EDC_CDC_MULTIBIT_SKEW_THRESHOLD = 50

Notes
The flow handles sync[345]cdc cells as well as regular sync cells.
If no groups are defined, then no report will be generated.

Param back annotation from GateCDC to DV
Please refer to GateCDCParamBackAnnotation

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

HemaSivaSatyanarayanaMedarametla) EditAttach
Gate level checking for CDC/FP (EGADS) issues

Gate level checking for CDC/FP (EGADS) issues
Introduction
Presentations
Implementation Details
Support/UBTS
Enabling the checks
feint/eco/placenroute/analysis Personalities
cdc_analysis Personality
FCNL constraint Personality
How to Start GateCDC Checks
Samedomain False Path Check (SDFP) & Nomarker Check
NoMarker Check with Synopsys TBC file
CDC Max Timing check
CDC Multibit Run
NonUnate Check
MTBF Check
Run everything (All Checks)
Common Parameters
Setting up clocks
Tunable: tune/EdcCdc/CdcSetup.tcl
Synchronizer MTBF Check, Runtype: cdcsyncrpt
Enabling the check
Supported Technologies
Tunables: tune/EdcCdc/SyncRpt.setup.tcl
Parameters
Results
CDC Constraint Checks, Runtype:cdcrace
Enabling CdcRace check
Enabling NoMarker check with Synopsys Solution
Tunables: tune/EdcCdc/WaiveRaceChk.tcl tune/EdcCdc/WaiveNoMarker.tcl
Samedomain check
Parameters
Results
Nonunate Check, Runtype:cdcnonunate
Enabling the check
Parameters
Results
Glitch sensitivity check in Nonunate check
Nonunate Check using Questa tool, Runtype:cdc_qnonunate
Enabling this Questa NonUnate check
CDCMAX Check, Runtype: cdcmax
Description for Merge Target Output files
MergeSamedomain target
MergeCheck target
MergeNonUnateCand target
MergeNonUnate target
Tile Run Enablement
Introduction
The following checks and analysis is required in order to get a complete CDC solution and meet the EGADS False path guidelines:
Synchronizer MTBF calculation
This is a functional check to ensure that the synchronizers used in your design are capable of operating without high failure rates for the designs target process, voltage and frequency.
CDC Timing
This is a timing check that ensures that the paths through special marker cells, namely CDCBUF/CDCBUFEN and paths to SYNCHRONIZERS meet certain timing requirements matching the values modeled in RTL simulations.
Timing exceptions on Synchronous Domains
This is a constraint check that flags any false paths between two clocks that are synchronous. Good design style and EGADs requirements require that all synchronous paths be properly timed and not false pathed.
No Marker Checks
This is a structural check that flags any timing exception path that does not have the corresponding markers.
Non Unate Reconvergence Check
This is a structural check that flags paths through CDCBUF/MCBUF (buffer equivalent markers cells) that have a non-unate reconvergence.



Presentations
Gate CDC overview slides presented at PD Tech Forum
Gate CDC overview video
Synchronizer MTBF analysis methodology slides

Synchronizer FIT spreadsheet example for gf7lp
Synchronizer depth recommendations for tsmcn7
Synchronizer FIT guidelines spreadsheet for tsmcn7
Synchronizer FIT spreadsheet example for tsmcn7
Synchronizer FIT guidelines spreadsheet for gf14lpp
Synchronizer FIT spreadsheet example for gf14lpp
Synchronizer FIT spreadsheet example for tsmc16ffp design
Synchronizer characterization methodology documents for gf14lpe
Synchronizer MTBF paper from International Symposium on Asynchronous Circuits and Systems, 2013

Implementation Details
CAD flown implementation details
Instructions for viewing training videos on the flow details:
Copy ATL: /proj/cad_gana_dev/user/maheshs/videos to your laptop.
You will find 4 sub-folders named GateCDCCodeReview_09_25_2013, GateCDCodeReview_09_27_2013 etc.
Simply open the file named ReplayMeeting.htm in these sub-folders using Internet Explorer. The training video will start playing in Windows Media Player embedded within the browser.

Support/UBTS
The flow is supported by Mahesh Sharma and Raghu Pattipati (as of October 1, 2013) Use the following UBTS category: TileBuilder::Supra(Select Component: Timing - Gate CDC)


Enabling the checks
The checks can be enabled to run in different personalities and families in Tilebuilder. The either take a primetime saved session as input or use the timing command file and use that to create a session to run the checks. For supra, the following personalities are supported:
eco
placenroute
analysis
cdc_analysis
In all personalities, the checks must be explicitly enabled by using the run_edc command in the override.controls. Each run_edc call should explicitly enable the check required by using the runtype argument. The supported runtype arguments are:
cdcsyncrpt - For synchronizer MTBF calculation
cdcmax - For CDC timing check
cdcrace - For same domain false paths, no marker checks
cdcnonunate - For nonunate reconvergence check
The override.controls should contain one or more of the following:

## override.controsl
## Run Sync Report and CDCMAX only for the slow functional corner
run_edc({runtype=>"cdcsyncrpt", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER", scan=>0 ,timing_runtype=>"stp" });
run_edc({runtype=>"cdcmax", sdc_mode=>func,    extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER",  scan=>0 ,timing_runtype=>"stp" });

## Run cdcrace and cdcnonunate for both functional and scan and for setup only. Note extraction corners
## and process/voltage/temperature are irrelevant for the structural and constraint checks
run_edc({runtype=>"cdcrace"});
run_edc({runtype=>"cdcnonunate"});

feint/eco/placenroute/analysis Personalities
In these personalities, the checks use the matching timing command files to generate the primetime session. The flow can be involved as follows:
## override.controls
run_timing({type=>"tile", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER", runtype=>"stp"});
run_timing({type=>"tile", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_FAST_CORNER", runtype=>"hld"});

run_timing({type=>"tile", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER", runtype=>"stp", scanonly=>1});
run_timing({type=>"tile", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_FAST_CORNER", runtype=>"hld",  scanonly=>1});

## Run Synchronizer Report using the frequencies/voltage from the functional scan run
run_edc({runtype=>"cdcsyncrpt", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER",  scanonly=>0 ,timing_runtype=>"stp" });

## Run CDC Timing only on the slow functional setup timing corner
run_edc({runtype=>"cdcmax", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$MY_SLOW_CORNER",  scanonly=>0 ,timing_runtype=>"stp" });

## Run CDC Race on setup for both functional and scan
run_edc({runtype=>"cdcmax", sdc_mode=>func, timing_runtype=>"stp"});
Every run_edc call automatically attaches to the Primetime timing target and uses it as the input. To pick specific timing targets to run the check, use the additional arguments and match the arguments to that of your preferred timing run. Because the runtype parameter is used differently between run_edc and run_timing, use the timing_runtype argument in run_edc to match that of the preferred timing run. If more than one timing target matches the run_edc arguments, then the flow will filter the matching targets and pick one timing target for each sdc_mode and func argument (in other words, the flow treats the extract and libcorner as wildcards unless they are explicitly specified)

In the example flow below, the timing run and the edc run were invoked as follows:

## overide.controls
run_timing({type=>"tile", sdc_mode=>func, extract=>"typrc0c", libcorner=>"$SLOW_CORNER", runtype=>"stp" });

run_edc({runtype=>"cdcsyncrpt", sdc_mode=>func,    extract=>"typrc0c", libcorner=>"$DDR_TIME_SLOW_CORNER",  scan=>0 ,timing_runtype=>"stp" });
run_edc({runtype=>"cdcmax", sdc_mode=>func,    extract=>"typrc0c", libcorner=>"$DDR_TIME_SLOW_CORNER",  scan=>0 ,timing_runtype=>"stp" });
run_edc({runtype=>"cdcrace", sdc_mode=>func,    extract=>"typrc0c", libcorner=>"$DDR_TIME_SLOW_CORNER",  scan=>0 ,timing_runtype=>"stp" });
run_edc({runtype=>"cdcnonunate", sdc_mode=>func,    extract=>"typrc0c", libcorner=>"$DDR_TIME_SLOW_CORNER",  scan=>0 ,timing_runtype=>"stp" })
screenshot.PNG

The rule of thumb is:

Select a run_timing you want to run the gatecdc checks on.
Add the run_edc call to the override.controls with same arguments as the run_timing and replace the timing runtype with timing_runtype. Use the runtype like cdcrace or cdcsyncrpt or cdcmax in this call.

cdc_analysis Personality
This personality is suited to run the checks standalone takes as input only a primetime saved session. This primetime saved session can be obtained from any flow (for example BAXE or FCNL) The primetime saved session is specified as a parameter in the override.params.

## override.params
EDC_CDC_PTSESSION = /proj/foo/bar/ptsession

## overide.controls
run_edc({runtype=>'cdcsyncrpt'});
run_edc({runtype=>'cdcmax'});
run_edc({runtype=>'cdcrace'});
run_edc({runtype=>'cdcnonunate'});
The run_edc can take optional arguments to specify the amount of RAM required

## override.controls
run_edc({runtype=>"cdcrace", ram => 20000});



FCNL constraint Personality
In FCNL constraints, these checks are enabled as follows:
## override.params
CHOSEN_GATECDC_TARGET_LIST = Final
CHOSEN_GCA_TARGET_LIST = Final ## or Initial Final
EDC_CDC_RAMSIZE = 32000 ## Note you have to estimate this 
EDC_CDC_JOBCOUNT = 2 ## Use appropriate value for the design size
EDC_CDC_MTBF_TECH = gf28a_cz ## Use appropriate value for the project
In FCNL constraints, the GCA target must be run in order for the checks to work.


How to Start GateCDC Checks
For fresh TileBuilderStart:


Step 1: Open a normal UNIX terminal and create a directory.
Step 2: Add the following params and controls for the respective GateCDCchecks into override.params and override.controls (You may have to refine the JOBCOUNT and MTBF_TECH to match your project). These two files should be present in your created directory.
Step 3: Type "source /tool/aticad/1.0/src/sysadmin/cpd.cshrc"
Step 4: Type "setprj projectname"
Step 5: Type "TileBuilderStart --params override.params --controls override.controls"
After a successful TBStart, a new xterm and console will be opened.
For a Parallel Run:


Step 1: cd $ALLTILES_DIR
Step 2: create a directory -----> mkdir
Step 3: Add the following params and controls for the respective GateCDCchecks into override.params and override.controls (You may have to refine the JOBCOUNT). These two files should be present in your created directory.
Step 4: Type "TileBuilderGenParams ; TileBuilderMake"
Step 5: After a successful TBGP & TBM, just type "TileBuilderConsole" it will open a console window where you can see all the targets.


Samedomain False Path Check (SDFP) & Nomarker Check
Suitable for very large SOC or IP.
Please follow the below params and controls for the Samedomain false path check (SDFP).

 ###   override.params    ### 

## Set this param with ptsession, if gcasession is not given in cdc_analysis personality 
EDC_CDC_PTSESSION =                                       
## Set this param with gcasession, if ptsession is not given in cdc_analysis personality 
EDC_CDC_GCASESSION =                                     

## Set this param with cad_cdc_knowngood label, as it has all latest cdc updates & maintained by CAD team. Before using this label, check once with GateCDC CAD team 
TILEBUILDER_FREEZEFLOWRELEASE   = cad_cdc_knowngood

## Below param has to be set to 0. Otherwise tool will create gca session, even if there are unresolved references, which are not noticed by designer
EDC_CDC_FORCE_LINK_PT2GCA       =  0

## For Signoff check, it has to be 1.  But for quick run keep it 0 and it will skip false-paths between clocks when set to 0
EDC_CDC_EXPAND_CLOCK2CLOCK = 1               
## For Signoff check, recommended value is 1. For quick run keep it 0 and check with your design teams before setting it to 1
EDC_CDC_EXPAND_MAX_DELAY = 1                     
## For Signoff check, it has to be 1. For quick run keep it 0 and it will skip multicycle-path exceptions when set to 0
EDC_CDC_EXPAND_MULTICYCLE_PATH = 1         
## Observed reduction of runtime by setting it to 1. Setting it to 1 will make flow to use analyze_paths commands to get start-end pairs over all_fanin/all_fanout command. 
EDC_CDC_SAMEDOMAIN_USE_ANALYZE_PATHS = 1

EDC_CDC_COMPRESS_MULTIBIT = 0
EDC_CDC_JOBCOUNT = 8

## Enable it for doing nomarker checks, which helps to review constraints having nomarker cells. This will help to catch wrongly given constraints
EDC_CDC_ENABLE_NOMARKER_CHECK  = 1         
## When EDC_CDC_SAMEDOMAIN_NO_WAIVER  param is set to 1, waivers will be applied in the Merge target & it will saves runtime
EDC_CDC_SAMEDOMAIN_NO_WAIVER     =   1        

## By enabling this param, there will be a standalone waiver target for each check. Advantage for enabling this param is when you update the waiver file, you need to simply rerun this waiver target without running the complete check from scratch
EDC_CDC_WAIVER_TARGET = 0             

## You can leave it to 0 to improve runtime, even for signoff. Setting it to 1 the script will read exceptions and will give you more information of which exception the SE pair belongs 
EDC_CDC_WAIVE_INCLUDE_ORIGINAL_SDC = 0

##  It has to be turned on to avoid Tcl error(max size for a Tcl value exceeded) in PrepDefault target, by skipping lengthy exceptions. All the skipped exceptions file_line_info are present in data/PrepDefault/skipped_exceptions
EDC_CDC_SKIP_TCL_ERROR = 0


 ###   override.controls    ### 

run_edc({runtype => 'cdcrace', ...});

NoMarker Check with Synopsys TBC file
Set below params in override.params and use cad_cdc_knowngood label to enable NoMarker target
EDC_CDC_ENABLE_NOMARKER_CHECK_WITH_TBC = 1
EDC_CDC_ENABLE_SAMEDOMAIN_CHECK = 0

CDC Max Timing check
Please follow the below params and controls for the CDCmax Timing check.
 ###   override.params    ### 

## Set this param with ptsession, if gcasession is not given in cdc_analysis personality 
EDC_CDC_PTSESSION =                                       
## Set this param with gcasession, if ptsession is not given in cdc_analysis personality 
EDC_CDC_GCASESSION =                                     

## Set this param with cad_cdc_knowngood label, as it has all latest cdc updates & maintained by CAD team. Before using this label, check once with GateCDC CAD team 
TILEBUILDER_FREEZEFLOWRELEASE   = cad_cdc_knowngood

## Uses -start_end_pairs option when the param is set to 1. Normally we would recommend -cover_design (EDC_CDC_USE_START_END set to 0, this is the default value), -start_end_pairs will increase runtime. But signoff should be done with -start_end_pairs option 
EDC_CDC_USE_START_END = 1

## Non-zero value enables the generation of CDC timing reports during a regular non-si timing run 
EDC_CDC_ENABLE_TIMING = 1

## Normally for regular runs, we would recommend to set this param to zero, as enabling this param will increase runtime. When we set this param to zero, only few paths(100) will be reported for high-fanout CDCBUF's. But signoff should be done by keeping this param to 1 
EDC_CDC_REPORT_ALL_PATHS_HFOUTCDC	= 1

## Zero value enables the generation of CDC reports
EDC_CDC_SKIP_CDC_TIMING = 0

## Zero value enables the generation of SYNC reports
EDC_CDC_SKIP_SYNC_TIMING = 0

## Generates a report including the passing paths (Default value is 0) 
EDC_CDC_INCLUDE_PASSPATH = 1

## It will report the paths whose skew percentage is greater than 50
EDC_CDC_MULTIBIT_SKEW_THRESHOLD = 50

##Non-zero value enables Skipping of exclusive clock paths & generates separate report for sync-paths 
EDC_CDC_CONSIDER_CLOCK_GROUPS = 1

EDC_CDC_ENABLE_FULL_UPDATETIMING = 1

## It will report all the false paths 
EDC_CDC_CDCTIMING_REPORT_FALSE_PATH = 1

## This param is used enable the timing check for only MCBUF cells
EDC_CDC_ENABLE_MCBUF_MAXDELAY_CHECK = 1

 ###   override.controls    ### 

run_edc({runtype => 'cdcmax', ...});


CDC Multibit Run
  * CdcMax timing reports & multibit reports has to be generated in 2 seperate runs
  * In multibit run only, please set below param to one and specify multibit groups in tune/EdcCdc/Sync.multibit.tcl file. In CdcMax timing run, below param has to be set to 0. They have to be given in sepertate runs as CdcMax waivers is effecting multibit runs.
  * All CdcMax Timing signoff params should have to be used in multibit run also.

EDC_CDC_MULTIBIT_SKEWCHECK_ONLY = 1


NonUnate Check
 ###    override.params    ###  
    * Use the same params which are used in the SDFP & Nomarker check.

 ###    override.controls    ###  
run_edc({runtype => 'cdcnonunate', ...});


MTBF Check
Please follow the below params and controls for the MTBF Synchronizer check.
 ###   override.params    ### 

EDC_CDC_MTBF_TECH = 
Example: EDC_CDC_MTBF_TECH = tsmc5

EDC_CDC_FORCE_LINK_PT2GCA  = 0

EDC_CDC_DISABLE_PRESET_CLEAR_ARCS = 0
EDC_CDC_MTBF_USE_PT = 0
EDC_CDC_SAME_DOMAIN_SYNC_FIT = 1

 ## This param is enabled only if you are MTBF check. If you are including SDFP, Nomarker and NonUnate check you must set this param to 0 
EDC_CDC_MTBF_CHECK_ONLY = 1

 ###   override.controls    ### 

run_edc({runtype => 'cdcsyncrpt', ...});


Run everything (All Checks)
 ###   override.params    ### 

 ## CDCmax Timing Check: 
EDC_CDC_USE_START_END = 1
EDC_CDC_ENABLE_TIMING = 1
EDC_CDC_REPORT_ALL_PATHS_HFOUTCDC = 1
EDC_CDC_SKIP_CDC_TIMING = 0
EDC_CDC_SKIP_SYNC_TIMING = 0
EDC_CDC_INCLUDE_PASSPATH = 1
EDC_CDC_MULTIBIT_SKEW_THRESHOLD = 50
EDC_CDC_CONSIDER_CLOCK_GROUPS = 1
EDC_CDC_ENABLE_FULL_UPDATETIMING = 1
EDC_CDC_CDCTIMING_REPORT_FALSE_PATH = 1
EDC_CDC_ENABLE_MCBUF_MAXDELAY_CHECK = 1
EDC_CDC_MTBF_TECH = 
EDC_CDC_FORCE_LINK_PT2GCA = 0

 ### SDFP & Nomarker Check: 
EDC_CDC_FORCE_LINK_PT2GCA = 0
EDC_CDC_DISABLE_PRESET_CLEAR_ARCS = 0
EDC_CDC_SAMEDOMAIN_USE_ANALYZE_PATHS = 1
EDC_CDC_SAMEDOMAIN_SKIP_LENGTHY_EXCEPTIONS = 0
EDC_CDC_ENABLE_NOMARKER_CHECK = 1
EDC_CDC_ENABLE_SAMEDOMAIN_CHECK = 1
EDC_CDC_EXPAND_CLK_GRP_EXCP = 1
EDC_CDC_EXPAND_FALSE_PATH = 1
EDC_CDC_EXPAND_MULTICYCLE_PATH = 1
EDC_CDC_EXPAND_CLOCK2CLOCK = 1
EDC_CDC_SKIP_TCL_ERROR = 0
EDC_CDC_SEGEN_GENERATE_CLOCK_GROUP_SE = 1
EDC_CDC_SEGEN_GENERATE_FALSE_PATH_SE = 0

 ### MTBF Check: 
EDC_CDC_FORCE_LINK_PT2GCA = 0
EDC_CDC_DISABLE_PRESET_CLEAR_ARCS = 0
EDC_CDC_MTBF_USE_PT = 0
EDC_CDC_MTBF_TECH = tsmcn7 or tsmcn6 according to tech
EDC_CDC_SAME_DOMAIN_SYNC_FIT = 1

 ###   override.controls    ### 

run_edc({runtype => 'cdcsyncrpt', ...});
run_edc({runtype => 'cdcrace', ...});
run_edc({runtype => 'cdcnonunate', ...});
run_edc({runtype => 'cdcmax' ...});


Common Parameters
Setting the parameters below impacts the runtime/checks enabled in the flow:

NAME	Description	Value	Comments
EDC_CDC_JOBCOUNT	Run multiple jobs in parallel wherever possible to speed up the processing	1	Use 1 for most tiles/macros etc, unless you are running a very large SOC or IP block. Dont use values more than the number of simultaneous LSF slots you can get
EDC_CDC_COMPRESS_MULTIBIT	Reduce the number of points to process by removing bit-blasted cases or multiple instances of the same block, assuming that all pins with the same name except for digits are instances of each other	false	Use this only for large SOC or IP blocks. This should not be used if running the non-unate check. In those cases, use the WaiveRaceChk tunable with regular expression waivers to remove all but one instance of the same block


Setting up clocks
A critical input for the flow is accurately setting up clock relationships between asynchronous and exclusive clocks. The flow automatically extracts certain relationships, but a complete setup using the tunable commands listed below would greatly improve quality of results and runtime. The flow automatically determines clock relationships as follows:
Clocks that share same master clock (or a master clock and derived clock) are treated as synchronous
Clocks that are defined on the same source pin are treated as exclusive (paths between the two clocks are skipped from all checks)
Clock relationships in set_clock_groups is automatically processed.
-physically_exclusive - The paths are skipped
-asynchronous - The clocks are treated as asynchronous
-logically_exclusive - The paths are skipped
In general, the flow assumes two clocks are asynchronous when no additional information is available.

Tunable: tune/EdcCdc/CdcSetup.tcl
Additional clock relationships can be created in this file. These relationships are used by all the runtypes: cdcrace/cdcsyncrpt/cdcnonunate.

cdc::make_clock_relationships:
This function works similar to the PT builtin set_clock_groups. It can be used to force a group of clocks to be treated as either synchronous or asynchronous or skippable to another group of clocks.
Usage:
  cdc::make_clock_relationships # Specify clock relationship between groups of clocks
   [-name name]           (Name of the clock group)
   -group group           (Clock Groups)
   [-synchronous]         (Declare each clock in each group to be SYNCHRONOUS with every clock in the other groups)
   [-asynchronous]        (Declare each clock in each group to be ASYNCHRONOUS with every clock in the other groups)
   [-skippable]           (Declare that paths between each clock in each group with every clock in the other groups can be skipped as non-physical)

Example:
   # Similar to set_clock_group -physically_exclusive -group {SC2} -group {CCLK}
   # Any path between SC2 and CCLK will be skipped from the checks
   cdc::make_clock_relationships -skippable -name "SKIP_SC2_CCLK" -group {SC2} -group {CCLK}
   # Skip all paths between SC2 and every other clock
   cdc::make_clock_relationship -skippable -group {SC2}
   # Skip all paths between SC2 and SC2
   cdc::make_clock_relationship -skippable -group {SC2} -group {SC2}
Note that defining two clocks as synchronous causes any clocks derived from them to be treated as synchronous (and conversely for asynchronous) Defining a clock as skippable will cause all paths between the two clocks to be ignored (This is how physically_exclusive clocks are handled)


Synchronizer MTBF Check, Runtype: cdcsyncrpt
This check calculates the synchronizer FIT rate based on the clock frequencies and voltage corner in the primetime session. A rule of thumb is to aim for a cumulative MTBF > 1E9 (1 billion) years (which equates to total FIT/package < 1E-4 and total FIT/die < 1E-6) and/or individual FIT of synchronizers to be <<1E-4 (i.e. 1E-8).

For async signals, D input will hit the metastability if its transition is in aperture window. So FIT calculation will be done using the aperture time given by foundry.
But for synchronous signals, D input of synchronizer might hit the metastability window with every transition. So a more accurate way to model this worst-case synchronous scenario is to have the aperture window for the FIT calculation be set to the full input clock Rx period (so any D input transition will create metastability in synchronous signals)


Enabling the check
This is invoked from the controls file by setting the runtype parameter to cdcsyncrpt. This check requires an explicit parameter setting one or more associated design processes in the params file.
## overide.controls
run_edc({runtype => 'cdcsyncrpt'});
## OR
run_edc({runtype => 'cdcsyncrpt', libcorner => $SLOW_CORNER, timing_runtype => 'stp'});

## override.params
EDC_CDC_MTBF_TECH = gf28a_cz gf28a_unaged 
    # Note multiple technologies maybe listed here, using space to separate them
The check generates the FIT rate of standard synchronizers in the design by considering every possible transmit receive asynchronous clock combinations for each synchronizer instance in the design. While this may seem pessimistic, the increases the overall FIT rate only fractionally and does not impact the overall rollup value. The clock frequencies, voltage of the synchronizer are obtained from primetime SDC and library containing the synchronizer respectively. The default activity factor (how often the input to the synchronizer switches) is set to 20%. The flow automatically understands back2back synchronizer structures and includes the latch contribution of back2back in the value for the first synchronizer in the chain. Note that back2back synchronizer are penalized one flop (two latches) for every external wire or every additional synchronzer in the chain.

The factors impacting the FIT rate of a synchronizer in reducing order of importance:

Synchronizer Voltage
Exponential relationship.
Process
LVT better than RVT, 2 sigma better than 3 sigma.
Size of memory structure in synchronizer
HP better than HD.
Destination Clock (synchronizer clock)
Exponential relationship.
Depth of Synchronizers (Number of flop stages)
Exponential relationship. More is better.
Input data rate
Linear relationship.

Supported Technologies
The EDC_CDC_MTBF_TECH parameter should point to one or more of the technologies below.
NAME	Description	Projects
gf28shp	GF 28SHP technology with aging model	BK KV
gf28shp_unaged	GF 28SHP technology with no aging applied	BK KV
tsmc28hp_perform	TSMC 28HP library (used by dGPU) using 2sigma models	Bonaire
tsmc28hp_func	TSMC 28HP library (used by dGPU) using 3sigma models	Bonaire
tsmc28hd	TSMC 28HD library (used by APUs) using 3sigma models	KB KT TH
tsmc16ffp	tsmc16ffp library using SSF models	To be used by all TSMC16FFP projects (no BTI aging)
gf28a	http://bugs.amd.com/ubts/prod/issue/view?id=468955	Mullins, BV, CZ for IPs that do not require aging
gf28a_cz	gf28a library with BTI aging	CZ with device aging for BTI/HCI effects
gf20lpm	gf20lpm library using SSG models	To be used by all gf20lpm projects (includes BTI aging)
gf14lpe	gf14lpe library using SSF models	To be used by all 14LPE projects (no BTI aging)
gf14lpp	gf14lpp library using SSF models	To be used by all 14LPP projects (no BTI aging)
tsmcn7	tsmcn7 library using SSF models	To be used by all TSMCN7 projects (no BTI aging)
tsmcn5	tsmcn5 library using SSF models	To be used by all TSMCN5 projects (no BTI aging)
If your project's technology is not listed above, then the library team must first be contacted to get the right model to use (You may need to file a bug if the library parameters don't match what is already supported)


Tunables: tune/EdcCdc/SyncRpt.setup.tcl
 cdc::set_sync_clock_frequency # Set the frequency of a clock to use for FIT calculation
   name                   (Name of (master) clock)
   value                  (Frequency to set (in Hz))
Example:
 cdc::set_sync_clock_frequency SCLK 1E9

 cdc::set_sync_voltage # Set the synchronizer voltage for a list of instances
   cells                  (A primetime collection of synchronizer instances)
   value                  (Value for the voltage)
Example:
 set my_synchronizers [filter_collection [get_cells -h *] -regexp "ref_name =~ sync.*"]]
 cdc::set_sync_voltage $my_synchronizers 0.8

 cdc::set_sync_data_switch_factor # Set the data activity for a list of cells
   cells                  (A primetime collection of synchronizer instances)
   value                  (Value for the data switch factor)
Example:
 set my_synchronizers [filter_collection [get_cells -h *] -regexp "ref_name =~ sync.*"]]
 cdc::set_sync_data_switch_factor $my_synchronizers 0.00001

 cdc::set_sync_rollup     # Set the mode to rollup the synchronizer fit 
                          # FIT is added up as 'DEFAULT' if this is not set
   cells                  (A primetime collection of synchronizer instances)
   rname                  (Name for the rollup (cannot be DEFAULT))
Example:
 set my_synchronizers [filter_collection $allsyncs -regexp "full_name =~ test.*"]]
 cdc::set_sync_rollup $my_synchronizers TEST_MODE
 # all synchronizers in $my_synchronizers will be rolled into a seperate TEST_MODE row

 cdc::set_sync_data_clock_swf # Set the synchronizer data switch factor for a given from/to clock
   -from                  (From clock)
   -to                    (To clock)
   cells                  (Synchronizer cell instances (collection))
   value                  (Value of the data switch factor)
Example:
 set my_synchronizers [filter_collection $allsyncs -regexp "full_name =~ testable.*"]]
 cdc::set_sync_data_clock_swf $my_synchronizers -from TCLK -to T2CLK 0.002
 # FIT rate for $my_synchronizers betwen TCLK and T2CLK will have a fit rate of 0.002

To Add the FIT result of the same RxClk and TxClk.
Include the below towards the end of the override.control file

EDC_CDC_SAME_DOMAIN_SYNC_FIT = 1     #make "0" if same Domain FIT calc is not required.
NEED_SyncMTBFDefault_POSTSCRIPT = <:
    if($EDC_CDC_SAME_DOMAIN_SYNC_FIT == 1) {
        $NEED_SyncMTBFDefault_POSTSCRIPT = "\"perl $FLOW_DIR/supra/scripts/analysis/cdc/cdc_calc_mtbf.pl gf28a_cz
rpts/SyncMTBFDefault/fit_calculation.gf28a_cz.xls rpts/SyncMTBFDefault/sync_report.csv.gz; perl
$FLOW_DIR/supra/scripts/analysis/cdc/cdc_calc_mtbf.pl gf28a_cz rpts/SyncMTBFDefault/fit_calculation_sameDomain.gf28a_cz.xls
rpts/SyncMTBFDefault/sync_sameDomain.csv.gz\"";
    } else {
        $NEED_SyncMTBFDefault_POSTSCRIPT = "\"perl $FLOW_DIR/supra/scripts/analysis/cdc/cdc_calc_mtbf.pl gf28a_cz
rpts/SyncMTBFDefault/fit_calculation.gf28a_cz.xls rpts/SyncMTBFDefault/sync_report.csv.gz\"";
    }
    print $NEED_SyncMTBFDefault_POSTSCRIPT;
:>

Parameters
NAME	Description	Value	Comments
EDC_CDC_MTBF_TECH	Parameter to specify one or more technologies for which the FIT spreadsheet is calculated	 	This is required to be set in your parameter file to a valid supported technology to produce the xls results
EDC_CDC_DEFAULT_SWF	Default data switching factor (between 0 and 1)	0.2	 
EDC_CDC_DEFAULT_TW	Default aperture window around the receive clock edge of the synchronizer, where a switching data could cause a metastability	200E-12	This is used instead of a slightly better approach of using the sum of the setup and hold times of synchronizers because the flow uses GCA now and GCA does not estimate setup and hold time arc values. The error in the FIT calculation is fairly small when we assume 200ps as this aperture window
These parameters should be treated as CAD ONLY and if used in your analysis, reviewed with CAD.


NAME	Description	Value	Comments
EDC_CDC_DEBUG	Enable additional debug print statements	false	Enable to debug any flow/algorithm bugs
EDC_CDC_VALID_CELLS	The cells in the design that are initially used to filter for the synchronizers. This can be used for example to narrow down the analysis to one IP included as part of a larger design	{get_cells -q -h -filter "is_hierarchical == false"}	Note that the parameter is actually evaluated as a GCA/Primetime TCL command and must have correct syntax.
EDC_CDC_SYNC_PATTERN	List of regular expression patterns to match synchronizer celltypes	[list {"^([hx][dp])?sync.*"}]	Note this is again a TCL list. Note the syntax used for the regular expression with mixture of { and " to allow the use of [] in the pattern name
EDC_CDC_SYNCCDC_PATTERN	List of regular expression patterns to match synchronizers with source flops in them	[list {"^([hx][dp])?sync[0-9]+(p5)?cdc.*"}]	Same comment as above
EDC_CDC_SYNC_INPIN	Pin name for the input data pin in regular synchronizers. Only one string is allowed	D	 
EDC_CDC_SYNC_CLOCKPIN	Pin name for the receive clock pin in regular synchronizers. Only one string is allowed	CLK	 
EDC_CDC_SYNCCDC_INPIN	Pin name for the input data pin in the synchronizers with source flops built in	DSRC
EDC_CDC_SYNCCDC_SRCCLK	Pin name for the source clock pin in the synchronizers with source flops built in	CLKSRC
EDC_CDC_SYNCCDC_DSTCLK	Pin name for the receive clock pin in the synchronizers with source flops built in	CLKDST
EDC_CDC_DEFAULT_ROLLUP_NAME	The name used to bin the FIT of synchronizers when one is not specified in the tunable	DEFAULT	Only one Rollup can be associated with a synchronizer. Some IPs may want to have different FIT target for test synchronizers versus functional and this enables that functionality.
EDC_CDC_FAKE_CLOCK_NAME	Default clock that is artifically created and used when no valid source or destination clocks are located for a synchronizer instance. The flow picks the slowest clock period of the real clocks as the period for this fake clock	CDC_FIT_DEFAULT_CLK	 


Results
The results are written to a directory named rpts/SyncMTBFCdcXXXXXX where the XXXXXX is a variable string depending upon your inputs. The files in the results directory are:
sync_b2b.rpt.gz : Report file containing the back2back synchronizers with all the synchronizers included in the chain.
sync_skip.csv.gz : CSV file describing which synchronizers got skipped from the final spreadsheet (either because their latches got included in the first synchronizer in the chain or they are purely synchronously timed)
sync_warnings.rpt.gz : Various topology warning encountered with synchronizers (These are usually covered in 0in checks)
sync_report.csv.gz : The raw report file containing every synchronizer instance and associated source clock and receive clock along with their frequencies and voltages. A description of the columns in this file is below:
Instance: synchronizer instance name
CellType: synchronizer library cell name
DataPin: data pin name of synchronizer cell
ClPin: clock pin name of synchronizer cell
RxClk: receive clock name
RxClk Master: receiver clock master name. If RxClk is a generated clock created using the create_generated_clock command, this will be the -master argument.
RxClk Master Frequency: RxClk master clock frequency (Hz)
RxClk Master Ratio: Ratio of RxClk to RxClk master frequencies.
TxClk: transmit clock name
TxClk Master: transmit clock master name. If TxClk is a generated clock created using the create_generated_clock command, this will be the -master argument.
TxClk Master Frequency: TxClk master clock frequency (Hz)
TxClk Master Ratio: Ratio of TxClk to TxClk master frequencies.
Synchronizer Aperture Window: Fixed number for technology (sec)
Latch Count: Number of latch stages in synchronizer (derived from synchronizer cell naming convention)
Data Switch Factor: Switching activity on data input of synchronizer (default=0.2 if not explictly overriden in tune file)
Voltage: Supply voltage (volts)
RollUp: Name of group to which FIT is rolled up (default group is DEFAULT)
LeakagePower: leakage power calculated on synchronizer instance (informational only, not used for FIT calculation)
fit_calculation..xls : Excel spreadsheet file containing the actual FIT calculation for the selected technology . Multiple technologies can be specified and multiple spreadsheets will be generated. If a spreadsheet is very large and difficult to load, then in the runs/SyncMTBFCdcXXXXX directory, there will be multiple partial spreadsheets which contain the same information. The primary reporting worksheet is called Rollup.

CDC Constraint Checks, Runtype:cdcrace
This check covers risky timing exceptions and checks for the usage of correct markers cells for each timing exception type. The checks are:
Samedomain exceptions: Any path whose start and endpoint have clocks that are synchronous should not be false-pathed. We strongly recommend running this check in both functional and scan mode. Per-EGADS guidelines, very large multicycle values should be used for same domain paths.
Nomarker checks: This checks ensures that the correct marker cell is used for each timing exception types. The check overlaps with 0in checks for CDC paths (set_false_path or set_clock_groups) but not for multicycle paths. The required marker cells are:
set_false_path: CDCBUF/CDCBUFEN used in the path or SYNC endpoint.
set_max_delay: CDCBUF/CDCBUFEN used in the path or SYNC endpoint.
set_multicycle_path: CDCBUF/CDCBUFEN/MCBUF/MCBUFEN used in the path or SYNC endpoint.
set_clock_groups: CDCBUF/CDCBUFEN used in the path or SYNC endpoint.
Nomarker on paths with special pins: As of October 2013, 0in does not fully cover paths using UPF to insert isolation/level shifters or paths with repeater flops added outside the RTL. This check allows the checks for markers on the paths containing these special list of cells. The pins of these cells have to identified using a parameter for this check to produce results.
Samedomain nomarker checks: A refinement of the samedomain checks that lists only the samedomain false paths that lack the correct marker cells.

Enabling CdcRace check
This is invoked from the controls file by setting the runtype parameter to cdcrace.
## override.controls
run_edc({runtype => 'cdcrace'});
## OR
run_edc({runtype => 'cdcrace', libcorner => $SLOW_CORNER, timing_runtype => 'stp'});

## override.params
EDC_CDC_SPECIAL_PINS = \[get_pins -quiet -of [get_cells .* -h -quiet -regexp "ref_name =~ .*iso.*"] -filter "lib_pin_name == EN"] 
      # create special report for nomarker checks on the paths through instances of iso cells on their EN pin.



Enabling NoMarker check with Synopsys Solution
By setting below param to 1, Seperate NoMarker targets will be created, which will be independent of PrepDefault, SeGen & CheckDefault targets. EDC_CDC_ENABLE_NOMARKER_CHECK_WITH_TBC = 1
If you enabled NoUnate check, then NonUnate targets will be dependent on NoMarker target




Tunables: tune/EdcCdc/WaiveRaceChk.tcl tune/EdcCdc/WaiveNoMarker.tcl
The primary mechanism for writing waivers for these checks is via these tunable files.
The waiver now consists of two parts: the one runs inside the gca_shell, and the other one runs as a post-processing step in the Merge* targets. So if new waivers are added, you can just run the Merge* targets to apply the waivers, as this will require less computational resources.

SameDomain waivers has to be placed in tune/EdcCdc/WaiveRaceChk.tcl file

Whereas NoMarker & NonUnate waivers has to be kept in tune/EdcCdc/WaiveNoMarker.tcl


Usage:
 cdc::waive_race_checks # Define pairwise startpoint/endpoint pins or clocks as 'skippable' for a check
   -regexp                (Optional flag to specify arguments as regular expression)
   -type type             (Type of check to skip: 
                           Values: samedomain, nonunate, nomarker, nomarker_special)
   -sdc {}                 sdc lines as waive pattern.
   sparg                  (Startpoint pin/port/clock as object)
   eparg                  (Endpoint  pin/port/clock as object)
   spclk                  (Start clock)
   epclk                  (End clock)
Example:
 cdc::waive_race_checks -type samedomain [get_pin foo] [get_pin bar] 
                # waive samedomain check between pin "Foo" and pin "Bar"
 cdc::waive_race_checks -type nonunate [get_clock CKA] [get_clock CKB]
                # waive nonunate check between all points on clock CKA and clock CKB
 cdc::waive_race_checks -regexp -type samedomain {iDFT.*} {.*} {PCLK} {PCLK}
                # waive al samedoman exceptions from all ports and pins whose names start with iDFT to all endpoints on PCLK
 cdc::waive_race_checks -type samedomain -sdc {set_false_path -from [get_pins {A B}]}
                # waive all samedomain violations caused by sdc "set_false_path -from [get_pins {A B}]"
 cdc::waive_race_checks -type samedomain -regexp -sdc {set_false_path .*through .*A}
                # waive all samedomain violations that caused by sdc lines can be matched with regexp set_false_path .*through .*A
                # Please note, special characters under -regexp mode will be treated as special characters. So you have to escape those brackets in sdc if you don't want them to be interpreted as special characters.
NOTE: When using the -regexp option, four argument strings must be provided. Each string is treated as a regular expression and automatically anchored to the beginning of the word. Hence in the example above, iDFT.* will match iDFT_10 but not test_iDFT_3. If the -regexp is not used two object collections are expected, either specifying start and endpoints or start and endclocks. Clocks and pin/ports cannot be mixed.

Samedomain check
The new samedomain check bypassed Segen target to save time. The new samedomain check performs like this:
If the sdc line is like: set_false_path -from [get_clocks A] -to [get_clocks B], we don't expand them as startpoints and endpoints at all, we take clock A and B directly and see if they are synchronous.
If the sdc line is like: set_false_path -from [get_pins xxx] -through [get_pins yyy] -to [get_pins zzz], we just get the startpoints and endpoints by using all_fanin, all_fanout and intersect_collection, then get clocks on startponits and endpoints, and check if the start clock and end clock are synchonous
The new samedomain check has a timeout feature to prevent hanging when check some sdc lines that covered too much startpoints or endpoints. The timeout feature is controlled by 3 parameters: EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT, EDC_CDC_SAMEDOMAIN_ENABLE_TIMEOUT_THRESHOLD, and EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT_BEHAVIOR, they will be addressed in the Parameters section in detail. Basically the will check the number of startpoints and endpoints covered by one sdc line, if any of the two numbers exceeded EDC_CDC_SAMEDOMAIN_ENABLE_TIMEOUT_THRESHOLD, the timeout feature will be enabled. Then the proc will monitor the time elapsed for this sdc line, if the time used to process this line is more than the value specified by EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT, the proc will stop checking this sdc line, and will either skip it and log it into one file, or re-process it using the gca built-in command analyze_path. This behavior is controlled by EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT_BEHAVIOR. If this variable is set to "skip", the proc will skip this line and log it, if it is set to "analyze_path", the proc will analyze this sdc line again using analyze_path command.

The flow chart of the new samedomain check is attached below for better view:

samedomain_flow_chart.png

Parameters
NAME	Description	Value	Comments
EDC_CDC_FORCE_LINK_PT2GCA	Parameter that controls the forceful conversion of ptsession to gcasession	0	Setting this param to 0, will avoid creation of black-boxes for unresolved references
EDC_CDC_ENABLE_NOMARKER_CHECK	Parameter that controls whether the nomarker check is run or not	true	Enable this param for signoff runs as it help to review wrong constraints (by checking nomarker cells in MCP & False-paths)
EDC_CDC_ENABLE_SAMEDOMAIN_CHECK	Parameter that controls whether the samedoman check is run or not	true	Enable this param for SameDomain check
EDC_CDC_EXPAND_FALSE_PATH	Include set_false_path exceptions in the checks by expanding their start end pairs	true	Enable this param for signoff runs to catch wrong False path constraints
EDC_CDC_EXPAND_MAX_DELAY	Include set_max_delay exceptions in the checks by expanding their start end pairs	true	If you are interested in only samedomain false path, disable this. Recommended is to enable it for Signoff
EDC_CDC_EXPAND_MULTICYCLE_PATH	Include set_multicycle_path exceptions in the checks by expanding their start end pairs	true	Enable this param for signoff runs to catch wrong MCP constraints
EDC_CDC_EXPAND_CLOCK2CLOCK	Include set_clock_groups or other exceptions between clocks by expanding their start end pairs	true	Enable this param for signoff run as "set_false_path -from clock -to clock" will be catched
These remaining parameters are meant to tune the flow and should be treated as CAD ONLY. Params marked as bold should NEVER be set if you don't experience any runtime issues, and only set them with the confirmation of CAD.

NAME	Description	Value	Comments
EDC_CDC_MAX_ENDPOINTS	Number of endpoints that are expanded for any given exception	524288	Maximum is 2 million (internal limit in GCA). The runtime is very much dependent on this and for very large designs, it should be reduced further
EDC_CDC_TRAVERSE_DISABLED	Expand start end pairs through disabled arcs that are disabled either because of set_case_analysis constant propagation or because of set_disable_timing	false	Enabling this will impact runtime. Consider building the timing session without the suspect case analysis or disable_timing command first
EDC_CDC_DEBUG	Enable additional debug print statements	false	Enable to debug any flow/algorithm bugs
EDC_CDC_SYNC_PATTERN	List of regular expression patterns to match synchronizer celltypes	[list {"^([hx][dp])?sync.*"}]	Note this is again a TCL list. Note the syntax used for the regular expression with mixture of { and " to allow the use of [] in the pattern name
EDC_CDC_CDCBUF_PATTERN	List of regular expression patterns to match CDCBUF/CDCBUFEN celltypes	[list {"^([hx][dp])?cdc.*"}]	 
EDC_CDC_MCBUF_PATTERN	List of regular expression patterns to match MCBUF/MCBUFEN celltypes	[list {"^([hx][dp])?mc.*"}]	 
EDC_CDC_CDBUFEN_PATTERN	List of regular expression patterns to match only CDCBUFEN celltypes	[list {"^([hx][dp])?cdcen.*"}]	Note that this should strictly be a subset of the CDBUF pattern
EDC_CDC_MCBUFEN_PATTERN	List of regular expression patterns to match only MCBUFEN celltypes	[list {"^([hx][dp])?mcen.*"}]	Note that this should strictly be a subset of the MCBUF pattern
EDC_CDC_SYNC_INPIN	Pin name for the input data pin in regular synchronizers. Only one string is allowed	D	 
EDC_CDC_CDCBUF_INPIN	Pin name for the input pin through which the asynchronous data path travels. Only one string is allowed	A
EDC_CDC_MCBUF_INPIN	Pin name for the input pin through which the input data path travels. Only one string is allowed	A
EDC_CDC_SAMEDOMAIN_ENABLE_TIMEOUT_THRESHOLD	If one of the number of startpoints or endpoints exceed this number, the timeout feature will be enabled.	100000	 
EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT	The time allowed to use for checking one sdc line if the timeout feature is enabled.	3600	Unit in seconds
EDC_CDC_SAMEDOMAIN_CHECK_TIMEOUT_BEHAVIOR	Controls the work flow in samedomain check if one sdc line is timed out. "skip" to skip this line, "analyze_path" to re-process this line again using analyze_path command	"skip"	valid options are "skip" and "analyze_path"
EDC_CDC_SAMEDOMAIN_INCLUDE_INVALID_PATHS	Skip the refinement of finding valid endpoints for a given startpoint. This could be timing consuming under some sdc modes	0	0 or 1
EDC_CDC_SAMEDOMAIN_PATH_LIMIT	Maximum number of violations reported for a launch-capture clock pair. Default value of "inf" means report all violations.	"inf"	integer

Results
The results are written out to rpts/CheckXXXXXX directory. The result files are:
nomarker.csv.gz: CSV file listing start/end pairs and associated clocks and exceptions for each timing exception that lacked the required marker cells.
nomarker.postwaived.csv.gz: nomarker CSV file generated after applying waivers in MergeCheck target.
nomarker_postwaived : It is a dircetory with bucketized files generated for each flat sdc line and each file will have corresponding violations related to that sdc line
nomarker_waiver.csv.gz : CSV file containing waived start/end pairs for the nomarker check.
samedomain.csv.gz : File containing samedomain start/end pairs.
samedomain_waivers.csv.gz : Waived points for above.
nomarker_special.csv.gz: Start/end pairs that have paths through the special pins that dont have the required marker cell. The last column will list the matching special pin.
nomarker_special.waivers.csv.gz: Waivers for the above.
samedomain_nomarker.csv.gz: Samedomain start/end pairs that also do not have the correct marker cells.
samedomain_nomarker.waivers.csv.gz : Waivers for the above.
The flow also generates summaries from the above files automatically in rpts/CheckXXXXXX/Summary. These are named as follows:
.by_clocks.gz: Summarize the count for each start/end clocks for
.by_sdc.gz: Summarize the count for each SDC line
.by_startpoint.gz: Summarize the count by startpoint

Nonunate Check, Runtype:cdcnonunate
This check covers the cases where there is a CDCBUF/MCBUF used in the design but the physical optimization created a non-unate reconvergence in this timing exception path that cannot be modeled in RTL simulations. The risk that is covered is the possibility that a single transition in the source point arrives as two opposite transitions at the destination flop, with a time difference, thus causing the input on the destination flop to glitch. This check requires that the nomarker check be run to generate the list of candidate start/end pairs which are paths with CDCBUF/MCBUF but not CDCBUFEN/MCBUFEN.

Enabling the check
## controls
run_edc({runtype => 'cdcnonunate'});

Parameters
Same set of parameters as used by the Check step in the cdcrace runtype. That step pre-filters the paths with CDCBUFEN/MCBUFEN and only paths with CDCBUF and MCBUF are included as candidates for this check.

Results
The results are written out to rpts/CheckXXXXXX directory. The result files are:
nunate.csv.gz: CSV file listing start/end pairs with associated sdc and exceptions that have atleast one positive unate and one negative unate path between them.
nunate.path.rpt.gz : Path report listing one positive unate and one negative unate path for a start/end pair (Note CSV may have multiple entries for the same start/end pair because of multiple clocks or multiple SDC exceptions between them)
nunate_cand.waivers.csv.gz : File with waivers for non-unate paths.

Glitch sensitivity check in Nonunate check
This check It flags CDC paths startpoints and endpoints, that might create glitches to downstream logic, or might be sensitive to glitches. The check also hightlights unexpected cells in CDC paths, that might be a victim of glitches. The check produces following reports:
glitch_creating_points.summary.rpt: Unexpected pins or ports that in the fanout logic cone of a glitch creating pin/port.
glitch_creating_points.sensitive.rpt: Glitch sensitive pins or ports in the fanout logic cone of a glitch creating pin/port.
glitch_sensitive_points.summary.rpt.gz: Unexpected pins or ports that in the fanin logic cone of a glitch sensitive pin/port.
glitch_sensitive_points.comb_cells.rpt.gz: Unexpected combinatorial cells that in the fanin logic cone of a glitch sensitive pin/port.
Params and example values for this check:
# Main switch to turn on this check:
EDC_CDC_ENABLE_GLITCH_CHECK = 1

# Should we only check paths with CDC marker cells (CDCBUF/MCBUF/CDCBUFEN/MCBUFEN/SYNC)?
# When should we set this to 1 (only check CDC paths)? Below is the answer from Michael Golden (Many thanks, Michael!):
# "For normal setup timing paths, where the data is launched from a clock edge and captured on a later synchronous clock edge, we know that the capture clock won’t fire until the data is stable – so we don’t worry about the glitch as long as 
# the max delay through the data path meets the setup time constraint."
# "For normal hold timing paths, where the data is launched from a clock edge and captured on the same synchronous clock edge,  we might have to worry about the glitch, since it could race through to the capture flop just like a normal logic 
# transition. So I would hope that the min-time characterization of the macros and SKY flops and other glitch-producing cells would take the glitch into account."
# Which means if the min-time characterization of glitch-producing cells can take the glitch into account, we can set below param to 1 to save runtime.
EDC_CDC_GLITCH_CHECK_CDC_PATHS_ONLY = 0

#Pins that can create glitches
EDC_CDC_GLITCH_CREATING_CELL_PIN        = Q_*SKY:Q arxsbnk*:RdData* arxsbnk*:SDO* ardecbrom*:RdData* arx3ddata:*Out* arl2data:*RdData*
 
#Ports driven by a $GLITCH_CREATING_CELL_PIN on the other side
EDC_CDC_GLITCH_CREATING_PORT    =
  
# don't want to capture glitches in any of these cells
EDC_CDC_GLITCH_SENSITIVE_CELL_PIN       = *_SYNC:D *:RD *:RESETH *:SD *:SETH *BUF_CDC*:A *CDC*:EN dlctdfs5/PA_PwrOkVDD dlctdfs5/PA_PwrOkVDDM_IN ar*:PwrOkVDD ar*:PwrOkVDDM_BotIn ar*:PwrOkVDDM_TopIn
  
# Has a glitch sensitive cell_pin on the receiver side of the port.
EDC_CDC_GLITCH_SENSITIVE_PORT   = *
  
#Waiver params
#Waiver list for all cells allowed to fanin to  $GLITCH_SENSITIVE_CELL_PIN or $GLITCH_SENSITIVE_PORT 
#Each IP owner needs to add safe macro pins to the existing list of safe stdcells. Review with RTL team.
EDC_CDC_ALLOWED_PIN_REF_NAME_AS_GLITCH_SENSITIVE_STARTPOINT    = _TIE:* _FSDPQ_:* _FDNQ_:* _FDP_:* _FDNRBSBQ_:* _FDPRBSBQ_:* _SYNC1MSFQNS_:* _SYNC4MSFQ_:* _SYNC4RMSFQ_:* _FSDPQM4SS_:* _FSDPQM2SS_:* ar*:PwrOkVDDM_BotOut ar*:PwrOkVDDM_TopOut
  
#Waiver list for all ports allowed to faninto a $GLITCH_SENSITIVE_CELL_PIN or $GLITCH_SENSITIVE_PORT
#Each IP owner needs to add safe ports. Review with RTL team.
EDC_CDC_ALLOWED_PORTS_AS_GLITCH_SENSITIVE_STARTPOINT    =
  
#Waiver list for all cells/pins that are allowed to capture $GLITCH_CREATING_CELL_PIN and $GLITCH_CREATING_PORT signals.
#List all non glitch sensitive capturing logic including macro pins. Review with RTL team.
EDC_CDC_ALLOWED_PIN_REF_NAME_AS_GLITCH_CREATING_ENDPOINT       = _TIE:* _FSDPQ_:* _FDP_:* _FDNRBSBQ_:* _FDPRBSBQ_:* _CKLDNQOR2_:* _FSDPQB_:* _FSDPQM4SS_:* _FDNQ_:* _FSDPQM2SS_:* arxsbnk:SDI*
 
# Flow has a feature to automatically determine the acceptable combinatorial cells in front of glitch sensitive pins/ports. Set below param to 1 if you want to disable this feature and use 
# EDC_CDC_ALLOWED_CELL_REF_NAME_IN_COMB_GLITCH_SENSITIVE_INPUT_FANIN to specify allowed cells:
EDC_CDC_SPECIFIED_COMBO_CELL_IN_GLITCH_SENSITIVE_INPUT_FANIN_ONLY = 0

#Cells that are allowed to show up in $GLITCH_SENSITIVE_CELL and  $GLITCH_SENSITIVE_PORT fanin, 'unate' cells
#Add all non-combinational logic gates to param to flag non-unate issues. Review with RTL team.
EDC_CDC_ALLOWED_CELL_REF_NAME_IN_COMB_GLITCH_SENSITIVE_INPUT_FANIN      = _TIE _INV_ _BUF_ _DEL_ _LVL _PSLS

Nonunate Check using Questa tool, Runtype:cdc_qnonunate
NonUnate? check will be done using Questa tool. Tool will cover all async-crossing paths and will report possible nonunate paths. Using Questa tool for nonunate check has reduced runtime & false violations. You can run this check at block level in PNR/ECO personality.

Enabling this Questa NonUnate? check
## controls
run_edc({runtype=>'cdc_qnonunate' , libcorner=>'tt0p9v100c' , sdc_mode=>'FuncTT0p65v' , stage_name=>'ReRoute' , timing_runtype=>"stp"});

CDCMAX Check, Runtype: cdcmax
This check can be run as a separate target or inside the primetime timing targets. The full documentation is here but the recommended approach is to run it as a separate target in the eco/placenroute/retime/analysis personalities.

tsmcn5_sync_usage_-_12062020.xlsx: TSMC5 Sync FIT data using Tau Table data from H210 library


Description for Merge Target Output files
MergeSamedomain? target

samedomain.csv.gz - contains prewaived Start-End pairs and associated clocks of false path exception in synchronous domain.
samedomain.postwaived.csv.gz - contains post-waived Start-End pairs and associated clocks of false path in synchronous domain.
skipped_exceptions.gz - contains all the skipped exceptions which are lengthy and results huge run time for SDFP check.
samedomain.sdc_waived.csv.gz - contains SDFP violations which are waived by waivers due to -sdc.
samedomain.spep_waived.csv.gz - contains violations which are waived by the waivers due to start pin/port and end pin/port.
samedomain.sdc_regexp_waived.csv.gz - contains SDFP violations which are waived by waivers due to -sdc using -regexp (wildcards).
samedomain.spep_regexp_waived.csv.gz - contains violations which are waived by the waivers due to start pin/port and end pin/port using -regexp(wildcards).
samedomain.sdc_regexp_waivers.csv.gz - contains waivers caused by -sdc using -regexp (wildcards).
samedomain.spep_regexp_waivers.csv.gz - contains waivers caused by start pin/port and end pin/port using -regexp (wildcards).
samedomain.sdc_waivers.csv.gz - contains waivers caused by -sdc.
samedomain.spep_waivers.csv.gz - contains waivers caused by start pin/port and end pin/port.
samedomain.unused_sdc_regexp_waivers.rpt.gz - contains unused waivers caused by -sdc using -regexp (wildcards).
samedomain.unused_spep_regexp_waivers.rpt.gz - contains unused waivers caused by start pin/port and end pin/port using -regexp (wildcards).
samedomain.unused_spep_waivers.rpt.gz - contains unused waivers caused by start pin/port and end pin/port.
samedomain_postwaived/ - directory includes splitted post waived violations files based on SDC location.
Summary report -

by_clocks.gz: Summarize the count for each start/end clocks
by_sdc.gz: Summarize the count for each SDC line
by_startpoint.gz: Summarize the count by start point.


MergeCheck? target
nomarker.csv.gz - contains prewaived SE pairs and associated clocks of false path and multicycle path exceptions which does not have marker cell.
nomarker.postwaived.csv.gz - contains post waived SE pairs and associated clocks of false path and multicycle path exceptions which does not have marker cell.
nomarker_postwaived/ - directory includes splitted post waived violations files based on SDC location.
nomarker.exceptions.csv.gz - contains the unique SDC location for which the SE pairs are generated.
nomarker.spep_regexp_waived.csv.gz - contains the violations which are waived by waivers due to start pin/port and end pins/ports using -regexp switch.
nomarker.spep_regexp_waivers.csv.gz - contains the waivers waivers caused by start pin/ports and end pin/ports, those using wildcards (-regexp)
nomarker.spep_waived.csv.gz - contains the violations waived by waivers due to start pin/port and end pin/port not using wildcards (-regexp).
nomarker.spep_waivers.csv.gz - contains the waivers waivers caused by start pin/ports and end pin/ports (not using wildcards).
nomarker.unused_spep_regexp_waivers.rpt.gz - contains the unused waivers caused by start pin/ports and end pin/ports (those using wildcards)
nomarker.unused_spep_waivers.rpt.gz - contains the unused normal waivers.
nomarker.sdc_waived.csv.gz - contains violations which are waived by waivers due to -sdc.
nomarker.sdc_regexp_waived.csv.gz - contains violations which are waived by waivers due to -sdc using -regexp (wildcards).
nomarker_waiver.csv.gz: containing waived start/end pairs for the nomarker check.
samedomain_nomarker.csv.gz: contains pre waived samedomain start/end pairs that also do not have the correct marker cells.
wrong_MCP_se.csv.gz - contains the violations which are flagged out in mismatching the cycles present in multi-cycle exception and the MCPM buff.
nomarker_special.csv.gz: contains pre waived start/end pairs that have paths through the special pins not having the required marker cell.
Summary report -

by_clocks.gz: Summarize the count for each start/end clocks
by_sdc.gz: Summarize the count for each SDC line
by_startpoint.gz: Summarize the count by start point.

MergeNonUnateCand? target
nunate_cand.prewaived.csv.gz - it is the merged file of nunate_cand.csv.gz coming from CheckDefault? * target which contains prewaived SE pairs and associated clocks of exceptions having marker cell.
nunate_cand.csv.gz - contains post waived SE pairs and associated clocks of exceptions having marker cells.
nunate_cand.exceptions.csv.gz - contains the unique SDC location for which the SE pairs are generated.
nunate_cand.spep_regexp_waived.csv.gz - contains the violations which are waived by waivers due to start pin/port and end pins/ports using -regexp switch.
nunate_cand.spep_regexp_waivers.csv.gz - contains the waivers waivers caused by start pin/ports and end pin/ports, those using wildcards (-regexp)
nunate_cand.spep_waived.csv.gz - contains the violations waived by waivers due to start pin/port and end pin/port not using wildcards (-regexp).
nunate_cand.spep_waivers.csv.gz - contains the waivers waivers caused by start pin/ports and end pin/ports (not using wildcards).
nunate_cand.unused_spep_regexp_waivers.rpt.gz - contains the unused waivers caused by start pin/ports and end pin/ports (those using wildcards)
nunate_cand.unused_spep_waivers.rpt.gz - contains the unused normal waivers.
nunate_cand.sdc_waived.csv.gz - contains violations which are waived by waivers due to -sdc.
nunate_cand.sdc_regexp_waived.csv.gz - contains violations which are waived by waivers due to -sdc using -regexp (wildcards).
nunate_cand.sdc_regexp_waivers.csv.gz - contains waivers caused by -sdc using -regexp (wildcards).
nunate_cand.sdc_waivers.csv.gz - contains waivers caused by -sdc.
nunate_cand.unused_sdc_regexp_waivers.rpt.gz - contains unused waivers caused by -sdc using -regexp (wildcards).

MergeNonUnate? target
rpts/CheckCdcStpFunc/nunate.csv.gz - contains SE pairs and associated clocks of different unateness.
rpts/CheckCdcStpFunc/nunate.path.rpt.gz - contains paths of different unateness for each SE pair.

Tile Run Enablement
Tiles which have sign-off quality constraints should run GateCDC and GCA checks at the tile level to find issues early on in the design process instead of waiting until the full-chip netlist is created. Typically, tile design that do not allow special constraint just for synthesis can utilize this functionality. For tiles that need tile constraints from the full-chip, constraint extractor may be able to provide this information. Details to be added.

GateCDC and GCA targets can be enabled using the following commands:


<:
run_gca({type=>"tile", runtype=>"stp", libcorner=>"$OPTIMIZATION_SETUP_LIB", sdc_mode=>"PrePhysical", sortgrp=>"Feint", preroute=>"0", stage_name=>"pretiming", si_type=>"No", ext_rpts=>"0"});
run_edc({type=>"tile", runtype=>"cdcrace", libcorner=>"$OPTIMIZATION_SETUP_LIB", sdc_mode=>"PrePhysical", stage_name=>"pretiming", extract=>""});
run_edc({type=>"tile", runtype=>"cdcnonunate", libcorner=>"$OPTIMIZATION_SETUP_LIB", sdc_mode=>"PrePhysical", stage_name=>"pretiming", extract=>""});

\\\\\\\\\\\\\\
# cdc isbella wang FEINT team, perl script;

# NA /proj/mi400_hcf_vol3/user/jialwang/fcnlconstraints_hcfvcn2/main/pd/tiles/CHIP_MID/constraints/process_scripts/cdc_analysis;
cp -pr /home/jialwang/hcf_vcn/fp_analysis/ToF_calculator_polygon.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/combine_report_with_distances.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/extractor.pl ./
cp -pr /home/jialwang/hcf_vcn/fp_analysis/summarize_report_with_tiles.pl
cp -pr /home/jialwang/hcf_vcn/fp_analysis/README

# please find information for #2 distance based GateCDC analysis
# HCF_VCN_FPcdcmaxdelay.pptx : ppt for fpaware CDC delay analysis
# after CDC max delay run is done, reports are
/proj/saw_fct_vol5/a0/fct_runs/CDCMaxdelay/run1_AIGC_NLB_sync/main/pd/tiles/hcf_aigc_aid_CDC_AIGC_NLB_TileBuilder_Aug02_1018_115633_GUI/rpts/MergeCdcMaxResDefault/reports.sync.csv.gz
# use scripts to obtain results
/home/akarna/gateCDC/extractor.pl
/home/akarna/gateCDC/summarize_report_with_tiles.pl
/home/akarna/gateCDC/modified_FP_script.pl    ; # usage: -t <module_name> -o <output_filename> -d <DEF release area dir> -h(elp) -u (prog info)
/home/akarna/gateCDC/combine_report_with_distances.pl
# You will get a csv file with all info:
/proj/saw_fct_vol5/a0/fct_runs/CDCMaxdelay/run1_AIGC_NLB_sync/main/pd/tiles/hcf_aigc_aid_CDC_AIGC_NLB_TileBuilder_Aug02_1018_115633_GUI/rpts/MergeCdcMaxResDefault/fpcdcmaxdelay.csv
# if required fix value >1, those can be sent to IP to check if need changes




# requirement on reports/logs files;

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
VCN cdc:  unique.report.cdc.fail.vcn.csv
VCN sync: unique.report.sync.fail.vcn.csv
# Running Floorplan Aware Analysis Scripts
perl ToF_calculator_polygon.pl        //calculates the longest distance within one tile and between two tiles, requires top def and tile def files under the run directory
perl extractor.pl                     //extract all the required  information from the provided report unique.report.cdc.fail.vcn.csv
perl summarize_report_with_tiles.pl   //adding tile information into the data extracted in the previous step
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




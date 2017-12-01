
# If ring oscillator is large enough (generally more than 50 LUTs), there may be a warning in TimeQuest and .fit.rpt like so:
# Warning: Design contains combinational loop of 118 nodes. Estimating the delays through the loop.
# This is done because large combinatorial loops can grow exponentially in size, causing a runaway run-time in TimeQuest.  Obviously, a ring oscillator shouldn't have this problem.
# The command set_scc_mode can be added(make sure -size is equal to message value), to make the message go away.
# If there are other large combinatorial loops in the design, TimeQuest run-time could go up.
# Also, from all my tests, the loop delays are identical with or without this setting.  The only difference this assignment made was making the warning go away, so I'm leaving command commented:
# set_scc_mode -size 118

# Make sure period is less than 2x loop value in Fast timing model
# In example, loop delay was 1.342, so fastest clock period is 2.684ns.  Overconstraining to 2.5 here:
#create_clock -name fake_clk -period 2.5 [get_pins {i_rng_rbg|constant|q}] 

#derive_clock_uncertainty

set_false_path -to [get_keepers {SoftShell:SoftShell|Role:Role|rng:rng_inst|rng_core:i_rng_core|rng_rbg_11s:i_rng_rbg|rb}]


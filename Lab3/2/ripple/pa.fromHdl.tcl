
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ripple -dir "/users/btech/hritvikt/Desktop/CS220/Lab3/2/ripple/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ripple.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ripple.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ripple $srcset
add_files [list {ripple.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4

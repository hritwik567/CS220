
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name adder5x4 -dir "/users/btech/hritvikt/Desktop/CS220/Lab2/Lab2_3/adder5x4/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "adder5x4.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {full_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {adder6.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {adder5.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {adder4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {adder5x4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top adder5x4 $srcset
add_files [list {adder5x4.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4


# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name seven_bit_adder -dir "/home/cse/Desktop/CS220/Lab2/Lab2_1/seven_bit_adder/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/cse/Desktop/CS220/Lab2/Lab2_1/seven_bit_adder/seven_bit_adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/cse/Desktop/CS220/Lab2/Lab2_1/seven_bit_adder} }
set_property target_constrs_file "seven_bit_adder.ucf" [current_fileset -constrset]
add_files [list {seven_bit_adder.ucf}] -fileset [get_property constrset [current_run]]
link_design

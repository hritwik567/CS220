
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name regfile -dir "/users/btech/hritvikt/Desktop/CS220/Lab6/regfile/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/users/btech/hritvikt/Desktop/CS220/Lab6/regfile/controller.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/users/btech/hritvikt/Desktop/CS220/Lab6/regfile} }
set_property target_constrs_file "controller.ucf" [current_fileset -constrset]
add_files [list {controller.ucf}] -fileset [get_property constrset [current_run]]
link_design

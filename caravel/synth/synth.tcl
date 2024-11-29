# Define the root path
set root_path "/home/yatharth/vsd_sfal/Synopsys_Caravel_sky130/caravel"

# Define the target and link libraries
set target_library "$root_path/pdk/SKY130/sky130_fd_sc_hd__tt_025C_1v80.db"

set link_library "$root_path/pdk/SKY130/sky130_fd_sc_hd__tt_025C_1v80.db \
$root_path/pdk/SKY130/sky130_fd_sc_hvl__tt_025C_3v30.db \
$root_path/pdk/SKY130/sram_1rw1r_32_256_8_sky130_TT_1p8V_25C_lib.db \
$root_path/pdk/SKY130/sky130_fd_sc_hvl__tt_025C_3v30_lv1v80.db"

# Specify the input Verilog directory and output paths
set verilog_folder "$root_path/rtl"
set output_file "$root_path/out/synth/output_file.v"

# Define the top-level module name
set top_module "caravel"

# Load the target and link libraries
set_app_var target_library $target_library
set_app_var link_library "* $link_library"

# Read the Verilog files
read_file $verilog_folder/defines.v
read_file $verilog_folder -autoread -format verilog -top $top_module

# Elaborate and link the design
elaborate $top_module
link

read_sdc /home/yatharth/vsd_sfal/Synopsys_Caravel_sky130/caravel/synth/caravel.sdc
# Run compile_ultra for optimization
compile_ultra

# Report data
report_qor > "$root_path/out/synth/qor_post_synth.rpt"
report_area > "$root_path/out/synth/area_post_synth.rpt"
report_power > "$root_path/out/synth/power_post_synth.rpt"

# Write out the synthesized netlist
write -format verilog -hierarchy -output $output_file

# Exit the DC Shell
quit

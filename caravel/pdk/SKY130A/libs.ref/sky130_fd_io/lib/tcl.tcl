# Read liberty files and write corresponding .db files
set libraries {
    sky130_fd_io__top_ground_lvc_wpad_tt_100C_1v80_3v30
    sky130_fd_io__top_power_lvc_wpad_tt_025C_1v80_3v30_3v30
    sky130_fd_io__top_xres4v2_tt_tt_025C_1v80_3v30
    sky130_ef_io__gpiov2_pad_tt_tt_025C_1v80_3v30
    sky130_ef_io__vccd_lvc_clamped_pad_tt_025C_1v80_3v30_3v30
    sky130_ef_io__vdda_hvc_clamped_pad_tt_025C_1v80_3v30_3v30
    sky130_ef_io__vssa_hvc_clamped_pad_tt_025C_1v80_3v30_3v30
    sky130_ef_io__vssd_lvc_clamped3_pad_tt_025C_1v80_3v30
    sky130_ef_io__vccd_lvc_clamped3_pad_tt_025C_1v80_3v30_3v30
    sky130_ef_io__vssd_lvc_clamped_pad_tt_025C_1v80_3v30
}

foreach lib $libraries {
    read_lib $lib.lib
    write_lib $lib -format db -output $lib.db
}

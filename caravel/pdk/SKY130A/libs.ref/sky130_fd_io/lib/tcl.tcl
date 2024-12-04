# Read liberty files and write corresponding .db files
set libraries {
    sky130_ef_io__vssio_hvc_clamped_pad_tt_025C_1v80_3v30_3v30
}

foreach lib $libraries {
    read_lib $lib.lib
    write_lib $lib -format db -output $lib.db
}

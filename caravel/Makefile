# Variables
TCL_SCRIPT = /home/yatharth/vsd_sfal/Synopsys_Caravel_sky130/caravel/synth/synth.tcl  # Name of your TCL script
LOG_FILE = /home/yatharth/vsd_sfal/Synopsys_Caravel_sky130/caravel/out/synth/log.txt        # Log file to capture output
# Default target
all: clean run_synthesis 

# Target to run the synthesis
run_synthesis:
	dc_shell -f $(TCL_SCRIPT) | tee $(LOG_FILE)

# Target to clean generated files
clean:
	rm -f *.log
	rm -f *.pvl
	rm -f *.syn
	rm -f *.mr
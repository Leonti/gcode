M201 X500.00 Y500.00 Z100.00 E5000.00 ;Setup machine max acceleration
M203 X500.00 Y500.00 Z10.00 E50.00 ;Setup machine max feedrate
M204 P500.00 R1000.00 T500.00 ;Setup Print/Retract/Travel acceleration
M205 X8.00 Y8.00 Z0.40 E5.00 ;Setup Jerk
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

G28 ;Home

M140 S{material_bed_temperature} ;Start heating bed
M190 S{material_bed_temperature} ;Wait for bed to reach temp before proceeding

M117 Auto bed-level GO!
M104 S{material_print_temperature} ;Start heating extruder
G29 ; Auto bed-level (BL-Touch)
M109 S{material_print_temperature} ;Wait for extruder to reach temp before proceeding
M117 Printing...

G92 E0 ;Reset Extruder
G1 X0 Y0 F3000 ;Move to left front corner
G1 Z0.15 F3000 ;Move Z down to touch buildplate
G1 Z10.0 F3000 ;Move Z Axis up
G1 X0 Y20 Z0.28 F5000.0 ;Move to start position
G1 X0 Y150.0 Z0.28 F1500.0 E10 ;Draw the first line
G1 X1 Y150.0 Z0.28 F5000.0 ;Move to side a little
G1 X1 Y20 Z0.28 F1500.0 E15 ;Draw the second line
G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up
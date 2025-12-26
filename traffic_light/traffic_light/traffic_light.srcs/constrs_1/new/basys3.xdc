## Clock signal
set_property  -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock  -name sys_clk -period 10.00 -waveform {0 5}    [get_ports clk]


## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports car_red]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports car_yellow]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports car_green]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports ped_red]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports ped_green]


## Reset Button
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports reset]


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

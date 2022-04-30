create_clock -name sysclk -period 10 [get_ports {clk}]
#leds
set_property PACKAGE_PIN H5 [get_ports {pencil_out}]
set_property PACKAGE_PIN J5 [get_ports {extra_money}]

#pushbutton
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk] 
set_property PACKAGE_PIN D9 [get_ports {clk}]
set_property PACKAGE_PIN C9 [get_ports {coin_in_en}] 
set_property PACKAGE_PIN B9 [get_ports {rst_n}] 


#dipswitches
set_property PACKAGE_PIN A8 [get_ports {coin_val}]

#pin voltage 
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in_en}]
set_property IOSTANDARD LVCMOS33 [get_ports {coin_val}]
set_property IOSTANDARD LVCMOS33 [get_ports {pencil_out}]
set_property IOSTANDARD LVCMOS33 [get_ports {extra_money}]

        
        

        
        
        
        
        
        
          
          
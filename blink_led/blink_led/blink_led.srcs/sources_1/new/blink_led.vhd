----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Gaël BOYA
-- 
-- Create Date: 21.12.2025 18:21:19
-- Design Name: blink_led
-- Module Name: blink_led - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity blink_led is
    generic (
        MAX_COUNT : natural := 50_000_000
    );
    Port ( clk : in STD_LOGIC;      -- 100 MHz
           led : out STD_LOGIC);
end blink_led;

architecture rtl of blink_led is
    
    -- 100 MHz -> 1Hz blinking
    signal counter : natural range 0 to MAX_COUNT - 1   := 0;
    signal led_r   : std_logic                          := '0';

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if counter = MAX_COUNT-1 then
                counter <= 0;
                led_r   <= not led_r;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    led <= led_r;

end rtl;

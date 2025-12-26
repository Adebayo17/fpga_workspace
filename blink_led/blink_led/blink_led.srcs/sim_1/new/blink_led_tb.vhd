----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2025 18:29:54
-- Design Name: 
-- Module Name: blink_led_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blink_led_tb is
end blink_led_tb;

architecture sim of blink_led_tb is

    signal clk : std_logic := '0';
    signal led : std_logic;

begin

    -- Generate 100 MHz clock
    clk <= not clk after 5 ns;
    
    -- DUT
    uut : entity work.blink_led
        generic map (
            MAX_COUNT => 100  -- blink very fast
        )
        port map(
            clk => clk,
            led => led
        );


end sim;

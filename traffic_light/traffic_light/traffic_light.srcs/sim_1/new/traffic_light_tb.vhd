----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2025 21:56:33
-- Design Name: 
-- Module Name: traffic_light_tb - sim
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

entity traffic_light_tb is
end traffic_light_tb;

architecture sim of traffic_light_tb is

    signal clk          : STD_LOGIC := '0';
    signal reset        : STD_LOGIC := '1';
    signal car_red      : STD_LOGIC;
    signal car_yellow   : STD_LOGIC;
    signal car_green    : STD_LOGIC;
    signal ped_red      : STD_LOGIC;
    signal ped_green    : STD_LOGIC;

begin

    -- Generate 100 MHz clock
    clk <= not clk after 5 ns;
    
    -- Reset Sequence
    reset_process : process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;
    
    uut : entity work.traffic_light
        generic map (
            T_CAR_GREEN  => 20,  -- short values for simulation
            T_CAR_YELLOW => 5,
            T_ALL_RED    => 3,
            T_PED_GREEN  => 15
        )
        port map (
            clk        => clk,
            reset      => reset,
            car_red    => car_red,
            car_yellow => car_yellow,
            car_green  => car_green,
            ped_red    => ped_red,
            ped_green  => ped_green
        );


end sim;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.12.2025 18:32:37
-- Design Name: 
-- Module Name: traffic_light - rtl
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

entity traffic_light is
    generic (
        T_CAR_YELLOW: natural := 1000;
        T_CAR_GREEN : natural := 200;
        T_ALL_RED   : natural := 100;
        T_PED_GREEN : natural := 800
    );
    Port ( 
        clk          : in STD_LOGIC;
        reset        : in STD_LOGIC;
        car_red      : out STD_LOGIC;
        car_yellow   : out STD_LOGIC;
        car_green    : out STD_LOGIC;
        ped_red      : out STD_LOGIC;
        ped_green    : out STD_LOGIC
    );
end traffic_light;

architecture rtl of traffic_light is

    type state_t is (
        ALL_RED_1,
        PED_IS_GREEN,
        ALL_RED_2,
        CAR_IS_GREEN,
        CAR_IS_YELLOW
    );
    
    signal state, next_state    : state_t;
    signal timer                : natural := 0;

begin

    -- State register and timer
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state <= ALL_RED_1;
                timer <= 0;
            else
                if state /= next_state then
                    state <= next_state;
                    timer <= 0;
                else 
                    timer <= timer + 1;
                end if;
            end if;
        end if;
    end process;
    
    -- Next-state logic and outputs
    process(state, timer)
    begin
        -- Default outputs
        car_red    <= '0';
        car_yellow <= '0';
        car_green  <= '0';
        ped_red    <= '0';
        ped_green  <= '0';
        
        next_state <= state;
        
        case state is 
            when ALL_RED_1 =>
                car_red <= '1';
                ped_red <= '1';
                if timer = T_ALL_RED then
                    next_state <= PED_IS_GREEN;
                end if;
            
            when PED_IS_GREEN =>
                car_red   <= '1';
                ped_green <= '1';
                if timer = T_PED_GREEN then
                    next_state <= ALL_RED_2;
                end if;
            
            when ALL_RED_2 =>
                car_red <= '1';
                ped_red <= '1';
                if timer = T_ALL_RED then
                    next_state <= CAR_IS_GREEN;
                end if;
            
            when CAR_IS_GREEN =>
                car_green <= '1';
                ped_red   <= '1';
                if timer = T_CAR_GREEN then
                    next_state <= CAR_IS_YELLOW;
                end if;
            
            when CAR_IS_YELLOW =>
                car_yellow <= '1';
                ped_red    <= '1';
                if timer = T_CAR_YELLOW then
                    next_state <= ALL_RED_1;
                end if;
        end case;
    end process;


end rtl;

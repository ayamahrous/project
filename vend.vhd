
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vend is Port 
( 
clk       :in std_logic;
rst_n     :in std_logic;
coin_in_en:in std_logic;
coin_val  :in std_logic;
pencil_out:out std_logic;
extra_money:out std_logic
);
end vend;

architecture Behavioral of vend is
Type state is (reset_state, await_en, collect_5_cents, collect_10_cents,collect_15_cents, collect_20_cents);
Signal current_state, next_state : state;
begin
    Process(clk, rst_n)
            begin
                if rst_n = '0' then
                current_state <= reset_state;
                elsif clk'event and clk = '1' then
                current_state <= next_state;
                end if;
            end process;
        
        
        
        
    Process (current_state, coin_in_en, coin_val)
            begin
                case current_state is
                    when reset_state =>
                    next_state <= await_en;
                    
                    when await_en =>
                    if (coin_in_en='1' and coin_val='0') then
                    next_state <= collect_5_cents;
                    elsif (coin_in_en ='1' and coin_val='1') then
                    next_state <= collect_10_cents;
                    else
                    next_state <= await_en;
                    end if;
                   
                    when collect_5_cents =>
                    if (coin_in_en='1' and coin_val='0') then
                    next_state <= collect_10_cents;
                    elsif (coin_in_en ='1' and coin_val='1') then
                    next_state <= collect_15_cents;
                    else
                    next_state <= collect_5_cents;
                    end if;
              
                    
                    when collect_10_cents =>
                    if (coin_in_en='1' and coin_val='0') then
                    next_state <= collect_15_cents;
                    elsif (coin_in_en ='1' and coin_val='1') then
                    next_state <= collect_20_cents;
                    else
                    next_state <= collect_10_cents;
                    end if; 
                   
                    when collect_20_cents =>
                    next_state <= await_en;
                  
                    when collect_15_cents =>
                    next_state <= await_en;
                 
                    when others =>
                    next_state <=reset_state;
                   
                end case;
            end process;
    
    
    
    
    Process(current_state)
        Begin
            Case current_state is
                When reset_state =>
                pencil_out <= '0'; extra_money <= '0';
                When await_en =>
                 pencil_out <= '0'; extra_money <= '0';
                 when collect_5_cents =>
                 pencil_out <= '0'; extra_money <= '0';
                 when collect_10_cents =>
                 pencil_out <= '0'; extra_money <= '0';
                 when collect_15_cents =>
                 pencil_out <= '1'; extra_money <= '0';
                 when collect_20_cents =>
                 pencil_out <= '1'; extra_money <= '1';
                 when others =>
                 pencil_out <= '0'; extra_money <= '0';
            end case;
        end process;

end Behavioral;

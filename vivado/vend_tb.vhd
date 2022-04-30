
library ieee;
  use IEEE.STD_LOGIC_1164.ALL;

entity vend_tb is
end entity vend_tb;

architecture behavioral of vend_tb is

  component vend is port (
      clk         : in    std_logic;
      rst_n       : in    std_logic;
      coin_in_en  : in    std_logic;
      coin_val    : in    std_logic;
      pencil_out  : out   std_logic;
      extra_money : out   std_logic
    );
  end component;

  signal clk_tb         : std_logic;
  signal rst_n_tb       : std_logic;
  signal coin_in_en_tb  : std_logic;
  signal coin_val_tb    : std_logic;
  signal pencil_out_tb  : std_logic;
  signal extra_money_tb : std_logic;

begin

  l : component vend
    port map (
      clk         => clk_tb,
      rst_n       => rst_n_tb,
      coin_in_en  => coin_in_en_tb,
      coin_val    => coin_val_tb,
      pencil_out  => pencil_out_tb,
      extra_money => extra_money_tb
    );

  process is
  begin

    clk_tb <= '1';
    wait for 5 ns;
    clk_tb <= '0';
    wait for 5 ns;

  end process;

  process is
  begin

    rst_n_tb      <= '1';
    coin_in_en_tb <= '0';
    coin_val_tb   <= '0';
    -- 5 5 5
    wait for 5 ns;
    rst_n_tb      <= '0';
    wait for 5 ns;
    rst_n_tb      <= '1';
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5 >>have 10
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5 >>have 15 >> 1   0

    -- 5 10
    wait for 20 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '1'; -- enter 10 >>have 15 >> 1 0

    -- 10 5
    wait for 20 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '1'; -- enter 10
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 10 >> have 15 1 0

    -- 10 10
    wait for 20 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '1'; -- enter 10
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '1'; -- enter 10 >> have 20 1 1

    -- 5 5 10
    wait for 20 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '0'; -- enter 5 >> have 10
    wait for 10 ns;
    coin_in_en_tb <= '1';
    coin_val_tb   <= '1'; -- enter 10 >> have 20 >> 1 1

    wait;

  end process;

end architecture behavioral;

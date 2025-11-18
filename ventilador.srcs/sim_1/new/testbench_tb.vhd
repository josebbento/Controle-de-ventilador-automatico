library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_tb is
end testbench_tb;

architecture Behavioral of testbench_tb is

    signal clk_tb         : STD_LOGIC := '0';
    signal reset_tb       : STD_LOGIC := '1';
    signal temperatura_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal velocidade_tb  : STD_LOGIC_VECTOR(1 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instanciação da FSM diretamente (sem top level)
    DUT: entity work.fsm_ventilador
        port map(
            clk         => clk_tb,
            reset       => reset_tb,
            temperatura => temperatura_tb,
            velocidade  => velocidade_tb
        );

    -- Clock
    clk_process : process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset
        wait for 20 ns;
        reset_tb <= '0';

        temperatura_tb <= "00"; wait for 20 ns;
        temperatura_tb <= "01"; wait for 20 ns;
        temperatura_tb <= "10"; wait for 20 ns;
        temperatura_tb <= "11"; wait for 20 ns;
        temperatura_tb <= "00"; wait for 20 ns;

        wait;
    end process;

end Behavioral;
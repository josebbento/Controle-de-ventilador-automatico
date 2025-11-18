library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_ventilador is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        temperatura: in  STD_LOGIC_VECTOR(1 downto 0);
        velocidade : out STD_LOGIC_VECTOR(1 downto 0)
    );
end fsm_ventilador;

architecture Behavioral of fsm_ventilador is

    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;

begin

    -- Processo do registrador de estado (FSM sequencial)
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Processo combinacional (transições de estado)
    process(temperatura)
    begin
        case temperatura is
            when "00" => next_state <= S0;
            when "01" => next_state <= S1;
            when "10" => next_state <= S2;
            when "11" => next_state <= S3;
            when others => next_state <= S0;
        end case;
    end process;

    -- Processo da saída (FSM tipo Moore)
    process(current_state)
    begin
        case current_state is
            when S0 => velocidade <= "00";
            when S1 => velocidade <= "01";
            when S2 => velocidade <= "10";
            when S3 => velocidade <= "11";
        end case;
    end process;

end Behavioral;
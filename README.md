# **Controle de Ventilador Automático — FSM em VHDL**
### **Alunos:** *Luiz Miguel Toller Marconatto* e *José Barros Bento de Freitas*
### **Disciplina:** Sistemas Digitais — UFN  
### **Ferramenta:** Vivado 2015.1  

---

## 🧭 **Objetivo do Projeto**

Desenvolver um mini controlador digital que ajusta automaticamente a velocidade de um ventilador conforme um valor de temperatura simulado.  
O sistema foi implementado em **VHDL**, utilizando conceitos de:

- Portas lógicas e circuitos combinacionais  
- Flip-flops e registradores  
- Máquinas de estados finitos (FSM – Moore)  
- Simulações e síntese lógica no Vivado  

---

## 🌀 **Descrição do Funcionamento**

O sistema recebe um valor de **temperatura em 2 bits** e define automaticamente a velocidade do ventilador:

| Temperatura (2 bits) | Interpretação          | Velocidade |
|----------------------|------------------------|------------|
| `00`                 | Temperatura baixa      | `00` (Desligado) |
| `01`                 | Temperatura média baixa| `01` (Velocidade 1) |
| `10`                 | Temperatura média alta | `10` (Velocidade 2) |
| `11`                 | Temperatura alta       | `11` (Velocidade 3) |

A saída é representada por **2 bits**, onde cada valor representa uma velocidade.  
A FSM projetada é do tipo **Moore** (saída depende somente do estado atual).


---

## 🧩 **Diagrama de Estados (FSM)**

        +-------------------+
        |       S0          |
        |   (Desligado)     |
        |   vel = "00"      |
        +---------+---------+
                  |
      temperatura = "01"
                  v
        +-------------------+
        |       S1          |
        |  Velocidade 1     |
        |   vel = "01"      |
        +---------+---------+
                  |
      temperatura = "10"
                  v
        +-------------------+
        |       S2          |
        |  Velocidade 2     |
        |   vel = "10"      |
        +---------+---------+
                  |
      temperatura = "11"
                  v
        +-------------------+
        |       S3          |
        |  Velocidade 3     |
        |   vel = "11"      |
        +---------+---------+

---

## ⚙️ **Arquivos do Projeto**

O repositório contém:

- Pasta completa do **Vivado 2015.1**  
- Código fonte em VHDL:  
  - `fsm_ventilador.vhd`  
  - `testbench_tb.vhd`  
- Prints das simulações  
- Este README.md

---

## 📜 **Descrição do Código**

### **FSM (fsm_ventilador.vhd)**  

```
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
```

---

### **Testbench (testbench_tb.vhd)**  

```
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
```

---

## 🧪 **Simulações**

### Temperaturas aplicadas no testbench:

| Tempo (ns) | Temperatura |
|------------|-------------|
| 0–20       | `00` |
| 20–40      | `01` |
| 40–60      | `10` |
| 60–80      | `11` |
| 80–100     | `00` |

### Print

- Formas de onda mostrando:  
  - Clock  
  - Reset  
  - Temperatura
  - Velocidade

> ![Simulação](https://github.com/josebbento/Controle-de-ventilador-automatico/blob/main/ventilador.png)

---

## 📌 **Conclusão**

O projeto permitiu consolidar a compreensão sobre:

- Funcionamento e implementação de uma FSM do tipo Moore  
- Relação entre entradas → estados → saídas  
- Diferença entre lógica sequencial (registradores) e combinacional (transições)  
- Desenvolvimento completo de sistemas digitais no Vivado  
- Testes e validações em simulação

### **Dificuldades enfrentadas**
- Ajustar a ordem das transições na FSM  
- Configuração do testbench  
- Interpretação de formas de onda no Vivado  

### **Aprendizados**
- VHDL na prática  
- Construção de máquinas de estado  
- Uso correto do Vivado  
- Entendimento da síntese e implementação de hardware digital  

---

## 🔗 **Repositório GitHub**

**Link:** https://github.com/josebbento/Controle-de-ventilador-automatico.git

---

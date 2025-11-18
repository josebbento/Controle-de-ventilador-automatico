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
Contém:
- Registrador de estado  
- Lógica de transição baseada no valor da temperatura  
- Saída dependente apenas do estado atual  

### **Testbench (testbench_tb.vhd)**  
Gera:
- Clock automático  
- Sequência de valores de temperatura  
- Sinal de reset  
- Observação das saídas e estados  

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

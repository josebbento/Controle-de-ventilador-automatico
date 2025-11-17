integantes:
- José
- Luiz Miguel

Prazo: 19/11
Lugar: site da UFN

# O que entregar
## GITHUB:
- [ ] código
- [ ] prints
  - [ ] onda
  - [ ] código
- [ ] readme.md
  - [x] titulo
  - [x] objetivo
  - [x] FSM
  - [ ] explicação do funcionamento
  - [ ] prints da simulação
  - [ ] conclusão

## APRESENTAÇÃO
- [ ] tema
- [ ] integrantes
- [ ] resumo do funcionamento
- [ ] diagramas e resultados
- [ ] link do github
- [ ] vídeo do circuito

# rodar
```bash
ghdl -a ventilador_control.vhdl
ghdl -a tb_ventilador_control.vhdl
ghdl -e tb_ventilador_control
ghdl -r tb_ventilador_control --wave=output.vcd
gtkwave output.vcd

```
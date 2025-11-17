<<<<<<< HEAD
# Controle-de-ventilador-automatico
=======
# Controle de ventilador automático (3 velocidades) - FSM que ajusta velocidade conforme nível de temperatura simulado.

## Objetivo

O objetivo deste projeto é desenvolver um controle automático para um ventilador com três velocidades (desligado, baixa, média e alta), utilizando uma máquina de estados finitos (FSM). O ventilador será controlado com base na temperatura ambiente, com a seguinte lógica:
* Abaixo de 20°C: o ventilador fica desligado.
* Entre 20°C e 24°C: o ventilador funciona na baixa velocidade.
* Entre 25°C e 29°C: o ventilador opera na velocidade média.
* A partir de 30°C: o ventilador é ajustado para a alta velocidade.

Esse controle visa proporcionar um ambiente mais confortável, ajustando automaticamente a intensidade do ventilador de acordo com a variação da temperatura.

## Máquina de Estados Finita (FSM)

M = ({Temp. < 20°C, 20 <= Temp. < 25°C, 25 <= Temp. < 30°C, Temp. >= 30°C}, {v0,v1,v2,v3}, δ, v0, {})

| Estado \ prox. | Temp. < 20°C | 20 <= Temp. < 25°C | 25 <= Temp. < 30°C | 30 <= Temp. |
|:--------------:|:------------:|:------------------:|:------------------:|:-----------:|
| v0 | v0 | v1 | v2 | v3 |
| v1 | v0 | v1 | v2 | v3 |
| v2 | v0 | v1 | v2 | v3 |
| v3 | v0 | v1 | v2 | v3 |
>>>>>>> 01eb5db (Objetivo e FSM prontos)

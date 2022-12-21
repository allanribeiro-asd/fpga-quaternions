# fpga-quaternions

Este projeto tem a intenção de fazer uso da placa Cyclone II
da Altera para calcular o deslocamento de um corpo, mas fazendo uso de
quaternions. Infelizmente, ângulos de Euler tem alguns problemas
matemáticos.

# Uso rápido

Rode o seguinte comando em um terminal:

## Compilando

Todos os passos são descritos considerando que o usuário pode, ou não,
ter alterado o source code aqui presente.

### 1 - Quartus

Arquivos em VHDL importantes ao projeto estão dentro de
("fpga/hw")[fpga/hw].

	calc_tb.vhd - Esta é a testbench do projeto para uma
multiplicação simples

	calc.vhd - Contém o encapsulamento dos registradores e
arquitetura para multiplicar dois quaternions de uma única dimensão

	fixed

### 2 - Qsys

### 3 - Eclipse

## Rodando

	nios2-download -g <bin>
	nios2-terminal



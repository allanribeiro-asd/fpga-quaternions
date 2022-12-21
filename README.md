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
("fpga/quat")[fpga/quat].

calc_tb.vhd - Esta é a testbench do projeto para uma multiplicação simples

calc.vhd - Contém o encapsulamento dos registradores e arquitetura para 
multiplicar dois quaternions de uma única dimensão
    
reg32_clr - Registrador "self clear" de 32 bits 
reg32_clr - Registrador ponto fixo, sinalizado, de 32 bits. Entrada e saída são no formato:
            bit:      (1)        (0)            (-1 a -30)
                    (Sinal)(Parte inteira).(Valores frácionários)
                    
### 2 - Qsys

### 3 - Eclipse
Os arquivos fonte do Eclipse estão em ("fpga/software/server1") [fpga/software/server1].
O principal deles é "iniche_init.c" onde o servidor por Socket é criado (função SSSInitialTask()).
É PRECISO ALTERAR O IP E PORTA DO SERVIDOR NO ARQUIVO "iniche_init.c", as linhas que cumprem essa função, possuem os respectivos comentátios no código.
    
## Rodando

	nios2-download -g <bin>
	nios2-terminal



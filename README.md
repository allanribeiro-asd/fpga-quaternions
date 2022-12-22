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

## 1 - Quartus

Arquivos em VHDL importantes ao projeto estão dentro de
("fpga/quat")[fpga/quat].

(calc_tb)[fpga/quat/calc_tb.vhd] - Esta é a testbench do projeto para uma multiplicação simples

(calc)[fpga/quat/calc.vhd] - Contém o encapsulamento dos registradores e arquitetura para
multiplicar dois quaternions de uma única dimensão
    
(reg32_clr)[fpga/quat/reg32_clr.vhd] - Registrador "self clear" de 32 bits; Registrador ponto fixo,
sinalizado, de 32 bits. Entrada e saída são no formato:

		bit:  (1)	(0)		(-1 a -30)
		    (Sinal)(Parte inteira).(Valores frácionários)

(fixed_float_types_c)[fpga/quat/fixed_float_types_c.vhd]
(fixed_pkg_c)[fpga/quat/fixed_pkg_c.vhd]
(float_pkg_c)[fpga/quat/fixed_pkg_c.vhd]

Arquivos da biblioteca que implementam o tipo usado para cálculo: sfixed;

### 1.1 Compilação

Abra o "DE2_NET.qpf"

Se os ".VHD" não estiverem inclusos, ou quiser incluir algum novo:

Na parte superior, abra projects;

Add/Remove Files in Project;

Clique em '...';

Selecione os arquivos;

Clique em add, ao lado de '...';

Para cada uma das bibliotecas, fixed_float_types_c, fixed_pkg_c, float_pkg_c, faça
	selecione-a
	clique em properties
	digite em library, o nome da biblioteca: "ieee_proposed", sem aspas
	dê OK.

Clique apply

## 2 - Qsys

Qsys é responsável por gerar os componentes, e sintetizar os elementos para
porgramação através do eclipse.

Os arquivos estão misturados na pasta raíz do projeto, mas importam

(system_0.qsys)[fpga/system_0.qsys] - Possui as netlists e configurações de componentes feitas no
qsys.

(system_0.SOPCINFO)[fpga/system_0_sopcinfo] - Possuem macros usadas para gerar o BSP do eclipse efetivamente

### 2.1 - Configurações

Abra o qsys

Aponte o arquivo system_0.qsys

Se necessário, inclua seu componente

Em System Contents, certifique-se de que as ligações estão corretas
(observe algum erro em messages, logo embaixo)

Clique em Generation

Escolha "None" em "Simulation" e "Testbench System"

Em "Synthesis", escolha "VHDL" e marque a opção "Create block symbol file"

Em seguida, clique em "Generate"

## 3 - Eclipse

Os arquivos fonte principais pro Eclipse estão em ("fpga/software/server1") [fpga/software/server1], sendo o principal deles (iniche_init.c)[fpga/sowftware/server1/iniche_init.c], onde o servidor por Socket é criado (função SSSInitialTask()).

É PRECISO ALTERAR O IP E PORTA DO SERVIDOR NO ARQUIVO "iniche_init.c", as linhas que cumprem essa função, possuem os respectivos comentátios no código.
    
### 3.1 - Compilação

Mude o workspace para o seu diretório local: <caminho até fpga-quaternions>\fpga\software

Clique com o direito do mouse em "server1" e selecione "Clean Project" (ou em "Build Configurations" e "Clean All")

Faça o mesmo para "server1_bsp"

Expanda a pasta do BSP

Abra os arquivos: "settings.bsp" e "create-this-bsp"

	Ambos possuem os caminhos que levam ao bsp e ao sopcinfo do projeto, substitua com o caminho do seu diretório.

	"create-this-bsp" tem apenas o caminho do sopcinfo, substitua-o também pelo seu caminho.

Salve os arquivos

De "Build Project" em "server1_bsp" e em seguida no "server1"

IMPORTANTE: Mesmo com erros, o projeto pode compilar. O eclipse tem um
problema com a leitura de sources, onde este não busca algumas referências.
Para ter certeza que compilou, faça o seguinte:

Feche TODO E QUALQUER source aberto com o eclipse relacionado ao projeto.

Dê clean no projeto

Na parte inferior, selecione um do erros, dê CTRL+A, e em seguida DEL

Dê build, e veja se existe um ".elf". Este é seu binário.

## Enviando e rodando

A placa precisa ficar conectada por USB ao computador durante todo o
processo (intel). A conexão de rede, se configurada corretamente, usará
dhcp para conectar ao servidor. Mais nenhuma configuração é necessária

No Quartus, na parte superior, em tools, selecione "Programmer"

Se os drivers da placa foram instalados corretamente, e esta estiver
conectada, "usb-blaster" deve aparecer, e o botão start estará disponível.
Só apertar, e ele faz o resto.

Se não instalado, abra seu painel de controle, procure por "gerenciador de
dispositivos", procure a interface da placa, e atualizar driver.

Os drivers são locais, selecione para procurar em "<caminho altera>\13.0sp1\quartus\drivers"

Com o programmer rodando, para enviar o binário, acesse <altera>\13.0sp1\nios2eds

execute "Nios II command shell.bat"

No terminal que abriu, digite:

	cd bin
	nios2-download -g <caminho até elf gerado> && nios2-terminal.exe

Se a placa conectar ela imprimirá os dados recebidos. Caso contrário, o
socket morre depois de algum tempo.



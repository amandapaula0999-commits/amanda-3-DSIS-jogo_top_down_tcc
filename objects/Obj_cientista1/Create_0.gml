#region/////////------INICIALIZAÇÃO DO DIÁLOGO 

// Texto das falas do NPC em variáveis individuais
fala_1 = "Olá! Seja bem-vindo ao jogo. Esse jogo é um projeto de TCC do meu ensino médio.";
fala_2 = "Feito pelo grupo composto por Batata (eu) [fiz o código do jogo], Isa [era para ter feito as artes, mas não deu, então o Pedro do outro grupo tá fazendo].";
fala_3 = "Luis Algu [meu namorado, ele fez a história do jogo, as falas e como ia ser os mapas e designs no geral].";
fala_4 = "Luiz [vulgo rato político, a seita].";

// Controle de quantidade e progressão das falas
fala_atual_num = 1;
total_falas = 4; // Altere este número de acordo com a quantidade de falas do NPC

// Controle de exibição e trava
exibir_dialogo = false;

// Variáveis para o efeito de digitação (maquininha)
texto_atual = "";
texto_completo = "";
char_index = 0;
velocidade_texto = 0.5;

#endregion////////////////////////////////
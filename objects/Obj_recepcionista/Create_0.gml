#region/////////------INICIALIZAÇÃO DO DIÁLOGO 

// Texto das falas do NPC em variáveis individuais
fala_1 = "bla bla bla bla bla bla  bal";
fala_2 = "o as artes, mas não deu, então o Pedro do outro grupo tá fazendo].";


// Controle de qual fala está ativa (1, 2, 3 ou 4)
fala_atual_num = 1;
total_falas = 2;

// Controle de exibição
exibir_dialogo = false;

// Variáveis para o efeito de digitação
texto_atual = "";
texto_completo = "";
char_index = 0;
velocidade_texto = 0.5;

#endregion////////////////////////////////
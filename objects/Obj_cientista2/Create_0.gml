#region/////////------INICIALIZAÇÃO DO DIÁLOGO 

// Texto das falas do NPC em variáveis individuais
fala_1 = "blo blo blo blo blob.";
fala_2 = "blo blob lbo blo blo blo blob blo blob ";
fala_3 = "blo blo blo blob lob lob, lbo blo blob ";


// Controle de qual fala está ativa (1, 2, 3 ou 4)
fala_atual_num = 1;
total_falas = 4;

// Controle de exibição e trava
exibir_dialogo = false;

// Variáveis para o efeito de digitação (maquininha)
texto_atual = "";
texto_completo = "";
char_index = 0;
velocidade_texto = 0.5;

#endregion////////////////////////////////



#region/////////------TRAVA GLOBAL DE DIÁLOGO

global.dialogo_ativo = false;

#endregion////////////////////////////////
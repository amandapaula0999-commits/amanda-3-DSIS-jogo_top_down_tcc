#region /////////------ CONFIGURAÇÃO INICIAL DO BOSS

// Posição inicial onde o boss fica escondido
pos_x_inicial = x;
pos_y_inicial = y;

// Velocidade de movimento do boss
velocidade = 1;

// Estado inicial do boss
estado = "esperando";

// Variável global para controle da chave
if (!variable_global_exists("chave_pega")) {
    global.chave_pega = false;
}

// Direção padrão que o boss começa olhando (0 = Baixo, 1 = Cima, 2 = Direita, 3 = Esquerda)
lado = 0;

#endregion ////////////////////////////////
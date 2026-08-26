#region/////////------VARIÁVEIS DE MOVIMENTAÇÃO

max_vel = 9; // A velocidade máxima 
velh = 0; // Velocidade no eixo X
velv = 0; //Velocidade no eixo Y

#endregion////////////////////////////////


#region/////////------TROCA DE SPRITES

lado = 0; // Controla a direção do sprite 0: Baixo, 1: Cima, 2: Direita, 3: Esquerda

#endregion////////////////////////////////


#region/////////------SISTEMA DE VIDA E CHECKPOINT

vida_max = 2;
vida = vida_max;

// Invulnerabilidade
invulneravel = false;

// Guarda a posição onde ele renasce (inicia onde ele é criado na room)
checkpoint_x = x;
checkpoint_y = y;

#endregion////////////////////////////////


#region/////////------INVENTÁRIO

caixas_mecanicas = 0; // Começa com 0 caixas de pregos guardadas

#endregion////////////////////////////////
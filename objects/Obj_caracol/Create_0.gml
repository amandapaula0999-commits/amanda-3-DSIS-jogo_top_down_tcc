#region/////////------ VIDA DO INIMIGO

vida = 20;
tomou_dano = false;
morrendo = false;

#endregion////////////////////////////////


#region/////////------MAQUINA DE ESTADOS E POSIÇÃO INICIAL

estado = "PATRULHA"; // Estados: PATRULHA, PERSEGUINDO, VOLTANDO

// Ponto fixo de origem da patrulha
posicao_inicial_x = x;
posicao_inicial_y = y;

ponto_retorno_x = x;
ponto_retorno_y = y;

#endregion////////////////////////////////


#region/////////------CONFIGURAÇÕES DA PATRULHA

velocidade = 2;

// Dimensões do retângulo de patrulha (em pixels)
distancia_horizontal = 400; 
distancia_vertical = 200;   

passos_dados = 0;
direcao_atual = 0; // 0 = Direita, 90 = Cima, 180 = Esquerda, 270 = Baixo

// Controle de pausas durante a patrulha
esta_parado = false;
tempo_parado = 0;
tempo_movimento = irandom_range(180, 420); // Anda entre 3 e 7 segundos

#endregion////////////////////////////////


#region/////////------VISÃO E PERSEGUIÇÃO

distancia_visao = 120;// Distância em pixels para detectar o jogador
distancia_perder = 200; // Distância para desistir de perseguir
velocidade_chase = 3;// Velocidade enquanto persegue

#endregion////////////////////////////////
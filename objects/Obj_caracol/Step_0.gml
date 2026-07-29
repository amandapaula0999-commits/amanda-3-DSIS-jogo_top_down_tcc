#region/////////------SISTEMA DE MORTE E DANO

// Checa se a vida zerou
if (vida <= 0 && !morrendo) {
    morrendo = true;
}

// Efeito de desaparecer ao morrer
if (morrendo) {
    image_alpha -= 0.02;
    if (image_alpha <= 0) instance_destroy();
    exit; // Interrompe o evento para não executar o movimento se estiver morrendo
}

#endregion////////////////////////////////


#region/////////------MÁQUINA DE ESTADOS E MOVIMENTAÇÃO

// Só executa a lógica se o jogador existir na sala
if (instance_exists(Obj_jogador)) {
    
    // Calcula a distância atual até o jogador
    var _dist_jogador = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);

    switch (estado) {
        
        // --- ESTADO PATRULHA ---
        case "PATRULHA":
            if (esta_parado) {
                // Diminui o tempo de pausa
                tempo_parado--;
                
                // Quando o tempo de pausa acabar, volta a andar
                if (tempo_parado <= 0) {
                    esta_parado = false;
                    tempo_movimento = irandom_range(180, 480); 
                }
            } else {
                // Movimenta no retângulo
                x += lengthdir_x(velocidade, direcao_atual);
                y += lengthdir_y(velocidade, direcao_atual);
                passos_dados += velocidade;

                var _limite_atual = distancia_vertical;
                if (direcao_atual == 0 || direcao_atual == 180) {
                    _limite_atual = distancia_horizontal;
                }

                // Faz a curva de 90 graus no circuito
                if (passos_dados >= _limite_atual) {
                    passos_dados = 0;
                    direcao_atual = (direcao_atual + 90) mod 360;
                }

                // Conta o tempo do movimento
                tempo_movimento--;
                
                // Quando o tempo de movimento acaba, entra em pausa temporária
                if (tempo_movimento <= 0) {
                    esta_parado = true;
                    tempo_parado = irandom_range(60, 240); 
                }
            }

            // Transição: Detectou o jogador no alcance de visão
            if (_dist_jogador <= distancia_visao) {
                ponto_retorno_x = posicao_inicial_x;
                ponto_retorno_y = posicao_inicial_y;
                
                estado = "PERSEGUINDO";
            }
            break;


        // --- ESTADO PERSEGUINDO ---
        case "PERSEGUINDO":
            var _dir_jogador = point_direction(x, y, Obj_jogador.x, Obj_jogador.y);
     
            // Atualiza a direção do movimento
            direcao_atual = _dir_jogador; 
    
            x += lengthdir_x(velocidade_chase, _dir_jogador);
            y += lengthdir_y(velocidade_chase, _dir_jogador);

            // Transição: Jogador se distanciou demais
            if (_dist_jogador >= distancia_perder) {
                estado = "VOLTANDO";
            }
            break;


        // --- ESTADO VOLTANDO ---
        case "VOLTANDO":
            var _dir_retorno = point_direction(x, y, ponto_retorno_x, ponto_retorno_y);
            direcao_atual = _dir_retorno;
            
            x += lengthdir_x(velocidade, _dir_retorno);
            y += lengthdir_y(velocidade, _dir_retorno);

            // Transição: Jogador reapareceu na visão
            if (_dist_jogador <= distancia_visao) {
                estado = "PERSEGUINDO";
            }

            // Chegada ao ponto de origem inicial (menos de 4px)
            if (point_distance(x, y, ponto_retorno_x, ponto_retorno_y) <= 4) {
                x = ponto_retorno_x; 
                y = ponto_retorno_y;
                
                // Reseta a rotina de patrulha limpa
                passos_dados = 0;
                direcao_atual = 0;
                esta_parado = false;
                tempo_movimento = irandom_range(180, 480);
                
                estado = "PATRULHA";
            }
            break;
            
    } // Fim do switch(estado)
    
} // Fim do if(instance_exists)

#endregion////////////////////////////////


#region/////////------CONTROLE DE SPRITES

//  (0 = Direita, 1 = Cima, 2 = Esquerda, 3 = Baixo)
var _lado = (direcao_atual div 90) mod 4;

// Checa se está se movimentando
var _movendo = false;
if (estado == "PATRULHA" && !esta_parado) _movendo = true;
if (estado == "PERSEGUINDO" || estado == "VOLTANDO") _movendo = true;

if (_movendo) {
    switch (_lado) {
        case 0: sprite_index = Spr_inimigo_andando_direita; break;
        case 1: sprite_index = Spr_inimigo_andando_cima; break;
        case 2: sprite_index = Spr_inimigo_andando_esqueda; break;
        case 3: sprite_index = Spr_inimigo_andando_baixo; break;
    }
} 
else {
    switch (_lado) {
        case 0: sprite_index = Spr_inimigo_parado_direita; break;
        case 1: sprite_index = Spr_inimigo_parado_cima; break;
        case 2: sprite_index = Spr_inimigo_parado_esqueda; break;
        case 3: sprite_index = Spr_inimigo_parado_baixo; break;
    }
}

#endregion////////////////////////////////
#region/////////------VERIFICAÇÃO DE DERROTA E TEMPORIZADOR (POÇA DE ÁCIDO)

//  Checa se o chefe está tocando na poça de ácido
if (place_meeting(x, y, Obj_acido)) {
    derrotado = true; // Entra no estado de derrotado/paralisado
    esperando_levantar = false; // Garante que a contagem para levantar só comece após a poça sumir
    alarm[0] = -1; // Desativa/cancela o alarme de recuperação enquanto ainda estiver pisando no ácido
} 
//  Quando a poça sumir (sem colisão com o ácido) e ele ainda estiver caído
else if (derrotado && !esperando_levantar) {
    esperando_levantar = true; // Marca que o temporizador para levantar já iniciou
    alarm[0] = game_get_speed(gamespeed_fps) * 5; // Inicia a contagem de 5 segundos para se levantar
}

#endregion////////////////////////////////


#region/////////------APARIÇÃO, PERSEGUIÇÃO E RETORNO DO BOSS

// Chefe em estado derrotado: para completamente e troca para a animação de caído
if (derrotado) {
    speed = 0; // Para todo o movimento no mapa
    sprite_index = Spr_boos_caido; // Exibe o sprite dele caído no chão
} 
// Chefe ativo: só atua se a chave global foi coletada e o jogador existe
else if (global.chave_pega && instance_exists(Obj_jogador)) {
    
    visible = true; // Torna o chefe visível na tela
    
    // Verifica se a posição do jogador está dentro do objeto da área do boss
    var _jogador_na_area = position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos);
    
    if (_jogador_na_area) {
        // Se o jogador estiver na área: persegue na direção dele com velocidade normal
        move_towards_point(Obj_jogador.x, Obj_jogador.y, velocidade_boss);
    } else {
        // Se o jogador saiu da área: calcula a distância até a posição inicial
        var _distancia_origem = point_distance(x, y, x_inicial, y_inicial);
        
        if (_distancia_origem > 2) {
            // Retorna em direção à sua posição inicial com velocidade de retorno
            move_towards_point(x_inicial, y_inicial, velocidade_retorno);
        } else {
            // Chegou à posição de origem: encerra o movimento e trava nas coordenadas exatas
            speed = 0;
            x = x_inicial;
            y = y_inicial;
        }
    }
} else {
    // Caso a chave ainda não tenha sido coletada ou o jogador não exista: permanece invisível e parado
    visible = false;
    speed = 0;
}

#endregion////////////////////////////////


#region/////////------TROCA DE SPRITES E DIREÇÃO (4 LADOS)

// A atualização de direção e sprites só é executada se o chefe NÃO estiver derrotado
if (!derrotado) {

    // Se estiver se movendo, guarda a direção atual do movimento
    if (speed > 0) {
        dir_olhando = direction;
    }

    // Converte o ângulo (0 a 360°) em 4 direções cardeais (0: Direita/Esquerda, 1: Cima, 2: Direita/Esquerda, 3: Baixo)
    var _dir_4_lados = floor((dir_olhando + 45) / 90) mod 4;

    if (speed > 0) {
        // SPRITES DE CAMINHADA (Em movimento)
        switch (_dir_4_lados) {
            case 0: sprite_index = Spr_andando_direita; break; // Olhando/Andando para a dirita
            case 1: sprite_index = Spr_andando_cima; break;     // Olhando/Andando para Cima
            case 2: sprite_index = Spr_andando_esquerda; break;  // Olhando/Andando para a esquerda
            case 3: sprite_index = Spr_andando_baixo; break;    // Olhando/Andando para Baixo
        }
    } else {
        // SPRITES PARADO (Em repouso)
        switch (_dir_4_lados) {
            case 0: sprite_index = Spr_parado_direita; break;   // Parado virado para a Direita
            case 1: sprite_index = Spr_parado_cima; break;      // Parado virado para Cima
            case 2: sprite_index = Spr_parado_esquerda; break;  // Parado virado para a Esquerda
            case 3: sprite_index = Spr_parado_baixo; break;     // Parado virado para Baixo
        }
    }

}

#endregion////////////////////////////////
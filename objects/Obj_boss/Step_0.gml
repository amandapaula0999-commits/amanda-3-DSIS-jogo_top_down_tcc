#region APARIÇÃO, PERSEGUIÇÃO E RETORNO DO BOSS

if (global.chave_pega && instance_exists(Obj_jogador)) {
    
    visible = true;
    
    var _jogador_na_area = position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos);
    
    if (_jogador_na_area) {
        // PERSEGUE O JOGADOR
        move_towards_point(Obj_jogador.x, Obj_jogador.y, velocidade_boss);
    } else {
        // VOLTA PARA O CANTO ORIGINÁRIO
        var _distancia_origem = point_distance(x, y, x_inicial, y_inicial);
        
        if (_distancia_origem > 2) {
            move_towards_point(x_inicial, y_inicial, velocidade_retorno);
        } else {
            speed = 0;
            x = x_inicial;
            y = y_inicial;
        }
    }
} else {
    visible = false;
    speed = 0;
}

#endregion


#region TROCA DE SPRITES E DIREÇÃO (4 LADOS)

// Atualiza a direção que está olhando apenas quando o chefe se move
if (speed > 0) {
    dir_olhando = direction;
}

// Converte a direção em 4 setores (0: Direita, 1: Cima, 2: Esquerda, 3: Baixo)
var _dir_4_lados = floor((dir_olhando + 45) / 90) mod 4;

if (speed > 0) {
    // SE ESTIVER ANDANDO
    switch (_dir_4_lados) {
        case 0: sprite_index = Spr_andando_esquerda; break;
        case 1: sprite_index = Spr_andando_cima; break;
        case 2: sprite_index = Spr_andando_direita; break;
        case 3: sprite_index = Spr_andando_baixo; break;
    }
} else {
    // SE ESTIVER PARADO
    switch (_dir_4_lados) {
        case 0: sprite_index = Spr_parado_esquerda; break;
        case 1: sprite_index = Spr_parado_cima; break;
        case 2: sprite_index = Spr_parado_direita; break;
        case 3: sprite_index = Spr_parado_baixo; break;
    }
}

#endregion
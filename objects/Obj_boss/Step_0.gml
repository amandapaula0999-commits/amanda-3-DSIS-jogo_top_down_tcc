#region /////////------ MAQUINA DE ESTADOS DO BOSS

// ESTADO: ESPERANDO (Invisível e sem colisão até pegar a chave)
if (estado == "esperando") {
    visible = false;
    mask_index = -1; // Desativa a colisão para não causar dano enquanto oculto
    speed = 0;
    
    if (global.chave_pega == true && instance_exists(Obj_jogador)) {
        if (position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos)) {
            
            // Posiciona no local correto
            x = pos_x_inicial;
            y = pos_y_inicial;
            
            // Fica visível e reativa a colisão normal do corpo
            visible = true;
            mask_index = sprite_index;
            
            // Pausa por 2 segundos antes de perseguir
            estado = "pausado";
            alarm[0] = game_get_speed(gamespeed_fps) * 2;
        }
    }
}

// ESTADO: PAUSADO
else if (estado == "pausado") {
    speed = 0;
}

// ESTADO: PERSEGUINDO
else if (estado == "perseguindo") {
    if (!instance_exists(Obj_jogador)) {
        speed = 0;
        estado = "voltando";
    } 
    else {
        var _jogador_na_sala = position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos);

        if (_jogador_na_sala) {
            move_towards_point(Obj_jogador.x, Obj_jogador.y, velocidade);
        } else {
            speed = 0;
            estado = "voltando";
        }
    }
}

// ESTADO: VOLTANDO
else if (estado == "voltando") {
    if (instance_exists(Obj_jogador) && position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos)) {
        estado = "pausado";
        alarm[0] = game_get_speed(gamespeed_fps) * 2;
    } 
    else {
        move_towards_point(pos_x_inicial, pos_y_inicial, velocidade);
        
        if (point_distance(x, y, pos_x_inicial, pos_y_inicial) <= velocidade) {
            x = pos_x_inicial;
            y = pos_y_inicial;
            speed = 0;
            estado = "esperando";
        }
    }
}

#endregion ////////////////////////////////


#region /////////------ CHECAGEM DO ÁCIDO E TROCA DE SPRITES

// Se já foi derrotado, trava na sprite caído
if (estado == "derrotado_acido") {
    sprite_index = Spr_boos_caido;
    speed = 0;
}
else {
    // --- COLISÃO DO ÁCIDO (PÉS) ---
    var _largura_pes = 12; // Ajuste para os lados dos pés
    var _altura_pe = 6;    // Ajuste para a altura dos pés
    
    var _pisou_no_acido = collision_rectangle(
        x - _largura_pes, y - _altura_pe, 
        x + _largura_pes, y, 
        Obj_acido, false, true
    );

    if (_pisou_no_acido) {
        estado = "derrotado_acido";
        speed = 0;
        sprite_index = Spr_boos_caido;
    } 
    else {
        // --- DIREÇÃO BASEADA NO ÂNGULO (DIRECTION) ---
        if (speed > 0) {
            image_speed = 1;
            
            if (direction >= 45 && direction < 135) {
                lado = 1; // Cima
            }
            else if (direction >= 135 && direction < 225) {
                lado = 3; // Esquerda
            }
            else if (direction >= 225 && direction < 315) {
                lado = 0; // Baixo
            }
            else {
                lado = 2; // Direita
            }
        } else {
            image_speed = 0.5;
        }

        // --- SELEÇÃO DE SPRITE (PARADO OU ANDANDO) ---
        if (speed > 0) {
            // Sprites ANDANDO
            if (lado == 0) sprite_index = Spr_andando_baixo;
            if (lado == 1) sprite_index = Spr_andando_cima;
            if (lado == 2) sprite_index = Spr_andando_esquerda;
            if (lado == 3) sprite_index = Spr_andando_direita;
        } 
        else {
            // Sprites PARADO
            if (lado == 0) sprite_index = Spr_parado_baixo;
            if (lado == 1) sprite_index = Spr_parado_cima;
            if (lado == 2) sprite_index = Spr_parado_esquerda;
            if (lado == 3) sprite_index = Spr_parado_direita;
        }
    }
}

#endregion ////////////////////////////////
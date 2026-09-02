#region /////////------ MAQUINA DE ESTADOS DO BOSS

// ESTADO: ESPERANDO
if (estado == "esperando") {
    visible = false;
    
    if (global.chave_pega == true && instance_exists(Obj_jogador)) {
        if (position_meeting(Obj_jogador.x, Obj_jogador.y, Obj_area_boos)) {
            
            // Reseta a posição para onde foi colocado no editor
            x = pos_x_inicial;
            y = pos_y_inicial;
            
            // Fica visível
            visible = true;
            
            // Muda para um estado de pausa
            estado = "pausado";
            
            // Define o tempo de espera: 2 segundos
            alarm[0] = game_get_speed(gamespeed_fps) * 2;
        }
    }
}

// ESTADO: PAUSADO (O Boss fica parado esperando o alarme)
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
        // Se o jogador voltar enquanto ele recua, faz a pausa de 2s novamente
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

// Prioridade máxima: se estiver no estado derrotado
if (estado == "derrotado_acido") {
    sprite_index = Spr_boos_caido;
    speed = 0;
}
else {
    // Se pisar no ácido durante a perseguição ou volta
    if (place_meeting(x, y, Obj_acido)) {
        estado = "derrotado_acido";
        speed = 0;
        sprite_index = Spr_boos_caido;
    } 
    else {
        #region /////////------ ATUALIZAÇÃO DE DIREÇÃO (LADO)

        // Atualiza o lado com base na velocidade vetorial nativa
        if (hspeed > 0) lado = 2; // Direita
        if (hspeed < 0) lado = 3; // Esquerda
        if (vspeed > 0) lado = 0; // Baixo
        if (vspeed < 0) lado = 1; // Cima

        #endregion ////////////////////////////////

        #region /////////------ SELEÇÃO DE SPRITE

        if (hspeed != 0 || vspeed != 0) {
            // Sprites em movimento
            if (lado == 0) sprite_index = Spr_andando_baixo;
            if (lado == 1) sprite_index = Spr_andando_cima;
            if (lado == 2) sprite_index = Spr_andando_direita;
            if (lado == 3) sprite_index = Spr_andando_esquerda;
        }
        else {
            // Sprites parado
            if (lado == 0) sprite_index = Spr_parado_baixo;
            if (lado == 1) sprite_index = Spr_parado_cima;
            if (lado == 2) sprite_index = Spr_parado_direita;
            if (lado == 3) sprite_index = Spr_parado_esquerda;
        }

        #endregion ////////////////////////////////
    }
}

#endregion ////////////////////////////////
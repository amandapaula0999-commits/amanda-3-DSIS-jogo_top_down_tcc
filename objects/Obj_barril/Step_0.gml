#region /////////------ LÓGICA E INTERAÇÃO COM HITBOX

// Detecta o ataque e inicia a queda
if (!quebrado) {
    if (place_meeting(x, y, Obj_hitbox)) {
        quebrado = true;
        mask_index = -1; // Desativa a colisão física
        
        sprite_index = Spr_barril_caindo;
        image_index = 0;
        image_speed = 1;
        
        // Cria a poça de ácido no chão
        poca_acido = instance_create_layer(x, y, "Instances", Obj_acido);
    }
}

// Quando chegar no último frame da animação de queda, trava o frame e inicia a transição
if (sprite_index == Spr_barril_caindo) {
    var _ultimo_frame = image_number - 1;
    
    if (image_index >= _ultimo_frame) {
        image_index = _ultimo_frame; // Trava o desenho no último frame
        image_speed = 0;             // Interrompe a animação para não dar loop
        transicao_iniciada = true;
    }
}

// Se a transição começou, reduz o alpha (transparência)
if (transicao_iniciada) {
    alpha_caindo -= 0.005; // Ajuste para sumir mais rápido ou mais devagar
    
    // Quando sumir por completo, fixa permanentemente na sprite do chão
    if (alpha_caindo <= 0) {
        alpha_caindo = 0;
        sprite_index = Spr_barril_chao;
        transicao_iniciada = false;
    }
}

#endregion ////////////////////////////////
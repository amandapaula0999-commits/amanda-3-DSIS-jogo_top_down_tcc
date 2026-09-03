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

// Verifica se chegou no penúltimo frame para iniciar o sumiço gradual
if (sprite_index == Spr_barril_caindo) {
    var _penultimo_frame = image_number - 2;
    
    if (image_index >= _penultimo_frame) {
        transicao_iniciada = true;
    }
}

// Se a transição começou, reduz o alpha (transparência)
if (transicao_iniciada) {
    alpha_caindo -= 0.005; // Ajuste este valor se quiser mais rápido ou mais devagar
    
    // Quando sumir por completo, fixa permanentemente na sprite do chão
    if (alpha_caindo <= 0) {
        alpha_caindo = 0;
        sprite_index = Spr_barril_chao;
        transicao_iniciada = false;
    }
}

#endregion ////////////////////////////////
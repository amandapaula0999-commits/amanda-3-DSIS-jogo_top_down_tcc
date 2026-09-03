#region/////////------DETECÇÃO DE IMPACTO DO CANO

// Se o barril ainda não foi atingido, verifica colisão com ataques
if (!atingido) {
    if (place_meeting(x, y, Obj_canoAremesado) || place_meeting(x, y, Obj_hitbox)) {
        atingido = true; // Marca o barril como atingido
        sprite_index = Spr_barril_caindo; // Inicia a animação de queda
        image_index = 0; // Começa a animação no primeiro frame
    }
}

#endregion////////////////////////////////


#region/////////------APARIÇÃO NO CHÃO E CRIAÇÃO DO ÁCIDO

// Exibe o barril caído e cria a poça quando a animação atinge o frame 6
if (atingido && image_index >= 6) {
    mostrar_chao = true; // Ativa a exibição do sprite do barril no chão (Spr_barril_chao)
    
    // Instancia o ácido uma única vez para não criar múltiplos objetos
    if (!acido_criado) {
        instance_create_layer(x, y, layer, Obj_acido); // Cria o Obj_acido na posição do barril
        acido_criado = true; // Garante que a poça não seja recriada nos frames seguintes
    }
}

#endregion////////////////////////////////


#region/////////------EFEITO DE DESAPARECER (FADE OUT RÁPIDO)

// Reduz a transparência do efeito de queda gradualmente após o fim da animação
if (sumindo) {
    alfa_caindo -= 0.0030; // Reduz o valor de alfa rapidamente a cada frame
    
    // Desativa o efeito assim que a transparência chegar a zero
    if (alfa_caindo <= 0) {
        alfa_caindo = 0; // Trava o alfa em 0 (totalmente invisível)
        sumindo = false; // Desativa o ciclo de fade out
    }
}

#endregion////////////////////////////////
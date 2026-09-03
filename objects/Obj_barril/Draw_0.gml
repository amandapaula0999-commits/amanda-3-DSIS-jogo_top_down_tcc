#region /////////------ DESENHO E EFEITO DE SUMIR SUAVEMENTE

if (transicao_iniciada) {
    //Desenha o barril no chão por baixo (totalmente visível)
    draw_sprite_ext(Spr_barril_chao, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    
    // Desenha o barril caindo por cima sumindo aos poucos (alpha reduzindo)
    draw_sprite_ext(Spr_barril_caindo, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha_caindo);
} else {
    // Desenha o objeto normalmente se não estiver transicionando
    draw_self();
}

#endregion ////////////////////////////////
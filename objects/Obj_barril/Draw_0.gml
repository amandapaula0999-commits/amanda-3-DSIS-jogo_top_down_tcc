#region/////////------DESENHO DA ANIMAÇÃO DE QUEDA E DO BARRIL NO CHÃO

// Desenha o efeito/animação de queda enquanto o alfa for maior que zero (aplica o efeito de transparência)
if (alfa_caindo > 0) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alfa_caindo);
}

//  Desenha o sprite do barril caído (Spr_barril_chao) por cima, totalmente visível, quando ativado
if (mostrar_chao) {
    draw_sprite(Spr_barril_chao, 0, x, y); // Renderiza o barril fixo no chão na posição original
}

#endregion////////////////////////////////
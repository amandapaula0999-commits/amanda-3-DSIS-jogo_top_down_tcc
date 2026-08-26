#region/////////------DESENHO COM ESCALA DINÂMICA

// Só desenha se a escala for maior que zero
if (escala > 0.01) {
    
    // Desenha a sprite aplicando o efeito de zoom/escala
    draw_sprite_ext(Sprite34, 0, x, y, escala, escala, 0, c_white, 1);

    //O texto só aparece quando a caixa estiver quase totalmente aberta
    if (escala >= 0.8) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);

        // Posição centralizada da caixa de texto
        var _texto_y = y - 24;

        // Desenha o texto com quebra automática a cada 75px de largura
        draw_text_ext(x, _texto_y, texto_fala, -1, 75);

        // Reseta as configurações de desenho para o padrão do GameMaker
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
    }
}

#endregion////////////////////////////////
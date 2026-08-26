#region/////////------DESENHO RECALIBRADO DENTRO DA CAIXA

if (escala > 0.01) {
    
    // Desenha o balão
    draw_sprite_ext(Spr_balao_fala, 0, x, y, escala, escala, 0, c_white, 1);

    //  Desenha o texto dentro das margens
    if (escala >= 0.8) {
        
        draw_set_font(Font_de_fala);
        draw_set_color(c_white);
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

     
        // - X: empurrado para a direita (x - 42)
        // - Y: baixado para ficar abaixo da borda superior (y - 62)
        var _texto_x = x - 42;
        var _texto_y = y - 62;

        // Recorta a string para o efeito de digitação
        var _texto_parcial = string_copy(texto_fala, 1, floor(letras_exibidas));

        // Reduzido para 80px para dar uma folga nas bordas laterais
        draw_text_ext(_texto_x, _texto_y, _texto_parcial, -1, 80);

        // Reseta as configurações do GameMaker
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

#endregion////////////////////////////////
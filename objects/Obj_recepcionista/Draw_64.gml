#region/////////------DESENHO DA INTERFACE DE DIÁLOGO 

if (exibir_dialogo) {
    // Pega as dimensões da interface gráfica
    var gui_largura = display_get_gui_width();
    var gui_altura = display_get_gui_height();

    // Define a posição centralizada na parte inferior da tela
    var pos_x = gui_largura / 2;
    var pos_y = gui_altura - 80;

    // Desenha o sprite do balão/caixa de diálogo
    draw_sprite(Spr_balao_fala, 0, pos_x, pos_y);

    // Configurações de alinhamento e cor do texto
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    // Parâmetros de formatação da mensagem
    var sep = 20;   // Espaçamento vertical entre linhas
    var w_max = 820; // Largura máxima antes de quebrar a linha

    // Desenha o texto com efeito de digitação progressiva
    draw_text_ext(pos_x, pos_y, texto_atual, sep, w_max);
}

#endregion////////////////////////////////
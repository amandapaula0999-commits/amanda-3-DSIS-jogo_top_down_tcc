#region/////////------CAIXA DE TEXTO NA PARTE INFERIOR DA TELA

// Pega a largura e altura exatas da tela/câmera do jogador
var _largura_gui = display_get_gui_width();
var _altura_gui = display_get_gui_height();

// Define a altura da caixa de texto (ex: 120 pixels de altura)
var _altura_caixa = 120;

// Posição da caixa (colada na parte de baixo)
var _x1 = 0;
var _y1 = _altura_gui - _altura_caixa;
var _x2 = _largura_gui;
var _y2 = _altura_gui;

// Desenha o fundo da caixa (Retângulo escuro com borda)
draw_set_color(c_black);
draw_set_alpha(0.8); // 80% de transparência
draw_rectangle(_x1, _y1, _x2, _y2, false);

// Desenha a borda da caixa
draw_set_color(c_white);
draw_set_alpha(1.0);
draw_rectangle(_x1, _y1, _x2, _y2, true);

// 5. Configuração e desenho do texto interno
draw_set_font(Font_de_fala);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _padding = 16;
var _texto_x = _x1 + _padding;
var _texto_y = _y1 + _padding;
var _largura_texto_max = _largura_gui - (_padding * 2);

// Efeito de digitação (opcional)
var _texto_parcial = string_copy(texto_fala, 1, floor(letras_exibidas));

// Desenha o texto respeitando os limites da tela
draw_text_ext(_texto_x, _texto_y, _texto_parcial, -1, _largura_texto_max);

#endregion////////////////////////////////
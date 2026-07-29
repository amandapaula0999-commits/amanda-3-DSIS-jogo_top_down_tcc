

#region/////////------CONFIGURAÇÕES DA BARRA DE VIDA

// Posição na tela (X = 20px da esquerda, Y = 20px do topo)
var _x1 = 20;
var _y1 = 20;

// Largura e Altura da barra
var _largura = 200;
var _altura = 16;

// Posição final 
var _x2 = _x1 + _largura;
var _y2 = _y1 + _altura;

#endregion////////////////////////////////


#region/////////------DESENHO DA BARRA E INTERFACE

// FUNDO DA BARRA (Cinza Escuro)
draw_set_color(c_dkgray);
draw_rectangle(_x1, _y1, _x2, _y2, false);

// PREENCHIMENTO DA VIDA (Vermelho)
// Calcula quanto a vida representa proporcionalmente em pixels
var _preenchimento_x = _x1 + (vida / vida_max) * _largura;

// Só desenha a vida se ela for maior que zero
if (vida > 0) {
    draw_set_color(c_red);
    draw_rectangle(_x1, _y1, _preenchimento_x, _y2, false);
}

// BORDA DE CONTORNO (Branca)
draw_set_color(c_white);
draw_rectangle(_x1, _y1, _x2, _y2, true);

// TEXTO COM OS NÚMEROS (Ex: Vida: 30 / 30)
draw_set_color(c_white);
draw_text(_x1, _y2 + 4, "Vida: " + string(max(0, vida)) + " / " + string(vida_max));

#endregion////////////////////////////////
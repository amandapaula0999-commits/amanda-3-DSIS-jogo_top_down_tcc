#region/////////------FINAL DA ANIMAÇÃO DE QUEDA E INÍCIO DO FADE OUT

// Executado quando a animação do Spr_barril_caindo chega ao último frame
if (sprite_index == Spr_barril_caindo) {
    image_speed = 0;                  // Interrompe a animação para não reiniciar o ciclo
    image_index = image_number - 1;   // Trava a exibição exatamente no último frame do sprite
    sumindo = true;                   // Ativa a flag no Step Event para iniciar o desaparecimento (fade out)
}

#endregion////////////////////////////////

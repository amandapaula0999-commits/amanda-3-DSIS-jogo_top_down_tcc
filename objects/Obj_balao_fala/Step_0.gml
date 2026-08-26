#region/////////------ANIMAÇÃO DE ABERTURA E DIGITAÇÃO

// Animação de abertura do balão
escala = lerp(escala, escala_alvo, velocidade_anim);

//  Aumenta a quantidade de letras exibidas com o tempo
if (escala >= 0.8) {
    if (letras_exibidas < string_length(texto_fala)) {
        letras_exibidas += velocidade_digitacao;
    }
}

// Posição em cima do NPC
if (dono != noone && instance_exists(dono)) {
    x = dono.x;
    y = dono.y - 18;
}

#endregion////////////////////////////////
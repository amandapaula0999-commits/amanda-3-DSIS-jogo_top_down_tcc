#region/////////------ANIMAÇÃO E SEGUIR O NPC

// Efeito de animação abrindo suavemente
escala = lerp(escala, escala_alvo, velocidade_anim);

//Acompanha o NPC em tempo real se ele estiver se movendo
if (dono != noone && instance_exists(dono)) {
    x = dono.x;
    y = dono.y - 32; // Ajuste para a altura acima da cabeça do NPC
}

#endregion////////////////////////////////
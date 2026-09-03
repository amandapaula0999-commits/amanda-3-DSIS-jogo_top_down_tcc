#region TEMPORIZADOR DE DESTRUIÇÃO DO ÁCIDO

// Verifica se o chefe colidiu com esta poça de ácido
if (place_meeting(x, y, Obj_boss)) {
    // Se o alarme ainda não estiver rodando, inicia a contagem de 2 segundos
    if (alarm[0] == -1) {
        alarm[0] = game_get_speed(gamespeed_fps) * 2;
    }
}

#endregion
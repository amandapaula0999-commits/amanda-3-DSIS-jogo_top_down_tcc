#region/////////------COLETAR CANO DO CHÃO (TECLA E)


// Só pode coletar se o cano parou de voar (speed == 0) e o jogador apertar "E"
if (speed == 0 && keyboard_check_pressed(ord("E"))) {
    
    // Recria o cano equipado na mão do jogador 
    var _novo_cano = instance_create_layer(other.x, other.y, "Instances", Obj_cano);
    _novo_cano.dono = other.id; // Transfere a posse para o jogador
    
    // Destrói este objeto que estava caído no chão
    instance_destroy(); 
}

#endregion////////////////////////////////
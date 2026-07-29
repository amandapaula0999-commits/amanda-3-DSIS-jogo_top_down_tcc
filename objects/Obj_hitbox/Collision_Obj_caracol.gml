#region/////////------COLISÃO E IMPACTO DO GOLPE


// Subtrai a vida do caracol se a variável existir
if (variable_instance_exists(other, "vida")) {
    
    // Aplica o dano da paulada
    other.vida -= dano; 
    
    // Ativa o piscar vermelho no caracol por 5 frames
    other.tomou_dano = true;
    other.alarm[0] = 5;
    
    //Aplica um leve empurrão no inimigo
    var _dir = point_direction(x, y, other.x, other.y);
    other.x += lengthdir_x(6, _dir);
    other.y += lengthdir_y(6, _dir);
}

// Destrói para acerte apenas 1 vez por ataque
instance_destroy();

#endregion////////////////////////////////
#region/////////------COLISÃO E APLICAÇÃO DE DANO


// Checa se o objeto atingido possui a variável "vida"
if (variable_instance_exists(other, "vida")) {
    other.vida -= dano;
    
    // Ativa o pisca pisca vermelho 
    other.tomou_dano = true;
    other.alarm[0] = 5; // Mantém o piscar por 5 frames
}

// Destrói o tiro após acertar o alvo
instance_destroy();

#endregion////////////////////////////////
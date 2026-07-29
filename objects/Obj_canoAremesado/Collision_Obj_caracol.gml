#region/////////------COLISÃO E IMPACTO DO ARREMESSO

// Só causa dano e ativa o efeito se o cano ainda estiver voando (speed > 0)
if (speed > 0) {
    
    // Aplica o dano no inimigo atingido
    if (variable_instance_exists(other, "vida")) {
        other.vida -= dano;
        
        // Ativa o piscar vermelho 
        other.tomou_dano = true;
        other.alarm[0] = 5; // Pisca por 5 frames
    }
    
    // Faz o cano parar de girar
    speed = 0;
    rotacao_velocidade = 0;
}

#endregion////////////////////////////////
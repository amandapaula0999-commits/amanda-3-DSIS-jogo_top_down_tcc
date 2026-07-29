#region/////////------ATIVAÇÃO DO CHECKPOINT

// Se o checkpoint salvo no jogador ainda não for este objeto
if (other.checkpoint_x != x || other.checkpoint_y != y) {
    
    // Marca ess objeto como o novo ponto de renascimento
    other.checkpoint_x = x;
    other.checkpoint_y = y;
    
}

#endregion////////////////////////////////
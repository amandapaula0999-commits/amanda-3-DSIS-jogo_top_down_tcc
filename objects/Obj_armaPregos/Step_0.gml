#region/////////------SEGUE O JOGADOR E O MOUSE

if (dono != noone && instance_exists(dono)) {
    
    // Segue a posição exata do jogador
    x = dono.x;
    y = dono.y;
    
    // Calcula a direção apontando para o mouse
    var _direcao_mouse = point_direction(x, y, mouse_x, mouse_y);
    image_angle = _direcao_mouse; 
    
    // Inverte o sprite verticalmente para a arma não ficar de ponta-cabeça ao olhar para a esquerda
    if (_direcao_mouse > 90 && _direcao_mouse < 270) {
        image_yscale = -1; 
    } else {
        image_yscale = 1;  
    }
    
    #region/////////------DISPARAR O PREGO (BOTÃO DIREITO)
    
    if (mouse_check_button_pressed(mb_right)) {
        if (!recarregando) {
            if (municao_atual > 0) {
                
                // Gasta 1 prego
                municao_atual -= 1;
                
                // Calcula a saída do disparo na ponta do cano
                var _ponta_x = x + lengthdir_x(comprimento_cano, _direcao_mouse);
                var _ponta_y = y + lengthdir_y(comprimento_cano, _direcao_mouse);
                
                // Cria o projétil
                var _prego = instance_create_layer(_ponta_x, _ponta_y, "Instances", Obj_bala);
                _prego.direction = _direcao_mouse;
                _prego.image_angle = _direcao_mouse;
                _prego.dano = 5; // Define o dano da bala
                
            } 
        } 
    }
    
    #endregion////////////////////////////////
    
    
    #region/////////------SISTEMA DE RECARGA (BOTÃO ESQUERDO)
    
    if (mouse_check_button_pressed(mb_left) && !recarregando) {
        if (dono.caixas_mecanicas > 0) {
            
            recarregando = true; // Trava o disparo durante a recarga
            
            // Consome 1 caixa do inventário do jogador
            dono.caixas_mecanicas -= 1; 
            
            // Define o tempo da recarga (30 frames = 0.5s)
            alarm[0] = 30; 
            
        }
    }
    
    #endregion////////////////////////////////
    
} 

#endregion////////////////////////////////
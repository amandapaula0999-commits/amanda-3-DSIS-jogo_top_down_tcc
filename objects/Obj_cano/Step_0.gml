#region/////////------SEGUE O JOGADOR E O MOUSE

// Só executa o código se tiver um dono válido
if (dono != noone && instance_exists(dono)) {
    
    // Sempre acompanha a posição exata do jogador
    x = dono.x;
    y = dono.y;
    
    // Se não estiver atacando, mira no ponteiro do mouse
    if (!atacando) {
        
        sprite_index = Spr_cano; // Garante o sprite normal parado
        
        var _direcao_mouse = point_direction(x, y, mouse_x, mouse_y);
        image_angle = _direcao_mouse - 80;
        
        #region/////////------ATAQUE COM BOTÃO DIREITO
        
        if (mouse_check_button_pressed(mb_right)) {
            atacando = true;
            
            sprite_index = Spr_canoAtaque; // Muda para a animação de ataque
            
            // Tempo de duração do ataque (37 frames)
            alarm[0] = 37; 
            
            // Cria a Hitbox na frente do ataque
            var _hitbox_x = x + lengthdir_x(40, image_angle + 50);
            var _hitbox_y = y + lengthdir_y(40, image_angle + 50);
            
            var _hitbox = instance_create_layer(_hitbox_x, _hitbox_y, "Instances", Obj_hitbox);
            _hitbox.image_angle = image_angle;
            _hitbox.dano = dano_cano; 
        }
        
        #endregion////////////////////////////////
        
        
        #region/////////------ARREMESSO COM BARRA DE ESPAÇO
        
        if (keyboard_check_pressed(vk_space)) {
            var _dir_arremesso = point_direction(x, y, mouse_x, mouse_y);
            
            // Cria o projétil do cano arremessado
            var _cano_voador = instance_create_layer(x, y, "Instances", Obj_canoAremesado);
            _cano_voador.direction = _dir_arremesso;
            _cano_voador.image_angle = _dir_arremesso;
            
            // Destrói o cano na mão do jogador 
            instance_destroy(); 
        }
        
        #endregion////////////////////////////////
        
	}
    
} 

#endregion////////////////////////////////
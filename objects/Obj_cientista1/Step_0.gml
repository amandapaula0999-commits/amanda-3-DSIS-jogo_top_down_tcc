#region/////////------INTERAÇÃO COM A TECLA E

if (instance_exists(Obj_jogador)) {
    var _distancia = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);
    
    // Se o jogador estiver perto e apertar "E"
    if (_distancia <= 900 && keyboard_check_pressed(ord("E"))) {
        
        if (!instance_exists(meu_balao)) {
            // Cria o balão chamando o Obj_balao_fala
            meu_balao = instance_create_layer(x, y - 18, "Instances", Obj_balao_fala);
            meu_balao.dono = id;
            meu_balao.texto_fala = texto_npc;
        } 
        else {
            // Fecha o balão se apertar "E" novamente
            instance_destroy(meu_balao);
            meu_balao = noone;
        }
    }
}

#endregion////////////////////////////////
#region/////////------MOVIMENTAÇÃO DO JOGADOR

// Define os vetores de entrada (WASD)
var vetor_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vetor_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Velocidade base
var velocidade = max_vel;

// Cálculo da movimentação (Normalização pela Hipotenusa)
var qud_hip = (vetor_x * vetor_x) + (vetor_y * vetor_y);

if (qud_hip > 0)
{
    var hip = sqrt(qud_hip);

    // Divide pela hipotenusa para evitar andar mais rápido na diagonal
    vetor_x /= hip;
    vetor_y /= hip;

    // Define as velocidades horizontal e vertical finais
    velh = vetor_x * velocidade;
    velv = vetor_y * velocidade;
}
else
{
    velh = 0;
    velv = 0;
}

// Aplica o movimento na posição do jogador
x += velh;
y += velv;

#endregion////////////////////////////////


#region/////////------TROCA DE SPRITES

// Atualiza a direção que o jogador está olhando
if (velh > 0) lado = 2; // Direita
if (velh < 0) lado = 3; // Esquerda
if (velv > 0) lado = 0; // Baixo
if (velv < 0) lado = 1; // Cima

// Seleciona o sprite correspondente ao movimento ou parada
if (velh != 0 || velv != 0) 
{
    // Sprites em movimento
    if (lado == 0) sprite_index = Spr_jogador_andando_baixo;
    if (lado == 1) sprite_index = Spr_jogador_andando_cima;
    if (lado == 2) sprite_index = Spr_jogador_andando_direita;
    if (lado == 3) sprite_index = Spr_jogador_andando_esquerda;
} 
else 
{
    // Sprites parado
    if (lado == 0) sprite_index = Spr_jogador_parado_baixo;
    if (lado == 1) sprite_index = Spr_jogador_parado_cima;
    if (lado == 2) sprite_index = Spr_jogador_parado_direita;
    if (lado == 3) sprite_index = Spr_jogador_parado_esquerda;
}

#endregion////////////////////////////////


#region/////////------SISTEMA DE MORTE E CHECKPOINT

// Checa se a vida zerou
if (vida <= 0) {
    // Restaura a vida completa
    vida = vida_max;
    
    // Manda o jogador para a posição do Checkpoint ativo
    x = checkpoint_x;
    y = checkpoint_y;
    
    // Aplica invulnerabilidade temporária (1 segundo = 60 frames)
    invulneravel = true;
    alarm[0] = 60; 
    
    show_debug_message("Jogador morreu e renasc"); ////APAGAR!!!!!!!!!!
}

// Aplica efeito invulnerabilidade
if (invulneravel) {
    image_alpha = 0.2; // Fica transparente
} else {
    image_alpha = 1.0; // Volta ao normal
}

#endregion////////////////////////////////


#region/////////------INTERAÇÃO: PISTOLA DE PREGOS

// Procura a pistola de pregos
var _arma_perto = instance_nearest(x, y, Obj_armaPregos);

if (_arma_perto != noone) {
    // Só permite pegar se a arma estiver no chão (sem dono)
    if (_arma_perto.dono == noone) {
        
        var _distancia = point_distance(x, y, _arma_perto.x, _arma_perto.y);
        
        // Se estiver ao alcance e pressionar "E"
        if (_distancia <= 20 && keyboard_check_pressed(ord("E"))) {
            _arma_perto.dono = id; // Define jogador como dono
        }
    }
}

#endregion////////////////////////////////


#region/////////------INTERAÇÃO: CAIXA DE PREGOS

// Procura a caixa de pregos mais próxima
var _caixa_perto = instance_nearest(x, y, Obj_caixaPregos);

if (_caixa_perto != noone) {
    var _dist_caixa = point_distance(x, y, _caixa_perto.x, _caixa_perto.y);
    
    // Se estiver perto e pressionar "E"
    if (_dist_caixa <= 50 && keyboard_check_pressed(ord("E"))) {
        caixas_mecanicas += 1; // Adiciona ao inventário
        instance_destroy(_caixa_perto); // Remove o objeto do mapa
        
        show_debug_message("Você pegou uma caixa! Total no inventário: " + string(caixas_mecanicas)); //////PAGAR!!
    }
}

#endregion////////////////////////////////


#region/////////------INTERAÇÃO: CANO

// Procura o cano mais
var _cano_perto = instance_nearest(x, y, Obj_cano);

if (_cano_perto != noone) {
    // Checa se o cano está sem dono
    if (_cano_perto.dono == noone) {
        
        var _dist_cano = point_distance(x, y, _cano_perto.x, _cano_perto.y);
        
        // Se estiver perto e pressionar "E"
        if (_dist_cano <= 20 && keyboard_check_pressed(ord("E"))) {
            _cano_perto.dono = id; // O jogador vira o dono do cano hihih
        }
    }
}

#endregion////////////////////////////////
#region/////////------ESTADOS DO BARRIL E TRANSIÇÕES

atingido = false; // Define se o barril sofreu colisão com algum ataque/cano (true/false)
mostrar_chao = false; // Controla quando desenhar o sprite do barril no chão (Spr_barril_chao)

#endregion////////////////////////////////


#region/////////------EFEITO VISUAL E CRIAÇÃO DE ÁCIDO

sumindo = false; // Ativa a diminuição de transparência da poça de queda (fade out)
alfa_caindo = 1; // Transparência atual do efeito (1 = 100% visível, 0 = invisível)

acido_criado = false; // Garante que a poça de ácido (Obj_acido) seja instanciada uma única vez

#endregion////////////////////////////////
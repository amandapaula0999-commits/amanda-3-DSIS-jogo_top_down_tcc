#region/////////------MOVIMENTAÇÃO E ORIGEM

velocidade_boss = 2; // Velocidade de caminhada ao perseguir o jogador
velocidade_retorno = 3; // Velocidade de caminhada ao voltar para a posição inicial

x_inicial = x; // Guarda a coordenada X onde o chefe foi colocado no mapa
y_inicial = y; // Guarda a coordenada Y onde o chefe foi colocado no mapa

speed = 0; // Velocidade inicial do movimento nativo do GameMaker
dir_olhando = 270; // Direção para onde está olhando em graus (270 = Baixo)

#endregion////////////////////////////////


#region/////////------ESTADOS E VISIBILIDADE

visible = false; // Controla se o chefe está visível (inicia oculto até a chave ser pega)

derrotado = false; // Indica se o chefe está caído por causa do ácido (true/false)
esperando_levantar = false; // Controla se o tempo de 5 segundos para se levantar já está contando

#endregion////////////////////////////////
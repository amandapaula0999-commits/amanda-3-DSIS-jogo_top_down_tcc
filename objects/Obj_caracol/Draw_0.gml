#region/////////------DESENHO E EFEITO DE DANO


if (tomou_dano) {
    //fica vermelho ao levar um golpe
    gpu_set_fog(true, c_red, 0, 0);
    draw_self();
    gpu_set_fog(false, c_white, 0, 0);
} else {
    // Desenho padrão do inimigo
    draw_self();
}

#endregion////////////////////////////////
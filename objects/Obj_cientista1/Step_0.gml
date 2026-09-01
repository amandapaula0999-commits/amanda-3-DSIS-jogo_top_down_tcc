#region/////////------SISTEMA DE DIÁLOGO E INTERAÇÃO

// Define qual é o texto completo do momento baseado no número da fala
if (fala_atual_num == 1) texto_completo = fala_1;
if (fala_atual_num == 2) texto_completo = fala_2;
if (fala_atual_num == 3) texto_completo = fala_3;
if (fala_atual_num == 4) texto_completo = fala_4;

// Interação para abrir o diálogo
if (!exibir_dialogo) {
    if (keyboard_check_pressed(ord("E")) && distance_to_object(all) < 32) {
        exibir_dialogo = true;
        fala_atual_num = 1;
        char_index = 0;
        texto_atual = "";
    }
} else {
    // Se o diálogo já estiver aberto e qualquer tecla for pressionada
    if (keyboard_check_pressed(vk_anykey)) {
        
        // PASSO 1: Se o texto ainda está sendo digitado, completa ele imediatamente
        if (char_index < string_length(texto_completo)) {
            char_index = string_length(texto_completo);
            texto_atual = texto_completo;
        } 
        // PASSO 2: Se o texto já estava completo, passa para a próxima fala ou fecha
        else {
            if (fala_atual_num < total_falas) {
                fala_atual_num += 1;
                char_index = 0;
                texto_atual = "";
            } else {
                exibir_dialogo = false;
                fala_atual_num = 1;
            }
        }
    }

    // Avança o efeito de digitação gradualmente
    if (char_index < string_length(texto_completo)) {
        char_index += velocidade_texto;
        texto_atual = string_copy(texto_completo, 1, floor(char_index));
    }
}

#endregion////////////////////////////////
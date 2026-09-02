// Garante que a chave comece sem ter sido pega
if (!variable_global_exists("chave_pega")) {
    global.chave_pega = false;
}
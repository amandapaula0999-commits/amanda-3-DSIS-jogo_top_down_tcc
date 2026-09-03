#region /////////------ DESTRUIÇÃO DA POÇA DE ÁCIDO

// Destrói a poça de ácido após o tempo do alarme terminar
if (instance_exists(poca_acido)) {
    instance_destroy(poca_acido);
    poca_acido = noone;
}

#endregion ////////////////////////////////
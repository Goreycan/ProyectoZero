// ==========================================
// PROYECTO ZERO
// Configuración de tempo
// ==========================================

// Tempo expresado en BPM
~bpm = 120;

// SuperCollider utiliza beats por segundo
~tempo = ~bpm / 60;

// Reloj principal del proyecto
~clock = TempoClock.new(~tempo);

("Tempo configurado: " ++ ~bpm ++ " BPM").postln;
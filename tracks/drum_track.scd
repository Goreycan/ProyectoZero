// ==========================================
// PROYECTO ZERO
// Pista de batería
// ==========================================

// Función para iniciar la batería
~startDrums = {
    var paso = 0;

    // Detener una ejecución anterior
    if (~drumTrack.notNil) {
        ~drumTrack.stop;
    };

    ~drumTrack = Routine({
        loop {
            if (~kickPattern[paso] == 1) {
                Synth(\kick);
            };

            if (~snarePattern[paso] == 1) {
                Synth(\snare);
            };

            if (~hihatPattern[paso] == 1) {
                Synth(\hihat);
            };

            paso = (paso + 1) % 8;

            0.5.wait;
        }
    }).play(~clock);

    "Batería iniciada.".postln;
};


// Función para detener la batería
~stopDrums = {
    if (~drumTrack.notNil) {
        ~drumTrack.stop;
        ~drumTrack = nil;

        "Batería detenida.".postln;
    } {
        "La batería no está ejecutándose.".postln;
    };
};
// ==========================================
// PROYECTO ZERO
// Pista de batería
// ==========================================

// Función para iniciar la batería.
// Puede ejecutarse varias veces: antes de crear una rutina nueva
// siempre detiene la rutina anterior para evitar duplicados.
~startDrums = {
    var paso = 0;
    var patronesListos;
    var relojListo;
    var instrumentosListos;

    patronesListos = ~kickPattern.notNil
        and: { ~snarePattern.notNil }
        and: { ~hihatPattern.notNil };

    relojListo = ~clock.notNil;

    instrumentosListos = SynthDescLib.global.at(\kick).notNil
        and: { SynthDescLib.global.at(\snare).notNil }
        and: { SynthDescLib.global.at(\hihat).notNil };

    if (patronesListos.not) {
        "No se puede iniciar: faltan patrones de batería.".warn;
    } {
        if (relojListo.not) {
            "No se puede iniciar: falta ~clock.".warn;
        } {
            if (instrumentosListos.not) {
                "No se puede iniciar: faltan SynthDefs de batería.".warn;
            } {
                if (~drumTrack.notNil) {
                    ~drumTrack.stop;
                    ~drumTrack = nil;
                    "Rutina de batería anterior detenida.".postln;
                };

                ~drumTrack = Routine({
                    loop {
                        if (~kickPattern.notNil and: { ~kickPattern.wrapAt(paso) == 1 }) {
                            Synth(\kick);
                        };

                        if (~snarePattern.notNil and: { ~snarePattern.wrapAt(paso) == 1 }) {
                            Synth(\snare);
                        };

                        if (~hihatPattern.notNil and: { ~hihatPattern.wrapAt(paso) == 1 }) {
                            Synth(\hihat);
                        };

                        paso = paso + 1;

                        0.5.wait;
                    }
                }).play(~clock);

                "Batería iniciada.".postln;
            };
        };
    };
};


// Función para detener la batería.
// Es segura aunque la batería ya esté detenida.
~stopDrums = {
    if (~drumTrack.notNil) {
        ~drumTrack.stop;
        ~drumTrack = nil;

        "Batería detenida.".postln;
    } {
        "La batería no está ejecutándose.".postln;
    };
};

(
// ==========================================
// PROYECTO ZERO
// Instrumento: Snare
// ==========================================

SynthDef(\snare, {
    |amp = 0.22|

    var ruido;
    var cuerpo;
    var envolvente;
    var sonido;

    envolvente = EnvGen.kr(
        Env.perc(
            0.001,
            0.12
        ),
        doneAction: 2
    );

    ruido = HPF.ar(
        WhiteNoise.ar,
        1800
    );

    cuerpo = SinOsc.ar(
        190,
        0,
        0.15
    );

    sonido = (
        ruido * 0.9
        +
        cuerpo
    ) * envolvente * amp;

    Out.ar(
        0,
        sonido ! 2
    );
}).add;

"Snare cargado.".postln;
)
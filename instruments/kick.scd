(
// ==========================================
// PROYECTO ZERO
// Instrumento: Kick
// ==========================================

SynthDef(\kick, {
    |amp = 0.45|

    var frecuencia;
    var envolvente;
    var sonido;

    frecuencia = EnvGen.kr(
        Env(
            [150, 48],
            [0.06],
            curve: -5
        )
    );

    envolvente = EnvGen.kr(
        Env.perc(
            0.001,
            0.25
        ),
        doneAction: 2
    );

    sonido = SinOsc.ar(frecuencia);

    sonido = sonido
        * envolvente
        * amp;

    Out.ar(
        0,
        sonido ! 2
    );
}).add;

"Kick cargado.".postln;
)
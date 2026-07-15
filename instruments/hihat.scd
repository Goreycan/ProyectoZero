(
// ==========================================
// PROYECTO ZERO
// Instrumento: Hi-hat
// ==========================================

SynthDef(\hihat, {
    |amp = 0.16|

    var envolvente;
    var ruido;
    var sonido;

    envolvente = EnvGen.kr(
        Env.perc(
            0.001,
            0.06
        ),
        doneAction: 2
    );

    ruido = WhiteNoise.ar;

    sonido = HPF.ar(
        ruido,
        6000
    ) * envolvente * amp;

    Out.ar(
        0,
        sonido ! 2
    );
}).add;

"Hi-hat cargado.".postln;
)

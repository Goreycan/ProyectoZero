// ==========================================
// PROYECTO ZERO
// Panel manual de desarrollo
// ==========================================
// Ejecuta cada bloque por separado en SuperCollider.
// Flujo sugerido:
// 1. Cargar el proyecto.
// 2. Probar instrumentos.
// 3. Iniciar la batería.
// 4. Cambiar BPM o patrones en vivo.
// 5. Detener la batería o liberar todo con Ctrl + .
// ==========================================


// ------------------------------------------
// 1. CARGAR PROYECTO
// ------------------------------------------

(
var raiz;

raiz = PathName(thisProcess.nowExecutingPath).pathOnly +/+ "..";

thisProcess.interpreter.executeFile(
    raiz +/+ "main.scd"
);
)


// ------------------------------------------
// 2. PROBAR INSTRUMENTOS
// ------------------------------------------

// Kick
Synth(\kick);

// Snare
Synth(\snare);

// Hi-hat
Synth(\hihat);


// ------------------------------------------
// 3. INICIAR Y DETENER LA BATERÍA
// ------------------------------------------

// Iniciar. Es seguro ejecutarlo varias veces: no duplica rutinas.
~startDrums.value;

// Detener. Es seguro ejecutarlo aunque ya esté detenida.
~stopDrums.value;


// ------------------------------------------
// 4. CAMBIAR BPM
// ------------------------------------------

// 90 BPM
(
~bpm = 90;
~clock.tempo = ~bpm / 60;
("Tempo: " ++ ~bpm ++ " BPM").postln;
)

// 120 BPM
(
~bpm = 120;
~clock.tempo = ~bpm / 60;
("Tempo: " ++ ~bpm ++ " BPM").postln;
)

// 128 BPM
(
~bpm = 128;
~clock.tempo = ~bpm / 60;
("Tempo: " ++ ~bpm ++ " BPM").postln;
)

// 140 BPM
(
~bpm = 140;
~clock.tempo = ~bpm / 60;
("Tempo: " ++ ~bpm ++ " BPM").postln;
)


// ------------------------------------------
// 5. MODIFICAR PATRONES EN VIVO
// ------------------------------------------
// Estos cambios se leen en la siguiente vuelta de la rutina.
// No hace falta detener la batería.

// Patrón base
(
~kickPattern = [
    1, 0, 0, 0,
    1, 0, 0, 0
];

~snarePattern = [
    0, 0, 1, 0,
    0, 0, 1, 0
];

~hihatPattern = [
    0, 1, 0, 1,
    0, 1, 0, 1
];

"Patrón base cargado.".postln;
)

// Hi-hat continuo
(
~hihatPattern = [
    1, 1, 1, 1,
    1, 1, 1, 1
];

"Hi-hat continuo activado.".postln;
)

// Kick alternativo
(
~kickPattern = [
    1, 0, 0, 1,
    0, 0, 1, 0
];

"Kick alternativo activado.".postln;
)

// Snare con respuesta al final del compás
(
~snarePattern = [
    0, 0, 1, 0,
    0, 0, 1, 1
];

"Snare alternativo activado.".postln;
)


// ------------------------------------------
// 6. LIBERAR TODOS LOS SINTETIZADORES
// ------------------------------------------

s.freeAll;

// Atajo de emergencia de SuperCollider:
// Ctrl + .


// ------------------------------------------
// 7. APAGAR EL SERVIDOR
// ------------------------------------------

s.quit;

// ==========================================
// CODE MUSIC LAB
// PROYECTO ZERO
// Panel de desarrollo
// ==========================================
//
// Flujo normal:
//
// 1. Ejecutar CARGAR PROYECTO.
// 2. Esperar "Proyecto Zero cargado".
// 3. Ejecutar las pruebas deseadas.
// 4. Detener pistas al terminar.
//
// ==========================================


// ------------------------------------------
// 1. CARGAR PROYECTO
// ------------------------------------------

(
var raiz;

raiz = PathName(thisProcess.nowExecutingPath).pathOnly;

thisProcess.interpreter.executeFile(
    raiz +/+ "main.scd"
);
)


// ------------------------------------------
// 2. ESTADO DEL SISTEMA
// ------------------------------------------

// Comprobar servidor
s.serverRunning.postln;

// Mostrar BPM actual
~bpm.postln;

// Mostrar tempo en beats por segundo
~clock.tempo.postln;


// ------------------------------------------
// 3. PRUEBAS DE INSTRUMENTOS
// ------------------------------------------

// Kick
Synth(\kick);

// Caja
Synth(\snare);

// Hi-hat
Synth(\hihat);


// ------------------------------------------
// 4. BATERÍA
// ------------------------------------------

// Iniciar
~startDrums.value;

// Detener
~stopDrums.value;


// ------------------------------------------
// 5. CAMBIAR TEMPO
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
// 6. CAMBIO DE PATRONES EN VIVO
// ------------------------------------------

// Patrón post-punk básico
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

"Patrón post-punk cargado.".postln;
)


// Hi-hat continuo
(
~hihatPattern = [
    1, 1, 1, 1,
    1, 1, 1, 1
];

"Hi-hat continuo activado.".postln;
)


// Hi-hat en contratiempos
(
~hihatPattern = [
    0, 1, 0, 1,
    0, 1, 0, 1
];

"Hi-hat en contratiempos activado.".postln;
)


// Kick más dinámico
(
~kickPattern = [
    1, 0, 0, 1,
    0, 0, 1, 0
];

"Kick alternativo activado.".postln;
)


// Restaurar patrón original
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

"Patrón original restaurado.".postln;
)


// ------------------------------------------
// 7. CONTROL GENERAL
// ------------------------------------------

// Detener batería
~stopDrums.value;

// Liberar todos los sintetizadores
s.freeAll;

// Botón de emergencia:
// Ctrl + .

// Apagar servidor
// s.quit;
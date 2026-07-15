// ==========================================
// CODE MUSIC LAB
// PROYECTO ZERO
// Archivo principal
// ==========================================

(
var cargarProyecto;
var raiz;

raiz = PathName(thisProcess.nowExecutingPath).pathOnly;

cargarProyecto = {
    "Cargando Proyecto Zero...".postln;

    thisProcess.interpreter.executeFile(
        raiz +/+ "config/tempo.scd"
    );

    thisProcess.interpreter.executeFile(
        raiz +/+ "instruments/kick.scd"
    );

    thisProcess.interpreter.executeFile(
        raiz +/+ "instruments/snare.scd"
    );

    thisProcess.interpreter.executeFile(
        raiz +/+ "instruments/hihat.scd"
    );

    thisProcess.interpreter.executeFile(
        raiz +/+ "patterns/drums.scd"
    );

    thisProcess.interpreter.executeFile(
        raiz +/+ "tracks/drum_track.scd"
    );

    "Proyecto Zero cargado correctamente.".postln;
};

if (s.serverRunning) {
    cargarProyecto.value;
} {
    s.waitForBoot({
        cargarProyecto.value;
    });

    s.boot;
};
)

// ==========================================
// PROYECTO ZERO
// Smoke test básico
// ==========================================
// Ejecutar después de cargar main.scd.

(
var errores = List.new;

if (~clock.isNil) {
    errores.add("Falta ~clock");
};

if (~kickPattern.isNil) {
    errores.add("Falta ~kickPattern");
};

if (~snarePattern.isNil) {
    errores.add("Falta ~snarePattern");
};

if (~hihatPattern.isNil) {
    errores.add("Falta ~hihatPattern");
};

if (~startDrums.isNil) {
    errores.add("Falta ~startDrums");
};

if (~stopDrums.isNil) {
    errores.add("Falta ~stopDrums");
};

if (errores.isEmpty) {
    "Smoke test OK: Proyecto Zero está cargado.".postln;
} {
    "Smoke test FALLÓ:".warn;
    errores.do({ |error| error.warn; });
};
)

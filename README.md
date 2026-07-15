# ProyectoZero

ProyectoZero es un Sound Lab básico para aprender síntesis en SuperCollider y crear instrumentos simples que más adelante puedan usarse desde TidalCycles. El repositorio no intenta ser un DAW ni un framework musical completo: su función es servir como laboratorio pequeño y educativo para live coding musical con Strudel y, después, TidalCycles.

## Estructura

- `main.scd`: inicia el servidor si hace falta y carga el proyecto.
- `dev/dev.scd`: panel manual con bloques independientes para probar y cambiar cosas en vivo.
- `config/`: configuración del tempo y del reloj principal.
- `instruments/`: `SynthDef` de kick, snare y hi-hat.
- `patterns/`: patrones básicos de batería.
- `tracks/`: lógica para iniciar y detener pistas.
- `songs/`: demostraciones musicales simples.
- `tests/`: pruebas básicas del entorno.

## Orden de ejecución

1. Abrir SuperCollider.
2. Ejecutar `main.scd` o el bloque **CARGAR PROYECTO** de `dev/dev.scd`.
3. Esperar el mensaje `Proyecto Zero cargado correctamente.`.
4. Usar los bloques de `dev/dev.scd` para probar instrumentos, iniciar la batería o cambiar parámetros en vivo.

## Iniciar y detener la batería

Después de cargar el proyecto:

```supercollider
~startDrums.value;
```

Para detenerla:

```supercollider
~stopDrums.value;
```

`~startDrums.value` puede ejecutarse varias veces sin dejar rutinas duplicadas. `~stopDrums.value` es seguro aunque la batería ya esté detenida.

## Cambiar BPM en vivo

El tempo se controla con `~bpm` y `~clock.tempo`. Por ejemplo, para 120 BPM:

```supercollider
~bpm = 120;
~clock.tempo = ~bpm / 60;
```

`dev/dev.scd` incluye bloques preparados para 90, 120, 128 y 140 BPM.

## Cambiar patrones en vivo

Los patrones pueden reasignarse mientras la batería está sonando. La rutina leerá los nuevos valores en los siguientes pasos:

```supercollider
~kickPattern = [1, 0, 0, 1, 0, 0, 1, 0];
~snarePattern = [0, 0, 1, 0, 0, 0, 1, 0];
~hihatPattern = [0, 1, 0, 1, 0, 1, 0, 1];
```

## Detener todo

Para una parada rápida en SuperCollider, usa:

```text
Ctrl + .
```

También puedes liberar todos los sintetizadores con:

```supercollider
s.freeAll;
```

o apagar el servidor con:

```supercollider
s.quit;
```

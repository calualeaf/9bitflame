import 'dart:math' as math;
import 'dart:typed_data';

enum ChiptuneWave { square, triangle, noise }

class ChiptuneNote {
  const ChiptuneNote(this.semitone, this.beat, this.length);

  final int semitone;
  final double beat;
  final double length;
}

class ChiptuneLayerRecipe {
  const ChiptuneLayerRecipe({
    required this.id,
    required this.wave,
    required this.notes,
    this.volume = 0.55,
    this.noiseSeed = 1,
  });

  final String id;
  final ChiptuneWave wave;
  final List<ChiptuneNote> notes;
  final double volume;
  final int noiseSeed;
}

const pixelhainKickRecipe = ChiptuneLayerRecipe(
  id: 'kick',
  wave: ChiptuneWave.triangle,
  notes: [
    ChiptuneNote(-24, 0, 0.25),
    ChiptuneNote(-24, 2, 0.25),
    ChiptuneNote(-24, 4, 0.25),
    ChiptuneNote(-24, 6, 0.25),
  ],
  volume: 0.8,
);

const pixelhainSnareRecipe = ChiptuneLayerRecipe(
  id: 'snare',
  wave: ChiptuneWave.noise,
  notes: [
    ChiptuneNote(0, 1, 0.18),
    ChiptuneNote(0, 3, 0.18),
    ChiptuneNote(0, 5, 0.18),
    ChiptuneNote(0, 7, 0.18),
  ],
  volume: 0.45,
  noiseSeed: 9,
);

const pixelhainBassRecipe = ChiptuneLayerRecipe(
  id: 'bass',
  wave: ChiptuneWave.square,
  notes: [
    ChiptuneNote(-12, 0, 0.9),
    ChiptuneNote(-5, 1, 0.9),
    ChiptuneNote(-3, 2, 0.9),
    ChiptuneNote(-5, 3, 0.9),
    ChiptuneNote(-12, 4, 0.9),
    ChiptuneNote(-5, 5, 0.9),
    ChiptuneNote(-8, 6, 0.9),
    ChiptuneNote(-10, 7, 0.9),
  ],
  volume: 0.48,
);

const pixelhainArpRecipe = ChiptuneLayerRecipe(
  id: 'arp',
  wave: ChiptuneWave.triangle,
  notes: [
    ChiptuneNote(0, 0, 0.3),
    ChiptuneNote(4, 0.5, 0.3),
    ChiptuneNote(7, 1, 0.3),
    ChiptuneNote(12, 1.5, 0.3),
    ChiptuneNote(11, 2, 0.3),
    ChiptuneNote(7, 2.5, 0.3),
    ChiptuneNote(4, 3, 0.3),
    ChiptuneNote(7, 3.5, 0.3),
  ],
  volume: 0.34,
);

const pixelhainLeadRecipe = ChiptuneLayerRecipe(
  id: 'lead',
  wave: ChiptuneWave.square,
  notes: [
    ChiptuneNote(12, 0, 0.45),
    ChiptuneNote(16, 0.5, 0.45),
    ChiptuneNote(19, 1, 0.45),
    ChiptuneNote(21, 1.5, 0.45),
    ChiptuneNote(19, 2, 0.45),
    ChiptuneNote(16, 2.5, 0.45),
    ChiptuneNote(14, 3, 0.45),
    ChiptuneNote(12, 3.5, 0.45),
  ],
  volume: 0.42,
);

const pixelhainFxRecipe = ChiptuneLayerRecipe(
  id: 'fx',
  wave: ChiptuneWave.triangle,
  notes: [
    ChiptuneNote(24, 0, 0.12),
    ChiptuneNote(31, 2, 0.12),
    ChiptuneNote(28, 4, 0.12),
    ChiptuneNote(36, 6, 0.12),
  ],
  volume: 0.38,
);

const pixelhainLayerRecipes = [
  pixelhainKickRecipe,
  pixelhainSnareRecipe,
  pixelhainBassRecipe,
  pixelhainArpRecipe,
  pixelhainLeadRecipe,
  pixelhainFxRecipe,
];

class PixelhainChiptuneSynth {
  const PixelhainChiptuneSynth({
    this.sampleRate = 22050,
    this.bpm = 144,
    this.loopBeats = 8,
  });

  final int sampleRate;
  final int bpm;
  final int loopBeats;

  Uint8List renderWav(ChiptuneLayerRecipe recipe) {
    final samples = _renderSamples(recipe);
    final bytes = ByteData(44 + samples.length * 2);
    _writeAscii(bytes, 0, 'RIFF');
    bytes.setUint32(4, 36 + samples.length * 2, Endian.little);
    _writeAscii(bytes, 8, 'WAVEfmt ');
    bytes.setUint32(16, 16, Endian.little);
    bytes.setUint16(20, 1, Endian.little);
    bytes.setUint16(22, 1, Endian.little);
    bytes.setUint32(24, sampleRate, Endian.little);
    bytes.setUint32(28, sampleRate * 2, Endian.little);
    bytes.setUint16(32, 2, Endian.little);
    bytes.setUint16(34, 16, Endian.little);
    _writeAscii(bytes, 36, 'data');
    bytes.setUint32(40, samples.length * 2, Endian.little);
    for (var i = 0; i < samples.length; i++) {
      bytes.setInt16(44 + i * 2, (samples[i] * 32767).round(), Endian.little);
    }
    return bytes.buffer.asUint8List();
  }

  List<double> _renderSamples(ChiptuneLayerRecipe recipe) {
    final secondsPerBeat = 60 / bpm;
    final sampleCount = (sampleRate * secondsPerBeat * loopBeats).round();
    final samples = List<double>.filled(sampleCount, 0);
    for (final note in recipe.notes) {
      final start = (note.beat * secondsPerBeat * sampleRate).round();
      final length = (note.length * secondsPerBeat * sampleRate).round();
      final frequency = (261.63 * math.pow(2, note.semitone / 12)).toDouble();
      var noise = recipe.noiseSeed;
      for (var i = 0; i < length && start + i < samples.length; i++) {
        final t = i / sampleRate;
        final envelope = math.max(0, 1 - i / length);
        final value = switch (recipe.wave) {
          ChiptuneWave.square => (t * frequency) % 1 < 0.5 ? 1.0 : -1.0,
          ChiptuneWave.triangle => 4 * ((t * frequency) % 1 - 0.5).abs() - 1,
          ChiptuneWave.noise => () {
            noise = (1103515245 * noise + 12345) & 0x7fffffff;
            return noise / 0x3fffffff - 1;
          }(),
        };
        samples[start + i] += value * envelope * recipe.volume;
      }
    }
    return [for (final sample in samples) sample.clamp(-1, 1).toDouble()];
  }

  void _writeAscii(ByteData bytes, int offset, String value) {
    for (var i = 0; i < value.length; i++) {
      bytes.setUint8(offset + i, value.codeUnitAt(i));
    }
  }
}

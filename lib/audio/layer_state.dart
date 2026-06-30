import 'dart:typed_data';

import 'package:bitflame/audio/chiptune_synth.dart';

class AudioLayerAsset {
  const AudioLayerAsset({
    required this.name,
    required this.recipe,
    required this.description,
  });

  final String name;
  final ChiptuneLayerRecipe recipe;
  final String description;

  String get asset => 'procedural://pixelhain/${recipe.id}';
}

const pixelhainAudioAssets = [
  AudioLayerAsset(
    name: 'Grundpuls / Kick',
    recipe: pixelhainKickRecipe,
    description: 'Punchiger 8-Bit-Viertelpuls als Gameboy-artiges Fundament.',
  ),
  AudioLayerAsset(
    name: 'Snare / Clap',
    recipe: pixelhainSnareRecipe,
    description: 'Kurzer Noise-Snare-Akzent im Chiptune-Stil.',
  ),
  AudioLayerAsset(
    name: 'Bassline',
    recipe: pixelhainBassRecipe,
    description: 'Warme Square-Wave-Bassfigur mit eingängigem Loop.',
  ),
  AudioLayerAsset(
    name: 'Arpeggio',
    recipe: pixelhainArpRecipe,
    description: 'Helles 8-Bit-Arpeggio als funkelnde Pixelhain-Bewegung.',
  ),
  AudioLayerAsset(
    name: 'Lead-Melodie',
    recipe: pixelhainLeadRecipe,
    description: 'Ohrwurm-Hook im Gameboy-inspirierten Rechteck-Sound.',
  ),
  AudioLayerAsset(
    name: 'FX / Finale-Layer',
    recipe: pixelhainFxRecipe,
    description: 'Kurze Blips und Glitch-Fills für den vollständigen Track.',
  ),
];

class LayerState {
  const LayerState({
    required this.name,
    required this.asset,
    required this.description,
    this.wavBytes,
    this.unlocked = false,
    this.ghost = false,
  });
  final String name;
  final String asset;
  final String description;
  final Uint8List? wavBytes;
  final bool unlocked;
  final bool ghost;

  bool get hasRenderedAudio => wavBytes != null && wavBytes!.isNotEmpty;

  LayerState unlock(Uint8List renderedWav) => LayerState(
    name: name,
    asset: asset,
    description: description,
    wavBytes: renderedWav,
    unlocked: true,
  );
  LayerState asGhost() => LayerState(
    name: name,
    asset: asset,
    description: description,
    wavBytes: wavBytes,
    ghost: true,
  );
}

class AudioLayerSystem {
  AudioLayerSystem(
    List<AudioLayerAsset> assets, {
    PixelhainChiptuneSynth synth = const PixelhainChiptuneSynth(),
  }) : _assets = assets,
       _synth = synth,
       layers = [
         for (final asset in assets)
           LayerState(
             name: asset.name,
             asset: asset.asset,
             description: asset.description,
           ),
       ];

  final List<AudioLayerAsset> _assets;
  final PixelhainChiptuneSynth _synth;
  final List<LayerState> layers;

  void unlock(int index) {
    final renderedWav = _synth.renderWav(_assets[index].recipe);
    layers[index] = layers[index].unlock(renderedWav);
  }

  List<Uint8List> get activeWavLayers => [
    for (final layer in layers)
      if (layer.unlocked && layer.wavBytes != null) layer.wavBytes!,
  ];

  int get unlockedCount => layers.where((layer) => layer.unlocked).length;
}

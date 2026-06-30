class AudioLayerAsset {
  const AudioLayerAsset({
    required this.name,
    required this.asset,
    required this.description,
  });

  final String name;
  final String asset;
  final String description;
}

const pixelhainAudioAssets = [
  AudioLayerAsset(
    name: 'Grundpuls / Kick',
    asset: 'procedural://pixelhain/kick',
    description: 'Punchiger 8-Bit-Viertelpuls als Gameboy-artiges Fundament.',
  ),
  AudioLayerAsset(
    name: 'Snare / Clap',
    asset: 'procedural://pixelhain/snare',
    description: 'Kurzer Noise-Snare-Akzent im Chiptune-Stil.',
  ),
  AudioLayerAsset(
    name: 'Bassline',
    asset: 'procedural://pixelhain/bass',
    description: 'Warme Square-Wave-Bassfigur mit eingängigem Loop.',
  ),
  AudioLayerAsset(
    name: 'Arpeggio',
    asset: 'procedural://pixelhain/arp',
    description: 'Helles 8-Bit-Arpeggio als funkelnde Pixelhain-Bewegung.',
  ),
  AudioLayerAsset(
    name: 'Lead-Melodie',
    asset: 'procedural://pixelhain/lead',
    description: 'Ohrwurm-Hook im Gameboy-inspirierten Rechteck-Sound.',
  ),
  AudioLayerAsset(
    name: 'FX / Finale-Layer',
    asset: 'procedural://pixelhain/fx',
    description: 'Kurze Blips und Glitch-Fills für den vollständigen Track.',
  ),
];

class LayerState {
  const LayerState({
    required this.name,
    required this.asset,
    required this.description,
    this.unlocked = false,
    this.ghost = false,
  });
  final String name;
  final String asset;
  final String description;
  final bool unlocked;
  final bool ghost;

  LayerState unlock() => LayerState(
    name: name,
    asset: asset,
    description: description,
    unlocked: true,
  );
  LayerState asGhost() => LayerState(
    name: name,
    asset: asset,
    description: description,
    ghost: true,
  );
}

class AudioLayerSystem {
  AudioLayerSystem(List<AudioLayerAsset> assets)
    : layers = [
        for (final asset in assets)
          LayerState(
            name: asset.name,
            asset: asset.asset,
            description: asset.description,
          ),
      ];

  final List<LayerState> layers;

  void unlock(int index) {
    layers[index] = layers[index].unlock();
  }

  int get unlockedCount => layers.where((layer) => layer.unlocked).length;
}

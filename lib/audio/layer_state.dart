class LayerState {
  const LayerState({
    required this.name,
    this.unlocked = false,
    this.ghost = false,
  });
  final String name;
  final bool unlocked;
  final bool ghost;

  LayerState unlock() => LayerState(name: name, unlocked: true);
  LayerState asGhost() => LayerState(name: name, ghost: true);
}

class AudioLayerSystem {
  AudioLayerSystem(List<String> layerNames)
    : layers = [for (final name in layerNames) LayerState(name: name)];

  final List<LayerState> layers;

  void unlock(int index) {
    layers[index] = layers[index].unlock();
  }

  int get unlockedCount => layers.where((layer) => layer.unlocked).length;
}

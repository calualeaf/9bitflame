enum Direction { up, right, down, left }

enum NodeType {
  start,
  target,
  pattern,
  straight,
  curve,
  empty,
  noise,
  blocked,
  glitch,
}

enum PuzzleStatus { incomplete, almostSolved, solved }

class GridPoint {
  const GridPoint(this.x, this.y);
  final int x;
  final int y;

  bool isNeighbor(GridPoint other) =>
      (x - other.x).abs() + (y - other.y).abs() == 1;

  Direction directionTo(GridPoint other) {
    if (other.x == x && other.y == y - 1) return Direction.up;
    if (other.x == x + 1 && other.y == y) return Direction.right;
    if (other.x == x && other.y == y + 1) return Direction.down;
    if (other.x == x - 1 && other.y == y) return Direction.left;
    throw ArgumentError('Points are not orthogonal neighbors.');
  }

  @override
  bool operator ==(Object other) =>
      other is GridPoint && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);
}

class PuzzleNode {
  const PuzzleNode({
    required this.id,
    required this.type,
    required this.position,
    this.patternIndex,
    this.rotation = Direction.up,
  });

  final String id;
  final NodeType type;
  final GridPoint position;
  final int? patternIndex;
  final Direction rotation;

  bool get isRotatable => type == NodeType.straight || type == NodeType.curve;

  PuzzleNode rotated() =>
      copyWith(rotation: Direction.values[(rotation.index + 1) % 4]);

  PuzzleNode copyWith({Direction? rotation}) => PuzzleNode(
    id: id,
    type: type,
    position: position,
    patternIndex: patternIndex,
    rotation: rotation ?? this.rotation,
  );

  bool connects(Direction incoming, Direction outgoing) {
    if (!isRotatable) return true;
    final allowed = switch (type) {
      NodeType.straight =>
        rotation == Direction.up || rotation == Direction.down
            ? {Direction.up, Direction.down}
            : {Direction.left, Direction.right},
      NodeType.curve => switch (rotation) {
        Direction.up => {Direction.up, Direction.right},
        Direction.right => {Direction.right, Direction.down},
        Direction.down => {Direction.down, Direction.left},
        Direction.left => {Direction.left, Direction.up},
      },
      _ => <Direction>{},
    };
    return allowed.contains(incoming) && allowed.contains(outgoing);
  }
}

class PuzzleDefinition {
  const PuzzleDefinition({
    required this.id,
    required this.title,
    required this.layerName,
    required this.nodes,
    required this.requiredPatternIds,
    this.tutorialText,
  });

  final String id;
  final String title;
  final String layerName;
  final List<PuzzleNode> nodes;
  final List<String> requiredPatternIds;
  final String? tutorialText;

  PuzzleNode get start =>
      nodes.singleWhere((node) => node.type == NodeType.start);
  PuzzleNode get target =>
      nodes.singleWhere((node) => node.type == NodeType.target);
  PuzzleNode? nodeAt(GridPoint point) {
    for (final node in nodes) {
      if (node.position == point) return node;
    }
    return null;
  }

  PuzzleDefinition replaceNode(PuzzleNode replacement) => PuzzleDefinition(
    id: id,
    title: title,
    layerName: layerName,
    nodes: [
      for (final node in nodes) node.id == replacement.id ? replacement : node,
    ],
    requiredPatternIds: requiredPatternIds,
    tutorialText: tutorialText,
  );
}

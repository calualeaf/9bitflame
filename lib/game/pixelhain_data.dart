import 'package:bitflame/puzzle/puzzle_model.dart';

const layerNames = [
  'Grundpuls / Kick',
  'Snare / Clap',
  'Bassline',
  'Arpeggio',
  'Lead-Melodie',
  'FX / Finale-Layer',
];

List<PuzzleDefinition> createPixelhainPuzzles() => [
  PuzzleDefinition(
    id: 'kick',
    title: 'Puzzle 1 – Grundpuls',
    layerName: layerNames[0],
    tutorialText: 'Verbinde den Puls mit dem Ziel.',
    requiredPatternIds: const ['puls'],
    nodes: const [
      PuzzleNode(
        id: 'start',
        type: NodeType.start,
        position: GridPoint(0, 1),
      ),
      PuzzleNode(
        id: 'puls',
        type: NodeType.pattern,
        position: GridPoint(1, 1),
      ),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(2, 1),
      ),
    ],
  ),
  _puzzle(
    'snare',
    'Puzzle 2 – Snare / Clap',
    1,
    const ['square', 'circle'],
    const [
      PuzzleNode(id: 'start', type: NodeType.start, position: GridPoint(0, 0)),
      PuzzleNode(
        id: 'square',
        type: NodeType.pattern,
        position: GridPoint(1, 0),
      ),
      PuzzleNode(
        id: 'gate',
        type: NodeType.straight,
        position: GridPoint(2, 0),
        rotation: Direction.up,
      ),
      PuzzleNode(
        id: 'circle',
        type: NodeType.pattern,
        position: GridPoint(3, 0),
      ),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(3, 1),
      ),
    ],
  ),
  _puzzle(
    'bass',
    'Puzzle 3 – Bassline',
    2,
    const ['a', 'b', 'c'],
    const [
      PuzzleNode(id: 'start', type: NodeType.start, position: GridPoint(0, 2)),
      PuzzleNode(id: 'a', type: NodeType.pattern, position: GridPoint(1, 2)),
      PuzzleNode(
        id: 'bend',
        type: NodeType.curve,
        position: GridPoint(2, 2),
        rotation: Direction.up,
      ),
      PuzzleNode(id: 'b', type: NodeType.pattern, position: GridPoint(2, 1)),
      PuzzleNode(id: 'c', type: NodeType.pattern, position: GridPoint(3, 1)),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(3, 0),
      ),
      PuzzleNode(
        id: 'block',
        type: NodeType.blocked,
        position: GridPoint(1, 1),
      ),
      PuzzleNode(id: 'noise', type: NodeType.noise, position: GridPoint(0, 1)),
    ],
  ),
  _puzzle(
    'arp',
    'Puzzle 4 – Arpeggio',
    3,
    const ['a', 'b'],
    const [
      PuzzleNode(id: 'start', type: NodeType.start, position: GridPoint(0, 3)),
      PuzzleNode(id: 'a', type: NodeType.pattern, position: GridPoint(1, 3)),
      PuzzleNode(
        id: 'gate1',
        type: NodeType.curve,
        position: GridPoint(2, 3),
        rotation: Direction.left,
      ),
      PuzzleNode(
        id: 'gate2',
        type: NodeType.straight,
        position: GridPoint(2, 2),
        rotation: Direction.up,
      ),
      PuzzleNode(id: 'b', type: NodeType.pattern, position: GridPoint(2, 1)),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(3, 1),
      ),
    ],
  ),
  _puzzle(
    'lead',
    'Puzzle 5 – Lead-Melodie',
    4,
    const ['hook'],
    const [
      PuzzleNode(id: 'start', type: NodeType.start, position: GridPoint(0, 0)),
      PuzzleNode(
        id: 'gate',
        type: NodeType.curve,
        position: GridPoint(1, 0),
        rotation: Direction.right,
      ),
      PuzzleNode(id: 'hook', type: NodeType.pattern, position: GridPoint(1, 1)),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(2, 1),
      ),
    ],
  ),
  _puzzle(
    'finale',
    'Puzzle 6 – Finale-Layer',
    5,
    const ['fx', 'counter'],
    const [
      PuzzleNode(id: 'start', type: NodeType.start, position: GridPoint(0, 2)),
      PuzzleNode(id: 'fx', type: NodeType.pattern, position: GridPoint(1, 2)),
      PuzzleNode(
        id: 'gate1',
        type: NodeType.straight,
        position: GridPoint(2, 2),
        rotation: Direction.right,
      ),
      PuzzleNode(
        id: 'counter',
        type: NodeType.pattern,
        position: GridPoint(3, 2),
      ),
      PuzzleNode(
        id: 'gate2',
        type: NodeType.curve,
        position: GridPoint(3, 1),
        rotation: Direction.right,
      ),
      PuzzleNode(
        id: 'target',
        type: NodeType.target,
        position: GridPoint(2, 1),
      ),
      PuzzleNode(
        id: 'glitch',
        type: NodeType.glitch,
        position: GridPoint(0, 0),
      ),
    ],
  ),
];

PuzzleDefinition _puzzle(
  String id,
  String title,
  int layer,
  List<String> patterns,
  List<PuzzleNode> nodes,
) => PuzzleDefinition(
  id: id,
  title: title,
  layerName: layerNames[layer],
  requiredPatternIds: patterns,
  nodes: nodes,
);

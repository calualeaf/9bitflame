import 'package:bitflame/audio/layer_state.dart';
import 'package:bitflame/game/pixelhain_data.dart';
import 'package:bitflame/progression/progression_state.dart';
import 'package:bitflame/puzzle/puzzle_engine.dart';
import 'package:bitflame/puzzle/puzzle_model.dart';
import 'package:flutter/material.dart';

class PixelhainScreen extends StatefulWidget {
  const PixelhainScreen({super.key});
  @override
  State<PixelhainScreen> createState() => _PixelhainScreenState();
}

class _PixelhainScreenState extends State<PixelhainScreen> {
  final puzzles = createPixelhainPuzzles();
  final engine = PuzzleEngine();
  final progression = ProgressionState();
  late final AudioLayerSystem audio = AudioLayerSystem(layerNames);
  var index = 0;
  var route = <GridPoint>[];
  PuzzleEvaluation evaluation = const PuzzleEvaluation(PuzzleStatus.incomplete, 'Ziehe vom Start zum Ziel.', 0);

  PuzzleDefinition get puzzle => puzzles[index];

  void _tap(PuzzleNode node) {
    setState(() {
      if (node.isRotatable) {
        puzzles[index] = puzzle.replaceNode(node.rotated());
        evaluation = engine.evaluate(puzzle, route);
      } else if (node.type == NodeType.glitch && progression.glitchUnlocked) {
        progression.glitchCompleted = true;
      }
    });
  }

  void _add(PuzzleNode node) {
    setState(() {
      if (route.isEmpty || route.last.isNeighbor(node.position)) route = [...route, node.position];
      evaluation = engine.evaluate(puzzle, route);
      if (evaluation.status == PuzzleStatus.solved && !progression.isSolved(puzzle.id)) {
        progression.markSolved(puzzle.id);
        audio.unlock(index);
      }
    });
  }

  void _next() => setState(() {
        if (index < puzzles.length - 1) index++;
        route = <GridPoint>[];
        evaluation = const PuzzleEvaluation(PuzzleStatus.incomplete, 'Ziehe vom Start zum Ziel.', 0);
      });

  @override
  Widget build(BuildContext context) {
    final solvedAll = progression.solvedCount == puzzles.length;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff09111f), Color(0xff173726)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Der Pixelhain', style: Theme.of(context).textTheme.headlineMedium),
                Text(solvedAll ? 'Der Track groovt vollständig.' : puzzle.title),
                const SizedBox(height: 12),
                _WorldTree(activeLayers: audio.unlockedCount, glitch: progression.glitchCompleted),
                const SizedBox(height: 12),
                Text(puzzle.tutorialText ?? evaluation.message, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                _Grid(puzzle: puzzle, route: route, onTap: _tap, onAdd: _add),
                const SizedBox(height: 12),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  for (final layer in audio.layers)
                    Chip(
                      label: Text(layer.name),
                      backgroundColor: layer.unlocked ? const Color(0xff72ffb6) : const Color(0xff243044),
                    ),
                ]),
                const Spacer(),
                if (evaluation.status == PuzzleStatus.solved && !solvedAll)
                  FilledButton(onPressed: _next, child: const Text('Nächstes Puzzle')),
                if (solvedAll) FilledButton(onPressed: () => setState(() => index = 0), child: const Text('Nochmal spielen')),
                if (progression.glitchUnlocked && !progression.glitchCompleted)
                  TextButton(onPressed: () => setState(() => progression.glitchCompleted = true), child: const Text('Glitch-Minispiel: Parallel Run starten')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorldTree extends StatelessWidget {
  const _WorldTree({required this.activeLayers, required this.glitch});
  final int activeLayers;
  final bool glitch;

  @override
  Widget build(BuildContext context) {
    final color = Color.lerp(const Color(0xff35445e), const Color(0xff72ffb6), activeLayers / 6)!;
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color(0xaa0c1729), border: Border.all(color: color, width: 3)),
      child: Center(child: Text(glitch ? '🌳✨🟣' : List.filled(activeLayers.clamp(1, 6), '🌳✨').join(' '), style: TextStyle(fontSize: 28, color: color))),
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({required this.puzzle, required this.route, required this.onTap, required this.onAdd});
  final PuzzleDefinition puzzle;
  final List<GridPoint> route;
  final ValueChanged<PuzzleNode> onTap;
  final ValueChanged<PuzzleNode> onAdd;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        children: [
          for (var y = 0; y < 4; y++)
            for (var x = 0; x < 4; x++) _cell(puzzle.nodeAt(GridPoint(x, y))),
        ],
      ),
    );
  }

  Widget _cell(PuzzleNode? node) {
    final selected = node != null && route.contains(node.position);
    final icon = switch (node?.type) {
      NodeType.start => '▶', NodeType.target => '◎', NodeType.pattern => '♪', NodeType.straight => node!.rotation == Direction.up || node.rotation == Direction.down ? '┃' : '━',
      NodeType.curve => '┗', NodeType.noise => '×', NodeType.blocked => '■', NodeType.glitch => '◈', _ => '·',
    };
    return GestureDetector(
      onTap: node == null ? null : () => node.isRotatable ? onTap(node) : onAdd(node),
      onLongPress: node == null ? null : () => onAdd(node),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected ? const Color(0xff72ffb6) : const Color(0xff17243a),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: node?.type == NodeType.blocked ? Colors.redAccent : Colors.white24),
        ),
        child: Center(child: Text(icon, style: const TextStyle(fontSize: 28))),
      ),
    );
  }
}

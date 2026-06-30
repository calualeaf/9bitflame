import 'package:bitflame/puzzle/puzzle_model.dart';

class PuzzleEvaluation {
  const PuzzleEvaluation(this.status, this.message, this.correctUntil);
  final PuzzleStatus status;
  final String message;
  final int correctUntil;
}

class PuzzleEngine {
  PuzzleEvaluation evaluate(PuzzleDefinition puzzle, List<GridPoint> route) {
    if (route.isEmpty || route.first != puzzle.start.position) {
      return const PuzzleEvaluation(
        PuzzleStatus.incomplete,
        'Route muss am Start beginnen.',
        0,
      );
    }

    final visitedPatterns = <String>[];
    for (var i = 0; i < route.length; i++) {
      final node = puzzle.nodeAt(route[i]);
      if (node == null || node.type == NodeType.blocked) {
        return PuzzleEvaluation(
          PuzzleStatus.incomplete,
          'Blockiertes Feld stoppt das Signal.',
          i,
        );
      }
      if (i > 0 && !route[i - 1].isNeighbor(route[i])) {
        return PuzzleEvaluation(
          PuzzleStatus.incomplete,
          'Nur orthogonale Nachbarn sind verbunden.',
          i - 1,
        );
      }
      if (i > 0 && i < route.length - 1 && node.isRotatable) {
        final incoming = route[i].directionTo(route[i - 1]);
        final outgoing = route[i].directionTo(route[i + 1]);
        if (!node.connects(incoming, outgoing)) {
          return PuzzleEvaluation(
            PuzzleStatus.almostSolved,
            'Tippe den Pfeilknoten, bis das Signal weiterfließt.',
            i,
          );
        }
      }
      if (node.type == NodeType.pattern) visitedPatterns.add(node.id);
    }

    final required = puzzle.requiredPatternIds;
    final inOrder =
        visitedPatterns.length >= required.length &&
        required.indexed.every(
          (entry) => visitedPatterns[entry.$1] == entry.$2,
        );
    if (!inOrder) {
      return PuzzleEvaluation(
        PuzzleStatus.almostSolved,
        'Pattern-Knoten fehlen oder sind vertauscht.',
        route.length - 1,
      );
    }
    if (route.last != puzzle.target.position) {
      return PuzzleEvaluation(
        PuzzleStatus.almostSolved,
        'Signal ist nah am Ziel.',
        route.length - 1,
      );
    }
    return PuzzleEvaluation(
      PuzzleStatus.solved,
      'Layer freigeschaltet!',
      route.length - 1,
    );
  }
}

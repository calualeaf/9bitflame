import 'dart:convert';

import 'package:bitflame/audio/chiptune_synth.dart';
import 'package:bitflame/game/pixelhain_data.dart';
import 'package:bitflame/puzzle/puzzle_engine.dart';
import 'package:bitflame/puzzle/puzzle_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('recognizes a complete route', () {
    final puzzle = createPixelhainPuzzles().first;
    final result = PuzzleEngine().evaluate(puzzle, const [
      GridPoint(0, 1),
      GridPoint(1, 1),
      GridPoint(2, 1),
    ]);
    expect(result.status, PuzzleStatus.solved);
  });

  test('reports wrong pattern order as almost solved', () {
    final puzzle = createPixelhainPuzzles()[1];
    final result = PuzzleEngine().evaluate(puzzle, const [
      GridPoint(0, 0),
      GridPoint(1, 0),
      GridPoint(2, 0),
      GridPoint(3, 0),
      GridPoint(3, 1),
    ]);
    expect(result.status, isNot(PuzzleStatus.solved));
  });

  test('stops at blocked fields', () {
    final puzzle = createPixelhainPuzzles()[2];
    final result = PuzzleEngine().evaluate(puzzle, const [
      GridPoint(0, 2),
      GridPoint(1, 2),
      GridPoint(1, 1),
    ]);
    expect(result.status, PuzzleStatus.incomplete);
  });

  test('rotates direction nodes in four orientations', () {
    const node = PuzzleNode(
      id: 'gate',
      type: NodeType.straight,
      position: GridPoint(0, 0),
    );
    expect(
      node.rotated().rotated().rotated().rotated().rotation,
      node.rotation,
    );
  });

  test('level 3 bassline route is solvable through its direction node', () {
    final puzzle = createPixelhainPuzzles()[2];
    final result = PuzzleEngine().evaluate(puzzle, const [
      GridPoint(0, 2),
      GridPoint(1, 2),
      GridPoint(2, 2),
      GridPoint(2, 1),
      GridPoint(3, 1),
      GridPoint(3, 0),
    ]);
    expect(result.status, PuzzleStatus.solved);
  });

  test('procedural chiptune layers render as wav data without binary assets', () {
    const synth = PixelhainChiptuneSynth();
    final rendered = [
      for (final recipe in pixelhainLayerRecipes) synth.renderWav(recipe),
    ];

    expect(rendered, hasLength(6));
    for (final wav in rendered) {
      expect(ascii.decode(wav.sublist(0, 4)), 'RIFF');
      expect(ascii.decode(wav.sublist(8, 12)), 'WAVE');
    }
  });
}

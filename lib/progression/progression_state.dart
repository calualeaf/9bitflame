class ProgressionState {
  final Set<String> _solvedPuzzleIds = <String>{};
  bool glitchUnlocked = false;
  bool glitchCompleted = false;

  int get solvedCount => _solvedPuzzleIds.length;
  bool isSolved(String id) => _solvedPuzzleIds.contains(id);

  void markSolved(String id) {
    _solvedPuzzleIds.add(id);
    if (solvedCount >= 3) glitchUnlocked = true;
  }
}

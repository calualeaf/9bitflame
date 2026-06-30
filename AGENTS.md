# AGENTS.md – 9bitflame

## Projektziel
9bitflame ist der Prototyp „Der Pixelhain“: ein 3–5-minütiges, portrait-orientiertes Smartphone-Klangpuzzle. Spielende reparieren eine Pixel-Klangwelt, indem sie Signalrouten auf einem 4x4-Grid verbinden, Richtungsknoten drehen und dadurch sechs Chiptune-Layer dauerhaft freischalten. Nach Puzzle 3 gibt es optional das kurze Glitch-Minispiel „Parallel Run“; nach Puzzle 6 läuft der vollständige Track und die Welt ist aufgeblüht.

## Tech-Stack
- Flutter stable und Dart stable über `subosito/flutter-action@v2` in CI.
- Flame stable für die spätere 2D-Game-Runtime und `flame_audio` für synchronisierte Layer.
- Flutter Unit-, Widget- und Golden-Tests.
- GitHub Actions für PR-Tests und ausschließlich manuell gestartete Android-Release-Builds.

## Wichtige Befehle
- Dependencies installieren: `flutter pub get`
- Format prüfen: `dart format --set-exit-if-changed .`
- Analyse ausführen: `flutter analyze`
- Tests ausführen: `flutter test`
- Signierte Release-APK bauen: `flutter build apk --release` nach Bereitstellung von `android/key.properties` und der Keystore-Datei durch GitHub-Actions-Secrets.

## Arbeitsregeln
- Es darf keine lokale Entwicklungsumgebung beim Auftraggeber vorausgesetzt werden; alle relevanten Checks und der Release-Build müssen in GitHub Actions lauffähig sein.
- Vor Pull Requests müssen Formatcheck, Analyse und Tests ausgeführt oder als Umgebungswarnung dokumentiert werden.
- Fachliche oder designrelevante Änderungen werden in `docs/` dokumentiert.
- Keine try/catch-Blöcke um Imports verwenden.
- Kleine, klar benannte Dateien bevorzugen und Domainlogik möglichst unabhängig von Rendering und Audio testbar halten.

## Architekturüberblick
- `lib/app/`: Flutter-App-Shell, Theme und Startscreen.
- `lib/game/`: Pixelhain-Screen, Leveldaten, Welt-/Grid-Darstellung und Interaktionsfluss.
- `lib/puzzle/`: testbare Puzzle-Domain mit Knoten, Richtungsknoten, Routenprüfung und Lösungsstatus.
- `lib/audio/`: Layer-State für sechs Haupt-Layer und spätere Audio-Anbindung.
- `lib/progression/`: In-Memory-Fortschritt für gelöste Puzzles und Glitch-Status.
- `test/`: Unit- und Widget-Tests; Golden-Tests sollen für zentrale visuelle Zustände ergänzt werden.

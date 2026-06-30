# 9bitflame – Der Pixelhain

`9bitflame` ist ein Flutter-/Flame-Prototyp für den Layer-Puzzle-Loop „Der Pixelhain“. Ziel ist ein kurzer Android-Vertical-Slice, in dem Spielende sechs Signalrouten lösen, Richtungsknoten drehen und pro gelöstem Puzzle einen neuen Chiptune-Layer freischalten.

## Prototyp-Scope

- Eine spielbare Klangwelt: **Der Pixelhain**.
- Sechs Layer-Puzzles auf einem kleinen 4x4-Grid.
- Route-Verbinden-Mechanik per Touch.
- Richtungsknoten mit 90-Grad-Rotation.
- Fast-gelöst-, Teilroute- und Gelöst-Feedback.
- Optionales Glitch-Minispiel nach Puzzle 3 als nicht blockierende Belohnung.
- Abschlusszustand mit vollständig aktivierter Welt und komplettem Track.
- Sechs kurze 8-Bit-Audio-Layer im Gameboy-inspirierten Stil, die prozedural
  aus textbasierten Rezepten erzeugt werden.

## Projektstruktur

```text
.github/workflows/      CI-Checks und manueller Android-Release-Build
assets/                 Audio-, Bild- und Font-Assets
docs/                   Fachliche Beschreibung und Design-Spezifikation
lib/app/                Flutter-App-Shell
lib/game/               Pixelhain-Screen, Leveldaten und UI-Prototyp
lib/puzzle/             Testbare Puzzle-Domainlogik
lib/audio/              Audio-Layer-State
lib/progression/        In-Memory-Progression
test/                   Unit- und Widget-Tests
```

## Lokale Entwicklung

Eine lokale Entwicklungsumgebung ist hilfreich, aber nicht Voraussetzung für die Abnahme, weil Checks und Release-Builds in GitHub Actions laufen.

```bash
flutter pub get
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

## Android-Release-Build

Der Release-Build wird ausschließlich manuell über **GitHub Actions → Android Release APK → Run workflow** gestartet. Pushes und Pull Requests veröffentlichen keine APK.

Erforderliche Repository-Secrets:

- `ANDROID_KEYSTORE_BASE64`: Base64-kodierte Keystore-Datei.
- `ANDROID_KEYSTORE_PASSWORD`: Keystore-Passwort.
- `ANDROID_KEY_ALIAS`: Alias des Release-Schlüssels.
- `ANDROID_KEY_PASSWORD`: Passwort des Release-Schlüssels.

Der Workflow führt Formatcheck, Analyse und Tests aus, baut anschließend `flutter build apk --release` und veröffentlicht `app-release.apk` als Asset eines GitHub Releases.

## Umsetzungshinweise

Die fachliche Grundlage liegt in `docs/2026-06-30_Design_Spec_Prototyp.md`. Änderungen an Gameplay, Architektur oder Akzeptanzkriterien sollen in `docs/` nachvollziehbar dokumentiert werden. Weitere Agenten- und Projektkonventionen stehen in `AGENTS.md`.

## Audio

Der Prototyp enthält sechs prozedurale Chiptune-Layer mit
Square-/Triangle-Waves und Noise-Percussion. Die Layer sind bewusst
Gameboy-inspiriert angelegt: Kick, Snare, Bassline, Arpeggio, Lead-Hook und
FX-Fill ergänzen sich nach und nach zu einem eingängigen Chiptune-Loop. Die
Rezepte liegen als Dart-Code im Repository, damit Pull Requests keine
Binärdateien enthalten müssen.

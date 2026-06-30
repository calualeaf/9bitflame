# Design Spec – Layer-Puzzle-Loop Prototyp „Der Pixelhain“

**Dokumentzweck:** Dieses Dokument beschreibt einen ersten funktionalen Prototyp der App so konkret, dass ein Entwickler ihn ohne weitere fachliche Rückfragen umsetzen kann. Es ist bewusst als Design- und Architektur-Spezifikation formuliert und enthält keinen Implementierungscode.

- **Primäre Quelle:** `docs/2026-06-30_Fachliche_Beschreibung.md`
- **Zielplattform:** Installierbare, signierte Android-APK für ein ungerootetes Android-16-Testgerät
- **Empfohlener Tech-Stack:** jeweils aktuelle stabile Versionen von Flutter + Flame + GitHub Actions + Golden Tests + AGENTS.md
- **Entwicklungsumgebung:** CODEX Cloud, später optional Claude Web
- **Prototyp-Ziel:** Ein 3–5-minütiger Vertical Slice mit einer Klangwelt, einem Track, sechs Layer-Puzzles und einem optionalen Glitch-Minispiel.

---

## 1. Produktvision

Der Prototyp ist ein entspanntes, aber lebendiges Klang-Puzzle für Smartphones. Die Spielenden reparieren eine kleine Pixel-Klangwelt, indem sie Signalrouten herstellen und dadurch musikalische Layer eines Chiptune-Tracks freischalten.

Der zentrale emotionale Moment lautet:

> Ein Puzzle rastet ein, ein neuer Sound-Layer startet, die Welt reagiert sichtbar, und der Track wird sofort voller.

Das Spiel soll sich **nicht** wie ein klassisches Rhythmusspiel, eine freie Kompositions-App oder ein abstraktes Logikpuzzle anfühlen. Stattdessen soll der Spieler das Gefühl haben:

> „Ich bringe eine kleine kaputte Klangwelt wieder zum Grooven.“

---

## 2. Prototyp-Scope

### 2.1 Muss im Prototyp enthalten sein

- Eine installierbare Android-App.
- Eine einzige spielbare Klangwelt: **„Der Pixelhain“**.
- Ein vollständiger Chiptune-Loop mit sechs vorbereiteten Layern.
- Sechs kurze Layer-Puzzles.
- Eine Route-Verbinden-Mechanik auf einem kleinen Grid.
- Richtungsknoten, die per Tap um 90 Grad gedreht werden.
- Deutliches visuelles und akustisches Feedback für Teilfortschritt, Fast-gelöst-Zustände und gelöste Puzzles.
- Ein optionales Glitch-Minispiel nach Puzzle 3.
- Ein Abschlussmoment mit vollständig laufendem Track und aufgeblühter Welt.
- Build- und Testautomatisierung über GitHub Actions.
- AGENTS.md-Anweisungen für CODEX Cloud.

### 2.2 Bewusst nicht im Prototyp enthalten

- Keine Weltkarte.
- Keine freie Komposition.
- Kein Level-Editor.
- Keine Währungen, Quests, Ranglisten oder Monetarisierung.
- Keine Account-Systeme.
- Keine Cloud-Speicherung.
- Keine komplexe Story.
- Kein Highscore- oder Perfektionssystem.
- Keine große Sammlung mehrerer Tracks.
- Keine komplexen alternativen Routen oder Remix-Systeme.

---

## 3. Zielplattform und technische Randbedingungen

### 3.1 Android-Ziel

Der Prototyp muss als signierte APK baubar und auf einem ungerooteten Android-16-Testgerät installierbar sein. Ein Android App Bundle kann später zusätzlich erzeugt werden, ist aber nicht das Abnahme-Artefakt des Prototyps.

Mindestanforderungen:

- Touch-only-Bedienung.
- Portrait-Modus als Standard.
- Keine Root-Rechte.
- Keine lokalen Build-Tools auf dem Rechner des Auftraggebers erforderlich.
- Die signierte APK muss über ein GitHub Release herunterladbar sein.

### 3.2 Entwicklungs- und Build-Prozess

Der vollständige Build-Prozess muss in GitHub Actions laufen und darf ausschließlich manuell gestartet werden. Ein Push auf `main` oder einen anderen Branch darf keinen Android-Build auslösen.

1. Ein berechtigter Nutzer startet den Build manuell per `workflow_dispatch`.
2. Repository wird ausgecheckt.
3. Die jeweils aktuelle stabile Flutter-Version wird installiert oder über eine gepflegte Action bereitgestellt.
4. Dependencies werden mit aktuellen, nicht veralteten Tool-Versionen geladen.
5. Format-/Analyse-Checks laufen.
6. Unit-/Widget-/Golden-Tests laufen.
7. Eine signierte Android-APK wird gebaut.
8. Ein GitHub Release wird erstellt oder aktualisiert.
9. Die signierte APK wird als Release-Asset veröffentlicht.

Lokale Entwicklung darf möglich sein, darf aber nicht notwendig sein. Der Build darf nicht von veralteten Actions, veralteten Android-Build-Tools oder gepinnten Altversionen abhängen. Nur beim Android-SDK gilt: Die App muss mindestens auf Android 16 funktionieren; Unterstützung älterer Android-Versionen ist erlaubt, aber nicht verpflichtend.

### 3.3 Entwicklung mit CODEX Cloud

Das Repository soll so strukturiert sein, dass CODEX Cloud zuverlässig Änderungen durchführen kann:

- Klare Modulstruktur.
- Kleine, gut benannte Dateien.
- Dokumentierte Architekturentscheidungen.
- AGENTS.md im Repository-Root mit Projektkonventionen.
- Automatisierte Tests, die in Pull Requests laufen.
- Keine geheimen lokalen Voraussetzungen.

---

## 4. Empfohlene technische Architektur

### 4.1 Technologieauswahl

| Bereich | Empfehlung | Begründung |
|---|---|---|
| App Framework | Flutter, aktuelle stabile Version | Gute Android-Unterstützung, CI-freundlich, schnelle UI-Iteration. |
| Game Runtime | Flame, aktuelle kompatible stabile Version | Geeignet für 2D-Spielzustände, Sprites, Animationen und Game Loops. |
| Audio | Flutter-/Flame-kompatible Audio-Lösung | Layer müssen loopbar, synchronisierbar und einzeln aktivierbar sein. |
| Tests | Unit Tests, Widget Tests, Golden Tests | Golden Tests sichern visuelle Zustände der Puzzle- und Welt-UI. |
| CI/CD | GitHub Actions mit aktuellen gepflegten Actions | Vollständiger manueller Cloud-Build ohne lokale Entwicklungsumgebung. |
| Agenten-Kontext | AGENTS.md | Gibt CODEX Cloud Projektregeln, Build-Befehle und Konventionen. |

### 4.2 Zielarchitektur auf hoher Ebene

Die App soll in klar getrennte Bereiche aufgeteilt werden:

1. **App Shell**
   - Startet Flutter-App.
   - Erzwingt Portrait-Modus.
   - Lädt den Game Screen.

2. **Game Layer mit Flame**
   - Verwaltet Welt, Grid, Knoten, Signalfluss, Animationen und Minispiel.
   - Enthält die laufende Spielszene.

3. **Puzzle Domain**
   - Beschreibt Puzzle-Daten, Knoten, Verbindungen, Richtungsknoten und Lösungsbedingungen.
   - Muss möglichst unabhängig von Rendering und Audio testbar sein.

4. **Audio Layer System**
   - Verwaltet sechs Haupt-Layer plus optionalen Glitch-FX-Layer.
   - Aktiviert Layer dauerhaft nach Puzzle-Lösung.
   - Unterstützt Ghost-, gedämpfte und vollständige Zustände.

5. **Progression State**
   - Speichert während der Session, welche Puzzles gelöst sind.
   - Für den Prototyp reicht In-Memory-State.
   - Persistenz ist optional und nicht kritisch.

6. **Test- und Fixture-Bereich**
   - Definiert reproduzierbare Puzzle-Konfigurationen.
   - Enthält Golden-Test-Szenen für Intro, Teilroute, falschen Richtungsknoten, gelösten Layer und Abschluss.

### 4.3 Vorgeschlagene Repository-Struktur

Die konkrete Dateistruktur kann vom Entwickler angepasst werden, sollte aber ungefähr so aussehen:

```text
/
  AGENTS.md
  README.md
  docs/
    2026-06-30_Fachliche_Beschreibung.md
    2026-06-30_Design_Spec_Prototyp.md
  .github/
    workflows/
      android_build.yml
      tests.yml
  app/
    pubspec.yaml
    lib/
      main.dart
      app/
      game/
      puzzle/
      audio/
      progression/
    test/
    test_goldens/
    assets/
      audio/
      images/
      fonts/
```

Wenn das Repository als reines Flutter-Projekt angelegt wird, kann `app/` entfallen. Wichtig ist nur, dass CI, README und AGENTS.md eindeutig auf die tatsächlichen Pfade verweisen.

---

## 5. Gameplay-Spezifikation

### 5.1 Leveldaten

| Feld | Wert |
|---|---|
| Levelname | Der Pixelhain |
| Dauer | ca. 3–5 Minuten |
| Orientierung | Portrait |
| Stil | Freundlicher NES-/Gameboy-inspirierter Chiptune-Groove |
| Thema | Schlafender Pixelwald mit Klangbaum, Signalsteinen und leuchtenden Pflanzen |
| Ziel | Sechs Klangschichten aktivieren und den Track vollständig machen |

### 5.2 Core Loop

Der Core Loop lautet:

1. Spieler betrachtet ein kleines Knotenfeld.
2. Spieler verbindet eine Route vom Start zum Ziel.
3. Spieler bindet Pattern-Knoten in richtiger Reihenfolge ein.
4. Spieler dreht bei Bedarf Richtungsknoten.
5. Signal erreicht korrekt das Ziel.
6. Neuer Musik-Layer startet dauerhaft.
7. Die Welt reagiert sichtbar.
8. Das nächste Puzzle wird freigeschaltet.

Dieser Loop wiederholt sich sechs Mal.

### 5.3 Musikalische Layer-Reihenfolge

1. Grundpuls / Kick
2. Snare / Clap
3. Bassline
4. Arpeggio
5. Lead-Melodie
6. FX / Counter-Melody / Finale-Layer

Optional nach dem Glitch-Minispiel:

- Glitch-FX-Layer

Jeder aktivierte Layer läuft ab Freischaltung dauerhaft weiter.

---

## 6. Puzzle-System

### 6.1 Grid

Für den ersten Prototyp reicht ein 4x4-Grid pro Puzzle. Das Grid darf visuell organischer wirken, muss aber intern eindeutig aus diskreten Feldern bestehen.

### 6.2 Knotentypen

| Knotentyp | Funktion |
|---|---|
| Start-Knoten | Quelle des Signals, nicht beweglich, nicht drehbar. |
| Ziel-Knoten | Ziel des Signals, löst bei korrektem Eingang den Layer-Unlock aus. |
| Pattern-Knoten | Musikalische Fragmente, müssen in definierter Reihenfolge besucht werden. |
| Richtungsknoten | Leitende Elemente, die per Tap gedreht werden. |
| Leerer Verbindungsknoten | Erlaubt Routenführung ohne Pattern-Bedeutung. |
| Stör-Knoten | Ablenkung oder falscher Weg, erzeugt aber keinen harten Fehlerklang. |
| Blockiertes Feld | Darf nicht benutzt werden. |
| Glitch-Knoten | Optionaler Zugang zum Minispiel nach Puzzle 3. |

### 6.3 Route-Verbinden-Interaktion

Der Spieler zieht mit dem Finger eine Route über benachbarte Knoten/Felder. Für den Prototyp genügt orthogonale Nachbarschaft: oben, unten, links, rechts. Diagonalen sind nicht erforderlich.

Erwartetes Verhalten:

- Route beginnt immer am Start-Knoten.
- Route kann über Pattern-, Richtungs- und leere Verbindungsknoten laufen.
- Route darf nicht über blockierte Felder laufen.
- Route kann bei Bedarf vom Spieler neu gezogen oder korrigiert werden.
- Der aktuelle Signalfluss wird live entlang der gültigen Route visualisiert.

### 6.4 Richtungsknoten

Richtungsknoten sind die wichtigste Erweiterung der Grundmechanik.

Anforderungen:

- Tap auf Richtungsknoten dreht ihn um 90 Grad im Uhrzeigersinn.
- Vier diskrete Ausrichtungen.
- Sichtbare Leitung oder Pfeilform.
- Weicher Klick-Sound beim Drehen.
- Sofortige Aktualisierung des Signalflusses.
- Kein harter Fehlerton bei falscher Ausrichtung.

Für den Prototyp sind zwei Typen ausreichend:

1. **Gerader Richtungsknoten:** verbindet gegenüberliegende Seiten.
2. **Kurven-Richtungsknoten:** verbindet benachbarte Seiten.

### 6.5 Lösungsbedingungen

Ein Puzzle ist gelöst, wenn alle Bedingungen erfüllt sind:

1. Es gibt eine durchgehende Route vom Start zum Ziel.
2. Alle erforderlichen Pattern-Knoten liegen in richtiger Reihenfolge auf der Route.
3. Die Route nutzt keine blockierten Felder.
4. Alle Richtungsknoten auf der Route sind korrekt ausgerichtet.
5. Das Signal kann vollständig bis zum Ziel fließen.

Ein Fast-gelöst-Zustand liegt vor, wenn die Route größtenteils korrekt ist, aber z. B. ein Richtungsknoten falsch ausgerichtet ist oder ein Pattern-Knoten fehlt.

---

## 7. Feedback- und Audio-Regeln

### 7.1 Grundprinzip

Das Spiel darf nie absichtlich schief oder unangenehm klingen. Unfertige Zustände klingen stattdessen:

- gedämpft,
- fragmentiert,
- fern,
- weich glitchy,
- unvollständig.

Gelöste Zustände klingen:

- klar,
- voller,
- rhythmisch stabil,
- synchron,
- präsenter.

### 7.2 Während des Verbindens

Bei teilweiser korrekter Route:

- Route leuchtet schwach.
- Signal fließt bis zur letzten korrekten Stelle.
- Ghost-Layer wird hörbar.
- Weltobjekte bewegen sich minimal.

Bei falscher Richtungsknoten-Ausrichtung:

- Signal stoppt sichtbar am Knoten.
- Knoten pulsiert weich.
- Ghost-Layer bleibt fragmentiert.
- Ein subtiler Drehhinweis erscheint.

Bei falscher Pattern-Reihenfolge:

- Betroffener Pattern-Knoten flackert.
- Ghost-Layer wird gedämpfter.
- Route bleibt bestehen, rastet aber nicht ein.

### 7.3 Beim Lösen

Jede Puzzle-Lösung muss dieselbe Belohnungskette auslösen:

1. Signal läuft sichtbar vom Start zum Ziel.
2. Route und relevante Richtungsknoten leuchten nacheinander auf.
3. Puzzlefeld pulsiert einmal im Beat.
4. Neuer Layer wird vollständig hörbar.
5. Klangbaum oder Weltbereich blüht sichtbar auf.
6. Kurzer positiver Chiptune-Impact spielt.
7. Nächstes Puzzle wird freigeschaltet.

Der Layer-Unlock muss stärker wirken als normales Feedback.

---

## 8. Levelablauf „Der Pixelhain“

### 8.1 Intro

Startzustand:

- Zentraler Klangbaum ist grau-blau und schlafend.
- Sechs Klangsteine sind verschlossen.
- Pflanzen und Partikel sind dunkel.
- Erstes Puzzlefeld ist aktiv.
- Leiser Grundpuls ist hörbar.

Erste Tutorial-Hilfe:

> „Verbinde den Puls mit dem Ziel.“

### 8.2 Puzzle 1 – Grundpuls / Kick

- Neue Mechanik: Route verbinden.
- Keine Richtungsknoten.
- Route: Start → Puls-Knoten → Ziel.
- Ergebnis: Kick/Grundpuls startet vollständig.
- Visuell: Wurzeln des Klangbaums leuchten im Takt.

### 8.3 Puzzle 2 – Snare / Clap

- Neue Mechanik: Pattern-Reihenfolge und optional erster einfacher Richtungsknoten.
- Empfohlen: ein gerader Richtungsknoten, zunächst falsch ausgerichtet.
- Route: Start → Quadrat → Richtungsknoten → Kreis → Ziel.
- Ergebnis: Snare/Clap startet vollständig.
- Visuell: Pixelpilze öffnen sich im Backbeat.

Wenn Playtests zeigen, dass dies zu früh ist, darf der Richtungsknoten erst in Puzzle 3 verpflichtend werden.

### 8.4 Puzzle 3 – Bassline

- Neue Mechanik: Pflicht-Richtungsknoten.
- Route: Start → Note A → Kurven-Richtungsknoten → Note B → Note C → Ziel.
- Enthält ein blockiertes Feld und einen Stör-Knoten.
- Ergebnis: Bassline startet vollständig.
- Visuell: Stamm des Klangbaums leuchtet.

Nach diesem Puzzle erscheint der optionale Glitch-Knoten.

### 8.5 Optionales Glitch-Minispiel – „Parallel Run“

- Start: Spieler tippt den violett flackernden Glitch-Knoten.
- Dauer: 20–40 Sekunden.
- Steuerung: Tap = Sprung.
- Spielform: horizontales Auto-Run-Minispiel mit 5–8 sammelbaren Glitch-Fragmenten oder einfachen Hindernissen.
- Erfolg: Optionaler Glitch-FX-Layer und kleine visuelle Mutation.
- Misserfolg: Rückkehr ins Hauptlevel ohne Game Over.

Das Minispiel darf den Abschluss des Hauptlevels nicht blockieren.

### 8.6 Puzzle 4 – Arpeggio

- Zwei Richtungsknoten.
- Etwas komplexere Route.
- Ergebnis: Arpeggio bringt Bewegung und Energie.
- Visuell: Baumkrone bekommt leuchtende Pixelblätter.

### 8.7 Puzzle 5 – Lead-Melodie

- Ein Richtungsknoten als Teil einer melodischen Route.
- Fokus: Hook-Moment.
- Ergebnis: Lead-Melodie startet.
- Visuell: Welt wirkt deutlich lebendig, Pflanzen bewegen sich melodisch.

### 8.8 Puzzle 6 – FX / Finale-Layer

- Zwei Richtungsknoten, optional mit Glitch-Bezug.
- Finale Route darf die anspruchsvollste des Levels sein, bleibt aber ohne Zeitdruck.
- Ergebnis: FX / Counter-Melody / Finale-Layer startet.
- Visuell: Klangbaum und Pixelhain sind vollständig aktiviert.

### 8.9 Abschluss

Nach Puzzle 6:

- Vollständiger Track läuft mindestens 10–20 Sekunden.
- Kamera oder Szene zeigt die aufgeblühte Welt.
- Optionaler Button: „Track erneut anhören“.
- Optionaler Button: „Nochmal spielen“.

Keine Weltkarte erforderlich.

---

## 9. UI/UX-Anforderungen

### 9.1 Bedienung

- Ein-Finger-Touch muss ausreichen.
- Kein präzises Timing erforderlich.
- Keine parallelen Mehrfinger-Gesten.
- Tap für Richtungsknoten.
- Drag für Route.
- Tap für Glitch-Knoten.
- Tap für Sprung im Minispiel.

### 9.2 Lesbarkeit

- Start, Ziel und aktive Knoten müssen auf Smartphone-Größe eindeutig unterscheidbar sein.
- Richtungsknoten brauchen klare Pfeil-/Leitungsform.
- Blockierte Felder müssen eindeutig nicht nutzbar aussehen.
- Ghost-, Fast-gelöst- und Gelöst-Zustände müssen visuell unterscheidbar sein.

### 9.3 Textmenge

Tutorial-Text soll minimal bleiben:

1. „Verbinde den Puls mit dem Ziel.“
2. „Tippe den Pfeilknoten, bis das Signal weiterfließt.“

Danach soll das Spiel möglichst über visuelle und akustische Hinweise funktionieren.

---

## 10. Asset-Anforderungen

### 10.1 Audio

Für den Prototyp werden mindestens benötigt:

- Ein gemeinsames Tempo und Loop-Raster für alle Layer.
- Sechs nahtlos loopende Haupt-Layer.
- Optionaler Glitch-FX-Layer.
- Ghost-/gedämpfte Varianten oder dynamische Lautstärke-/Filterzustände.
- Kurzer positiver Unlock-Impact.
- Weicher Klick-Sound für Richtungsknoten.
- Optionaler Glitch-Portal-Sound.

Wichtig: Alle Layer müssen harmonisch zueinander passen.

### 10.2 Grafik

Benötigt werden:

- Pixelhain-Hintergrund.
- Klangbaum in mehreren Aktivierungszuständen.
- Start-, Ziel-, Pattern-, Richtungs-, Stör-, Block- und Glitch-Knoten.
- Signalfluss-Animation.
- Route-Highlight.
- Kleine Weltreaktionen pro Layer.
- Minispiel-Figur.
- Minispiel-Hindernisse oder Sammelobjekte.

### 10.3 Platzhalterstrategie

Falls finale Assets fehlen, sollen hochwertige Platzhalter erlaubt sein, solange folgende Dinge testbar bleiben:

- Signalfluss-Verständlichkeit.
- Richtungsknoten-Verständlichkeit.
- Layer-Unlock-Wirkung.
- Welttransformation.
- Audio-Layer-Aufbau.

---

## 11. Teststrategie

### 11.1 Unit Tests

Unit Tests sollen mindestens prüfen:

- Korrekte Erkennung einer vollständigen Route.
- Fehler bei falscher Pattern-Reihenfolge.
- Fehler bei blockiertem Feld.
- Fast-gelöst-Zustand bei falsch gedrehtem Richtungsknoten.
- Korrekte Rotation eines Richtungsknotens in vier Ausrichtungen.
- Puzzleabschluss aktiviert den richtigen Layer-State.

### 11.2 Widget-/Integrationstests

Tests sollen mindestens prüfen:

- App startet bis zum Game Screen.
- Puzzle 1 kann über Testinput gelöst werden.
- Richtungsknoten reagieren auf Tap.
- Nach Puzzle-Lösung wird nächstes Puzzle freigeschaltet.

### 11.3 Golden Tests

Golden Tests sollen mindestens folgende Szenen abdecken:

1. Intro-Zustand des Pixelhains.
2. Puzzle mit teilweiser Route.
3. Signal stoppt an falsch ausgerichtetem Richtungsknoten.
4. Gelöster Layer mit aktivierter Weltreaktion.
5. Abschlusszustand mit vollständig aktivierter Welt.

Golden Tests dienen nicht dazu, jedes Animationsdetail festzuschreiben. Sie sollen die wichtigsten visuellen Zustände gegen unbeabsichtigte Änderungen absichern.

### 11.4 Manuelle Akzeptanztests auf Android

Vor Abnahme soll ein Entwickler auf einem Android-16-Testgerät prüfen:

- APK lässt sich ohne Root installieren.
- App startet ohne Absturz.
- Touch-Interaktionen funktionieren flüssig.
- Audio-Layer starten nachvollziehbar.
- Keine offensichtlichen Loop-Lücken im Track.
- Puzzle 1 bis 6 sind abschließbar.
- Optionales Glitch-Minispiel blockiert den Levelabschluss nicht.

---

## 12. GitHub-Actions-Anforderungen

Es sollen mindestens zwei Workflows existieren. Alle verwendeten Actions, SDKs und Build-Tools müssen auf aktuellen, gepflegten Versionen basieren. Veraltete Actions-Versionen oder alte Flutter-/Java-/Android-Toolchains sind zu vermeiden. Versionen dürfen bewusst gepinnt werden, wenn sie auf eine aktuelle stabile Version zeigen und regelmäßig aktualisiert werden.

### 12.1 Tests Workflow

Auslöser:

- Pull Request
- Optional manuell per `workflow_dispatch`

Der Test-Workflow darf weiterhin in Pull Requests laufen, weil er keine Release-APK veröffentlicht.

Aufgaben:

- Flutter installieren.
- Dependencies laden.
- Formatcheck ausführen.
- Statische Analyse ausführen.
- Unit-/Widget-/Golden-Tests ausführen.

### 12.2 Android Release Build Workflow

Auslöser:

- Ausschließlich manuell per `workflow_dispatch`

Nicht erlaubte Auslöser:

- Kein Push auf `main`
- Kein Push auf andere Branches
- Kein Pull-Request-Trigger für die Veröffentlichung einer APK

Aufgaben:

- Aktuelle stabile Flutter-Version installieren.
- Aktuelle kompatible Java-/Android-Toolchain verwenden.
- Dependencies laden.
- Tests verpflichtend ausführen.
- Release-APK bauen.
- APK mit einem in GitHub Actions bereitgestellten Signing-Setup signieren.
- GitHub Release erstellen oder aktualisieren.
- Signierte APK als GitHub-Release-Asset hochladen.

Das Ergebnis des Build-Prozesses ist eine signierte APK, die über ein GitHub Release herunterladbar ist. Eine reine Debug-APK oder ein bloßes Workflow-Artefakt reicht für die Abnahme nicht aus.

---

## 13. AGENTS.md-Anforderungen

Im Repository-Root soll eine `AGENTS.md` liegen, damit CODEX Cloud zuverlässig arbeiten kann.

Sie soll mindestens enthalten:

- Projektziel in 3–5 Sätzen.
- Tech-Stack: jeweils aktuelle stabile Versionen von Flutter + Flame.
- Wichtige Befehle:
  - Dependencies installieren.
  - Format prüfen.
  - Analyse ausführen.
  - Tests ausführen.
  - Signierte Android-Release-APK bauen.
- Hinweis, dass keine lokale Entwicklungsumgebung vorausgesetzt werden darf.
- Testanforderung vor Pull Requests.
- Kurze Architekturübersicht.
- Konvention, dass fachliche Änderungen in `docs/` dokumentiert werden.
- Hinweis, dass keine try/catch-Blöcke um Imports verwendet werden sollen.

---

## 14. Akzeptanzkriterien

Der Prototyp gilt als funktional, wenn alle folgenden Punkte erfüllt sind:

1. Eine signierte Android-APK wird vollständig in GitHub Actions gebaut.
2. Der Android-Build-Workflow wird ausschließlich manuell per `workflow_dispatch` ausgelöst.
3. Die signierte APK wird als Asset eines GitHub Releases bereitgestellt.
4. Die APK lässt sich auf einem ungerooteten Android-16-Gerät installieren.
5. Die App startet direkt in oder vor den Level „Der Pixelhain“.
6. Der Spieler kann sechs Puzzles lösen.
7. Jeder gelöste Puzzle aktiviert genau einen neuen Musik-Layer dauerhaft.
8. Mindestens ein Puzzle enthält einen verpflichtenden Richtungsknoten.
9. Falsch ausgerichtete Richtungsknoten stoppen das Signal sichtbar, ohne harten Fehlerton.
10. Nach Puzzle 3 kann optional ein Glitch-Minispiel gestartet werden.
11. Das Glitch-Minispiel ist kurz, einfach und blockiert den Levelabschluss nicht.
12. Nach Puzzle 6 läuft der vollständige Track und die Welt ist sichtbar aufgeblüht.
13. Unit-/Widget- oder Integrationstests decken die Kernlogik ab.
14. Golden Tests decken zentrale visuelle Zustände ab.
15. README oder AGENTS.md dokumentieren, wie der manuelle Release-Build zu nutzen ist.
16. Flutter, Flame, GitHub Actions und weitere Build-Tools werden in aktuellen stabilen Versionen verwendet; veraltete Toolchains sind nicht akzeptabel.

---

## 15. Wichtigste offene Designfragen für den nächsten Schritt

Diese Fragen müssen nicht vor dem ersten Prototyp final beantwortet werden, sollten aber während der Umsetzung beobachtet werden:

1. Ist der Layer-Unlock stark genug, um Freude auszulösen?
2. Verstehen Spieler Richtungsknoten ohne lange Erklärung?
3. Ist Puzzle 2 mit Richtungsknoten zu früh oder genau richtig?
4. Fühlt sich das Glitch-Minispiel wie Belohnung oder Unterbrechung an?
5. Bleibt der Track nach jedem Layer musikalisch spannender?
6. Ist der Prototyp eher zu leicht, genau richtig oder zu abstrakt?
7. Wollen Spieler den fertigen Track kurz anhören oder sofort abbrechen?

---

## 16. Entwickler-Priorisierung

Empfohlene Umsetzungsreihenfolge:

1. Flutter/Flame-Projektstruktur und GitHub Actions einrichten.
2. Puzzle-Domain-Modell ohne Rendering implementieren.
3. Unit Tests für Route, Pattern-Reihenfolge und Richtungsknoten schreiben.
4. Einfache Flame-Szene mit 4x4-Grid und Platzhalterknoten bauen.
5. Route-Drag und Richtungsknoten-Tap umsetzen.
6. Audio-Layer-System mit Platzhalterloops anbinden.
7. Puzzle 1–3 spielbar machen.
8. Layer-Unlock-Feedback verstärken.
9. Puzzle 4–6 ergänzen.
10. Optionales Glitch-Minispiel ergänzen.
11. Golden Tests und Android-CI stabilisieren.
12. Signierte APK über einen manuellen GitHub-Release-Build erzeugen und auf Android-16-Gerät testen.

Die wichtigste technische und gestalterische Priorität bleibt:

> Jede gelöste Aktion muss den Track spürbar besser machen.

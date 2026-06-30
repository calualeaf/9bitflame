# Layer-Puzzle-Loop – Game-Design-Ausarbeitung mit Level-1-Spezifikation

---

# 1. Ausgangsvision

> Ein eingängiges Klang-Puzzle für Smartphones. Die Spielenden reisen durch bunte, NES-artige Klangwelten und bauen jedes Puzzle Schicht für Schicht zu einem vollen Gameboy-Chiptune-Track auf. Jeder Lösungsschritt fügt eine neue, immer harmonische Klangschicht hinzu — es klingt nie schief, es wird nur immer reicher und eingängiger. Versteckt in den Puzzles lauern surreale 16-bit-Minispiele mit verzerrten „Parallelwelt“-Helden der 8/16-bit-Ära, die für Tempo, Action und Überraschung sorgen.
>
> Leitgefühl: entspanntes, frustfreies Fundament — aber keine Schlaf-/Zen-App. Eingängige Ohrwurm-Tracks und actionreiche Minispiele halten Energie und Spannung hoch.

---

# 2. Kurze Zusammenfassung der Spiel-Fantasie

## 2.1 Was soll der Spieler fühlen?

Der Spieler soll fühlen:

**„Ich bringe eine kleine kaputte Klangwelt wieder zum Grooven.“**

Das Spielgefühl soll nicht primär sein:

- „Ich komponiere frei.“
- „Ich spiele ein hartes Rhythmusspiel.“
- „Ich löse abstrakte Logikaufgaben.“

Sondern eher:

- „Ich entdecke einen Song.“
- „Ich repariere eine musikalische Welt.“
- „Jede richtige Aktion macht alles schöner, voller und eingängiger.“
- „Ich bin entspannt, aber trotzdem wach und neugierig.“

Der wichtigste emotionale Moment ist der **Layer-Unlock**:

Ein Rätsel rastet ein, eine neue Klangschicht startet, die Welt reagiert visuell, und der Track wird sofort besser.

---

## 2.2 Welche Rolle nimmt der Spieler ein?

Die stärkste Spielerrolle ist:

## Chiptune-Restaurator / Groove-Architekt

Der Spieler reist durch seltsame Pixelwelten, löst kleine Klangrätsel und setzt aus einzelnen musikalischen Schichten einen vollständigen Ohrwurm zusammen.

Der Spieler ist nicht vollständig freier Komponist, sondern eher jemand, der vorhandene musikalische Energie freilegt, sortiert und synchronisiert.

---

# 3. Zentrale Design-Hypothese

Die stärkste Hypothese für den Spielkern lautet:

> **Kleine Klangrätsel lösen macht Spaß, wenn jede Lösung sofort hörbar und sichtbar eine neue Song-Schicht freischaltet.**

Das Spiel muss beweisen, dass der wiederholte Moment

**Rätsel lösen → Klangschicht kommt dazu → Welt wird lebendiger**

auch nach mehreren Wiederholungen befriedigend bleibt.

Falls dieser Moment nicht trägt, helfen spätere Sammelsysteme, Minispiele oder Meta-Progression nur begrenzt.

---

# 4. Wahrscheinlich stärkster Core Loop

# Layer-Puzzle-Loop

## 4.1 Kurzform

**Puzzleteil lösen → neue Klangschicht freischalten → nächsten Layer wählen → Track/Welt voller machen → nächstes Klangrätsel lösen.**

---

## 4.2 Loop im geforderten Format

**Spieler löst ein kleines Pattern-/Routing-/Layer-Puzzle → bekommt sofort eine neue hörbare Musikschicht plus visuelles Aufblühen → entscheidet, welche nächste Klangschicht oder welchen versteckten Glitch-Pfad er angeht → vervollständigt den Track und verändert die Welt → wiederholt, weil der Song immer voller, eingängiger und überraschender wird.**

---

## 4.3 Warum dieser Loop zur Vision passt

Der Loop erfüllt die Kernfantasie direkt:

- Der Spieler baut Musik Schicht für Schicht auf.
- Jede gelöste Aufgabe erzeugt eine positive, sinnliche Belohnung.
- Das Spiel bleibt frustarm, weil nichts schief klingt.
- Es gibt trotzdem Fortschritt, Spannung und Energie.
- Die surrealen Minispiele können als Kontrast wirken, ohne den Hauptloop zu überladen.

---

# 5. Core Loop, Session Loop, Meta Loop

# 5.1 Core Loop: alle 10–60 Sekunden

Der Spieler sieht ein kleines Klang-Puzzle. Möglich sind zum Beispiel:

- ein 4x4-Grid,
- eine Reihe von Klangknoten,
- eine Signalroute,
- eine Pattern-Kette,
- ein Layer-Schaltkreis,
- eine Sequenz aus musikalischen Fragmenten.

Der Spieler manipuliert wenige Elemente:

- drehen,
- verbinden,
- tauschen,
- aktivieren,
- verschieben,
- timen.

Für den ersten spielbaren Level wird diese Auswahl konkretisiert auf:

- Route verbinden,
- Pattern-Knoten in richtiger Reihenfolge einbinden,
- Richtungsknoten drehen,
- optionale Glitch-Knoten entdecken.

Wenn die Lösung stimmt, passiert sofort:

1. Eine neue musikalische Schicht startet im Loop.
2. Die Welt reagiert sichtbar.
3. Das Puzzlefeld verändert sich oder öffnet den nächsten Bereich.
4. Der Spieler versteht: „Ich habe den Track voller gemacht.“

Beispiele für freischaltbare Layer:

- Kick,
- Snare,
- Hi-Hat,
- Bassline,
- Arpeggio,
- Lead-Melodie,
- Akkordfläche,
- Counter-Melody,
- FX,
- Vocal-/Chip-Chop,
- Glitch-Layer.

Wichtig: Auch nicht gelöste Zustände dürfen musikalisch nicht unangenehm sein. Sie sollten aber klar unvollständig wirken.

Beispiele:

- Der Layer klingt gedämpft.
- Nur einzelne Noten sind hörbar.
- Der Klang wirkt „verschattet“ oder „glitchy“.
- Die Welt pulsiert nicht synchron.
- Ein Signal erreicht sein Ziel noch nicht.
- Ein Signal stoppt an einem falsch ausgerichteten Richtungsknoten.

Nicht: „Das klingt falsch.“  
Besser: **„Das ist noch nicht eingerastet.“**

---

# 5.2 Session Loop: 3–10 Minuten

Eine Spielsitzung sollte idealerweise ein kompletter kleiner Track sein.

## Beispielablauf einer Session

1. Der Spieler betritt eine fast leere Klangwelt.
2. Ein einfacher Puls, Drone oder Beat-Fragment läuft bereits.
3. Der Spieler löst 5–8 kleine Layer-Puzzles.
4. Jedes gelöste Puzzle fügt eine neue Klangschicht hinzu.
5. Nach einigen gelösten Layers kann ein Glitch-Moment erscheinen.
6. Optional startet ein kurzes surreales 16-bit-Minispiel.
7. Der Spieler kehrt in den Song zurück.
8. Am Ende ist der Track vollständig.
9. Die Welt ist synchronisiert, repariert oder transformiert.

---

## Session Reward

Der zentrale Reward ist nicht nur ein Score, sondern:

**Der Spieler hört den fertigen Track und sieht die vollständig aufgeblühte Welt.**

Die Session sollte enden mit:

- einem kurzen musikalischen Finale,
- einer fertigen Loop-Version des Tracks,
- sichtbarer Transformation der Welt,
- Lust auf die nächste Klangwelt.

---

# 5.3 Meta Loop: über mehrere Sitzungen hinweg

Der Meta Loop sollte für den Anfang bewusst schlank bleiben.

Stärkste Variante:

**Welten/Tracks abschließen → neue Klangwelten freischalten → neue musikalische Stile/Instrumente entdecken → Album/Karte/Songbook vervollständigen.**

Mögliche Meta-Strukturen:

- eine Weltkarte aus Klangwelten,
- ein Album mit abgeschlossenen Tracks,
- freigeschaltete Instrumenten-Familien,
- alternative Track-Versionen,
- geheime Glitch-Tracks,
- kosmetische Veränderungen der Klangwelten.

Für den ersten Prototyp sollte die Meta-Progression aber minimal bleiben.

Die wichtigste Testfrage lautet:

> **Will der Spieler nach einem fertigen Track den nächsten hören?**

Wenn ja, ist der Kern stark. Wenn nein, sollte nicht zuerst Meta-Progression ergänzt werden, sondern der Layer-Puzzle-Moment verbessert werden.

---

# 6. Wichtigste Spaßquelle

Die wichtigste Spaßquelle ist:

# Bauen

Der Spieler baut einen Song Schicht für Schicht auf.

Das ist die zentrale Fantasie und die zentrale Belohnung.

---

## 6.1 Sekundäre Spaßquellen

# Entdecken

Der Spieler fragt sich:

- Welche Klangschicht kommt als Nächstes?
- Wie verändert sich die Welt?
- Gibt es ein verstecktes Glitch-Portal?
- Was ist die nächste musikalische Überraschung?

# Progression

Der Fortschritt ist direkt hörbar. Der Track wird voller, dichter und vollständig.

Das ist stärker als rein abstrakte Level-Progression.

# Skill

Skill sollte vorhanden sein, aber leicht zugänglich bleiben.

Geeignete Skill-Arten:

- Pattern-Erkennung,
- räumliches Denken,
- leichtes Timing,
- Reihenfolgen verstehen,
- Ursache-Wirkung lesen,
- Signalfluss verstehen,
- Richtungsknoten korrekt ausrichten.

Nicht ideal als Hauptfokus:

- harte Rhythmus-Präzision,
- schnelle Reaktion als Pflicht,
- komplexe Musiktheorie,
- freie Komposition.

---

## 6.2 Spaßquellen, die vorsichtig eingesetzt werden sollten

# Kreativität

Kreativität klingt passend, ist aber riskant. Wenn der Spieler frei komponieren soll, steigen Entwicklungsaufwand und Qualitätsrisiko stark.

Für den Anfang besser:

**kuratiertes musikalisches Bauen statt freies Komponieren.**

Der Spieler trifft Entscheidungen innerhalb sicherer, harmonischer Bausteine.

# Chaos

Chaos passt zu den Glitch-Minispielen, sollte aber nicht den Hauptloop dominieren.

# Risiko/Belohnung

Risiko/Belohnung eignet sich gut für optionale Glitch-Pfade, aber nicht als Fundament des entspannten Hauptspiels.

---

# 7. Design-Prinzipien für den Layer-Puzzle-Loop

# 7.1 Jede Lösung muss sofort belohnen

Ein gelöstes Puzzle darf sich nicht nur wie ein Häkchen anfühlen.

Es sollte gleichzeitig passieren:

- neuer Sound startet,
- visuelles Feedback,
- kurzer Impact,
- Fortschritt im Track,
- erkennbare Veränderung der Welt.

Der Layer-Unlock ist der wichtigste Moment des Spiels.

---

# 7.2 „Nie falsch klingend“ braucht trotzdem klares Feedback

Die Vision sagt: Es klingt nie schief.

Das ist stark, aber gefährlich. Wenn alles immer gut klingt, könnte dem Spieler Feedback fehlen.

Lösung:

Nicht gelöste Zustände klingen harmonisch, aber:

- dünn,
- gedämpft,
- fragmentiert,
- unvollständig,
- fern,
- glitchy,
- unsynchronisiert.

Gelöste Zustände klingen:

- voll,
- klar,
- rhythmisch stabil,
- synchron,
- energetischer,
- präsenter.

So bleibt das Spiel angenehm, ohne beliebig zu werden.

---

# 7.3 Der Spieler sollte Musik nicht erklären müssen

Das Spiel sollte ohne Musiktheorie funktionieren.

Der Spieler muss nicht wissen:

- was eine Tonart ist,
- was ein Akkord ist,
- was ein Arpeggio ist,
- was Synkope bedeutet.

Er sollte über einfache, visuelle und taktile Regeln spielen können:

- gleiche Formen verbinden,
- Signalfluss herstellen,
- Pattern vervollständigen,
- Knoten synchronisieren,
- Wege schließen,
- Sequenzen ordnen,
- Richtungsknoten drehen.

Die Musik ist die Belohnung, nicht die Bedienungsanleitung.

---

# 7.4 Minispiele sind Würze, nicht Fundament

Die surrealen 16-bit-Minispiele sind ein starkes Alleinstellungsmerkmal.

Aber für den ersten Prototyp sollten sie nicht der Kern sein.

Empfohlene Rolle:

- optional,
- kurz,
- überraschend,
- energetisch,
- nach einem gelösten Layer oder als versteckter Bonus.

Nicht empfohlen für den ersten Prototyp:

- Minispiele als Hauptfortschritt,
- lange Unterbrechungen,
- viele verschiedene Minigame-Typen,
- komplexe Action-Systeme.

Der Hauptloop bleibt:

**Layer-Puzzle lösen → Musik wird voller.**

Das Minigame ist ein Energie-Peak, kein zweites komplettes Spiel.

---

# 8. Erste konkrete Mechanik-Hypothese

# Pattern-Knoten verbinden

Eine gute erste Puzzleform wäre:

**Der Spieler verbindet Klangknoten in der richtigen Reihenfolge oder Route, um einen Layer zu aktivieren.**

Diese Mechanik wird für Level 1 konkret erweitert zu:

**Der Spieler verbindet die Route und dreht mindestens einen Richtungsknoten, damit das Signal weiterfließen kann.**

Richtungsknoten müssen aber nicht in jedem Rätsel vorkommen. Sie werden im ersten Level eingeführt und können später für komplexere Fälle weiterentwickelt werden.

---

## 8.1 Warum diese Mechanik geeignet ist

- Visuell verständlich.
- Touch-tauglich.
- Kein hartes Timing nötig.
- Gut skalierbar.
- Passt zur Fantasie von Klangwelt-Reparatur.
- Kann später Tiefe entwickeln.
- Erlaubt harmonische Zwischenzustände.
- Richtungsknoten geben zusätzliche Puzzle-Tiefe, ohne harte Reaktionsanforderung.
- Signalfluss ist intuitiv sichtbar und auditiv unterstützbar.

---

## 8.2 Beispiel

Auf dem Screen befinden sich mehrere Knoten:

- Start-Knoten,
- Beat-Knoten,
- Bass-Knoten,
- Melodie-Knoten,
- Richtungsknoten,
- Ziel-Knoten.

Der Spieler zieht Verbindungen oder dreht Module, bis das Signal korrekt durchläuft.

Während des Experimentierens hört er Fragmente des Layers. Wenn die Route korrekt ist und alle Richtungsknoten richtig ausgerichtet sind, rastet der Layer ein und spielt vollständig im Loop.

---

## 8.3 Mögliche spätere Variationen

Nur als Richtung, nicht als Feature-Liste für den ersten Prototyp:

- Knoten mit Taktpositionen,
- Knoten mit Instrumentfarben,
- rotierende Signalpfade,
- Gates, die nur auf bestimmten Beats öffnen,
- Glitch-Knoten mit optionalem Risiko,
- alternative Routen für Remix-Varianten,
- One-Way-Richtungsknoten,
- T-Knoten,
- Beat-Gates,
- farbkodierte Richtungsknoten.

Für den ersten Prototyp reicht eine einzige klare Variante:

**Route verbinden + einfache Richtungsknoten drehen.**

---

# 9. Alternative Core Loops

Neben dem empfohlenen Layer-Puzzle-Loop wurden drei Alternativen identifiziert.

---

# 9.1 Alternative A: Rhythmus-Echo-Loop

## Loop

**Spieler hört ein kurzes Pattern → tippt oder swiped es nach → schaltet Layer frei → Song wird voller → nächstes Pattern wird komplexer.**

## Stärken

- Sofort verständlich.
- Starkes Skill-Gefühl.
- Passt gut zu Musik.
- Kann sehr befriedigend sein.

## Risiken

- Android-Audio-Latenz kann problematisch sein.
- Timing-Frust widerspricht dem frustfreien Leitgefühl.
- Barrierefreiheit sinkt.
- Kann schnell wie ein klassisches Rhythmusspiel wirken.

## Einschätzung

Gut als späterer Puzzle-Typ oder Minigame-Variante, aber riskanter als Hauptloop.

---

# 9.2 Alternative B: Signal-Routing-Loop

## Loop

**Spieler verbindet Klangquellen mit Ausgängen → richtige Verbindung aktiviert musikalische Layer → Welt synchronisiert sich → neue Knoten und Sonderregeln erscheinen.**

## Stärken

- Sehr mobile-tauglich.
- Gute Spieltiefe.
- Saubere Puzzle-Logik.
- Passt gut zur Reparatur-/Synchronisationsfantasie.

## Risiken

- Kann abstrakt und trocken wirken.
- Braucht gutes visuelles und akustisches Feedback.
- Puzzle-Design kann aufwendig werden.

## Einschätzung

Sehr nahe am empfohlenen Layer-Puzzle-Loop. Eventuell ist Signal-Routing die konkrete Umsetzungsform des Layer-Puzzle-Loops.

---

# 9.3 Alternative C: Glitch-Portal-Loop

## Loop

**Spieler sucht versteckte Fehler in Klangrätseln → aktiviert surreale Minispiele → gewinnt Bonus-Layer oder Varianten → kehrt in den Song zurück → sucht weitere Glitches.**

## Stärken

- Markant.
- Überraschend.
- Eigenständige Identität.
- Passt gut zur Parallelwelt-Idee.

## Risiken

- Hoher Content-Aufwand.
- Kann den entspannten Hauptflow stören.
- Baut schnell zwei Spiele gleichzeitig.
- Schwerer sauber zu balancieren.

## Einschätzung

Sehr gut als sekundärer Loop, aber nicht als erstes Fundament.

---

# 10. Bewertung der Core Loops

Skala: 1 = schwach, 5 = stark.  
Entwicklungsaufwand: relativ für ein Indie-Team oder Solo-/Small-Team-Prototyping.

| Core Loop | Verständlichkeit | Mobile-Tauglichkeit | Wiederholbarkeit | Spieltiefe | Entwicklungsaufwand | Einschätzung |
|---|---:|---:|---:|---:|---|---|
| **Layer-Puzzle-Loop** | 5 | 5 | 4 | 3 | mittel | Bester Fit. Sofort verständlich, starke Belohnung, gut für Vertical Slice. |
| **Rhythmus-Echo-Loop** | 4 | 4 | 4 | 4 | mittel | Kann Spaß machen, aber Timing-Frust und Android-Audio-Latenz sind echte Risiken. |
| **Signal-Routing-Loop** | 4 | 5 | 5 | 5 | mittel–hoch | Mechanisch tief, aber braucht gutes Puzzle-Design und kann trocken werden. |
| **Glitch-Portal-Loop** | 3 | 4 | 3 | 3 | hoch | Cooles Alleinstellungsmerkmal, aber zu contentlastig als erster Kern. |

---

# 11. Empfehlung für den ersten Vertical-Slice-Prototyp

# Ziel

Ein einziger 3–5-Minuten-Track, der durch 6 Layer-Puzzles aufgebaut wird.

Der Prototyp muss nicht beweisen, dass das ganze Spiel langfristig funktioniert. Er muss nur eine zentrale Frage beantworten:

> **Macht es Spaß, einen Song durch kleine Rätsel hörbar aufzubauen?**

---

# 11.1 Minimaler Umfang

Für den ersten Vertical Slice:

- 1 Klangwelt,
- 1 vollständiger Chiptune-Track,
- 6 musikalische Layer,
- 1 klare Puzzle-Mechanik,
- 1 kurzer Glitch-Minispiel-Moment,
- keine komplexe Meta-Progression,
- keine große Sammlung,
- keine freie Komposition.

## Beispielhafte Layer-Reihenfolge

1. Grundpuls / Kick
2. Snare / Percussion
3. Bassline
4. Arpeggio
5. Lead-Melodie
6. FX / Counter-Melody / Finale-Layer

Jeder Layer sollte so gestaltet sein, dass der Track nach jedem Schritt hörbar besser wird.

---

# 11.2 Empfohlene Struktur des Vertical Slice

## Start

- Fast leere Welt.
- Nur ein leiser Puls oder ein einzelnes Motiv.
- Visuell reduzierte, aber charmante Umgebung.

## Puzzle 1

- Sehr einfach.
- Spieler lernt die Interaktion.
- Erster klarer Layer-Unlock.

## Puzzle 2–3

- Mechanik wird leicht variiert.
- Track gewinnt Rhythmus und Körper.
- Richtungsknoten können eingeführt werden, spätestens in Puzzle 3.

## Glitch-Moment

- Ein versteckter oder halb-versteckter Störpunkt erscheint.
- Spieler kann ihn aktivieren.
- Kurzes 16-bit-Minispiel, maximal 20–40 Sekunden.
- Danach Rückkehr in den Track.
- Bonus: kleiner Effekt-Layer oder visuelle Mutation.

## Puzzle 4–6

- Track wird melodischer und vollständiger.
- Finale Layer bringt Ohrwurm-Moment.
- Richtungsknoten dürfen komplexer eingesetzt werden.

## Abschluss

- Fertiger Track läuft kurz vollständig.
- Welt ist vollständig transformiert.
- Spieler bekommt Abschlussgefühl.

---

# 11.3 Was im ersten Prototyp bewusst nicht gebaut werden sollte

Nicht priorisieren:

- große Weltkarte,
- viele Minispiele,
- Level-Editor,
- freie Komposition,
- komplexe Währungen,
- tägliche Quests,
- Social Sharing,
- Ranglisten,
- große Story,
- viele Charaktere,
- permanente Upgrades.

Diese Dinge können später nützlich sein. Sie beantworten aber nicht die wichtigste Frage des ersten Prototyps.

---

# 12. Konkrete Gameplay-Experimente

# Experiment 1: Der 60-Sekunden-Layer-Test

## Ziel

Prüfen, ob der Layer-Unlock als Belohnung funktioniert.

## Aufbau

- Ein einzelnes Puzzle.
- Ein kurzer Loop läuft im Hintergrund.
- Nach Lösung wird ein neuer Layer aktiviert.

## Testfrage

**Freuen sich Spieler wirklich über den Moment, wenn der Layer dazukommt?**

## Erfolgskriterium

Spieler reagieren spontan positiv:

- „Ah!“
- „Nice.“
- Kopfnicken.
- Lächeln.
- Sie wollen den nächsten Layer hören.

Wenn Spieler nur sagen „Okay, nächstes Rätsel“, ist der musikalische Reward zu schwach.

---

# Experiment 2: Drei Arten von Puzzle-Feedback

## Ziel

Herausfinden, wie viel Inszenierung der Layer-Unlock braucht.

## Varianten

A. Nur Sound kommt dazu.  
B. Sound plus visuelles Aufblühen.  
C. Sound plus visuelles Aufblühen plus kurzer Impact/Jingle/Animation.

## Testfrage

**Welche Variante macht den Fortschritt am befriedigendsten?**

## Erwartung

Wahrscheinlich gewinnt B oder C. Nur Sound kann auf Smartphone-Lautsprechern zu subtil sein.

---

# Experiment 3: „Nie falsch, aber noch nicht richtig“

## Ziel

Testen, ob harmonische Fehlzustände verständlich sind.

## Aufbau

Falsche oder unvollständige Puzzle-Zustände klingen nicht schief, aber unvollständig.

Mögliche Zustände:

- Layer ist gedämpft.
- Layer spielt nur als Ghost-Version.
- Rhythmus ist fragmentiert.
- Welt flackert leicht.
- Signal erreicht Ziel nicht vollständig.
- Signal stoppt an falsch ausgerichtetem Richtungsknoten.

## Testfrage

**Versteht der Spieler, dass er noch nicht fertig ist, obwohl nichts unangenehm klingt?**

## Wichtigkeit

Dieses Experiment ist zentral, weil es die Kernvision direkt testet.

---

# Experiment 4: Minigame als Unterbrechung vs. Belohnung

## Ziel

Prüfen, wo die Glitch-Minispiele den Flow am besten unterstützen.

## Varianten

A. Minigame erscheint plötzlich mitten im Puzzle.  
B. Minigame erscheint optional nach einem gelösten Layer.  
C. Minigame ist als versteckter Glitch-Knoten sichtbar, aber freiwillig.

## Testfrage

**Fühlt sich das Minigame wie aufregende Überraschung oder wie störende Unterbrechung an?**

## Erwartung

Optional nach einem gelösten Layer oder über einen sichtbaren Glitch-Knoten ist wahrscheinlich besser als eine harte Unterbrechung.

---

# Experiment 5: Drei Tracks, gleiche Mechanik

## Ziel

Prüfen, ob die Mechanik wiederholbar ist oder nur einmal interessant wirkt.

## Aufbau

- Drei kurze Tracks.
- Gleiche Puzzle-Mechanik.
- Unterschiedliche musikalische Identität.
- Wenig bis keine neuen Features.

## Testfrage

**Trägt die Musik-/Layer-Belohnung über mehrere Wiederholungen?**

## Erfolgskriterium

Spieler wollen nach Track 1 freiwillig Track 2 starten.

Wenn nicht, fehlen vermutlich:

- stärkere musikalische Hooks,
- klarere Layer-Belohnungen,
- bessere Puzzle-Spannung,
- stärkere visuelle Transformation.

---

# Experiment 6: Richtungsknoten-Verständlichkeit

## Ziel

Prüfen, ob Spieler verstehen, dass ein Knoten gedreht werden muss, damit das Signal weiterfließen kann.

## Aufbau

- Ein einfaches Route-Puzzle.
- Die geometrische Route ist naheliegend.
- Ein Richtungsknoten liegt auf dieser Route, ist aber falsch ausgerichtet.
- Das Signal stoppt sichtbar am Richtungsknoten.

## Testfrage

**Versteht der Spieler ohne lange Erklärung, dass er den Richtungsknoten antippen und drehen muss?**

## Erfolgskriterium

Spieler drehen den Knoten nach kurzer Beobachtung selbstständig oder nach einem einzigen subtilen Hinweis.

Wenn Spieler die Verbindung löschen oder denken, die Route sei grundsätzlich falsch, ist das Feedback am Richtungsknoten nicht klar genug.

---

# 13. Kritische Risiken

# Risiko 1: Das Spiel klingt immer gut, aber fühlt sich beliebig an

Wenn jede Aktion harmonisch ist, kann der Spieler das Gefühl verlieren, dass seine Entscheidungen wichtig sind.

## Gegenmaßnahme

Klare Unterschiede zwischen:

- unvollständig,
- fast richtig,
- eingerastet,
- vollständig.

Diese Unterschiede müssen hörbar und sichtbar sein.

---

# Risiko 2: Die Puzzles sind nur Verpackung für Musik

Wenn Puzzles zu trivial sind, wirkt das Spiel wie ein interaktiver Musikplayer.

## Gegenmaßnahme

Die Puzzles brauchen echte, aber kleine Denkaufgaben:

- richtige Reihenfolge,
- Signalfluss,
- begrenzte Züge,
- räumliche Anordnung,
- einfache Regeln mit späteren Variationen,
- Richtungsknoten als zusätzliche, gut lesbare Komplexität.

Nicht schwer, aber absichtlich.

---

# Risiko 3: Die Minispiele sprengen den Scope

Surreale 16-bit-Minispiele sind reizvoll, aber teuer.

## Gegenmaßnahme

Im Vertical Slice nur ein einziges Minispiel bauen.

Es sollte:

- kurz sein,
- einfache Steuerung haben,
- visuell stark wirken,
- den Track belohnen,
- nicht länger als 20–40 Sekunden dauern.

---

# Risiko 4: Der Track-Aufbau ist musikalisch nicht spannend genug

Wenn der Song nach jedem Layer nur „mehr“ wird, aber nicht besser, verliert der Loop Kraft.

## Gegenmaßnahme

Jeder Layer sollte eine klare Funktion haben:

- Groove,
- Bewegung,
- Bassfundament,
- Hook,
- Energie,
- Überraschung,
- Finale.

Der stärkste Layer sollte nicht zu früh kommen. Die Session braucht musikalische Dramaturgie.

---

# Risiko 5: Zu viel Kreativität zu früh

Freie Musikgestaltung klingt attraktiv, kann aber Design, Audio, UI und Testing stark verkomplizieren.

## Gegenmaßnahme

Im ersten Prototyp nur kuratierte Auswahl und Anordnung erlauben.

Der Spieler soll sich kreativ fühlen, ohne dass das System echte freie Komposition leisten muss.

---

# Risiko 6: Richtungsknoten machen das Spiel zu trocken oder abstrakt

Wenn Richtungsknoten wie rein technische Logik-Bausteine wirken, kann der musikalische Charme leiden.

## Gegenmaßnahme

Richtungsknoten müssen als musikalische Signalsteine inszeniert werden:

- sie klicken weich im Takt ein,
- sie lassen Audiofragmente klarer werden,
- sie leuchten synchron mit dem Signal,
- sie wirken wie Teil der Klangwelt, nicht wie technische UI-Schalter.

---

# 14. Design-Entscheidungen für den nächsten Schritt

Diese Entscheidungen sollten früh getroffen oder getestet werden:

# 14.1 Denken vs. Reagieren

Soll der Hauptloop eher ein ruhiges Puzzle sein oder ein rhythmisches Geschicklichkeitsspiel?

Empfehlung:

**Denken als Fundament, Reaktion als optionaler Energie-Peak.**

---

# 14.2 Levelziel

Ist das Ziel pro Level:

- Song fertigstellen,
- perfekte Lösung erreichen,
- Highscore erzielen,
- geheime Layer finden?

Empfehlung für den Anfang:

**Song fertigstellen.**

Optional später:

- perfekte Synchronisation,
- versteckte Glitches,
- alternative Mix-Versionen.

---

# 14.3 Rolle der Minispiele

Sollen Minispiele regelmäßig oder optional sein?

Empfehlung:

**Optional oder halb-versteckt.**

Sie sollten sich wie eine Entdeckung anfühlen, nicht wie Pflichtcontent.

---

# 14.4 Musikalische Freiheit

Mögliche Stufen:

1. Spieler schaltet Layer nur frei.
2. Spieler wählt Layer-Reihenfolge.
3. Spieler wählt zwischen alternativen Layern.
4. Spieler remixt aktiv.
5. Spieler komponiert frei.

Empfehlung für den Prototyp:

**Stufe 1–2.**

Also: Layer freischalten, eventuell Reihenfolge wählen. Keine freie Komposition.

---

# 14.5 Wichtigster Prototyp-Erfolg

Was ist wichtiger für den ersten Prototyp?

- Ohrwurm-Moment,
- Puzzle-Tiefe,
- Minigame-Überraschung,
- visuelle Welttransformation?

Empfehlung:

**Ohrwurm-Moment zuerst.**

Denn die zentrale Differenzierung des Spiels ist nicht „noch ein Puzzle“, sondern „ein Puzzle, das einen Song baut“.

---

# 14.6 Rolle der Richtungsknoten

Sollen Richtungsknoten sofort zentraler Bestandteil sein oder erst später ausgebaut werden?

Empfehlung:

**Im ersten Level einführen, aber nicht jedes Puzzle darauf aufbauen.**

Richtungsknoten sollen die Puzzle-Tiefe erhöhen, aber nicht den Einstieg dominieren. Sie sind im ersten Level ein Beweis, dass die Mechanik erweiterbar ist.

---

# 15. Empfohlener nächster Prototyp-Plan

# Prototyp A: One Song, Six Locks

## Ziel

Einen einzigen Track über sechs Puzzle-Lösungen aufbauen.

## Umfang

- 1 Loop mit ca. 60–90 Sekunden musikalischem Material,
- 6 Layer,
- 6 kleine Puzzles mit derselben Grundmechanik,
- 1 visuelle Welt,
- 1 Glitch-Minispiel,
- simples Level-Ende,
- Richtungsknoten als zusätzliche Mechanik ab Puzzle 2 oder 3.

## Kernfragen

1. Ist der Layer-Unlock befriedigend?
2. Ist das Puzzle verständlich?
3. Bleibt der Spieler neugierig auf den nächsten Layer?
4. Stört oder belebt das Minispiel den Flow?
5. Will der Spieler danach einen weiteren Track spielen?
6. Versteht der Spieler Richtungsknoten als Teil des Signalflusses?
7. Erhöhen Richtungsknoten die Puzzle-Tiefe, ohne den entspannten Flow zu stören?

## Was gemessen oder beobachtet werden sollte

- Zeit bis zum Verstehen der Interaktion.
- Reaktion auf den ersten Layer-Unlock.
- Abbruchpunkte.
- Ob Spieler Sound einschalten.
- Ob Spieler nach dem Abschluss den fertigen Track anhören.
- Ob Spieler freiwillig wiederholen oder weiterspielen wollen.
- Welche Layer sie besonders wahrnehmen.
- Ob Spieler Richtungsknoten selbstständig antippen und drehen.
- Ob Spieler verstehen, warum ein Signal stoppt.
- Ob Richtungsknoten als angenehm, interessant oder störend empfunden werden.

---

# 16. Kurzfazit des Game Designs

Der beste erste Core Loop für diese Vision ist:

> **Kleine Klangrätsel lösen, dadurch live neue Song-Layer freischalten, die Pixelwelt sichtbar zum Leben erwecken und gelegentlich optionale Glitch-Minispiele als Energie-Peak entdecken.**

Dieser Loop ist:

- verständlich,
- mobile-tauglich,
- musikalisch eigenständig,
- indie-realistisch,
- gut prototypisierbar,
- nah an der ursprünglichen Vision.

Die wichtigste Design-Regel lautet:

> **Jede gelöste Aktion muss den Track spürbar besser machen.**

Wenn dieser Moment funktioniert, hat das Spiel einen starken Kern. Wenn er nicht funktioniert, sollten nicht zuerst mehr Features gebaut werden, sondern genau dieser Moment verbessert werden.

Für die erste spielbare Version wird dieser Kern konkretisiert als:

> **Route verbinden, Pattern-Knoten in richtiger Reihenfolge einbinden, Richtungsknoten drehen, Layer freischalten, Welt aufblühen lassen.**

---

# 17. Offene Fragen zur weiteren Schärfung

1. Soll der Spieler im Hauptloop eher **denken** oder eher **rhythmisch reagieren**?
2. Ist das Ziel pro Level eher **Song fertigstellen** oder **Highscore/Perfektion erreichen**?
3. Sollen Minispiele **optional versteckt** sein oder regelmäßig als fester Bestandteil auftauchen?
4. Wie frei darf der Spieler musikalisch eingreifen: nur Layer freischalten, Layer-Reihenfolge wählen oder echte Remix-Entscheidungen treffen?
5. Was ist wichtiger für den ersten Prototyp: **Ohrwurm-Moment** oder **Puzzle-Tiefe**?
6. Sollen Richtungsknoten bereits in Level 1 stark präsent sein oder nur als sanfte Einführung dienen?
7. Soll der Spieler später alternative Routen für Remix-Varianten wählen können?
8. Sollen Glitch-Knoten später eigene Richtungsknoten-Regeln bekommen?

---

# 18. Fachliche Levelbeschreibung – Level 1: „Der Pixelhain“

# 18.1 Zweck des ersten Levels

Dieses Level ist die erste spielbare Version des Spiels. Es soll den zentralen Core-Loop des Spiels fachlich beschreiben und so konkretisieren, dass ein Entwickler daraus eine erste spielbare Version erstellen kann.

Der Prototyp soll eine Kernfrage beantworten:

**Macht es Spaß, einen Song durch kleine Klangrätsel Schicht für Schicht aufzubauen?**

Der Spieler soll am Ende des Levels das Gefühl haben:

**„Ich habe eine kleine kaputte Klangwelt wieder zum Grooven gebracht.“**

Technologie, Engine, Audio-Architektur, Persistenz, Monetarisierung, Speicherlogik, Asset-Pipeline und langfristige Metasysteme sind für dieses Level out of scope.

---

# 18.2 Zentrale Design-Entscheidungen für Level 1

Für die erste spielbare Version werden folgende Entscheidungen festgelegt:

1. **Der Hauptloop ist ein ruhiges Puzzle, kein Rhythmusspiel.**  
   Der Spieler muss nicht im Takt tippen. Rhythmische Präzision ist nicht erforderlich.

2. **Das Levelziel ist: Song fertigstellen.**  
   Es gibt keinen Highscore, keine Sternebewertung und keinen Game Over.

3. **Der Spieler komponiert nicht frei.**  
   Alle musikalischen Layer sind vorbereitet und harmonisch kuratiert. Der Spieler aktiviert sie durch Rätsel.

4. **Die Grundmechanik ist: Route verbinden.**  
   Der Spieler verbindet Start, Pattern-Knoten und Ziel zu einer funktionierenden Signalroute.

5. **Richtungsknoten erweitern die Route.**  
   In ausgewählten Rätseln muss der Spieler mindestens einen Richtungsknoten drehen, damit das Signal korrekt weiterfließen kann.

6. **Richtungsknoten kommen nicht in jedem Rätsel vor.**  
   Sie werden im ersten Level vorsichtig eingeführt und bleiben eine Mechanik für spätere komplexere Rätsel.

7. **Es klingt nie schief.**  
   Unfertige oder falsche Zustände klingen gedämpft, fragmentiert, fern oder glitchy, aber nie dissonant oder unangenehm.

8. **Der Layer-Unlock ist der wichtigste Reward.**  
   Jede erfolgreiche Lösung muss sofort hörbar und sichtbar belohnen.

---

# 18.3 Levelüberblick

**Levelname:** Der Pixelhain  
**Dauer:** ca. 3–5 Minuten  
**Musikstil:** freundlicher NES-/Gameboy-inspirierter Chiptune-Groove  
**Visuelles Thema:** kleiner, schlafender Pixelwald mit leuchtenden Pflanzen, alten Signalsteinen und einem zentralen Klangbaum  
**Spielziel:** sechs Klangschichten aktivieren und dadurch den vollständigen Track sowie die Welt wiederherstellen

---

## 18.3.1 Levelstruktur

Das Level besteht aus:

- Intro-Zustand mit fast leerer Klangwelt
- 6 Layer-Puzzles
- Einführung von Richtungsknoten ab Puzzle 2 oder 3
- 1 optionalem Glitch-Minispiel nach Puzzle 3
- Abschlussmoment mit vollständigem Track

---

## 18.3.2 Musikalische Layer-Reihenfolge

1. Grundpuls / Kick
2. Snare / Clap
3. Bassline
4. Arpeggio
5. Lead-Melodie
6. FX / Counter-Melody / Finale-Layer

Jeder freigeschaltete Layer läuft ab Aktivierung dauerhaft im Musikloop weiter.

---

# 18.4 Spielerfantasie im Level

Der Spieler ist ein Chiptune-Restaurator. Er betritt eine kleine beschädigte Pixelwelt, in der Musik, Licht und Bewegung auseinandergefallen sind.

In der Mitte der Welt steht ein schlafender Klangbaum. Um ihn herum liegen Klangknoten, Signalsteine und defekte Leitungen. Der Spieler stellt Signalwege wieder her. Sobald ein Signal korrekt durch einen Bereich fließt, erwacht eine neue musikalische Schicht.

Der Spieler fühlt sich nicht wie ein freier Komponist und nicht wie ein Rhythmusspiel-Performer, sondern wie jemand, der vorhandene musikalische Energie freilegt, ordnet und synchronisiert.

---

# 18.5 Core Loop des Levels

Der Core Loop im ersten Level lautet:

**Spieler betrachtet ein kleines Knotenfeld → verbindet eine Route → dreht bei Bedarf Richtungsknoten → Signal erreicht das Ziel → neuer Musik-Layer startet → Welt reagiert sichtbar → nächstes Puzzle wird freigeschaltet.**

Dieser Loop wiederholt sich sechs Mal.

Der wichtigste Moment ist jedes Mal:

**Das Puzzle rastet ein, der Sound wird voller, die Welt blüht auf.**

---

# 19. Grundmechanik: Route verbinden

# 19.1 Spielfeld

Jedes Puzzle besteht aus einem kleinen Knotenfeld. Für den ersten Prototyp reicht ein 4x4-Grid. Spätere Puzzles können visuell komplexer wirken, sollten aber im ersten Level weiterhin schnell erfassbar bleiben.

Auf dem Grid können folgende Elemente vorkommen:

- Start-Knoten
- Ziel-Knoten
- Pattern-Knoten
- Richtungsknoten
- Leere Verbindungsknoten
- Stör-Knoten
- Blockierte Felder
- Optionaler Glitch-Knoten

---

# 19.2 Start-Knoten

Der Start-Knoten ist die Quelle des Signals.

Eigenschaften:

- pulsiert leicht im Takt
- sendet ein sichtbares Signal aus
- ist immer der Beginn der Route
- kann nicht bewegt oder gedreht werden

Der Start-Knoten sollte visuell eindeutig sein, zum Beispiel durch ein kleines Play-Symbol, eine Quelle oder ein leuchtendes Herzstück.

---

# 19.3 Ziel-Knoten

Der Ziel-Knoten ist der Endpunkt der Route.

Eigenschaften:

- wartet auf ein eingehendes Signal
- leuchtet schwach, solange er nicht erreicht wurde
- leuchtet stark, wenn das Signal korrekt ankommt
- löst bei korrekter Route den Layer-Unlock aus

Der Ziel-Knoten sollte visuell eindeutig sein, zum Beispiel durch ein kleines Lautsprecher-, Schloss- oder Kristallsymbol.

---

# 19.4 Pattern-Knoten

Pattern-Knoten repräsentieren musikalische Fragmente eines Layers.

Beispiele:

- Puls-Knoten
- Snare-Knoten
- Bassnoten-Knoten
- Arpeggio-Knoten
- Melodie-Knoten
- FX-Knoten

Pattern-Knoten müssen in einer bestimmten Reihenfolge in die Route eingebunden werden.

Die Reihenfolge wird visuell kommuniziert:

- über eine Sequenzleiste am oberen Bildschirmrand,
- durch nacheinander pulsierende Knoten,
- durch eindeutige Symbole,
- optional durch kurze Klangfragmente.

Der Spieler muss keine Musiktheorie verstehen. Er folgt Symbolen, Signalen und visueller Ordnung.

---

# 20. Neue Mechanik: Richtungsknoten

# 20.1 Zweck der Richtungsknoten

Richtungsknoten erhöhen die Puzzle-Tiefe, ohne das Spiel in ein hartes Logikspiel zu verwandeln.

Sie sorgen dafür, dass es nicht reicht, nur die richtige Route zu zeichnen. Der Spieler muss zusätzlich verstehen:

**In welche Richtung darf das Signal durch diesen Knoten fließen?**

Dadurch entsteht eine kleine zusätzliche Denkaufgabe:

**Der Spieler verbindet die Route und dreht mindestens einen Richtungsknoten, damit das Signal weiterfließen kann.**

---

# 20.2 Grundverhalten

Ein Richtungsknoten ist ein Knoten mit einer sichtbaren Richtung oder Leitungsform.

Er kann zum Beispiel so aussehen:

- gerader Leiter: links ↔ rechts oder oben ↕ unten
- Kurve: Eingang von links, Ausgang nach oben
- Pfeil: Signal darf nur in Pfeilrichtung passieren
- T-Stück: später möglich, für Level 1 optional nicht nötig

Für den ersten Prototyp werden nur zwei einfache Typen empfohlen:

1. **Gerader Richtungsknoten**  
   Verbindet zwei gegenüberliegende Seiten.

2. **Kurven-Richtungsknoten**  
   Verbindet zwei benachbarte Seiten.

---

# 20.3 Spieleraktion

Der Spieler kann einen Richtungsknoten antippen, um ihn zu drehen.

Empfohlenes Verhalten:

- Jeder Tap dreht den Richtungsknoten um 90 Grad im Uhrzeigersinn.
- Der Knoten rastet sichtbar in vier mögliche Ausrichtungen ein.
- Beim Drehen gibt es ein kurzes, weiches Klick-Geräusch.
- Das Signal aktualisiert sich sofort.

Optional, aber nicht zwingend für den ersten Prototyp:

- Wischen auf dem Knoten dreht ihn in Wischrichtung.
- Langes Drücken zeigt eine kurze Vorschau des möglichen Signalflusses.

Für die erste Version reicht:

**Antippen = 90 Grad drehen.**

---

# 20.4 Signalregel

Das Signal kann einen Richtungsknoten nur passieren, wenn die Verbindungsausrichtung passt.

Beispiel:

- Das Signal kommt von links.
- Der Richtungsknoten ist horizontal ausgerichtet.
- Das Signal kann nach rechts weiterfließen.

Anderes Beispiel:

- Das Signal kommt von links.
- Der Richtungsknoten ist vertikal ausgerichtet.
- Das Signal stoppt am Richtungsknoten.
- Der Spieler muss den Knoten drehen.

Der Richtungsknoten macht also nicht die Route falsch im musikalisch unangenehmen Sinn. Er macht sie nur noch nicht leitfähig.

---

# 20.5 Feedback bei falscher Ausrichtung

Wenn das Signal einen Richtungsknoten nicht passieren kann:

- das Signal läuft bis zum Richtungsknoten und stoppt dort,
- der Richtungsknoten flackert weich,
- der Ghost-Layer bleibt fragmentiert,
- der Knoten zeigt eine kleine Drehaufforderung,
- es gibt keinen harten Fehlerton.

Der Spieler soll verstehen:

**„Die Route ist vielleicht richtig, aber dieser Knoten zeigt noch falsch.“**

Nicht:

**„Ich habe verloren.“**

---

# 20.6 Feedback bei richtiger Ausrichtung

Wenn ein Richtungsknoten richtig gedreht ist:

- das Signal fließt sichtbar durch ihn hindurch,
- der Knoten klickt weich ein,
- der Ghost-Layer wird klarer,
- ein kleines Licht bewegt sich entlang der Route weiter,
- bei vollständiger Route wird der Layer aktiv.

---

# 20.7 Einsatz im ersten Level

Richtungsknoten müssen nicht in jedem Rätsel vorkommen.

Empfohlene Verteilung im ersten Level:

- Puzzle 1: kein Richtungsknoten
- Puzzle 2: ein sehr einfacher Richtungsknoten oder noch keiner
- Puzzle 3: erster Pflicht-Richtungsknoten
- Puzzle 4: zwei Richtungsknoten
- Puzzle 5: ein Richtungsknoten als Teil der Melodie-Route
- Puzzle 6: zwei Richtungsknoten, optional einer davon mit Glitch-Bezug

So bleibt der Einstieg leicht, aber die Rätsel werden nicht zu banal.

---

# 21. Lösungsbedingungen

Ein Puzzle ist gelöst, wenn alle folgenden Bedingungen erfüllt sind:

1. Das Signal führt vom Start-Knoten zum Ziel-Knoten.
2. Alle erforderlichen Pattern-Knoten liegen in der richtigen Reihenfolge auf der Route.
3. Die Route benutzt keine blockierten Felder.
4. Alle Richtungsknoten auf der Route sind korrekt ausgerichtet.
5. Das Signal kann vollständig und ohne Unterbrechung bis zum Ziel fließen.

Ein Puzzle darf als fast gelöst gelten, wenn:

- die Route geometrisch korrekt ist,
- aber ein Richtungsknoten falsch ausgerichtet ist,
- oder ein Pattern-Knoten fehlt,
- oder die Reihenfolge noch nicht stimmt.

Dieser Fast-gelöst-Zustand ist wichtig, weil er dem Spieler Fortschritt zeigt.

---

# 22. Allgemeine Feedback-Regeln

# 22.1 Während des Verbindens

Wenn der Spieler eine teilweise korrekte Route baut:

- die Route leuchtet schwach,
- der Layer ist als Ghost hörbar,
- passende Weltobjekte bewegen sich minimal,
- das Signal fließt bis zur letzten korrekten Stelle.

Wenn die Route an einem falsch gedrehten Richtungsknoten stoppt:

- der Signalfluss bleibt sichtbar vor dem Knoten stehen,
- der Richtungsknoten pulsiert als Hinweis,
- der Ghost-Layer spielt fragmentiert weiter,
- eine subtile Dreh-Animation kann anzeigen, dass der Knoten interaktiv ist.

Wenn die Route die falsche Reihenfolge nutzt:

- der betroffene Pattern-Knoten flackert,
- der Ghost-Layer wird gedämpfter,
- die Verbindung bleibt bestehen, aber rastet nicht ein.

---

# 22.2 Beim Lösen eines Puzzles

Wenn ein Puzzle gelöst wird, passiert immer dieselbe Belohnungskette:

1. Das Signal läuft sichtbar vom Start zum Ziel.
2. Alle Richtungsknoten auf der Route leuchten nacheinander auf.
3. Das Puzzlefeld pulsiert einmal im Beat.
4. Der neue Layer wird vollständig hörbar.
5. Der Klangbaum oder ein Weltbereich blüht sichtbar auf.
6. Ein kurzer positiver Chiptune-Impact spielt.
7. Das nächste Puzzle wird freigeschaltet.

Der Layer-Unlock muss kräftiger wirken als das normale Puzzle-Feedback.

---

# 23. Intro des Levels

# 23.1 Ausgangszustand

Der Spieler startet im Pixelhain.

Zu sehen:

- zentraler Klangbaum, grau-blau und schlafend
- sechs verschlossene Klangsteine rund um den Baum
- dunkle Pflanzen und inaktive Pixelpartikel
- erstes Puzzlefeld im Vordergrund
- schwach leuchtender Start-Knoten

Zu hören:

- sehr leiser Grundpuls
- eventuell ein einzelner warmer Chiptune-Ton alle zwei Takte
- kein vollständiger Beat

---

# 23.2 Ziel des Intros

Der Spieler soll verstehen:

- Die Welt ist unvollständig.
- Der Klangbaum braucht Energie.
- Das erste Knotenpuzzle ist der aktive Interaktionspunkt.
- Eine Route muss vom Start zum Ziel hergestellt werden.

---

# 23.3 Tutorial-Hilfe

Beim ersten Puzzle darf eine kurze Hilfe erscheinen:

**„Verbinde den Puls mit dem Ziel.“**

Beim ersten Richtungsknoten erscheint später eine zweite Hilfe:

**„Tippe den Pfeilknoten, bis das Signal weiterfließt.“**

Danach sollte das Spiel möglichst ohne Text funktionieren.

---

# 24. Puzzle 1 – Grundpuls / Kick

# 24.1 Ziel

Der Spieler lernt das Verbinden von Knoten.

# 24.2 Neue Mechanik

Keine Richtungsknoten.

# 24.3 Schwierigkeitsgrad

Sehr einfach.

# 24.4 Puzzleaufbau

Grid-Größe: 4x4

Erforderliche Route:

**Start → Puls-Knoten → Ziel**

Beispielhafte Positionen:

- Start: links mittig
- Puls-Knoten: Mitte
- Ziel: rechts mittig

Es gibt keine Ablenkung, keine blockierten Felder und keine Stör-Knoten.

---

# 24.5 Spieleraufgabe

Der Spieler zieht eine Verbindung vom Start über den Puls-Knoten zum Ziel.

---

# 24.6 Audio vor Lösung

- sehr leiser, dumpfer Puls
- Kick nur angedeutet
- Welt wirkt musikalisch leer

---

# 24.7 Audio nach Lösung

- klare Kick oder Grundpuls startet im Loop
- Track bekommt rhythmisches Fundament
- der Puls bleibt dauerhaft aktiv

---

# 24.8 Visuelle Reaktion

- Wurzeln des Klangbaums beginnen im Takt zu leuchten
- Bodenpixel pulsieren leicht
- erster Klangstein aktiviert sich

---

# 24.9 Zweck

Dieses Puzzle beantwortet nur eine Frage:

**Versteht der Spieler die Grundinteraktion des Verbindens?**

Das Puzzle soll nicht fordern, sondern Vertrauen schaffen.

---

# 25. Puzzle 2 – Snare / Clap

# 25.1 Ziel

Der Spieler lernt, dass Reihenfolge wichtig ist. Optional kann hier bereits ein sehr einfacher Richtungsknoten eingeführt werden, falls der Einstieg dadurch nicht überladen wirkt.

# 25.2 Neue Mechanik

Empfohlen: ein einfacher Richtungsknoten als Tutorial-Element.

Alternativ kann der Richtungsknoten erst in Puzzle 3 eingeführt werden, wenn der erste Playtest zeigt, dass Puzzle 2 sonst zu viel auf einmal verlangt.

# 25.3 Schwierigkeitsgrad

Einfach.

---

# 25.4 Puzzleaufbau

Erforderliche Route:

**Start → Quadrat → Richtungsknoten → Kreis → Ziel**

Elemente:

- Start-Knoten
- Quadrat-Pattern-Knoten
- ein gerader Richtungsknoten
- Kreis-Pattern-Knoten
- Ziel-Knoten
- ein leerer Verbindungsknoten

Der Richtungsknoten liegt bereits auf der offensichtlichen Route, ist aber zunächst falsch ausgerichtet.

Beispiel:

- Die Route läuft von links nach rechts.
- Der Richtungsknoten ist zunächst vertikal.
- Der Spieler muss ihn einmal drehen, damit das Signal horizontal weiterfließen kann.

---

# 25.5 Spieleraufgabe

Der Spieler verbindet die Route in der richtigen Reihenfolge und dreht den Richtungsknoten, damit das Signal weiterfließen kann.

Die korrekte Reihenfolge lautet:

**Start → Quadrat → Kreis → Ziel**

Der Richtungsknoten zählt nicht als Pattern-Knoten, sondern als leitendes Element zwischen den Pattern-Knoten.

---

# 25.6 Audio vor Lösung

- Kick läuft vollständig
- Snare ist als leiser Ghost auf jedem zweiten Beat hörbar
- Ghost-Snare klingt gedämpft, aber musikalisch passend

---

# 25.7 Audio während teilweiser Lösung

Wenn der Spieler Start → Quadrat korrekt verbindet:

- Snare wird kurz klarer
- Signal leuchtet stabil bis Quadrat

Wenn das Signal am falsch gedrehten Richtungsknoten stoppt:

- Snare-Ghost bleibt fragmentiert
- Richtungsknoten pulsiert weich
- ein kurzer visueller Drehhinweis erscheint

Wenn der Spieler den Richtungsknoten korrekt dreht:

- Signal fließt weiter
- Snare-Ghost wird klarer
- der Spieler erkennt den Zusammenhang zwischen Drehung und Signalfluss

---

# 25.8 Audio nach Lösung

- Snare / Clap startet vollständig
- Groove wirkt deutlich stabiler
- Kick und Snare laufen gemeinsam weiter

---

# 25.9 Visuelle Reaktion

- kleine Pixelpilze öffnen sich im Backbeat
- zweiter Klangstein aktiviert sich
- Welt bekommt etwas mehr Farbe
- der Richtungsknoten bleibt als leuchtender Teil der Route sichtbar

---

# 25.10 Zweck

Puzzle 2 zeigt zwei Dinge:

1. Die Route hat eine richtige Reihenfolge.
2. Manche Knoten müssen gedreht werden, damit das Signal weiterfließen kann.

Falls das im Playtest zu früh wirkt, wird Puzzle 2 ohne Richtungsknoten gebaut und Puzzle 3 übernimmt die Einführung.

---

# 26. Puzzle 3 – Bassline

# 26.1 Ziel

Der Spieler löst die erste echte kleine Denkaufgabe.

# 26.2 Neue Mechanik

Pflicht-Richtungsknoten.

# 26.3 Schwierigkeitsgrad

Leicht bis mittel.

---

# 26.4 Puzzleaufbau

Erforderliche Route:

**Start → Note A → Richtungsknoten → Note B → Note C → Ziel**

Elemente:

- Start-Knoten
- drei Bassnoten-Knoten
- ein Kurven-Richtungsknoten
- ein Stör-Knoten
- ein blockiertes Feld
- ein leerer Umweg-Knoten
- Ziel-Knoten

Der Richtungsknoten ist notwendig, um um das blockierte Feld herumzuleiten.

---

# 26.5 Spieleraufgabe

Der Spieler muss:

1. eine Route finden, die alle drei Bassnoten in der richtigen Reihenfolge enthält,
2. das blockierte Feld umgehen,
3. den Kurven-Richtungsknoten so drehen, dass das Signal von Note A zu Note B weiterfließen kann.

Die korrekte Pattern-Reihenfolge lautet:

**Note A → Note B → Note C**

Der Richtungsknoten ist Teil der Route, aber nicht Teil der musikalischen Sequenz.

---

# 26.6 Audio vor Lösung

- Kick und Snare laufen
- Bassline ist als tiefer, gedämpfter Schatten hörbar
- Bass spielt nur einzelne Fragmente

---

# 26.7 Audio während teilweiser Lösung

Wenn Note A korrekt erreicht wird:

- erstes Bassfragment wird klarer

Wenn das Signal am falsch gedrehten Richtungsknoten stoppt:

- Bassfragment bleibt auf einer kurzen, gedämpften Wiederholung hängen
- der Richtungsknoten flackert weich
- keine dissonanten Töne entstehen

Wenn Note B und Note C korrekt erreicht werden:

- weitere Bassfragmente werden hörbar
- bei fast richtiger Route klingt der Bass nahezu vollständig, aber noch weich und fern

---

# 26.8 Audio nach Lösung

- vollständige Bassline startet
- Track bekommt Körper und Bewegung
- Kick, Snare und Bass bilden nun den stabilen Groove

---

# 26.9 Visuelle Reaktion

- Stamm des Klangbaums leuchtet
- kleine Pixeltiere oder Blätter bewegen sich im Bassrhythmus
- dritter Klangstein aktiviert sich
- der Signalfluss wirkt erstmals wie eine echte Reparatur der Welt

---

# 26.10 Zweck

Puzzle 3 soll den ersten echten Aha-Moment erzeugen:

**Die Route ist nicht nur eine Linie. Sie braucht die richtige Reihenfolge und die richtige Richtung.**

---

# 27. Optionaler Glitch-Moment nach Puzzle 3

Nach dem Bassline-Unlock erscheint ein kleiner Glitch-Riss in der Welt.

# 27.1 Darstellung

Ein einzelner Stör-Knoten flackert violett oder invertiert. Er ist klar als ungewöhnlich erkennbar, aber nicht aggressiv.

Der Spieler kann:

- den Glitch ignorieren und mit Puzzle 4 weitermachen,
- den Glitch antippen und ein kurzes Minispiel starten.

Für den ersten Prototyp ist der Glitch optional. Wenn der Spieler ihn ignoriert, bleibt das Level vollständig abschließbar.

---

# 28. Glitch-Minispiel – „Parallel Run“

# 28.1 Ziel

Kurzer Energie-Peak und Überraschungsmoment.

# 28.2 Dauer

20–40 Sekunden.

# 28.3 Grundidee

Der Spieler steuert eine verzerrte 16-bit-Figur durch einen kurzen horizontalen Korridor. Die Figur läuft automatisch. Der Spieler muss nur springen.

---

# 28.4 Steuerung

- Tippen = Sprung

Für den ersten Prototyp gibt es keine zweite Aktion.

---

# 28.5 Spielregel

Der Spieler soll 5–8 Glitch-Fragmente einsammeln oder einfachen Hindernissen ausweichen.

Das Minispiel ist bewusst niedrigschwellig. Es soll überraschen, aber nicht bestrafen.

---

# 28.6 Ergebnis bei Erfolg

Bei Abschluss:

- Spieler erhält einen optionalen Glitch-FX-Layer
- Welt bekommt eine kleine visuelle Mutation
- Haupttrack läuft weiter
- alle paar Takte erscheint ein kleiner zusätzlicher Glitch-Effekt

---

# 28.7 Ergebnis bei Misserfolg

Wenn der Spieler scheitert:

- kein Game Over
- Rückkehr ins Hauptlevel
- Glitch-FX-Layer bleibt deaktiviert oder nur visuell angedeutet

---

# 28.8 Zweck

Das Minispiel testet:

**Fühlt sich der Glitch wie eine aufregende Belohnung an oder wie eine störende Unterbrechung?**

---

# 29. Puzzle 4 – Arpeggio

# 29.1 Ziel

Der Track bekommt Bewegung und melodische Energie. Das Puzzle soll zeigen, dass Richtungsknoten auch in etwas komplexeren Routen gut funktionieren.

# 29.2 Neue Mechanik

Zwei Richtungsknoten.

# 29.3 Schwierigkeitsgrad

Mittel.

---

# 29.4 Puzzleaufbau

Erforderliche Route:

**Start → Dreieck → Richtungsknoten A → Kreis → Richtungsknoten B → Quadrat → Raute → Ziel**

Elemente:

- Start-Knoten
- vier Arpeggio-Pattern-Knoten
- zwei Richtungsknoten
- zwei leere Knoten
- ein Stör-Knoten
- ein blockiertes Feld
- Ziel-Knoten

Richtungsknoten A ist ein gerader Leiter.  
Richtungsknoten B ist ein Kurvenleiter.

---

# 29.5 Spieleraufgabe

Der Spieler muss eine längere Route herstellen und beide Richtungsknoten korrekt drehen.

Die korrekte Pattern-Reihenfolge lautet:

**Dreieck → Kreis → Quadrat → Raute**

Die Richtungsknoten können zwischen diesen Pattern-Knoten liegen, zählen aber nicht zur Sequenzleiste.

---

# 29.6 Audio vor Lösung

- Kick, Snare und Bassline laufen
- Arpeggio ist als glitzernder, leiser Ghost hörbar
- einzelne Noten flackern im Hintergrund

---

# 29.7 Audio während teilweiser Lösung

Wenn der erste Arpeggio-Knoten korrekt verbunden ist:

- erste Arpeggio-Noten werden klarer

Wenn Richtungsknoten A falsch steht:

- Signal stoppt dort
- Arpeggio spielt nur ein kurzes Fragment
- der Knoten pulsiert im Takt

Wenn Richtungsknoten B falsch steht:

- Signal erreicht bereits einen späteren Abschnitt, stoppt aber vor dem Ziel
- Arpeggio klingt fast vollständig, aber noch gefiltert

Bei jeder korrekten Drehung:

- das Signal fließt weiter
- ein weiterer Teil des Arpeggios wird klarer
- das Puzzle vermittelt echten Fortschritt

---

# 29.8 Audio nach Lösung

- vollständiges Arpeggio startet
- Track fühlt sich aktiver und verspielter an
- bisheriger Groove erhält melodische Bewegung

---

# 29.9 Visuelle Reaktion

- Baumkrone beginnt zu leuchten
- kleine Lichtpartikel steigen im Takt auf
- vierter Klangstein aktiviert sich
- Route und Richtungsknoten bleiben kurz als leuchtender Signalpfad sichtbar

---

# 29.10 Zweck

Puzzle 4 soll beweisen, dass die Mechanik nach mehreren Layern noch trägt:

**Der Spieler denkt über Route, Reihenfolge und Richtung nach, ohne sich überfordert zu fühlen.**

---

# 30. Puzzle 5 – Lead-Melodie

# 30.1 Ziel

Der Ohrwurm-Moment des Levels. Dieses Puzzle sollte nicht das schwerste sein, weil der Fokus auf dem musikalischen Reward liegt.

# 30.2 Neue Mechanik

Ein Richtungsknoten als Teil der Melodie-Route.

# 30.3 Schwierigkeitsgrad

Mittel.

---

# 30.4 Puzzleaufbau

Erforderliche Route:

**Start → Melodie 1 → Melodie 2 → Richtungsknoten → Melodie 3 → Ziel**

Elemente:

- Start-Knoten
- drei Melodie-Knoten
- ein Richtungsknoten
- ein leerer Verbindungsknoten
- ein Stör-Knoten
- Ziel-Knoten

Besonderheit:

Die drei Melodie-Knoten pulsen nacheinander als Vorschau. Dadurch sieht und hört der Spieler indirekt die richtige Reihenfolge.

---

# 30.5 Spieleraufgabe

Der Spieler muss:

1. die Melodie-Knoten in der Reihenfolge verbinden, in der sie pulsen,
2. den Richtungsknoten korrekt drehen,
3. das Signal bis zum Ziel führen.

Die korrekte Pattern-Reihenfolge lautet:

**Melodie 1 → Melodie 2 → Melodie 3**

Der Richtungsknoten liegt zwischen Melodie 2 und Melodie 3.

---

# 30.6 Audio vor Lösung

- bisheriger Groove läuft vollständig
- Lead ist nur als sehr leises Motiv hörbar
- eventuell ist nur die erste Note der Hook hörbar

---

# 30.7 Audio während teilweiser Lösung

Wenn Melodie 1 korrekt erreicht wird:

- erstes Hook-Fragment wird hörbar

Wenn Melodie 2 korrekt erreicht wird:

- zweites Hook-Fragment ergänzt sich

Wenn das Signal am Richtungsknoten stoppt:

- die Hook bleibt kurz vor ihrer Auflösung hängen
- der Klang bleibt angenehm, aber eindeutig unvollständig
- der Richtungsknoten pulsiert als Hinweis

Wenn Melodie 3 erreicht wird:

- die Hook ist nahezu vollständig, aber noch gefiltert

---

# 30.8 Audio nach Lösung

- vollständige Lead-Melodie startet
- Track bekommt seinen klaren Hook
- dies ist der stärkste emotionale Layer-Unlock des Levels

---

# 30.9 Visuelle Reaktion

- Klangbaum öffnet seine Krone
- Himmel oder Hintergrund wechselt sichtbar in eine hellere Farbpalette
- Pixelpflanzen tanzen synchron
- fünfter Klangstein aktiviert sich

---

# 30.10 Zweck

Puzzle 5 muss den zentralen Prototyp-Test tragen:

**Freut sich der Spieler über den neuen Layer?**

Wenn dieser Moment nicht stark wirkt, muss zuerst Musik, Inszenierung oder Layer-Dramaturgie verbessert werden, nicht die Puzzle-Komplexität.

---

# 31. Puzzle 6 – Finale-Layer / Counter-Melody / FX

# 31.1 Ziel

Das Level abschließen und den fertigen Track herstellen. Das finale Puzzle darf komplexer wirken, soll aber nicht blockieren.

# 31.2 Neue Mechanik

Zwei Richtungsknoten, optionaler Glitch-Bezug.

# 31.3 Schwierigkeitsgrad

Mittel.

---

# 31.4 Puzzleaufbau

Erforderliche Route ohne Glitch-Bonus:

**Start → FX 1 → Richtungsknoten A → FX 2 → Richtungsknoten B → Counter → Ziel**

Wenn der Spieler das Glitch-Minispiel erfolgreich abgeschlossen hat, kann zusätzlich ein optionaler Glitch-Knoten eingebunden werden:

**Start → FX 1 → Richtungsknoten A → Glitch → FX 2 → Richtungsknoten B → Counter → Ziel**

Elemente:

- Start-Knoten
- zwei FX-Knoten
- ein Counter-Melody-Knoten
- zwei Richtungsknoten
- optionaler Glitch-Knoten
- zwei Stör-Knoten
- ein blockiertes Feld
- Ziel-Knoten

---

# 31.5 Spieleraufgabe

Der Spieler muss die finale Route herstellen und die Richtungsknoten korrekt drehen.

Pflichtsequenz:

**FX 1 → FX 2 → Counter**

Optionale Sequenz bei freigeschaltetem Glitch:

**FX 1 → Glitch → FX 2 → Counter**

Der optionale Glitch-Knoten ist nicht nötig, um das Level abzuschließen. Er ergänzt nur eine Bonusvariante des Finale-Layers.

---

# 31.6 Audio vor Lösung

- voller Groove mit Kick, Snare, Bass, Arpeggio und Lead
- Finale-Layer ist als leises FX-Schimmern hörbar
- wenn Glitch freigeschaltet wurde, erscheint gelegentlich ein subtiler Glitch-Ghost

---

# 31.7 Audio während teilweiser Lösung

Wenn FX 1 korrekt erreicht wird:

- kurze helle FX-Partikel werden hörbar

Wenn Richtungsknoten A falsch steht:

- Signal stoppt
- FX bleibt als kurzes Schimmern hängen

Wenn der optionale Glitch-Knoten eingebunden wird:

- ein kurzer verzerrter, aber harmonischer Effekt wird hörbar
- Welt zeigt eine kleine Parallelwelt-Mutation

Wenn Richtungsknoten B falsch steht:

- Counter-Melody bleibt gefiltert und unvollständig
- Signal pulsiert vor dem Knoten

---

# 31.8 Audio nach Lösung

- Counter-Melody oder Finale-FX startet vollständig
- Track klingt abgeschlossen
- optionaler Glitch-FX wird integriert, falls freigeschaltet

---

# 31.9 Visuelle Reaktion

- alle sechs Klangsteine leuchten
- Klangbaum ist vollständig aktiviert
- Welt pulsiert synchron zum Track
- kurze finale Animation startet
- die vollständige Route leuchtet einmal vom Start bis zum Ziel auf

---

# 31.10 Zweck

Puzzle 6 liefert das Abschlussgefühl:

**Der Song ist jetzt fertig. Die Welt ist repariert.**

Es soll etwas anspruchsvoller wirken als Puzzle 1–3, aber nicht verhindern, dass der Spieler den musikalischen Abschluss erlebt.

---

# 32. Levelabschluss

Nach Puzzle 6 wird das Puzzle-Interface reduziert oder ausgeblendet. Der Spieler sieht die vollständig transformierte Welt.

## Ablauf

1. Letzter Layer rastet ein.
2. Kamera oder Bildausschnitt zeigt den ganzen Pixelhain.
3. Vollständiger Track läuft mindestens 15–25 Sekunden.
4. Weltobjekte animieren synchron.
5. Abschlussmeldung erscheint.

Beispieltext:

**„Der Pixelhain groovt wieder.“**

Danach erscheinen zwei Buttons:

- **Noch einmal hören**
- **Weiter**

Für den ersten Prototyp muss „Weiter“ noch kein echtes nächstes Level öffnen. Es kann auf einen Platzhalter-Screen führen:

**„Nächste Klangwelt folgt.“**

---

# 33. Keine Fail States

Das erste Level soll frustarm sein.

Es gibt daher:

- keinen Timer,
- keine Lebenspunkte,
- keinen Game Over Screen,
- keine negative Bewertung,
- keine harte Strafe bei falscher Verbindung,
- keine harte Strafe bei falsch gedrehtem Richtungsknoten.

Fehler werden ausschließlich als unvollständige Zustände dargestellt.

Der Spieler kann jederzeit:

- Verbindungen entfernen,
- Richtungsknoten erneut drehen,
- Puzzle zurücksetzen,
- weiter experimentieren.

---

# 34. UI-Anforderungen auf fachlicher Ebene

Das Level benötigt folgende sichtbare Elemente:

# 34.1 Puzzlefeld

Zeigt:

- Knoten
- Verbindungen
- Signalfluss
- Richtungsknoten
- blockierte Felder
- aktive und inaktive Zustände

---

# 34.2 Sequenzleiste

Zeigt die benötigte Reihenfolge der Pattern-Knoten als Symbole.

Wichtig:

- Richtungsknoten erscheinen nicht in der Sequenzleiste.
- Sie sind Teil der Route, aber nicht Teil der musikalischen Pattern-Reihenfolge.

---

# 34.3 Layer-Fortschritt

Sechs kleine Icons oder Klangsteine zeigen, welche Layer aktiv sind:

1. Puls
2. Snare
3. Bass
4. Arpeggio
5. Lead
6. Finale

---

# 34.4 Reset-Button

Setzt nur das aktuelle Puzzle zurück.

Der Reset darf nicht:

- bereits freigeschaltete Layer deaktivieren,
- das gesamte Level zurücksetzen,
- den Spieler bestrafen.

---

# 34.5 Richtungsknoten-Hinweis

Beim ersten Auftreten eines Richtungsknotens erscheint eine kurze Hilfe:

**„Tippe den Pfeilknoten, bis das Signal weiterfließt.“**

Danach reicht visuelles Feedback.

---

# 34.6 Optionaler Glitch-Indikator

Zeigt, dass ein Bonuspfad verfügbar ist.

Der Glitch-Indikator darf auffällig sein, aber nicht wie Pflicht wirken.

---

# 34.7 Abschlussbuttons

Nach Levelabschluss:

- Noch einmal hören
- Weiter

---

# 35. Audio-Verhalten

# 35.1 Grundregel

Alle musikalischen Layer sind Bestandteil desselben Tracks und müssen harmonisch zusammenpassen.

Der Spieler erzeugt keine falschen Noten. Er aktiviert vorbereitete Layer.

---

# 35.2 Layer-Zustände

Jeder Layer kann drei Zustände haben:

# Inaktiv

- Layer ist nicht oder nur extrem subtil hörbar.
- Weltobjekte des Layers sind dunkel oder unbewegt.

# Ghost

- Layer ist leise, gefiltert, fragmentiert oder rhythmisch unvollständig hörbar.
- Wird während einer teilweise korrekten Puzzlelösung verwendet.
- Wird besonders genutzt, wenn das Signal an einem Richtungsknoten stoppt.

# Aktiv

- Layer ist vollständig hörbar.
- Layer bleibt bis zum Levelende aktiv.
- Zugehörige Weltobjekte sind vollständig animiert.

---

# 35.3 Audio bei Richtungsknoten

Richtungsknoten beeinflussen den Ghost-Zustand.

Wenn das Signal einen Richtungsknoten erreicht, aber nicht passieren kann:

- der Layer bleibt angenehm, aber unvollständig,
- der Loop wirkt, als würde ihm ein Teil fehlen,
- ein gefilterter oder gedämpfter Abschnitt wiederholt sich,
- der Spieler hört Fortschritt, aber auch eine klare Blockade.

Wenn der Richtungsknoten korrekt gedreht wird:

- ein weiteres Fragment wird freigeschaltet,
- der Layer wird klarer,
- das Signal fließt hörbar weiter.

---

# 35.4 Wichtiges Audioziel

Nach jedem gelösten Puzzle muss der Track spürbar besser sein.

„Mehr Sound“ reicht nicht. Jeder Layer braucht eine klare musikalische Funktion:

- Kick = Fundament
- Snare = Groove
- Bassline = Körper
- Arpeggio = Bewegung
- Lead = Hook
- Finale-Layer = Abschluss / Glanz / Überraschung

---

# 36. Visuelles Fortschrittssystem

Die Welt verändert sich parallel zum Track.

# Anfang

- entsättigte Farben
- wenige Animationen
- Klangbaum schläft
- Signalwege sind dunkel

# Nach jedem Layer

- ein neuer Weltbereich leuchtet
- mehr Objekte bewegen sich im Beat
- Farbpalette wird lebendiger
- der Klangbaum wächst oder erwacht weiter
- aktivierte Richtungsknoten bleiben als Teil des reparierten Signalnetzes sichtbar

# Ende

- vollständige Farbpalette
- alle Weltobjekte animiert
- Klangbaum leuchtet
- Track und Welt wirken synchron

---

# 37. Fachliche Abnahmekriterien

Ein Entwickler kann das Level als funktional betrachten, wenn folgende Kriterien erfüllt sind:

1. Der Spieler kann das Level vom Start bis zum Abschluss ohne externe Erklärung spielen.
2. Es gibt sechs nacheinander lösbare Knoten-Puzzles.
3. Jedes Puzzle aktiviert genau einen neuen musikalischen Layer.
4. Aktivierte Layer bleiben hörbar und laufen synchron weiter.
5. Mindestens drei der sechs Puzzles enthalten Richtungsknoten.
6. Mindestens ein Puzzle verlangt, dass der Spieler einen Richtungsknoten dreht, damit das Signal weiterfließen kann.
7. Richtungsknoten können per Tap in 90-Grad-Schritten gedreht werden.
8. Ein falsch ausgerichteter Richtungsknoten blockiert den Signalfluss, ohne einen harten Fehler auszulösen.
9. Unfertige Puzzle-Zustände klingen nicht falsch, aber klar unvollständig.
10. Jede erfolgreiche Lösung erzeugt sichtbares und hörbares Feedback.
11. Die Welt verändert sich nach jedem Layer sichtbar.
12. Nach Puzzle 3 erscheint ein optionaler Glitch-Moment.
13. Das Glitch-Minispiel dauert maximal 40 Sekunden und führt zurück ins Hauptlevel.
14. Puzzle 6 löst einen klaren Levelabschluss aus.
15. Der vollständige Track kann am Ende kurz angehört werden.
16. Es gibt keinen Game Over und keine harte Strafe.

---

# 38. Was bewusst nicht Bestandteil dieses Levels ist

Nicht Teil der ersten spielbaren Version:

- mehrere Klangwelten
- Weltkarte
- Metaprogression
- freies Komponieren
- Level-Editor
- Highscore
- Sternebewertung
- tägliche Challenges
- mehrere Minigames
- komplexe Story
- freischaltbare Charaktere
- Shop oder Währungen
- Social Sharing
- komplexe Richtungsknoten wie T-Stücke, One-Way-Gates oder Beat-Gates

Diese Systeme können später ergänzt werden, beantworten aber nicht die zentrale Frage des ersten Prototyps.

---

# 39. Erweiterbarkeit der Richtungsknoten für spätere Level

Für spätere komplexere Fälle können Richtungsknoten ausgebaut werden.

## 39.1 One-Way-Knoten

Das Signal darf nur in eine Richtung passieren.

## 39.2 T-Knoten

Das Signal kann auf zwei mögliche Ausgänge verteilt werden.

## 39.3 Beat-Gate

Der Knoten öffnet nur auf bestimmten Beats.

## 39.4 Glitch-Richtungsknoten

Der Knoten verändert seine Ausrichtung automatisch oder invertiert kurzzeitig.

## 39.5 Farbkodierte Richtungsknoten

Nur bestimmte Klangfarben oder Layer dürfen durch den Knoten fließen.

Diese Varianten sind nicht Teil von Level 1, aber die Grundmechanik sollte so beschrieben und gestaltet sein, dass sie später erweiterbar bleibt.

---

# 40. Zentrale Testfragen für Level 1

Nach dem Spielen dieses Levels sollen folgende Fragen beantwortet werden können:

1. Versteht der Spieler die Knoten-Verbindungsmechanik schnell?
2. Versteht der Spieler, dass Richtungsknoten gedreht werden können?
3. Ist klar, warum das Signal an einem Richtungsknoten stoppt?
4. Fühlt sich das Drehen der Richtungsknoten befriedigend an?
5. Wird das Puzzle dadurch interessanter, ohne frustrierend zu werden?
6. Ist der erste Layer-Unlock befriedigend?
7. Wird der Track nach jedem Layer spürbar besser?
8. Bleibt der Spieler neugierig auf den nächsten Layer?
9. Ist der Unterschied zwischen „unvollständig“, „fast gelöst“ und „gelöst“ klar genug?
10. Fühlt sich das Glitch-Minispiel wie eine Belohnung oder wie eine Unterbrechung an?
11. Hört der Spieler den fertigen Track am Ende freiwillig weiter?
12. Würde der Spieler danach eine zweite Klangwelt starten wollen?

---

# 41. Kurzbeschreibung für das Entwicklungsteam

Das erste Level ist ein 3–5-minütiger spielbarer Prototyp einer Klangwelt. Der Spieler repariert einen schlafenden Pixelhain, indem er sechs kleine Knoten-Puzzles löst. Jedes Puzzle aktiviert einen vorbereiteten Chiptune-Layer. Der Track beginnt fast leer und wächst über Kick, Snare, Bassline, Arpeggio, Lead und Finale-Layer zu einem vollständigen Loop.

Die Grundinteraktion ist das Verbinden einer Route vom Start zum Ziel. In späteren Puzzles kommen Richtungsknoten hinzu. Der Spieler verbindet die Route und dreht mindestens einen Richtungsknoten, damit das Signal weiterfließen kann. Richtungsknoten werden per Tap in 90-Grad-Schritten gedreht. Wenn ein Richtungsknoten falsch steht, stoppt das Signal dort, der Layer bleibt als angenehmer Ghost hörbar, und der Knoten zeigt durch Pulsieren, dass er gedreht werden muss.

Die Welt reagiert nach jedem gelösten Puzzle sichtbar: mehr Farbe, mehr Animation, mehr Synchronität. Nach dem dritten Puzzle erscheint optional ein kurzer Glitch-Pfad mit einem sehr einfachen 16-bit-Minispiel. Das Level endet, wenn alle sechs Layer aktiv sind und der vollständige Track für einen kurzen Abschlussmoment läuft.

Der Prototyp ist erfolgreich, wenn der Layer-Unlock hörbar und sichtbar Freude erzeugt, die Richtungsknoten zusätzliche Denk-Tiefe geben und der Spieler den Wunsch entwickelt, den nächsten Layer oder eine nächste Klangwelt zu entdecken.

---

# 42. Gesamtkurzfazit

Die Vision des Spiels ist ein entspanntes, aber waches Klang-Puzzle, in dem der Spieler eine musikalische Welt repariert. Der stärkste Kern ist der Layer-Puzzle-Loop:

**Kleine Klangrätsel lösen → neue Song-Layer freischalten → Welt wird lebendiger → Track wird voller → nächstes Rätsel lösen.**

Der erste spielbare Level „Der Pixelhain“ übersetzt diese Vision in eine konkrete, testbare Form:

- eine Klangwelt,
- ein Chiptune-Track,
- sechs Layer,
- sechs Puzzles,
- Route-Verbinden als Grundmechanik,
- Richtungsknoten als erste Vertiefung,
- ein optionales Glitch-Minispiel,
- ein klarer Abschluss mit vollständigem Track.

Die zentrale Qualitätsregel bleibt:

> **Jede gelöste Aktion muss den Track spürbar besser machen.**

Wenn dieser Moment funktioniert, hat das Spiel einen starken Kern. Wenn er nicht funktioniert, sollten nicht zuerst mehr Features gebaut werden, sondern genau dieser Moment verbessert werden.

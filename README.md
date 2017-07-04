[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc-sa/4.0/)

# KP Ranks
**Version:** 1.4

**Serverkey:** Yes

**Requires:** CBA_A3

**BI Forum:** [KP Ranks](https://forums.bistudio.com/topic/195034-kp-ranks/)

**Workshop:** [KP Ranks](http://steamcommunity.com/sharedfiles/filedetails/?id=741621641)


## Description:
This mod provides a automatic ranksign system for players, based on the users own config via dedicated server userconfig files or via unit init line in the editor.

The ranksign for the german Bundeswehr (green and brown ranksigns) and the US Army are implemented. They will be automaticly attached to a players uniform.


## Features:
* 3x 20 ranks for german "Flecktarn", "Tropentarn" and for US troops. (from the bottom til Colonel / Oberst)
* Server owners can manage the applied ranks with a serverside userconfig file, where they can list every player via steamID and the proper rank for them.
* Missionmakers can set the rank of a player unit via init line.
* The ranksign get's reapplied after uniform change or opening the arsenal.
* If a player isn't listed at the server file or don't have something in his unit init line, he will get the lowest rank.
* There is also a userconfig file with the uniform list, on which the mod will apply the ranksigns. Server owners can extend this list as they want.
* You get automaticly the right ranksign, even during running missions. If you wear a german Flecktarn uniform, you'll get a green german one. If you wear a german Tropentarn uniform, you'll get a brown german one and if you wear a vanilla NATO ArmA uniform, you'll get the US ranksign.
* Mission module included to force the usage of this mod.

This Mod works on vanilla uniforms, Uniforms of the BW Mod, the KSK 2035 Tropic Mod and D-Man's Croatian Military mod.

RHS Mod was checked, but the RHS uniforms don't have a proper position for apply the ranksigns, so if you wear a RHS uniform you won't get a ranksign applied.


## Script Commands:
To apply a rank via unit init file:

this setVariable ["KP_Ranks_rank", x];

x = int of the desired rank (0-19)

To apply a new rank during a running mission you have to run this on the machine of the client which rank you want to change:

player setVariable ["KP_Ranks_rank", x];

## Licence:
Copyright (c) 2016 [Wyqer](https://github.com/Wyqer)

This work is licensed under the CC BY-NC-SA 4.0 License.

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc-sa/4.0/)

Textured for the ranksigns are made by our community- and clanmember [Nils](https://www.killahpotatoes.de/index.php?user/9-nils/).

If you like the work and think it's worth a small donation, feel free to use the following link:

https://www.paypal.me/wyqer

## Changelog:

### v1.4
* Added: Croatian ranksigns. Many thanks to [Degman](http://steamcommunity.com/id/degman)
* Tweaked: Brighten up the german "Tropentarn" ranksigns a little bit

### v1.3
* Added: Support for Croatian Military Mod
* Tweaked: Some Code optimizations
* Fixed: Small error when the player is virtual zeus

### v1.2
* Added: own textures for the ranksigns
* Added: uniform list
* Added: Mission Module
* Tweaked: Rewritten the Code
* Tweaked: Renamed from "KP Dienstgrade" to "KP Ranks"

### v1.1
* Fixed: Full Ghillies got weird textures

### v1.0
* Initial Release

# ------------------------------------------------------------

## Beschreibung:
Diese Mod bietet ein automatisiertes Dienstgradsystem für Spieler.

Es basiert auf einer userconfig Datei für dedizierte Server bzw. auf das Init Feld der Einheit für Missionsbauer.

Die Mod beinhaltet Dienstgrade der Bundeswehr (Flecktarn und Tropentarn), sowie die Dienstgrade der US Army.


## Features:
* 3x 20 Dienstgrade für Flecktarn, Tropentarn und US Truppen.
* Serverbetreiber können die Dienstgrade einzelner Spieler direkt per userconfig Datei verwalten. Benötigt ist dazu nur die steamID des Spielers und die gewünschte Nummer des Dienstgrades.
* Missionsbauer können den Spielereinheiten per Init Zeile einen Dienstgrad zuweisen.
* Dienstgrade werden neu auf die Uniform gebracht, wenn die Uniform gewechselt oder das Arsenal betreten wird.
* Ist ein Spieler nicht in der userconfig Datei gelistet oder hat seine Einheit keinen Init Eintrag, so bekommt er den niedrigsten Dienstgrad zugewiesen.
* Außerdem ist eine userconfig Datei für die Uniformen vorhanden. Diese kann durch Serverbetreiber natürlich erweitert werden.
* Der Dienstgrad ist immer entsprechend der Uniform, selbst in laufenden Missionen. Trägt man Flecktarn bzw. Tropentarn, so bekommt man den deutschen grünen bzw. braunen Dienstgrad. Trägt man eine Vanilla NATO ArmA Uniform, erhält man den entsprechenden US Dienstgrad.
* Missionsmodul, um die Benutzung dieser Mod zu verlangen, ist vorhanden.

Diese Mod funktioniert mit den Vanilla Uniformen, den Uniformen der BW Mod, der KSK 2035 Tropic Mod und denen der D-Man's Croatian Military Mod.

RHS unterstützt leider nicht die entsprechende Positionierung der Dienstgrade, weshalb auf RHS Uniformen kein Dienstgrad erscheinen wird.


## Scriptbefehle:
Um einen Dienstgrad per Einheiten Initzeile im Editor zuzuweisen:

this setVariable ["KP_Ranks_rank", x];

x = int des gewünschten Dienstgrades (0-19)

Um einen Dienstgrad während einer laufenden Mission zu ändern, muss folgender Code bei dem Client ausgeführt werden, der eine entsprechende Änderung erfahren soll:

player setVariable ["KP_Ranks_rank", x];

## Lizenz:
Copyright (c) 2016 [Wyqer](https://github.com/Wyqer)

Diese Mod wird unter der CC BY-NC-SA 4.0 Lizenz veröffentlicht.

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.de)

Texturen der Dienstgradabzeichen wurden durch unser Community- und Clanmitglied [Nils](https://www.killahpotatoes.de/index.php?user/9-nils/) erstellt.

Wenn dir meine Arbeit gefällt und du denkst, dass sie eine Kleinigkeit wert ist, benutze gerne folgenden Link:

https://www.paypal.me/wyqer

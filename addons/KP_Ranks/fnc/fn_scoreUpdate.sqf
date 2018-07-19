/*
    KPR_fnc_scoreUpdate

    File: fn_scoreUpdate.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Loop for updating the players playtime. Also updates the player rank if the leveling system is enabled.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Store current tickTime for duration output
private _start = diag_tickTime;

if (!isMultiplayer) exitWith {};

if (!isServer) exitWith {};

// Pre-initialize private variables so they won't be always re-initialized as private during the forEach
private _playerId = "";
private _index = -1;
private _score = 0;
private _rank = 0;
private _newPlaytime = 0;
private _neededPoints = 99999;

{
    // Player UID and array index in KPR_players for current player
    _playerId = getPlayerUID _x;
    _index = KPR_players findIf {_x select 1 == _playerId};

    // Only continue, if player is in array (maybe he was just deleted by an Admin)
    if (_index > -1) then {
        // Get current score and rank
        _score = KPR_players select _index select 5;
        _rank = KPR_players select _index select 2;

        // Adjust playtime of the player
        _newPlaytime = (KPR_players select _index select 6) + KPR_updateInterval;
        KPR_players select _index set [6, _newPlaytime];

        // If he reached the needed additional playtime for a reward, add score
        if ((_newPlaytime % KPR_playtime) < KPR_updateInterval) then {
            _score = _score + KPR_playPoints;
            KPR_players select _index set [5, _score];
        };

        // Get needed points for next rank
        _neededPoints = missionNamespace getVariable ("KPR_rank" + str (_rank + 1));

        // If his score is above the needed points, promote him
        if (_score >= _neededPoints) then {
            KPR_players select _index set [2, _rank + 1];
            // TODO: Inform the player, systemchat is only a placeholder for development
            systemChat format ["%1 promoted to %2 with %3 points", name _x, _rank + 1, _score];
        };

        // If his score is below the needed points for the current rank, degrade him
        if (_rank > 0) then {
            _keepPoints = missionNamespace getVariable ("KPR_rank" + str _rank);
            if (_score < _keepPoints) then {
                KPR_players select _index set [2, _rank - 1];
                // TODO: Inform the player, systemchat is only a placeholder for development
                systemChat format ["%1 degraded to %2 with %3 points", name _x, _rank - 1, _score];
            };
        };
    };

} forEach (allPlayers - entities "HeadlessClient_F");

// Save updated data
[KPR_players] call KPR_fnc_savePlayers;

// Schedule a next call in CBA
[{call KPR_fnc_scoreUpdate;}, [], KPR_updateInterval * 60] call CBA_fnc_waitAndExecute;

// Log update and track duration of the runtime
if (KPR_levelDebug) then {
    private _text = format ["[KP RANKS] [LEVEL] Score Update finished. Duration: %1ms", diag_tickTime - _start];
    _text remoteExecCall ["diag_log", 2];
};

true

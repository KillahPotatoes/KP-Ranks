/*
    KPR_fnc_scoreUpdate

    File: fn_scoreUpdate.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-08-21
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
private _uid = "";
private _index = -1;
private _score = 0;
private _rank = 0;
private _newPlaytime = 0;
private _neededPoints = 99999;
private _keepPoints = 0;

{
    // Player UID and array index in KPR_players for current player
    _uid = getPlayerUID _x;
    _index = [_uid] call KPR_fnc_getPlayerIndex;

    // Only continue, if player is in array (maybe he was just deleted by an Admin)
    if (_index > -1) then {
        // Get current score and rank
        _score = [_uid] call KPR_fnc_getScore;
        _rank = [_uid] call KPR_fnc_getRank;

        // Adjust playtime of the player
        _newPlaytime = (KPR_players select _index select 6) + KPR_updateInterval;
        KPR_players select _index set [6, _newPlaytime];

        // Only touch scores, if the level system is running
        if (KPR_levelSystem) then {
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
                [true] remoteExecCall ["KPR_fnc_applyRank", _x];
                // Announce, if enabled
                if (KPR_levelAnnounce) then {
                    [true, KPR_players select _index select 0] remoteExecCall ["KPR_fnc_levelAnnounce"];
                };
                // Log if debug is enabled
                if (KPR_levelDebug) then {
                    private _text = format ["[KP RANKS] [LEVEL] %1 promoted - Current points: %2 - Needed points: %3", KPR_players select _index select 0, _score, _neededPoints];
                    diag_log _text;
                };
            };

            // If his score is below the needed points for the current rank, degrade him
            if (_rank > 0) then {
                _keepPoints = missionNamespace getVariable ("KPR_rank" + str _rank);
                if (_score < _keepPoints) then {
                    KPR_players select _index set [2, _rank - 1];
                    [true] remoteExecCall ["KPR_fnc_applyRank", _x];
                    // Announce, if enabled
                    if (KPR_levelAnnounce) then {
                        [false, KPR_players select _index select 0] remoteExecCall ["KPR_fnc_levelAnnounce"];
                    };
                    // Log if debug is enabled
                    if (KPR_levelDebug) then {
                        private _text = format ["[KP RANKS] [LEVEL] %1 degraded - Current points: %2 - Needed points: %3", KPR_players select _index select 0, _score, _keepPoints];
                        diag_log _text;
                    };
                };
            };
        };
    };
} forEach (allPlayers - entities "HeadlessClient_F");

// Save updated data
[KPR_players] call KPR_fnc_savePlayers;

// Schedule a next call in CBA
[{[] call KPR_fnc_scoreUpdate;}, [], KPR_updateInterval * 60] call CBA_fnc_waitAndExecute;

// Log update and track the runtime
if (KPR_levelDebug) then {
    private _text = format ["[KP RANKS] [LEVEL] Score Update finished, next in %1 minutes - Runtime: %2ms", KPR_updateInterval, diag_tickTime - _start];
    diag_log _text;
};

true

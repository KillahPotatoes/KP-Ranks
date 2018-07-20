/*
    KPR_fnc_playerDeath

    File: fn_playerDeath.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles respawn of players and substract the penalty to their score, if level system is activated.

    Parameter(s):
        0: OBJECT - Entity which respawned
        1: OBJECT - Corpse of the respawned entity

    Returns:
    BOOL
*/

// Leave if the leveling system isn't enabled
if (!KPR_levelSystem) exitWith {};

params ["_entity", "_corpse"];

// Exit, if the respawned entity isn't a player
if !(isPlayer _entity) exitWith {};

// Exit, if there is no corpse (e.g. a joining player)
if !(isNull _corpse) exitWith {};

// Get some player date
private _playerId = getPlayerUID _entity;
private _index = KPR_players findIf {_x select 1 == _playerId};
private _score = (KPR_players select _index select 5) - KPR_killedPenalty;

// No negative points
if (_score < 0) then {
    _score = 0;
};

// Update points of player
KPR_players select _index set [5, _score];

// Save updated data
[KPR_players] call KPR_fnc_savePlayers;

// Log if debug is enabled
if (KPR_levelDebug) then {
    diag_log format ["[KP RANKS] [LEVEL] %1 respawned - New points: %2", KPR_players select _index select 0, _score];
};

true

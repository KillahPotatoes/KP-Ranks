/*
    KPR_fnc_playerDeath

    File: fn_playerDeath.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles respawn of players and substract the respawn penalty to their score.

    Parameter(s):
        0: OBJECT - Entity which respawned
        1: OBJECT - Corpse of the respawned entity

    Returns:
    BOOL
*/

params ["_entity", "_corpse"];

// Exit, if the respawned entity isn't a player
if !(isPlayer _entity) exitWith {};

// Exit, if there is no corpse (e.g. a joining player)
if (isNull _corpse) exitWith {};

// Get player index
private _playerId = getPlayerUID _entity;
private _index = [_playerId] call KPR_fnc_getPlayerIndex;

// Apply death penalty
[_playerId, (KPR_killedPenalty * -1)] call KPR_fnc_addScore;

// Log if debug is enabled
if (KPR_levelDebug) then {
    diag_log format ["[KP RANKS] [LEVEL] %1 respawned - New points: %2", KPR_players select _index select 0, KPR_players select _index select 5];
};

true

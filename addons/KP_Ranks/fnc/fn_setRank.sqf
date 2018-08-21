/*
    KPR_fnc_setRank

    File: fn_setRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-23
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Sets the rank of a given player to a given rank. Returns true on success and false if the player wasn't found.

    Parameter(s):
        0: STRING - Steam UID of the player (default: uid of current player)
        1: NUMBER - Rank to set (default: 0)

    Returns:
    BOOL
*/

if (!isServer) exitWith {false};

params [["_uid", getPlayerUID player], ["_rank", 0]];

private _index = [_uid] call KPR_fnc_getPlayerIndex;

// Return false, if uid wasn't found in the players array
if (_index == -1) exitWith {false};

// Set rank and save
KPR_players select _index set [2, _rank];
[KPR_players] call KPR_fnc_savePlayers;

true

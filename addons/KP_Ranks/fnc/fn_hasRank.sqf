/*
    KPR_fnc_hasRank

    File: fn_hasRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-23
    Last Update: 2018-07-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Checks if the given player has at least the given rank.
    Returns true if he has and false if the player hasn't or wasn't found.

    Parameter(s):
        0: STRING - Steam UID of the player
        1: NUMBER - Rank to check (default: 0)

    Returns:
    BOOL
*/

params ["_uid", ["_rank", 0]];

private _index = [_uid] call KPR_fnc_getPlayerIndex;

// Return false, if uid wasn't found in the players array
if (_index == -1) exitWith {false};

(KPR_players select _index select 2 >= _rank)

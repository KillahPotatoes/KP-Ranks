/*
    KPR_fnc_getRank

    File: fn_getRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-23
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets the current rank of a given player. Identified by the Steam UID.
    Returns the current rank as number. If the Steam UID wasn't found it returns -1.

    Parameter(s):
        0: STRING - Steam UID of the player (default: uid of current player)

    Returns:
    NUMBER
*/

params [["_uid", getPlayerUID player]];

private _index = [_uid] call KPR_fnc_getPlayerIndex;

// Return -1, if uid wasn't found in the players array
if (_index == -1) exitWith {_index};

// Return rank number, if player was found
KPR_players select _index select 2

/*
    KPR_fnc_addScore

    File: fn_addScore.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-23
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Changes the score of a given player. Returns true on success and false if the player wasn't found.

    Parameter(s):
        0: STRING - Steam UID of the player
        1: NUMBER - Amount of points to add to the player score. Can be negative to substract. (default: 0)

    Returns:
    BOOL
*/

if (!isServer) exitWith {false};

params ["_uid", ["_change", 0]];

// Get current score
private _score = [_uid] call KPR_fnc_getScore;

// Return false, if uid wasn't found in the players array
if (_score == -1) exitWith {false};

// Adjust score
_score = _score + _change;

// Prevent negative score
if (_score < 0) then {
    _score = 0;
};

// Save new score
[_uid, _score] call KPR_fnc_setScore;

true

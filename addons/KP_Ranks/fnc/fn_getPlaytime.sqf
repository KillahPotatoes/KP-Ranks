/*
    KPR_fnc_getPlaytime

    File: fn_getPlaytime.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets the playtime of the given player as string formatted to days, hours and minutes.

    Parameter(s):
        0: STRING - Steam UID of the player (default: uid of current player)

    Returns:
    STRING
*/

params [["_uid", getPlayerUID player]];

private _playtime = [_uid] call KPR_fnc_getPlaytimePlain;

// Generate readable time values
private _playtimeD = floor (_playtime / 1440);
_playtime = _playtime % 1440;
private _playtimeH = floor (_playtime / 60);
private _playtimeM = _playtime % 60;

format ["%1d %2h %3m", _playtimeD, _playtimeH, _playtimeM]

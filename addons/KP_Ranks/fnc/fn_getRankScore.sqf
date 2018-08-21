/*
    KPR_fnc_getRankScore

    File: fn_getRankScore.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets the needed score to keep the current player rank.

    Parameter(s):
        0: STRING - Steam UID of the player (default: uid of current player)

    Returns:
    NUMBER
*/

params [["_uid", getPlayerUID player]];

private _rank = [_uid] call KPR_fnc_getRank;

missionNamespace getVariable ("KPR_rank" + str _rank)

/*
    KPR_fnc_getPlaytimePlain

    File: fn_getPlaytimePlain.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets the playtime of the given player in plain minutes.

    Parameter(s):
        0: STRING - Steam UID of the player (default: uid of current player)

    Returns:
    NUMBER
*/

params [["_uid", getPlayerUID player]];

KPR_players select ([_uid] call KPR_fnc_getPlayerIndex) select 6

/*
    KPR_fnc_getPlayerIndex

    File: fn_getPlayerIndex.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets the index of a given player in the KPR_players array. Identified by the Steam UID.
    Returns the index as number. If the Steam UID wasn't found it returns -1.

    Parameter(s):
        0: STRING - Steam UID of the player

    Returns:
    NUMBER
*/

params ["_uid"];

KPR_players findIf {_x select 1 == _uid}

/*
    KPR_fnc_getRankName

    File: fn_getRankName.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Returns the rank name without the prefix like "USA11". It only contains the rank name like "Master Sergeant"

    Parameter(s):
        0: OBJECT - Player object from which the rank name should be retrieved (default: player)

    Returns:
    STRING
*/

params [["_unit", player]];

[_unit] call KPR_fnc_getInsigniaData select 2

/*
    KPR_fnc_isAdmin

    File: fn_isAdmin.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-14
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Loop for evaluation if the player is server or KPR admin.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!hasInterface) exitWith {};

if (!isMultiplayer) exitWith {};

private _bool = false;

if (serverCommandAvailable "#kick") then {
    _bool = true;
} else {
    if ((KPR_players select ([getPlayerUID player] call KPR_fnc_getPlayerIndex) select 4) == 1) then {
        _bool = true;
    };
};

KPR_isAdmin = _bool;

[{[] call KPR_fnc_isAdmin;}, [], 5] call CBA_fnc_waitAndExecute;

true

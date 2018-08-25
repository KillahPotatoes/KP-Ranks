/*
    KPR_fnc_autoLoop

    File: fn_autoLoop.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Endless loop which applies the insignia to the players uniform, as long it's enabled in the CBA settings.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!hasInterface) exitWith {};

if (!isMultiplayer) exitWith {};

if (KPR_autoMode || KPR_levelSystem) then {
    [false] call KPR_fnc_applyRank;
};

[{[] call KPR_fnc_autoLoop;}, [], KPR_autoModeInterval] call CBA_fnc_waitAndExecute;

true

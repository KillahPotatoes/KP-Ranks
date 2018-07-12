/*
    KPR_fnc_autoLoop

    File: fn_autoLoop.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Endless loop which applies the insignia to the players uniform.

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

if (!isMultiplayer) exitWith {};

if (hasInterface) then {
    if (KPR_extendedLog) then {
        private _text = format ["[KP RANKS] [%1 (%2)] Loop started", name player, getPlayerUID player];
        _text remoteExec ["diag_log", 2];
    };

    while {KPR_autoMode} do {
        uiSleep KPR_autoModeInterval;
        call KPR_fnc_applyRank;
    };

    if (KPR_extendedLog) then {
        private _text = format ["[KP RANKS] [%1 (%2)] Loop stopped", name player, getPlayerUID player];
        _text remoteExec ["diag_log", 2];
    };
};

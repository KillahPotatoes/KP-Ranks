/*
    KPR_fnc_playerExport

    File: fn_playerExport.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-13
    Last Update: 2018-07-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Exports the current KPR_players array to a variable in the players profileNamespace for transport to another server.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

player setVariable ["KPR_pClipboard", KPR_players];
findDisplay 7580821 displayCtrl 75802 ctrlEnable true;

true

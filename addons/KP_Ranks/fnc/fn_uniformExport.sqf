/*
    KPR_fnc_uniformExport

    File: fn_uniformExport.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Exports the current KPR_uniforms array to a variable in the players profileNamespace for transport to another server.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

profileNamespace setVariable ["KPR_uClipboard", +KPR_uniforms];
saveProfileNamespace;

findDisplay 7580822 displayCtrl 758010 ctrlEnable true;

hint localize "STR_KPR_DIALOG_EXPORTDONE";
[{hintSilent "";}, [], 2] call CBA_fnc_waitAndExecute;

true

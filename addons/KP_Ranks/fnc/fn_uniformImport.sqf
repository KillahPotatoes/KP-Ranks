/*
    KPR_fnc_uniformImport

    File: fn_uniformImport.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-08-21
    License: GNU General Pubic License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Imports the KPR_uniforms array from the players profileNamespace variable.
    Unsets the variable in the profileNamespace afterwards.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

KPR_uniforms = profileNamespace getVariable ["KPR_uClipboard", []];
profileNamespace setVariable ["KPR_uClipboard", nil];
saveProfileNamespace;
[KPR_uniforms] remoteExecCall ["KPR_fnc_saveUniforms", 2];
closeDialog 0;
[{!dialog}, {[] call KPR_fnc_openDialogUniforms;}] call CBA_fnc_waitUntilAndExecute;

true

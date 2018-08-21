/*
    KPR_fnc_uniformSave

    File: fn_uniformSave.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Saves faction change on a currently selected active uniform.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Dialog controls
private _dialog = findDisplay 7580822;
private _ctrlsLbAct = _dialog displayCtrl 75801;
private _ctrlsLbDropdown = _dialog displayCtrl 75806;

// Classname of selected Uniform
private _classname = _ctrlsLbAct lbData (lbCurSel _ctrlsLbAct);;

// Update faction in KPR_uniforms list
KPR_uniforms select ([_classname] call KPR_fnc_getUniformIndex) set [1, lbCurSel _ctrlsLbDropdown];

// Send updated list to server for saving
[KPR_uniforms] remoteExecCall ["KPR_fnc_saveUniforms", 2];

// Update both listboxes with affected uniform selected
[_classname] call KPR_fnc_uniformFill;

true

/*
    KPR_fnc_uniformMove

    File: fn_uniformMove.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Moves uniforms from or to the active uniform list depending on the current Listbox selection.

    Parameter(s):
        0: STRING - "add" if moving to active or "delete" if moving to inactive (Default: "")

    Returns:
    BOOL
*/

params [["_action", ""]];

// Dialog controls
private _dialog = findDisplay 7580822;
private _ctrlsLbAct = _dialog displayCtrl 75801;
private _ctrlsLbInact = _dialog displayCtrl 75802;
private _ctrlsLbDropdown = _dialog displayCtrl 75806;

private _classname = "";

// Add/Remove the uniform to/from KPR_uniforms
if (_action == "add") then {
    _classname = _ctrlsLbInact lbData (lbCurSel _ctrlsLbInact);
    KPR_uniforms pushBack [_classname, lbCurSel _ctrlsLbDropdown];
} else {
    _classname = _ctrlsLbAct lbData (lbCurSel _ctrlsLbAct);
    KPR_uniforms deleteAt ([_classname] call KPR_fnc_getUniformIndex);
};

// Send updated list to server for saving
[KPR_uniforms] remoteExecCall ["KPR_fnc_saveUniforms", 2];

// Update both listboxes with affected uniform selected
[_classname] call KPR_fnc_uniformFill;

true

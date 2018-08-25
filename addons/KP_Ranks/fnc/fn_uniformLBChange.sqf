/*
    KPR_fnc_uniformLBChange

    File: fn_uniformLBChange.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-17
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Stores edits for the saving process of the player list, if the save button is clicked in the dialog.

    Parameter(s):
        0: STRING - Kind of edit which should be done
        1: NUMBER - Index of the selected element in the Listbox

    Returns:
    BOOL
*/

params ["_kind", "_index"];

// Dialog IDCs and controls
private _dialog = findDisplay 7580822;
private _ctrlsLbAct = _dialog displayCtrl 75801;
private _ctrlsLbInact = _dialog displayCtrl 75802;
private _ctrlsPicture = _dialog displayCtrl 75803;
private _ctrlsClass = _dialog displayCtrl 75804;
private _ctrlsAuthor = _dialog displayCtrl 75805;
private _ctrlsLbDropdown = _dialog displayCtrl 75806;
private _ctrlsToActive = _dialog displayCtrl 75807;
private _ctrlsSaveUniform = _dialog displayCtrl 75808;
private _ctrlsToInactive = _dialog displayCtrl 75809;

// Config variable
private _config = configFile >> "CfgWeapons";

// Unhide buttons
_ctrlsToActive ctrlShow true;
_ctrlsSaveUniform ctrlShow true;
_ctrlsToInactive ctrlShow true;

// Remove selection in the opposite list, get uniform config class and enable buttons with possible actions
if (_kind == "active") then {
    _ctrlsLbInact lbSetCurSel -1;
    _config = _config >> _ctrlsLbAct lbData _index;
    _ctrlsToActive ctrlEnable false;
    _ctrlsSaveUniform ctrlEnable true;
    _ctrlsToInactive ctrlEnable true;
} else {
    _ctrlsLbAct lbSetCurSel -1;
    _config = _config >> _ctrlsLbInact lbData _index;
    _ctrlsToActive ctrlEnable true;
    _ctrlsSaveUniform ctrlEnable false;
    _ctrlsToInactive ctrlEnable false;
};

// Index in uniform list, if active uniform
private _uniformIndex = [configName _config] call KPR_fnc_getUniformIndex;

// Update details
_ctrlsPicture ctrlSetText getText (_config >> "picture");
_ctrlsClass ctrlSetText configName _config;
_ctrlsAuthor ctrlSetText getText (_config >> "Author");

// Unhide faction selector and set faction or default
_ctrlsLbDropdown ctrlEnable true;
_ctrlsLbDropdown ctrlShow true;
if (_uniformIndex != -1) then {
    _ctrlsLbDropdown lbSetCurSel (KPR_uniforms select _uniformIndex select 1);
} else {
    _ctrlsLbDropdown lbSetCurSel 3;
};

true

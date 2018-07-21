/*
    KPR_fnc_openDialogUniforms

    File: fn_openDialogUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-14
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the uniform management dialog.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Open dialog and disable serialization, so local variables can store displays and controls
createDialog "KPR_uniformList";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 7580822;
private _ctrlsLbDropdown = _dialog displayCtrl 75806;
private _ctrlsToActive = _dialog displayCtrl 75807;
private _ctrlsSaveUniform = _dialog displayCtrl 75808;
private _ctrlsToInactive = _dialog displayCtrl 75809;
private _ctrlsImport = _dialog displayCtrl 758010;

// Add selections for the faction list dropdown
_ctrlsLbDropdown lbAdd localize "STR_KPR_DIALOG_BWF";
_ctrlsLbDropdown lbAdd localize "STR_KPR_DIALOG_BWT";
_ctrlsLbDropdown lbAdd localize "STR_KPR_DIALOG_CRO";
_ctrlsLbDropdown lbAdd localize "STR_KPR_DIALOG_USA";
_ctrlsLbDropdown lbSetCurSel 3;

// Hide faction dropdown and buttons, as in initial state there is no uniform selected
{
    _x ctrlEnable false;
} forEach [_ctrlsLbDropdown, _ctrlsToActive, _ctrlsSaveUniform, _ctrlsToInactive];

_ctrlsLbDropdown ctrlShow false;

// Deactivate import button, if no exported data is saved in the players profile
if (profileNamespace getVariable ["KPR_uClipboard", []] isEqualTo []) then {
    _ctrlsImport ctrlEnable false;
} else {
    _ctrlsImport ctrlEnable true;
};

// Fill active and inactive list
[] call KPR_fnc_uniformFill;

true

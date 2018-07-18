/*
    KPR_fnc_openDialogUniforms

    File: fn_openDialogUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-14
    Last Update: 2018-07-14
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

// Filter uniforms which are present due to loaded mods
{
    if (isClass (configFile >> "CfgWeapons" >> _x select 0)) then {
        KPR_activeUniforms pushBack [getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayName"), _x select 0, _forEachIndex];
    };
} forEach KPR_uniforms;

// Sort alphabetical
KPR_activeUniforms sort true;

// Variable for current classname
private _classname = "";

// Check for all available uniforms in the config and add them to the inactive list, when not already in the active list
{
    _classname = configName _x;
    if (KPR_activeUniforms findIf {_x select 1 == _classname} == -1) then {
        KPR_inactiveUniforms pushBack [getText (_x >> "displayName"), _classname];
    };
} forEach ('((configName _x) call BIS_fnc_itemType) select 1 == "Uniform" && getText (_x >> "displayName") != ""' configClasses (configFile >> "CfgWeapons"));

// Destroy classname variable
_classname = nil;

// Sort alphabetical
KPR_inactiveUniforms sort true;

// Dialog IDCs and controls
private _dialog = findDisplay 7580822;
private _ctrlsLbActIdc = 75801;
private _ctrlsLbInactIdc = 75802;
private _ctrlsPictureIdc = 75803;
private _ctrlsClassIdc = 75804;
private _ctrlsAuthorIdc = 75805;
private _ctrlsLbDropdownIdc = 75806;
private _ctrlsToActiveIdc = 75807;
private _ctrlsSaveUniformIdc = 75808;
private _ctrlsToInactiveIdc = 75809;
private _ctrlsLbAct = _dialog displayCtrl _ctrlsLbActIdc;
private _ctrlsLbInact = _dialog displayCtrl _ctrlsLbInactIdc;
private _ctrlsPicture = _dialog displayCtrl _ctrlsPictureIdc;
private _ctrlsClass = _dialog displayCtrl _ctrlsClassIdc;
private _ctrlsAuthor = _dialog displayCtrl _ctrlsAuthorIdc;
private _ctrlsLbDropdown = _dialog displayCtrl _ctrlsLbDropdownIdc;
private _ctrlsToActive = _dialog displayCtrl _ctrlsToActiveIdc;
private _ctrlsSaveUniform = _dialog displayCtrl _ctrlsSaveUniformIdc;
private _ctrlsToInactive = _dialog displayCtrl _ctrlsToInactiveIdc;

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

// Add active uniforms to listbox
{
    _ctrlsLbAct lbSetData [_ctrlsLbAct lbAdd (_x select 0), _x select 1];
} forEach KPR_activeUniforms;

// Add inactive uniforms to listbox
{
    _ctrlsLbInact lbSetData [_ctrlsLbInact lbAdd (_x select 0), _x select 1];
} forEach KPR_inactiveUniforms;

true

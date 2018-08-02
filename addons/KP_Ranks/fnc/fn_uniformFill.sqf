/*
    KPR_fnc_uniformFill

    File: fn_uniformFill.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Updates and fills the active and inactive uniforms lists in the uniform management dialog.

    Parameter(s):
        0: STRING - OPTIONAL - Classname of the uniform which should be selected after updating the lists (Default: nil)

    Returns:
    BOOL
*/

params [["_toSelect", ""]];

if !(KPR_activeUniforms isEqualTo []) then {KPR_activeUniforms = [];};
if !(KPR_inactiveUniforms isEqualTo []) then {KPR_inactiveUniforms = [];};

// Dialog controls
private _dialog = findDisplay 7580822;
private _ctrlsLbAct = _dialog displayCtrl 75801;
private _ctrlsLbInact = _dialog displayCtrl 75802;

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
    if ((KPR_activeUniforms findIf {_x select 1 == _classname}) == -1) then {
        KPR_inactiveUniforms pushBack [getText (_x >> "displayName"), _classname];
    };
} forEach ('((configName _x) call BIS_fnc_itemType) select 1 == "Uniform" && getText (_x >> "displayName") != ""' configClasses (configFile >> "CfgWeapons"));

// Sort alphabetical
KPR_inactiveUniforms sort true;

// Add active uniforms to listbox
lbClear _ctrlsLbAct;
{
    _ctrlsLbAct lbSetData [_ctrlsLbAct lbAdd (_x select 0), _x select 1];
} forEach KPR_activeUniforms;
_ctrlsLbAct lbSetCurSel -1;

// Add inactive uniforms to listbox
lbClear _ctrlsLbInact;
{
    _ctrlsLbInact lbSetData [_ctrlsLbInact lbAdd (_x select 0), _x select 1];
} forEach KPR_inactiveUniforms;
_ctrlsLbInact lbSetCurSel -1;

// Set selection of listbox to the added/removed uniform after the move
if (_toSelect != "") then {
    private _index = KPR_activeUniforms findIf {_x select 1 == _toSelect};
    if (_index == -1) then {
        _index = KPR_inactiveUniforms findIf {_x select 1 == _toSelect};
        _ctrlsLbInact lbSetCurSel _index;
    } else {
        _ctrlsLbAct lbSetCurSel _index;
    };
};

true

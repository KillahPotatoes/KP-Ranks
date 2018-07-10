/*
    KPR_fnc_applyRank

    File: fn_applyRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Updates and applies the insignia on the players uniform.
    Optionally shows a hint for the player.

    Parameter(s):
        0: BOOL - Show hint for player (default: false)

    Returns:
    BOOL
*/

params [["_showHint", false]];

// Get current player rank
private _rank = player getVariable ["KPR_rank", 0];

// Bool for kind of hint
private _validUniform = false;

// Configclass of the insignia
private _insigniaClass = configNull;

// Get index of the current player uniform
private _uniformIndex = KPR_uniforms findIf {_x select 0 == uniform player};

// Placeholder with default values
private _material = "\a3\data_f\default.rvmat";
private _texture = "#(rgb,8,8,3)color(0,0,0,0)";
private _displayname = "NONE";

// Apply insignia, if player wears a supported uniform
if (_uniformIndex != -1) then {
    _validUniform = true;
    if (KPR_uniforms select _uniformIndex select 1 == 0) exitWith {
        _insigniaClass = [["CfgUnitInsignia", "KPR_BWF_" + str _rank], configNull] call BIS_fnc_loadClass;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 1) exitWith {
        _insigniaClass = [["CfgUnitInsignia", "KPR_BWT_" + str _rank], configNull] call BIS_fnc_loadClass;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 2) exitWith {
        if (_rank != 0) then {
            _insigniaClass = [["CfgUnitInsignia", "KPR_USA_" + str _rank], configNull] call BIS_fnc_loadClass;
        };
    };
    if (KPR_uniforms select _uniformIndex select 1 == 3) exitWith {
        if (_rank != 0) then {
            _insigniaClass = [["CfgUnitInsignia", "KPR_CRO_" + str _rank], configNull] call BIS_fnc_loadClass;
        };
    };
};

// If it's a valid uniform, get specific values for material and texture of the insignia
if (!isNull _insigniaClass) then {
    _material = getText (_insigniaClass >> "material");
    _texture = getText (_insigniaClass >> "texture");
    _displayname = getText (_insigniaClass >> "displayname");
};

// Show hint with the picture of the insignia or that the uniform isn't supported
if (_showHint) then {
    private _text = format ["[KP RANKS] [%1 (%2)] Uniform not supported: %3", name player, getPlayerUID player, uniform player];
    if (_validUniform) then {
        [_texture, true] spawn KPR_fnc_showHint;
        _text = format ["[KP RANKS] [%1 (%2)] Apply Rank %3 on uniform %4", name player, getPlayerUID player, _displayname, uniform player];
    } else {
        ["Uniform not supported"] spawn KPR_fnc_showHint;
    };
    _text remoteExec ["diag_log", 2];
};

// Apply insignia
{
    if (_x == "insignia") exitWith {
        player setObjectMaterialGlobal [_forEachIndex, _material];
        player setObjectTextureGlobal [_forEachIndex, _texture];
    };
} forEach getArray (configFile >> "CfgVehicles" >> getText (configFile >> "CfgWeapons" >> uniform player >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

true

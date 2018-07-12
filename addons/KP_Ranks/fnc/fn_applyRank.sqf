/*
    KPR_fnc_applyRank

    File: fn_applyRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-12
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
private _index = KPR_uniforms findIf {_x select 0 == uniform player};

// Placeholder with default values
private _material = "\a3\data_f\default.rvmat";
private _texture = "#(rgb,8,8,3)color(0,0,0,0)";
private _displayname = "NONE";

// Get configClass of the insignia, if player wears a supported uniform
if (_index != -1) then {
    _validUniform = true;
    _insigniaClass = [["CfgUnitInsignia", format ["KPR_%1_%2", KPR_uniforms select _index select 1, str _rank]], configNull] call BIS_fnc_loadClass;
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
        [_displayname, _texture] spawn KPR_fnc_showHint;
        _text = format ["[KP RANKS] [%1 (%2)] Apply Rank %3 on uniform %4", name player, getPlayerUID player, _displayname, uniform player];
    } else {
        ["Uniform not supported"] spawn KPR_fnc_showHint;
    };

    if (KPR_extendedLog) then {
        _text remoteExec ["diag_log", 2];
    };
};

// Apply insignia
{
    if (_x == "insignia") exitWith {
        player setObjectMaterialGlobal [_forEachIndex, _material];
        player setObjectTextureGlobal [_forEachIndex, _texture];
    };
} forEach getArray (configFile >> "CfgVehicles" >> getText (configFile >> "CfgWeapons" >> uniform player >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

true

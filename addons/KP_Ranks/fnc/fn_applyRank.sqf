/*
    KPR_fnc_applyRank

    File: fn_applyRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-19
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

// Get current player list index
private _indexP = KPR_players findIf {_x select 1 == getPlayerUID player};

// Get current player rank
private _rank = KPR_players select _indexP select 2;

// Bool for kind of hint
private _validUniform = false;

// Configclass of the insignia
private _insigniaClass = configNull;

// Get index of the current player uniform
private _indexU = KPR_uniforms findIf {_x select 0 == uniform player};

// Placeholder with default values
private _material = "\a3\data_f\default.rvmat";
private _texture = "#(rgb,8,8,3)color(0,0,0,0)";
private _displayname = "NONE";

// Get configClass of the insignia, if player wears a supported uniform
if (_indexU != -1) then {
    _validUniform = true;

    private _nation = KPR_uniforms select _indexU select 1;
    if (KPR_playerNation) then {_nation = KPR_players select _indexP select 3;};

    switch (_nation) do {
        case 0: {_nation = "BWF";};
        case 1: {_nation = "BWT";};
        case 2: {_nation = "CRO";};
        case 3: {_nation = "USA";};
        default {_nation = "USA";};
    };

    _insigniaClass = [["CfgUnitInsignia", format ["KPR_%1_%2", _nation, str _rank]], configNull] call BIS_fnc_loadClass;
};

// If it's a valid uniform, get specific values for material and texture of the insignia
if (!isNull _insigniaClass) then {
    _material = getText (_insigniaClass >> "material");
    _texture = getText (_insigniaClass >> "texture");
    _displayname = getText (_insigniaClass >> "displayname");
};

// Show hint with the picture of the insignia or that the uniform isn't supported
if (_showHint) then {
    if (_validUniform || KPR_playerNation) then {
        [_displayname select [6], _texture] call KPR_fnc_showHint;
    } else {
        ["Uniform not supported"] call KPR_fnc_showHint;
        if (KPR_extendedLog) then {
            private _text = format ["[KP RANKS] [%1 (%2)] Uniform not supported: %3", name player, getPlayerUID player, uniform player];
            _text remoteExecCall ["diag_log", 2];
        };
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

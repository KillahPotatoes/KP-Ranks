/*
    KPR_fnc_getInsigniaData

    File: fn_getInsigniaData.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Gets specific data of the insignia of the provided player object.
    Returns an array with the corresponding insignia data on success or an empty array if no data could be retrieved.

    Parameter(s):
        0: OBJECT - Player object from which the rank should be retrieved (default: player)

    Returns:
    ARRAY
        0: STRING - material (rvmat) of the insignia
        1: STRING - path to the texture of the insignia
        2: STRING - rank name without the prefix like "USA11". It only contains the rank name like "Master Sergeant"
        3: NUMBER - index of the player uniform in the KPR_uniforms array, -1 if not wearing an activated uniform
*/

params [["_unit", player]];

// Initialize return variable
private _return = [];

// Proceed, if provided unit is a player. Otherwise just return the empty array.
if (isPlayer _unit) then {
    // Placeholder with default values
    private _material = "\a3\data_f\default.rvmat";
    private _texture = "#(rgb,8,8,3)color(0,0,0,0)";
    private _name = "NONE";
    private _nation = -1;

    // Is the player wearing an activated uniform
    private _uniform = [uniform _unit] call KPR_fnc_getUniformIndex;

    // UID of the player
    private _uid = getPlayerUID _unit;

    // Get current player list index
    private _indexP = [_uid] call KPR_fnc_getPlayerIndex;

    // Get current player rank
    private _rank = [_uid] call KPR_fnc_getRank;

    // Configclass of the insignia
    private _insigniaClass = configNull;

    // Get the nation of the player or uniform
    if (_uniform != -1) then {_nation = KPR_uniforms select _uniform select 1;};
    if (KPR_playerNation) then {_nation = KPR_players select _indexP select 3;};

    switch (_nation) do {
        case 0: {_nation = "BWF";};
        case 1: {_nation = "BWT";};
        case 2: {_nation = "CRO";};
        case 3: {_nation = "USA";};
        default {_nation = "USA";};
    };

    _insigniaClass = [["CfgUnitInsignia", format ["KPR_%1_%2", _nation, str _rank]], configNull] call BIS_fnc_loadClass;

    // If it's a valid uniform, get specific values for material and texture of the insignia
    if (!isNull _insigniaClass) then {
        _material = getText (_insigniaClass >> "material");
        _texture = getText (_insigniaClass >> "texture");
        _name = getText (_insigniaClass >> "displayname");
    };

    // Fill the return array
    _return = [_material, _texture, _name select [6], _uniform];
};

_return

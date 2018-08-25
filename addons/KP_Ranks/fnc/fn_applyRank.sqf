/*
    KPR_fnc_applyRank

    File: fn_applyRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-08-21
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

// Exit, if KPR_players list is empty.
if (KPR_players isEqualTo []) exitWith {};

// Get the insignia data
private _insignia = [] call KPR_fnc_getInsigniaData;

// Show hint with the picture of the insignia or that the uniform isn't activated
if (_showHint) then {
    if (((_insignia select 3) > -1) || KPR_playerNation) then {
        [_insignia select 2, _insignia select 1] call KPR_fnc_showHint;
    } else {
        ["Uniform not activated"] call KPR_fnc_showHint;
        if (KPR_extendedLog) then {
            private _text = format ["[KP RANKS] [%1 (%2)] Uniform not activated: %3", name player, getPlayerUID player, uniform player];
            _text remoteExecCall ["diag_log", 2];
        };
    };
};

// Apply insignia
{
    if (_x == "insignia") exitWith {
        player setObjectMaterialGlobal [_forEachIndex, _insignia select 0];
        player setObjectTextureGlobal [_forEachIndex, _insignia select 1];
    };
} forEach getArray (configFile >> "CfgVehicles" >> getText (configFile >> "CfgWeapons" >> uniform player >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

true

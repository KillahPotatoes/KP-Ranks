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

// Classname of the insignia
private _insigniaClass = "";

// Get index of the current player uniform
private _uniformIndex = KPR_uniforms findIf {_x select 0 == uniform player};

// Apply insignia, if player wears a supported uniform
if (_uniformIndex != -1) then {
    _validUniform = true;
    if (KPR_uniforms select _uniformIndex select 1 == 0) exitWith {
        _insigniaClass = "KPR_BWF_" + str _rank;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 1) exitWith {
        _insigniaClass = "KPR_BWT_" + str _rank;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 2) exitWith {
        if (_rank != 0) then {
            _insigniaClass = "KPR_USA_" + str _rank;
        };
    };
    if (KPR_uniforms select _uniformIndex select 1 == 3) exitWith {
        if (_rank != 0) then {
            _insigniaClass = "KPR_CRO_" + str _rank;
        };
    };
};

// Show hint with the picture of the insignia or that the uniform isn't supported
if (_showHint) then {
    if (_validUniform) then {
        [_insigniaClass, true] spawn KPR_fnc_showHint;
    } else {
        ["Uniform not supported"] spawn KPR_fnc_showHint;
    };
    private _text = format [
        "[KP RANKS] [%1 (%2)] Apply Rank %3 on uniform %4",
        name player,
        getPlayerUID player,
        _insigniaClass,
        uniform player
    ];
    _text remoteExec ["diag_log", 2];
};

// Apply insignia
[player, _insigniaClass] call BIS_fnc_setUnitInsignia;

true

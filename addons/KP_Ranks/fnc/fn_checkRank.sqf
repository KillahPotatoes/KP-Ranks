/*
    KPR_fnc_checkRank

    File: fn_checkRank.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Updates and applies the insignia on the players uniform.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

private _rank = player getVariable ["KPR_rank", 0];
private _uniform = uniform player;
private _insigniaClass = "";

private _uniformIndex = KPR_uniforms findIf {_x select 0 == _uniform};

if (_uniformIndex != -1) then {
    if (KPR_uniforms select _uniformIndex select 1 == 0) exitWith {
        _insigniaClass = "KPR_BWF_" + str _rank;
        [_insigniaClass, true] spawn KPR_fnc_showHint;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 1) exitWith {
        _insigniaClass = "KPR_BWT_" + str _rank;
        [_insigniaClass, true] spawn KPR_fnc_showHint;
    };
    if (KPR_uniforms select _uniformIndex select 1 == 2) exitWith {
        if (_rank != 0) then {
            _insigniaClass = "KPR_USA_" + str _rank;
            [_insigniaClass, true] spawn KPR_fnc_showHint;
        };
    };
    if (KPR_uniforms select _uniformIndex select 1 == 3) exitWith {
        if (_rank != 0) then {
            _insigniaClass = "KPR_CRO_" + str _rank;
            [_insigniaClass, true] spawn KPR_fnc_showHint;
        };
    };
} else {
    ["Uniform not supported"] spawn KPR_fnc_showHint;
};

private _text = format [
    "[KP RANKS] [%1 (%2)] Check Rank - Rank: %3 - Uniform: %4 - Insignia: %5",
    name player,
    getPlayerUID player,
    _rank,
    _uniform,
    _insigniaClass
];
_text remoteExec ["diag_log", 2];

[player, _insigniaClass] call BIS_fnc_setUnitInsignia;

true

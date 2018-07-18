/*
    KPR_fnc_saveUniforms

    File: fn_saveUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-18
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Updates and saves the list of active uniforms in the servers profile namespace.

    Parameter(s):
        0: ARRAY - Array of uniform data arrays, e.g [[classname, faction], [classname, faction], [classname, faction]]

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

params [["_newList", []]];

if (_newList isEqualTo []) then {
    diag_log "[KP RANKS] [SERVER] KPR_fnc_saveUniforms called with no data. Skipping the saving.";
} else {
    diag_log format ["[KP RANKS] [SERVER] KPR_fnc_saveUniforms called with %1 entries.", count _newList];

    KPR_uniforms = +_newList;
    profileNamespace setVariable ["KPR_uniforms", KPR_uniforms];
    saveProfileNamespace;
    publicVariable "KPR_uniforms";
};

true

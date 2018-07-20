/*
    KPR_fnc_sendAceKiller

    File: fn_sendAceKiller.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Sends the value of the "ace_medical_lastDamageSource" variable of an object back to the server.

    Parameter(s):
        0: OBJECT - Object from which the server needs the last damage source

    Returns:
    BOOL
*/

params ["_killed"];

if (local _killed) then {
    KPR_aceKiller = _killed getVariable ["ace_medical_lastDamageSource", _killed];
    if (KPR_levelDebug) then {
        private _text = format ["[KP RANKS] [%1 (%2)] I'm owner of %3 - lastDamageSource was: %4", name player, getPlayerUID player, _killed, KPR_aceKiller];
        _text remoteExecCall ["diag_log", 2];
    };
    publicVariableServer "KPR_aceKiller";
};

true

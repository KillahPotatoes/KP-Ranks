/*
    KPR_fnc_sendAceKiller

    File: fn_sendAceKiller.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
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
    publicVariableServer "KPR_aceKiller";
};

true

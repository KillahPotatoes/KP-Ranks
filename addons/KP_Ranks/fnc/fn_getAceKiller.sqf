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

params ["_killed", "_killer", "_instigator"];

KPR_aceKiller = objNull;

// In ACE, only the owner of the killed object (where it's local) can get the value of this variable, as it's not public
if (local _killed) then {
    KPR_aceKiller = _killed getVariable ["ace_medical_lastDamageSource", _killer];
} else {
    // Ask the owner for the information
    private _owner = owner _killed;
    [_killed] remoteExecCall ["KPR_fnc_sendAceKiller", _killed];
};

// Wait until we have the data, then call the normal entityKilled function with updated data
[{!(KPR_aceKiller isEqualTo objNull)}, {[_this select 0, _this select 1, KPR_aceKiller] call KPR_fnc_entityKilled;}, [_killed, _killer]] call CBA_fnc_waitUntilAndExecute;

true

/*
    KPR_fnc_sendAceKiller

    File: fn_sendAceKiller.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Sends the value of the "ace_medical_lastDamageSource" variable of an object back to the server, if there are possible wrong data provided due to ACE.

    Parameter(s):
        0: OBJECT - Object from which the server needs the last damage source

    Returns:
    BOOL
*/

params ["_killed", "_killer", "_instigator"];

// Only start request/reply method if it seems we have wrong data from the event handler
if (isNull _instigator || _instigator == _killed) then {
    if (KPR_levelDebug) then {diag_log format ["[KP RANKS] [LEVEL] Getting ACE lastDamageSource - _killed: %1 - _instigator: %2", _killed, _instigator];};

    KPR_aceKiller = objNull;

    // Store current tickTime for duration output
    private _start = diag_tickTime;

    // In ACE, only the owner of the killed object (where it's local) can get the value of this variable, as it's not public
    if (local _killed) then {
        KPR_aceKiller = _killed getVariable ["ace_medical_lastDamageSource", _killer];
        if (KPR_levelDebug) then {diag_log format ["[KP RANKS] [LEVEL] %1 is local to server. Instigator is: %2.", _killed, KPR_aceKiller];};
    } else {
        if (KPR_levelDebug) then {diag_log format ["[KP RANKS] [LEVEL] %1 not local to server. Asking owner for data.", _killed];};
        // Ask the owner for the information
        [_killed] remoteExecCall ["KPR_fnc_sendAceKiller", _killed];
    };

    // Wait until we have the data, then call the normal entityKilled function with updated data
    [
        {!(KPR_aceKiller isEqualTo objNull)},
        {
            [_this select 0, _this select 1, KPR_aceKiller] call KPR_fnc_entityKilled;
            if (KPR_levelDebug && !(_this select 2)) then {diag_log format ["[KP RANKS] [LEVEL] Data received in %1ms", diag_tickTime - (_this select 3)];};
        },
        [_killed, _killer, local _killed, _start],
        1,
        {diag_log format ["[KP RANKS] [WARNING] No data received for %1 during the last second, skipping event.", _this select 0];}
    ] call CBA_fnc_waitUntilAndExecute;
} else {
    // Directly move to the usual entity killed handling
    [_killed, _killer, _instigator] call KPR_fnc_entityKilled;
};



true

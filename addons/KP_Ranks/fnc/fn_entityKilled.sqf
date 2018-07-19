/*
    KPR_fnc_entityKilled

    File: fn_entityKilled.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles kills by players to add rewards to their score, if level system is activated.

    Parameter(s):
        0: OBJECT - entity that was killed
        1: OBJECT - the killer (vehicle or person)
        2: OBJECT - person who pulled the trigger

    Returns:
    BOOL
*/

// Leave if the leveling system isn't enabled
if (!KPR_levelSystem) exitWith {};

params ["_killed", "_killer", "_instigator"];

if (KPR_ace) then {
    // TODO: get this variable value from the machine, where the object is local
    _instigator = _killed getVariable ["ace_medical_lastDamageSource", _killer];
} else {
    // Catch UAV operator or driver from roadkills
    if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
    if (isNull _instigator) then {_instigator = _killer};
};

// Don't do something for AI
if !(isPlayer _instigator) exitWith {};

// Exit, if the player is a renegade
if (side _instigator == sideEnemy) exitWith {
    if (KPR_levelDebug) then {
        private _text = format ["[KP RANKS] [LEVEL] Skipping kill of %1 (%2), due to renegade status", name _instigator, getPlayerUID _instigator];
        diag_log _text;
    };
};

// Evaluate kind of reward and corresponding points
private _kind = "Infantry";
private _points = KPR_infPoints;

call {
    if (side group _killed == side group _instigator) exitWith {_kind = "Teamkill"; _points = KPR_tkPenalty * -1;};
    if ([side group _instigator, side group _killed] call BIS_fnc_sideIsFriendly) exitWith {_kind = "Teamkill"; _points = KPR_tkPenalty * -1;};
    if (_killed isKindOf "Car") exitWith {_kind = "Light"; _points = KPR_lvhPoints;};
    if (_killed isKindOf "Tank") exitWith {_kind = "Armored"; _points = KPR_avhPoints;};
    if (_killed isKindOf "Air") exitWith {_kind = "Air"; _points = KPR_airPoints;};
};

// Get some player date
private _playerId = getPlayerUID _instigator;
private _index = KPR_players findIf {_x select 1 == _playerId};
private _score = (KPR_players select _index select 5) + _points;

// No negative points
if (_score < 0) then {
    _score = 0;
};

// Update points of player
KPR_players select _index set [5, _score];

if (KPR_levelDebug) then {
    private _text = format [
        "[KP RANKS] [LEVEL] Player: %1 (%2) - Kind: %2 (%3) - Reward: %4 - Updated Points: %5 - Same Side: %6 - Friendly: %7",
        name _instigator,
        _playerId,
        _kind,
        typeOf _killed,
        _points,
        _score,
        side group _killed == side group _instigator,
        [side group _instigator, side group _killed] call BIS_fnc_sideIsFriendly
    ];
    diag_log _text;
};

// Save updated data
[KPR_players] call KPR_fnc_savePlayers;

true

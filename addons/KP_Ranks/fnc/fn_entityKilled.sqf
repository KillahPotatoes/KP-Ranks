/*
    KPR_fnc_entityKilled

    File: fn_entityKilled.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-08-21
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

params ["_killed", "_killer", "_instigator"];

// Catch UAV operator or driver from roadkills
if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
if (isNull _instigator) then {_instigator = _killer};

// Don't do something for AI
if !(isPlayer _instigator) exitWith {};

// Exit when killed and instigator are identical (otherwise players get additional teamkill penalty for respawn/death)
if (_killed isEqualTo _instigator) exitWith {};

// Exit when unknown, enemy side or ambient life
if (side group _killed == sideUnknown || side group _killed == sideEnemy || side group _killed == sideAmbientLife) exitWith {};

// Evaluate kind of reward and corresponding points
private _kind = "Infantry";
private _points = KPR_infPoints;

[] call {
    if (side group _killed == side group _instigator) exitWith {_kind = "Teamkill"; _points = KPR_tkPenalty * -1;};
    if ([side group _instigator, side group _killed] call BIS_fnc_sideIsFriendly) exitWith {_kind = "Friendkill"; _points = KPR_tkPenalty * -1;};
    if (_killed isKindOf "Car") exitWith {_kind = "Light"; _points = KPR_lvhPoints;};
    if (_killed isKindOf "Tank") exitWith {_kind = "Armored"; _points = KPR_avhPoints;};
    if (_killed isKindOf "Air") exitWith {_kind = "Air"; _points = KPR_airPoints;};
};

// Get player index
private _playerId = getPlayerUID _instigator;
private _index = [_playerId] call KPR_fnc_getPlayerIndex;

// Apply points to player score
[_playerId, _points] call KPR_fnc_addScore;

if (KPR_levelDebug) then {
    diag_log format [
        "[KP RANKS] [LEVEL] Player: %1 (%2) - Kind: %3 (%4) - Reward: %5 - Updated Points: %6 - Same Side: %7 - Friendly: %8",
        name _instigator,
        _playerId,
        _kind,
        typeOf _killed,
        _points,
        KPR_players select _index select 5,
        side group _killed == side group _instigator,
        [side group _instigator, side group _killed] call BIS_fnc_sideIsFriendly
    ];
};

true

/*
    KPR_fnc_savePlayers

    File: fn_savePlayers.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Updates and saves the list of player ranks in the servers profile namespace.

    Parameter(s):
        0: ARRAY - Array of player data arrays, e.g [[Name, Steam UID, Rank, Nation, isAdmin, Score, Playtime], [Name, Steam UID, Rank, Nation, isAdmin, Score, Playtime]]

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

params [["_newList", []]];

// Reinitialize with all current players, if list gets fully deleted
if (_newList isEqualTo []) then {
    {
        _newList pushBack [name _x, getPlayerUID _x, 0, 3, 0, 0, 0];
    } forEach (allPlayers - entities "HeadlessClient_F");
};

KPR_players = +_newList;
KPR_players sort true;
profileNamespace setVariable ["KPR_players", KPR_players];
saveProfileNamespace;
publicVariable "KPR_players";

true

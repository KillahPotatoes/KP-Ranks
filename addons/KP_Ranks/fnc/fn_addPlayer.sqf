/*
    KPR_fnc_addPlayer

    File: fn_addPlayer.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds a player to the player list.

    Parameter(s):
        0: ARRAY - Array of player data, e.g [Steam UID, Name, Rank]

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

params [["_newPlayer",[]]];

diag_log format ["[KP RANKS] [SERVER] KPR_fnc_addPlayer called with: %1", _newPlayer];

KPR_players pushBack _newPlayer;
[KPR_players] call KPR_fnc_savePlayers;

true

/*
    KPR_fnc_playerSaveServer

    File: fn_playerSaveServer.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-14
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Saves all changes in the player list and gives feedback to clients.

    Parameter(s):
        0: ARRAY - KPR_editPlayers array from the client who made changes in the player dialog

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

params [["_edits", []]];

KPR_editsDone = false;

if !(_edits isEqualTo []) then {
    private _index = -1;

    // Handle deletions
    {
        KPR_players deleteAt ([_x] call KPR_fnc_getPlayerIndex);
    } forEach (_edits select 0);

    // Handle edits
    {
        _index = [_x select 1] call KPR_fnc_getPlayerIndex;

        // Skip if the player was marked for deletion after some edits are scheduled on the player
        if (_index != -1) then {
            KPR_players set [_index, +_x];
        };
    } forEach (_edits select 1);
};

[{[KPR_players] call KPR_fnc_savePlayers}, {KPR_editsDone = true; publicvariable "KPR_editsDone";}] call CBA_fnc_waitUntilAndExecute;

true

/*
    KPR_fnc_playerSaveServer

    File: fn_playerSaveServer.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-14
    Last Update: 2018-07-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Saves all changes in the player list and gives feedback to clients.

    Parameter(s):
        0: ARRAY - KPR_editPlayers array from the client who made changes in the player dialog

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

params [["_edits",[]]];

KPR_editsDone = false;

if !(_edits isEqualTo []) then {
    private _uid = "";
    private _index = -1;

    // Handle deletions
    {
        _uid = _x;
        KPR_players deleteAt (KPR_players findIf {_x select 1 == _uid});
    } forEach (_edits select 0);

    // Handle edits
    {
        _uid = _x select 1;
        _index = KPR_players findIf {_x select 1 == _uid};

        if (_index != -1) then {
            KPR_players set [_index, +_x];
        };
    } forEach (_edits select 1);
};

[{[KPR_players] call KPR_fnc_savePlayers}, {KPR_editsDone = true; publicvariable "KPR_editsDone";}] call CBA_fnc_waitUntilAndExecute;

true

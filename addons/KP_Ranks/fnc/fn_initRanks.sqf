/*
    KPR_fnc_initRanks

    File: fn_initRanks.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the mod with the saved data and provide them to the clients.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!isMultiplayer) exitWith {};

if (isServer) then {
    diag_log "[KP RANKS] [SERVER] Initializing KP Ranks...";

    // Load saved or set default uniform list
    KPR_uniforms = profileNamespace getVariable ["KPR_uniforms",[]];

    if (KPR_uniforms isEqualTo []) then {
        diag_log "[KP RANKS] [SERVER] No uniform list on server...";

        // Get default list
        call KPR_fnc_setDefaultUniforms;

        // Save the default list initially on the server
        profileNamespace setVariable ["KPR_uniforms", KPR_uniforms];
        saveProfileNamespace;
    } else {
        diag_log "[KP RANKS] [SERVER] Sending uniform list to clients...";
    };
    // Provide list of uniforms for clients
    publicVariable "KPR_uniforms";

    // Get the servers player list and provide it for clients
    KPR_players = profileNamespace getVariable ["KPR_players",[]];
    if (KPR_players isEqualTo []) then {
        diag_log "[KP RANKS] [SERVER] No player list on server...";
    } else {
        diag_log "[KP RANKS] [SERVER] Sending player list to clients...";
    };
    publicVariable "KPR_players";

    diag_log format ["[KP RANKS] [SERVER] Finished initialization - Listed Players: %1 - Listed Uniforms: %2 - Auto Mode: %3", count KPR_players, count KPR_uniforms, KPR_autoMode];
};

if (hasInterface) then {
    private _text = format ["[KP RANKS] [%1 (%2)] Connected", name player, getPlayerUID player];
    _text remoteExec ["diag_log", 2];

    // Get and set player rank
    private _playerIndex = KPR_players findIf {_x select 0 == getPlayerUID player};
    if (_playerIndex != -1) then {
        player setVariable ["KPR_rank", KPR_players select _playerIndex select 2];
        _text = format ["[KP RANKS] [%1 (%2)] Found in server list with rank: %3", name player, getPlayerUID player, player getVariable ["KPR_rank", 0]];
        _text remoteExec ["diag_log", 2];
    } else {
        player setVariable ["KPR_rank", 0];
        _text = format ["[KP RANKS] [%1 (%2)] Not in server list, adding player to server list.", name player, getPlayerUID player];
        _text remoteExec ["diag_log", 2];
        private _newPlayer = [getPlayerUID player, name player, 0];
        [_newPlayer] remoteExecCall ["KPR_fnc_addPlayer", 2];
    };

    // Check for ACE
    if (isClass (configfile >> "CfgPatches" >> "ace_interact_menu")) then {
        _text = format ["[KP RANKS] [%1 (%2)] ACE detected", name player, getPlayerUID player];
        _text remoteExec ["diag_log", 2];

        // Add self interaction menu entries
        call KPR_fnc_initACE;
    } else {
        // Add vanilla actions and respawn EH
        player addEventHandler ["Respawn", {
            params ["_unit", "_corpse"];
            [_corpse] call KPR_fnc_addActions;
        }];
        call KPR_fnc_addActions;
    };

    _text = format ["[KP RANKS] [%1 (%2)] Initialization finished", name player, getPlayerUID player];
    _text remoteExec ["diag_log", 2];
};

true

/*
    KPR_fnc_playerSave

    File: fn_playerSave.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-13
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Sends all changes in the player list to the server and displays visual feedback to the player.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

KPR_editsDone = false;

[KPR_editPlayers] remoteExecCall ["KPR_fnc_playerSaveServer", 2];
hint localize "STR_KPR_DIALOG_SAVING";

[{KPR_editsDone},
    {
        closedialog 0;
        hint localize "STR_KPR_DIALOG_SAVINGDONE";
        [{hintSilent "";}, [], 2] call CBA_fnc_waitAndExecute;
        [{!dialog}, {[] call KPR_fnc_openDialogPlayers;}] call CBA_fnc_waitUntilAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;

true

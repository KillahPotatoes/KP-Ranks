/*
    KPR_fnc_addActions

    File: fn_addActions.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds actions to the vanilla action menu.

    Parameter(s):
        0: OBJECT - Dead body after a respawn. (default: objNull)

    Returns:
    BOOL
*/

params [["_corpse", objNull]];

if (isNil "KPR_actionIdCheck") then {KPR_actionIdCheck = -1};

// Remove action from dead body of the player
if (!isNull _corpse) then {_corpse removeAction KPR_actionIdCheck;};

KPR_actionIdCheck = player addAction [localize "STR_KPR_ACTION_CHECKRANK", {[true] call KPR_fnc_applyRank;}, nil, -1200, false, true, "", "!KPR_autoMode"];
KPR_actionIdPlayers = player addAction ["Player Management", {[] spawn KPR_fnc_openDialogPlayers;}, nil, -1201, false, true];

true

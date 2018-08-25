/*
    KPR_fnc_addActions

    File: fn_addActions.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-08-21
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
if (isNil "KPR_actionIdPlayers") then {KPR_actionIdPlayers = -1};
if (isNil "KPR_actionIdUniforms") then {KPR_actionIdUniforms = -1};

// Remove action from dead body of the player
if (!isNull _corpse) then {
    _corpse removeAction KPR_actionIdCheck;
    _corpse removeAction KPR_actionIdPlayers;
    _corpse removeAction KPR_actionIdUniforms;
};

KPR_actionIdCheck = player addAction [localize "STR_KPR_ACTION_CHECKRANK", {[true] call KPR_fnc_applyRank;}, nil, -1200, false, true, "", "!KPR_autoMode || KPR_levelSystem"];
KPR_actionIdPlayers = player addAction [localize "STR_KPR_ACTION_PLAYERMANAGE", {[] call KPR_fnc_openDialogPlayers;}, nil, -1201, false, true, "", "KPR_isAdmin"];
KPR_actionIdUniforms = player addAction [localize "STR_KPR_ACTION_UNIFORMMANAGE", {[] call KPR_fnc_openDialogUniforms;}, nil, -1201, false, true, "", "KPR_isAdmin"];

true

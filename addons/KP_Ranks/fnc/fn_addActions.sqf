/*
    KPR_fnc_addActions

    File: fn_addActions.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds actions to the vanilla action menu.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (isNil "KPR_actionIdCheck") then {KPR_actionIdCheck = -1};

if (KPR_actionIdCheck != -1) then {player removeAction KPR_actionIdCheck;};

KPR_actionIdCheck = player addAction ["Check Rank", {[true] call KPR_fnc_applyRank;}, nil, -1200, false, true, "", "!KPR_autoMode"];

true

/*
    KPR_fnc_initACE

    File: fn_initACE.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the ACE Selfinteractions for KP Ranks, if ACE is loaded.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

private _action = ["KPR_Check", "Check Rank", "\KP_Ranks\kplogo_ca.paa", {[true] call KPR_fnc_applyRank;}, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

true

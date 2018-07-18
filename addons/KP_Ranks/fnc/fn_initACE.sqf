/*
    KPR_fnc_initACE

    File: fn_initACE.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the ACE Selfinteractions for KP Ranks, if ACE is loaded.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Action to check rank and update insignia on the current uniform
private _action = ["KPR_Check", localize "STR_KPR_ACTION_CHECKRANK", "\KP_Ranks\kplogo_ca.paa", {[true] call KPR_fnc_applyRank;}, {!KPR_autoMode}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

// KP Ranks administration category for self interactions
private _action = ["KPR_Admin", "Ranks Admin", "\KP_Ranks\kplogo_ca.paa", {}, {KPR_isAdmin}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Action to open the player management dialog
private _action = ["KPR_PlayerManage", localize "STR_KPR_ACTION_PLAYERMANAGE", "", {call KPR_fnc_openDialogPlayers;}, {KPR_isAdmin}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "KPR_Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

// Action to open the uniform management dialog
private _action = ["KPR_UniformManage", localize "STR_KPR_ACTION_UNIFORMMANAGE", "", {call KPR_fnc_openDialogUniforms;}, {KPR_isAdmin}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "KPR_Admin"], _action] call ace_interact_menu_fnc_addActionToClass;

true

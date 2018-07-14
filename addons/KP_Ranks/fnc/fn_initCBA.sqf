/*
    KPR_fnc_initCBA

    File: fn_initCBA.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the CBA Settings for KP Ranks.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

[
    "KPR_autoMode",
    "CHECKBOX",
    [localize "STR_KPR_CBA_AUTOENABLE", localize "STR_KPR_CBA_AUTOENABLEDESC"],
    "KP Ranks",
    false,
    true,
    {
        if (KPR_autoMode) then {
            call KPR_fnc_autoLoop;
        };
    }
] call CBA_Settings_fnc_init;

[
    "KPR_autoModeInterval",
    "SLIDER",
    [localize "STR_KPR_CBA_AUTOINTERVAL", localize "STR_KPR_CBA_AUTOINTERVALDESC"],
    "KP Ranks",
    [1, 60, 5, 0],
    true
] call CBA_Settings_fnc_init;

[
    "KPR_playerNation",
    "CHECKBOX",
    [localize "STR_KPR_CBA_PLAYERNATION", localize "STR_KPR_CBA_PLAYERNATIONDESC"],
    "KP Ranks",
    false,
    true
] call CBA_Settings_fnc_init;

[
    "KPR_extendedLog",
    "CHECKBOX",
    [localize "STR_KPR_CBA_EXTLOG", localize "STR_KPR_CBA_EXTLOGDESC"],
    "KP Ranks",
    true,
    true
] call CBA_Settings_fnc_init;

if (isServer) then {
    diag_log "[KP RANKS] [SERVER] CBA Settings loaded";
};

true

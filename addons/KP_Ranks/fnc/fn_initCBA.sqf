/*
    KPR_fnc_initCBA

    File: fn_initCBA.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the CBA Settings for KP Ranks.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Auto Mode checkbox
[
    "KPR_autoMode",
    "CHECKBOX",
    [localize "STR_KPR_CBA_AUTOENABLE", localize "STR_KPR_CBA_AUTOENABLEDESC"],
    "KP Ranks",
    false,
    true
] call CBA_Settings_fnc_init;

// Auto Mode interval slider
[
    "KPR_autoModeInterval",
    "SLIDER",
    [localize "STR_KPR_CBA_AUTOINTERVAL", localize "STR_KPR_CBA_AUTOINTERVALDESC"],
    "KP Ranks",
    [1, 60, 5, 0],
    true
] call CBA_Settings_fnc_init;

// Nation via player or uniform checkbox
[
    "KPR_playerNation",
    "CHECKBOX",
    [localize "STR_KPR_CBA_PLAYERNATION", localize "STR_KPR_CBA_PLAYERNATIONDESC"],
    "KP Ranks",
    true,
    true
] call CBA_Settings_fnc_init;

// Extended server log output checkbox
[
    "KPR_extendedLog",
    "CHECKBOX",
    [localize "STR_KPR_CBA_EXTLOG", localize "STR_KPR_CBA_EXTLOGDESC"],
    "KP Ranks",
    false,
    true
] call CBA_Settings_fnc_init;

// Leveling system enable checkbox
[
    "KPR_levelSystem",
    "CHECKBOX",
    [localize "STR_KPR_CBA_LEVELENB", localize "STR_KPR_CBA_LEVELENBDESC"],
    "KP Ranks Leveling System",
    false,
    true
] call CBA_Settings_fnc_init;

// Interval for the score update check
[
    "KPR_updateInterval",
    "SLIDER",
    [localize "STR_KPR_CBA_UPDATEINT", localize "STR_KPR_CBA_UPDATEINTDESC"],
    ["KP Ranks Leveling System"],
    [1, 60, 1, 0],
    true
] call CBA_Settings_fnc_init;

// Should other players get a notification via system chat if a player was promoted/degraded
[
    "KPR_levelAnnounce",
    "CHECKBOX",
    [localize "STR_KPR_CBA_LEVELANNOUNCE", localize "STR_KPR_CBA_LEVELANNOUNCEDESC"],
    "KP Ranks Leveling System",
    true,
    true
] call CBA_Settings_fnc_init;

// Debug server log output for the leveling system checkbox
[
    "KPR_levelDebug",
    "CHECKBOX",
    [localize "STR_KPR_CBA_LEVELDEBUG", localize "STR_KPR_CBA_LEVELDEBUGDESC"],
    "KP Ranks Leveling System",
    false,
    true
] call CBA_Settings_fnc_init;

// Points for infantry kill
[
    "KPR_infPoints",
    "SLIDER",
    [localize "STR_KPR_CBA_INF", localize "STR_KPR_CBA_INFDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 4, 0],
    true
] call CBA_Settings_fnc_init;

// Points for destroyed light vehicle
[
    "KPR_lvhPoints",
    "SLIDER",
    [localize "STR_KPR_CBA_LVH", localize "STR_KPR_CBA_LVHDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 8, 0],
    true
] call CBA_Settings_fnc_init;

// Points for destroyed heavy vehicle
[
    "KPR_avhPoints",
    "SLIDER",
    [localize "STR_KPR_CBA_AVH", localize "STR_KPR_CBA_AVHDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 12, 0],
    true
] call CBA_Settings_fnc_init;

// Points for destroyed air vehicle
[
    "KPR_airPoints",
    "SLIDER",
    [localize "STR_KPR_CBA_AIR", localize "STR_KPR_CBA_AIRDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 32, 0],
    true
] call CBA_Settings_fnc_init;

// Playtime in minutes needed to trigger points reward
[
    "KPR_playtime",
    "SLIDER",
    [localize "STR_KPR_CBA_PLAYTIME", localize "STR_KPR_CBA_PLAYTIMEDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [KPR_updateInterval + 1, 10080, 60, 0],
    true
] call CBA_Settings_fnc_init;

// Points for playtime
[
    "KPR_playPoints",
    "SLIDER",
    [localize "STR_KPR_CBA_PLAYPOINTS", localize "STR_KPR_CBA_PLAYPOINTSDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 24, 0],
    true
] call CBA_Settings_fnc_init;

// Teamkill penalty
[
    "KPR_tkPenalty",
    "SLIDER",
    [localize "STR_KPR_CBA_TEAMKILL", localize "STR_KPR_CBA_TEAMKILLDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 24, 0],
    true
] call CBA_Settings_fnc_init;

// Death penalty
[
    "KPR_killedPenalty",
    "SLIDER",
    [localize "STR_KPR_CBA_DEATH", localize "STR_KPR_CBA_DEATHDESC"],
    ["KP Ranks Leveling System", localize "STR_KPR_CBA_SCORING"],
    [1, 100000, 8, 0],
    true
] call CBA_Settings_fnc_init;

// Needed points for each rank
for "_i" from 1 to 19 do {
    [
        "KPR_rank" + str _i,
        "SLIDER",
        [(localize "STR_KPR_CBA_RANKREQ") + " " + str _i, localize "STR_KPR_CBA_RANKREQDESC"],
        ["KP Ranks Leveling System", localize "STR_KPR_CBA_REQUIREMENTS"],
        [1, 1000000, (_i * _i * 80), 0],
        true
    ] call CBA_Settings_fnc_init;
};

if (isServer) then {
    diag_log "[KP RANKS] [SERVER] CBA Settings loaded";
};

true

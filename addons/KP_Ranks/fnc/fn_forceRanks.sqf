/*
    KPR_fnc_forceRanks

    File: fn_forceRanks.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This is just a dummy function for the provided "Force KP Ranks" module which displays a message in the log.
    If the module is placed in the mission it'll create a dependency to this mod inside the mission.
    This way it can be ensured that every player loads the mod.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

diag_log "[KP RANKS] [SERVER] Usage of KP Ranks is forced in this mission.";

true

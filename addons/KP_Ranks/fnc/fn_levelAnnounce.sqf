/*
    KPR_fnc_levelAnnounce

    File: fn_levelAnnounce.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-19
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Outputs a promotion or degradation of a player in the system chat.

    Parameter(s):
        0: BOOL - True for promotion, false for degradation.
        1: STRING - Name of the player who was promoted/degraded.

    Returns:
    BOOL
*/

params ["_promotion", "_name"];

if (_promotion) then {
    systemChat format [localize "STR_KPR_PLAYER_PROMOTED", _name];
} else {
    systemChat format [localize "STR_KPR_PLAYER_DEGRADED", _name];
};

true

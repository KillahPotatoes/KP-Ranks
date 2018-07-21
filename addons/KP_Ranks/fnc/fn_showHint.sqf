/*
    KPR_fnc_showHint

    File: fn_showHint.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Shows the given string as hint for 3 seconds. Structured text is supported.

    Parameter(s):
        0: STRING - Text to display as hint.
        1: STRING - OPTIONAL - Insignia texture path (default: "")

    Returns:
    BOOL
*/

params [["_text", ""], ["_insignia", ""]];

if (_text != "") then {
    // If no insignia texture path is provided, display just the text as hint
    if (_insignia != "") then {
        // Add points count, if levelsystem is active
        if (KPR_levelSystem) then {
            // Get needed points for next rank and current points of the player
            private _index = KPR_players findIf {_x select 1 == getPlayerUID player};
            private _points = KPR_players select _index select 5;
            private _neededPoints = missionNamespace getVariable ("KPR_rank" + str ((KPR_players select _index select 2) + 1));
            _text = format ["%1<br /><br /><img size='4' image='%2' /><br /><br />%3 / %4", _text, _insignia, _points, _neededPoints];
        } else {
            _text = format ["%1<br /><br /><img size='4' image='%2' />", _text, _insignia];
        };
        hint parseText _text;
    } else {
        hint _text;
    };
    [{hintSilent "";}, [], 4] call CBA_fnc_waitAndExecute;
};

true

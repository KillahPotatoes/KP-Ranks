/*
    KPR_fnc_showHint

    File: fn_showHint.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-08-21
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
        // Display score additionally, if levelsystem is active
        if (KPR_levelSystem) then {
            // Get needed score for next rank and current score of the player
            private _uid = getPlayerUID player;
            private _score = [_uid] call KPR_fnc_getScore;
            private _neededScore = missionNamespace getVariable ("KPR_rank" + str (([_uid] call KPR_fnc_getRank) + 1));
            _text = format ["%1<br /><br /><img size='4' image='%2' /><br /><br />%3 / %4", _text, _insignia, _score, _neededScore];
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

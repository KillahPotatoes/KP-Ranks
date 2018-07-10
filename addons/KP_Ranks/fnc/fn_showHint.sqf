/*
    KPR_fnc_showHint

    File: fn_showHint.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Shows the given string as hint for 3 seconds. Structured text is supported.

    Parameter(s):
        0: STRING - Text to display as hint.
        1: STRING - OPTIONAL - Insignia texture path (default: "")

    Returns:
    NOTHING
*/

params [["_text", ""], ["_insignia", ""]];

if (_text != "") then {
    if (_insignia != "") then {
        _text = format ["%1<br /><br /><img size='4' image='%2' />", _text, _insignia];
        hint parseText _text;
    } else {
        hint _text;
    };
    uiSleep 5;
    hintSilent "";
};

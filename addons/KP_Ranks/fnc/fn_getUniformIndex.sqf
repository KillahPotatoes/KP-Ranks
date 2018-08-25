/*
    KPR_fnc_getUniformIndex

    File: fn_getUniformIndex.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-21
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Returns the index from the KPR_uniforms array if activated. Otherwise -1.

    Parameter(s):
        0: STRING - uniform classname (default: classname of current player uniform)

    Returns:
    NUMBER
*/

params [["_uniform", uniform player]];

KPR_uniforms findIf {_x select 0 == _uniform}

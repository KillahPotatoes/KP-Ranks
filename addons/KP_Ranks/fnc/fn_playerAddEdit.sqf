/*
    KPR_fnc_playerAddEdit

    File: fn_playerAddEdit.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-13
    Last Update: 2018-08-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Stores edits for the saving process of the player list, if the save button is clicked in the dialog.

    Parameter(s):
        0: STRING - Kind of edit which should be done
        1: ARRAY - Values for the edit, first value is always the player UID

    Returns:
    BOOL
*/

params ["_kind", "_values"];

// Colors for ActiveText change
private _colorGood = [0, 0.8, 0, 1];
private _colorBad = [0.8, 0, 0, 1];

private _index = -1;
// Index in edits array, if at least one entry is added
if !((KPR_editPlayers select 1) isEqualTo []) then {
    _index = KPR_editPlayers select 1 findIf {_x select 1 == _values select 0};
};

// If first edit, get current data
if (_index == -1 && _kind != "delete") then {
    _index = KPR_editPlayers select 1 pushBack +(KPR_players select ([_values select 0] call KPR_fnc_getPlayerIndex));
};

// Change ActiveText control in dialog
if (_kind == "admin" || _kind == "delete") then {
    if (ctrlText (_values select 1) == localize "STR_KPR_DIALOG_YES") then {
        (_values select 1) ctrlSetText localize "STR_KPR_DIALOG_NO";
        (_values select 1) ctrlSetTextColor _colorBad;
    } else {
        (_values select 1) ctrlSetText localize "STR_KPR_DIALOG_YES";
        (_values select 1) ctrlSetTextColor _colorGood;
    };
};

// Process desired edit
switch (_kind) do {
    case "admin": {
        // Switch admin attribute
        private _current = KPR_editPlayers select 1 select _index select 4;
        KPR_editPlayers select 1 select _index set [4, (_current + 1) % 2];
    };
    case "delete": {
        // Add or remove from the delete list
        if ((_values select 0) in (KPR_editPlayers select 0)) then {
            (KPR_editPlayers select 0) deleteAt ((KPR_editPlayers select 0) findIf {_x == _values select 0});
        } else {
            (KPR_editPlayers select 0) pushBack (_values select 0);
        };
    };
    case "nation": {
        // Update player nation
        KPR_editPlayers select 1 select _index set [3, _values select 1];
    };
    case "rank": {
        // update player rank
        KPR_editPlayers select 1 select _index set [2, _values select 1];
    };
};

true

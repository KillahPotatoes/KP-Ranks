/*
    KPR_fnc_openDialogPlayers

    File: fn_openDialogPlayers.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the player management dialog and creates the dialog controls for each player.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Open dialog and disable serialization, so local variables can store displays and controls
createDialog "KPR_playerList";
disableSerialization;

private _contentWidth = safeZoneW * (0.5 - 2 * 0.002);
private _colorGood = [0, 0.8, 0, 1];
private _colorBad = [0.8, 0, 0, 1];

private _dialog = findDisplay 7580821;
private _ctrlsGrpIdc = 75801;
private _ctrlsGrp = _dialog displayCtrl _ctrlsGrpIdc;

private _ctrl = controlNull;

// Create player rows
{
    // Different background for every second row
    if ((_forEachIndex + 1) % 2 == 0) then {
        _ctrl = _dialog ctrlCreate ["KP_Text", -1, _ctrlsGrp];
        _ctrl ctrlSetPosition [0, safeZoneH * 0.04 * (_forEachIndex + 1), _contentWidth, safeZoneH * 0.04];
        _ctrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
        _ctrl ctrlCommit 0;
    };

    // Name
    _ctrl = _dialog ctrlCreate ["KP_Text", 10 + 10 * _forEachIndex, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.01, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.08, safeZoneH * 0.02];
    _ctrl ctrlSetText (_x select 0);
    if (KPR_levelSystem) then {
        // Tooltip with current points if level system is enabled
        _ctrl ctrlSetTooltip format [(localize "STR_KPR_SCORE") + ": %1\n%2", _x select 5, [_x select 1] call KPR_fnc_getPlaytime];
    } else {
        // Otherwise just the playtime
        _ctrl ctrlSetTooltip ([_x select 1] call KPR_fnc_getPlaytime);
    };
    _ctrl ctrlCommit 0;

    // KPR Admin
    _ctrl = _dialog ctrlCreate ["KP_ActiveText", 10 + 10 * _forEachIndex + 1, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.11, safeZoneH * (0.008 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.08, safeZoneH * 0.02];
    if (_x select 4 == 1) then {
        _ctrl ctrlSetText localize "STR_KPR_DIALOG_YES";
        _ctrl ctrlSetTextColor _colorGood;
    } else {
        _ctrl ctrlSetText localize "STR_KPR_DIALOG_NO";
        _ctrl ctrlSetTextColor _colorBad;
    };
    _ctrl ctrlSetTooltip localize "STR_KPR_DIALOG_ADMINDESC";
    _ctrl ctrlAddEventHandler ["ButtonClick", format ["['admin', ['%1', _this select 0]] call KPR_fnc_playerAddEdit", _x select 1]];
    _ctrl ctrlCommit 0;

    // Current rank
    _ctrl = _dialog ctrlCreate ["KP_XListBox", 10 + 10 * _forEachIndex + 2, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.215, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.07, safeZoneH * 0.025];
    for "_i" from 0 to 19 do {
        _ctrl lbAdd (str _i);
    };
    _ctrl lbSetCurSel (_x select 2);
    if (KPR_levelSystem) then {
        // Disable control, when level system is enabled
        _ctrl ctrlEnable false;
        _ctrl ctrlSetTooltip localize "STR_KPR_DIALOG_RANKDISABLEDTT";
    } else {
        _ctrl ctrlAddEventHandler ["LBSelChanged", format ["['rank', ['%1', _this select 1]] call KPR_fnc_playerAddEdit", _x select 1]];
    };
    _ctrl ctrlCommit 0;

    // Rank nation
    _ctrl = _dialog ctrlCreate ["KP_Combo", 10 + 10 * _forEachIndex + 3, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.31, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.08, safeZoneH * 0.025];
    _ctrl lbAdd localize "STR_KPR_DIALOG_BWF";
    _ctrl lbAdd localize "STR_KPR_DIALOG_BWT";
    _ctrl lbAdd localize "STR_KPR_DIALOG_CRO";
    _ctrl lbAdd localize "STR_KPR_DIALOG_USA";
    _ctrl lbSetCurSel (_x select 3);
    _ctrl ctrlAddEventHandler ["LBSelChanged", format ["['nation', ['%1', _this select 1]] call KPR_fnc_playerAddEdit", _x select 1]];
    _ctrl ctrlCommit 0;

    if (!KPR_playerNation) then {
        // Disable control, when nation is set by uniform
        _ctrl ctrlEnable false;
    };

    // Mark for deletion
    _ctrl = _dialog ctrlCreate ["KP_ActiveText", 10 + 10 * _forEachIndex + 4, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.41, safeZoneH * (0.008 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.08, safeZoneH * 0.02];
    _ctrl ctrlSetText localize "STR_KPR_DIALOG_NO";
    _ctrl ctrlSetTooltip localize "STR_KPR_DIALOG_DELDESC";
    _ctrl ctrlSetTextColor _colorBad;
    _ctrl ctrlAddEventHandler ["ButtonClick", format ["['delete', ['%1', _this select 0]] call KPR_fnc_playerAddEdit", _x select 1]];
    _ctrl ctrlCommit 0;

    // Deactivate import button, if no exported data is saved in the players profile
    if (profileNamespace getVariable ["KPR_pClipboard", []] isEqualTo []) then {
        _dialog displayCtrl 75802 ctrlEnable false;
    } else {
        _dialog displayCtrl 75802 ctrlEnable true;
    };
} forEach KPR_players;

true

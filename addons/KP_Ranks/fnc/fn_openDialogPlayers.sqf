/*
    KPR_fnc_openDialogPlayers

    File: fn_openDialogPlayers.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the player management dialog and handles the user inputs.

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

// Open dialog and disable serialization, so local variables can store displays and controls
createDialog "KPR_playerList";
disableSerialization;
waitUntil {dialog};

KPR_playerWipe = 0;
KPR_playerExport = 0;
KPR_playerImport = 0;
KPR_playerSave = 0;

private _contentWidth = safeZoneW * (0.5 - 2 * 0.002);

private _dialog = findDisplay 7580821;
private _ctrlsGrpIdc = 1;
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
    _ctrl ctrlSetText (_x select 1);
    _ctrl ctrlCommit 0;

    // KPR Admin
    _ctrl = _dialog ctrlCreate ["KP_ActiveText", 10 + 10 * _forEachIndex + 1, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.1, safeZoneH * (0.008 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.1, safeZoneH * 0.02];
    if (_x select 0 in KPR_admins) then {
        _ctrl ctrlSetText "Yes";
        _ctrl ctrlSetTextColor [0, 0.8, 0, 1];
    } else {
        _ctrl ctrlSetText "No";
        _ctrl ctrlSetTextColor [0.8, 0, 0, 1];
    };
    _ctrl ctrlCommit 0;

    // Current rank
    _ctrl = _dialog ctrlCreate ["KP_Combo", 10 + 10 * _forEachIndex + 2, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.225, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.05, safeZoneH * 0.025];
    for "_i" from 1 to 20 do {
        _ctrl lbAdd (str _i);
    };
    _ctrl lbSetCurSel 0;
    _ctrl ctrlCommit 0;

    // Rank nation
    _ctrl = _dialog ctrlCreate ["KP_Combo", 10 + 10 * _forEachIndex + 3, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.325, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.05, safeZoneH * 0.025];
    _ctrl lbAdd "BWF";
    _ctrl lbAdd "BWT";
    _ctrl lbAdd "CRO";
    _ctrl lbAdd "USA";
    _ctrl lbSetCurSel 0;
    _ctrl ctrlCommit 0;

    if (!KPR_playerNation) then {
        _ctrl ctrlEnable false;
    };

    // Delete Button
    _ctrl = _dialog ctrlCreate ["KP_ShortcutButton", -1, _ctrlsGrp];
    _ctrl ctrlSetPosition [safeZoneW * 0.425, safeZoneH * (0.0075 + 0.04 * (_forEachIndex + 1)), safeZoneW * 0.05, safeZoneH * 0.025];
    _ctrl ctrlSetText "Delete";
    _ctrl buttonSetAction format ["hint 'Delete %1 with ID %2'", _x select 1, _forEachIndex];
    _ctrl ctrlCommit 0;
} forEach KPR_players;

while {dialog} do {
    waitUntil {
        !dialog || !(alive player) || KPR_playerWipe == 1 || KPR_playerExport == 1 || KPR_playerImport == 1 || KPR_playerSave == 1
    };

    if (KPR_playerWipe == 1) then {
        hint "Wipe";
        KPR_playerWipe = 0;
    };

    if (KPR_playerExport == 1) then {
        hint "Export";
        KPR_playerExport = 0;
    };

    if (KPR_playerImport == 1) then {
        hint "Import";
        KPR_playerImport = 0;
    };

    if (KPR_playerSave == 1) then {
        hint "Save";
        KPR_playerSave = 0;
    };
};





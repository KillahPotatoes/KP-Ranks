waitUntil {sleep 1; KP_Ranks_init_done};

if (isNil "KP_Ranks_enable") exitWith {KP_Ranks_check = false; diag_log "[KP RANKS] Automatic insignia assignment not enabled";};
if (KP_Ranks_enable == false) exitWith {KP_Ranks_check = false; diag_log "[KP RANKS] Automatic insignia assignment not enabled";};

KP_Ranks_check = true;

private ["_rank", "_faction", "_uniform", "_insigniaClass"];

_rank = 0;
_faction = "";
_uniform = "";
_insigniaClass = "";

diag_log "[KP RANKS] Automatic insignia assignment enabled";

while {true} do {
	hint "";
	if ((player getVariable "KP_Ranks_rank") != _rank || (uniform player) != _uniform) then {
		_rank = player getVariable "KP_Ranks_rank";
		_uniform = uniform player;

		{
			if (_uniform == (_x select 0)) exitWith {
				switch (_x select 1) do {
					case 1: {
						_faction = "KP_Ranks_BWT_";
						_insigniaClass = _faction + str _rank;					
					};
					case 2: {
						_faction = "KP_Ranks_USA_";
						switch (_rank) do {
							case 1: {_insigniaClass = _faction + str _rank;};
							case 2;
							case 3: {_insigniaClass = _faction + "2";};
							case 4;
							case 5: {_insigniaClass = _faction + "4";};
							case 6;
							case 7: {_insigniaClass = _faction + "6";};
							case 8;
							case 9: {_insigniaClass = _faction + "8";};
							case 10: {_insigniaClass = _faction + str _rank;};
							case 11: {_insigniaClass = _faction + str _rank;};
							case 12: {_insigniaClass = _faction + str _rank;};
							case 13: {_insigniaClass = _faction + str _rank;};
							case 14: {_insigniaClass = _faction + str _rank;};
							case 15;
							case 16: {_insigniaClass = _faction + "15";};
							case 17: {_insigniaClass = _faction + str _rank;};
							case 18: {_insigniaClass = _faction + str _rank;};
							case 19: {_insigniaClass = _faction + str _rank;};
							default {_insigniaClass = ""};
						};
					};
					case 3: {
						_faction = "KP_Ranks_CRO_";
						switch (_rank) do {
							case 1;
							case 2: {_insigniaClass = _faction + "1"};
							case 3;
							case 4;
							case 5: {_insigniaClass = _faction + "3"};
							case 6: {_insigniaClass = _faction + str _rank;};
							case 7: {_insigniaClass = _faction + str _rank;};
							case 8: {_insigniaClass = _faction + str _rank;};
							case 9: {_insigniaClass = _faction + str _rank;};
							case 10: {_insigniaClass = _faction + str _rank;};
							case 11;
							case 12: {_insigniaClass = _faction + "11";};
							case 13: {_insigniaClass = _faction + str _rank;};
							case 14: {_insigniaClass = _faction + str _rank;};
							case 15;
							case 16: {_insigniaClass = _faction + "15";};
							case 17: {_insigniaClass = _faction + str _rank;};
							case 18: {_insigniaClass = _faction + str _rank;};
							case 19: {_insigniaClass = _faction + str _rank;};
							default {_insigniaClass = ""};
						};
					};
					default {
						_faction = "KP_Ranks_BWF_";
						_insigniaClass = _faction + str _rank;
					};
				};
			};
		} forEach KP_Ranks_uniforms;
	};

	[player, _insigniaClass] call BIS_fnc_setUnitInsignia;

	waitUntil {uiSleep 5;
		(((([player] call BIS_fnc_getUnitInsignia) != _insigniaClass) || ((player getVariable "KP_Ranks_rank") != _rank)) && ((uniform player) in KP_Ranks_uniform_classnames))
	};
};

KP_Ranks_check = false;
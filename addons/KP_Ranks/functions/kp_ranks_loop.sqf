KP_Ranks_check = true;

while {true} do {
	if (!isNil "KP_Ranks_playerUniform") then {
		if (uniform player != KP_Ranks_playerUniform || !isNull (uinamespace getvariable "RSCDisplayArsenal")) then {
			// Place texture on uniform
			KP_Ranks_playerUniform = uniform player;
			{
				if (KP_Ranks_playerUniform == _x select 0 && (player isKindOf "B_Soldier_base_F" || player isKindOf "I_Soldier_base_F")) then {
					switch (_x select 1) do {
						case 1: {KP_Ranks_faction = "\KP_Ranks\ranks\brown\"};
						case 2: {KP_Ranks_faction = "\KP_Ranks\ranks\us\"};
						default {KP_Ranks_faction = "\KP_Ranks\ranks\green\"};
					}; 
					
					if (!(_x select 1 == 2 && player getVariable "KP_Ranks_rank" == 0)) then {
						player setObjectTextureGlobal [1, KP_Ranks_faction + KP_Ranks_patch];
					};
				};
			} forEach KP_Ranks_uniforms;
		};
	};
	
	uisleep 5;
};

KP_Ranks_check = false;
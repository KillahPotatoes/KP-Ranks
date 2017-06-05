KP_Ranks_check = true;
waitUntil {KP_Ranks_init_done};

while {true} do {
	waitUntil {sleep 3;
		(((((getObjectTextures player) select 1) find "kpd" + (str (player getVariable "KP_Ranks_rank")) + "_ca.paa") == -1) && ((uniform player) in KP_Ranks_uniform_classnames))
	};
	KP_ranks_patch = "kpd" + (str (player getVariable "KP_Ranks_rank")) + "_ca.paa";
	{
		if (((uniform player) == (_x select 0)) && ((player isKindOf "B_Soldier_base_F") || (player isKindOf "I_Soldier_base_F"))) then {
			switch (_x select 1) do {
				case 1: {KP_Ranks_faction = "\KP_Ranks\ranks\brown\"};
				case 2: {KP_Ranks_faction = "\KP_Ranks\ranks\us\"};
				default {KP_Ranks_faction = "\KP_Ranks\ranks\green\"};
			};
			
			if !(((_x select 1) == 2) && ((player getVariable "KP_Ranks_rank") == 0)) then {
				player setObjectTextureGlobal [1, KP_Ranks_faction + KP_Ranks_patch];
			};
		};
	} forEach KP_Ranks_uniforms;
};

KP_Ranks_check = false;
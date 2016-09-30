if (isDedicated) then {
	// Get userconfig from dedicated server
	call compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_loadServerconfig.sqf";
} else {
	// If local player, compile init function
	KP_Ranks_init = compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_init.sqf";
	
	// Compile loop function
	KP_Ranks_loop = compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_loop.sqf";
	
	// Initialize KP Ranks
	[] spawn KP_Ranks_init;
	
	// Start the loop
	[] spawn KP_Ranks_loop;
	
	// Reinitialize after respawn
	player addEventHandler ["Respawn", {
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
	}];
	
};
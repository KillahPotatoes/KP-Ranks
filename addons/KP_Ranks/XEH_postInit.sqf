if (isDedicated) then {
	// Get userconfig from dedicated server
	call compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_loadServerconfig.sqf";
} else {
	// If local player, compile init function
	KP_Ranks_init = compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_init.sqf";
	
	// Compile loop function
	KP_Ranks_loop = compile preprocessFileLineNumbers "\KP_Ranks\functions\kp_ranks_loop.sqf";
	
	if ((side player) != sideLogic) then {
		// Initialize KP Ranks
		KP_Ranks_init_done = false;
		[] spawn KP_Ranks_init;
		
		// Start the loop
		[] spawn KP_Ranks_loop;
	};	
};
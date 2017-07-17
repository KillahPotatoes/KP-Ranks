waitUntil {!isNull player};
waitUntil {sleep 1; alive player};

diag_log "[KP RANKS] Initialising...";

// If unit not listed on the server or has no init entry, set it to lowest rank
if ((player getVariable ["KP_Ranks_rank", 0]) == 0) then {
	player setVariable ["KP_Ranks_rank", 0];
};

if (!isNil "KP_Ranks_list") then {
	diag_log "[KP RANKS] Server ranks list found";
	{
		if ( (getPlayerUID player) isEqualTo (_x select 0) ) then {
			player setVariable ["KP_Ranks_rank", (_x select 1)];
		};
	} forEach KP_Ranks_list;
} else {
	diag_log "[KP RANKS] No server ranks list found";
};

// If no serverconfig available for the uniforms, use the standard list
if (isNil "KP_Ranks_uniforms") then {
	diag_log "[KP RANKS] No server uniform list found";
	KP_Ranks_uniforms = [
		["BWA3_Uniform2_Fleck", 0],
		["BWA3_Uniform2_Tropen", 1],
		["BWA3_Uniform2_idz_Fleck", 0],
		["BWA3_Uniform2_idz_Tropen", 1],
		["BWA3_Uniform3_idz_Fleck", 0],
		["BWA3_Uniform3_idz_Tropen", 1],
		["BWA3_Uniform_Fleck", 0],
		["BWA3_Uniform_Tropen", 1],
		["BWA3_Uniform_idz_Fleck", 0],
		["BWA3_Uniform_idz_Tropen", 1],
		["IP_U_B_CombatUniform_light_KSK_Tropic", 0],
		["IP_U_B_CombatUniform_light_KSK_Tropic_shortsleeve", 0],
		["IP_U_B_ReconUniform_KSK_Tropic", 0],
		["IP_U_B_ReconUniform_Rolled_KSK_Tropic", 0],
		["U_B_CTRG_1", 2],
		["U_B_CTRG_2", 2],
		["U_B_CTRG_3", 2],
		["U_B_CTRG_Soldier_F", 2],
		["U_B_CTRG_Soldier_3_F", 2],
		["U_B_CTRG_Soldier_urb_1_F", 2],
		["U_B_CTRG_Soldier_urb_3_F", 2],
		["U_B_CombatUniform_mcam", 2],
		["U_B_CombatUniform_mcam_tshirt", 2],
		["U_B_CombatUniform_mcam_vest", 2],
		["U_B_CombatUniform_mcam_worn", 2],
		["U_B_HeliPilotCoveralls", 2],
		["U_B_T_Soldier_F", 2],
		["U_B_T_Soldier_SL_F", 2],
		["U_I_CombatUniform", 2],
		["U_I_CombatUniform_shortsleeve", 2],
		["U_I_HeliPilotCoveralls", 2],
		["U_I_pilotCoveralls", 2],
		["U_DMan_CA_CombatUniform_Des", 3],
		["U_DMan_CA_CombatUniform_Des_vest", 3],
		["U_DMan_CA_CombatUniform_Des_tshirt", 3],
		["U_DMan_CA_CombatUniform_Wdl", 3],
		["U_DMan_CA_CombatUniform_Wdl_vest", 3],
		["U_DMan_CA_CombatUniform_Wdl_tshirt", 3],
		["U_DMan_CA_HeliPilotCoveralls", 3],
		["U_DMan_CA_HeliPilotCoveralls_Des", 3],
		["U_DMan_N_CombatUniform_Nav", 3],
		["U_DMan_N_CombatUniform_Nav_vest", 3],
		["U_DMan_N_CombatUniform_Nav_tshirt", 3],
		["U_DMan_SFC_CombatUniform_Blk", 3],
		["U_DMan_SFC_CombatUniform_Blk_vest", 3],
		["U_DMan_SFC_CombatUniform_Urb", 3],
		["U_DMan_SFC_CombatUniform_Urb_vest", 3]
	]
} else {
	diag_log "[KP RANKS] Server uniform list found";	
};

KP_Ranks_uniform_classnames = [];
{
	KP_Ranks_uniform_classnames pushBack (_x select 0);
} forEach KP_Ranks_uniforms;


diag_log "[KP RANKS] Initialising done";
KP_Ranks_init_done = true;

waitUntil {!isNull player};
waitUntil {sleep 1; alive player};

// If unit not listed on the server or has no init entry, set it to lowest rank
if ((player getVariable ["KP_Ranks_rank", 0]) == 0) then {
	player setVariable ["KP_Ranks_rank", 0];
};

if (!isNil "KP_Ranks_list") then {
	{
		if ( (getPlayerUID player) isEqualTo (_x select 0) ) then {
			player setVariable ["KP_Ranks_rank", (_x select 1)];
		};
	} forEach KP_Ranks_list;
};
	
// Set the rank texture for this unit
KP_ranks_patch = "kpd" + (str (player getVariable "KP_Ranks_rank")) + "_ca.paa";

// If no serverconfig available for the uniforms, use the standard list
if (isNil "KP_Ranks_uniforms") then {
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
};

KP_Ranks_uniform_classnames = [];
{
	KP_Ranks_uniform_classnames pushBack (_x select 0);
} forEach KP_Ranks_uniforms;

{
	if (((uniform player) == (_x select 0)) && ((player isKindOf "B_Soldier_base_F") || (player isKindOf "I_Soldier_base_F"))) then {
		switch (_x select 1) do {
			case 1: {KP_Ranks_faction = "\KP_Ranks\ranks\brown\"};
			case 2: {KP_Ranks_faction = "\KP_Ranks\ranks\us\"};
			case 3: {KP_Ranks_faction = "\KP_Ranks\ranks\cro\"};
			default {KP_Ranks_faction = "\KP_Ranks\ranks\green\"};
		}; 
		
		if !((((_x select 1) == 2) || ((_x select 1) == 3)) && ((player getVariable "KP_Ranks_rank") == 0)) then {
			player setObjectTextureGlobal [1, KP_Ranks_faction + KP_Ranks_patch];
		};
	};
} forEach KP_Ranks_uniforms;

KP_Ranks_init_done = true;

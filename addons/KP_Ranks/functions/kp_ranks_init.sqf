waitUntil {!isNull player};
waitUntil {uisleep 1; alive player};

// If unit not listed on the server or has no init entry, set it to lowest rank
private _rank = player getVariable "KP_Ranks_rank";

if (isNil "_rank") then {
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
switch (player getVariable "KP_Ranks_rank") do {
	case 1: {KP_Ranks_patch = "kpd1_ca.paa"};
	case 2: {KP_Ranks_patch = "kpd2_ca.paa"};
	case 3: {KP_Ranks_patch = "kpd3_ca.paa"};
	case 4: {KP_Ranks_patch = "kpd4_ca.paa"};
	case 5: {KP_Ranks_patch = "kpd5_ca.paa"};
	case 6: {KP_Ranks_patch = "kpd6_ca.paa"};
	case 7: {KP_Ranks_patch = "kpd7_ca.paa"};
	case 8: {KP_Ranks_patch = "kpd8_ca.paa"};
	case 9: {KP_Ranks_patch = "kpd9_ca.paa"};
	case 10: {KP_Ranks_patch = "kpd10_ca.paa"};
	case 11: {KP_Ranks_patch = "kpd11_ca.paa"};
	case 12: {KP_Ranks_patch = "kpd12_ca.paa"};
	case 13: {KP_Ranks_patch = "kpd13_ca.paa"};
	case 14: {KP_Ranks_patch = "kpd14_ca.paa"};
	case 15: {KP_Ranks_patch = "kpd15_ca.paa"};
	case 16: {KP_Ranks_patch = "kpd16_ca.paa"};
	case 17: {KP_Ranks_patch = "kpd17_ca.paa"};
	case 18: {KP_Ranks_patch = "kpd18_ca.paa"};
	case 19: {KP_Ranks_patch = "kpd19_ca.paa"};
	default {KP_Ranks_patch = "kpd0_ca.paa"};
};

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
		["U_B_CTRG_Soldier_3_F", 2],
		["U_B_CTRG_Soldier_F", 2],
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
		["U_I_pilotCoveralls", 2]
	]
};

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

true
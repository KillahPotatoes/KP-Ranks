/*
    KPR_fnc_setDefaultUniforms

    File: fn_setDefaultUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Applies the default list of uniforms which are tested and working.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

KPR_uniforms = [
    // Format:
    // ["Uniform Classname" as string, nation/army as int]
    // Nations:
    // 0 = Bundeswehr Flecktarn
    // 1 = Bundeswehr Tropentarn
    // 2 = Croatian Army
    // 3 = US Army

    // Bundeswehr Wood
    ["BWA3_Uniform_Fleck", 0],
    ["BWA3_Uniform_idz_Fleck", 0],
    ["BWA3_Uniform2_Fleck", 0],
    ["BWA3_Uniform2_idz_Fleck", 0],
    ["BWA3_Uniform3_idz_Fleck", 0],
    ["IP_U_B_CombatUniform_light_KSK_Tropic", 0],
    ["IP_U_B_CombatUniform_light_KSK_Tropic_shortsleeve", 0],
    ["IP_U_B_ReconUniform_KSK_Tropic", 0],
    ["IP_U_B_ReconUniform_Rolled_KSK_Tropic", 0],
    ["PBW_Uniform1_fleck", 0],
    ["PBW_Uniform1H_fleck", 0],
    ["PBW_Uniform2_fleck", 0],
    ["PBW_Uniform3_fleck", 0],
    ["PBW_Uniform3K_fleck", 0],
    ["PBW_Uniform4_fleck", 0],
    ["PBW_Uniform4K_fleck", 0],

    // Bundeswehr Desert
    ["BWA3_Uniform_Tropen", 1],
    ["BWA3_Uniform_idz_Tropen", 1],
    ["BWA3_Uniform2_Tropen", 1],
    ["BWA3_Uniform2_idz_Tropen", 1],
    ["BWA3_Uniform3_idz_Tropen", 1],
    ["PBW_Uniform1_tropen", 0],
    ["PBW_Uniform1H_tropen", 0],
    ["PBW_Uniform2_tropen", 0],
    ["PBW_Uniform3_tropen", 0],
    ["PBW_Uniform3K_tropen", 0],
    ["PBW_Uniform4_tropen", 0],
    ["PBW_Uniform4K_tropen", 0],

    // Croatian Army
    ["U_DMan_CA_CombatUniform_Des", 2],
    ["U_DMan_CA_CombatUniform_Des_vest", 2],
    ["U_DMan_CA_CombatUniform_Des_tshirt", 2],
    ["U_DMan_CA_CombatUniform_Wdl", 2],
    ["U_DMan_CA_CombatUniform_Wdl_vest", 2],
    ["U_DMan_CA_CombatUniform_Wdl_tshirt", 2],
    ["U_DMan_CA_HeliPilotCoveralls", 2],
    ["U_DMan_CA_HeliPilotCoveralls_Des", 2],
    ["U_DMan_N_CombatUniform_Nav", 2],
    ["U_DMan_N_CombatUniform_Nav_vest", 2],
    ["U_DMan_N_CombatUniform_Nav_tshirt", 2],
    ["U_DMan_SFC_CombatUniform_Blk", 2],
    ["U_DMan_SFC_CombatUniform_Blk_vest", 2],
    ["U_DMan_SFC_CombatUniform_Urb", 2],
    ["U_DMan_SFC_CombatUniform_Urb_vest", 2],

    // US Army
    ["U_B_CombatUniform_mcam", 3],
    ["U_B_CombatUniform_mcam_tshirt", 3],
    ["U_B_CombatUniform_mcam_vest", 3],
    ["U_B_CombatUniform_mcam_worn", 3],
    ["U_B_HeliPilotCoveralls", 3],
    ["U_B_PilotCoveralls", 3],
    ["U_B_T_Soldier_F", 3],
    ["U_B_T_Soldier_SL_F", 3],
    ["U_B_Wetsuit", 3],
    ["U_I_CombatUniform", 3],
    ["U_I_CombatUniform_shortsleeve", 3],
    ["U_I_HeliPilotCoveralls", 3],
    ["U_I_pilotCoveralls", 3],
    ["U_I_Wetsuit", 3],
    ["rhs_uniform_acu_ucp", 3],
    ["rhs_uniform_cu_ocp", 3],
    ["rhs_uniform_cu_ucp", 3],
    ["rhs_uniform_FROG01_d", 3],
    ["rhs_uniform_FROG01_wd", 3],
    ["rhs_uniform_g3_blk", 3],
    ["rhs_uniform_g3_m81", 3],
    ["rhs_uniform_g3_mc", 3],
    ["rhs_uniform_g3_rgr", 3],
    ["rhs_uniform_g3_tan", 3],

    // British Armed Forces (currently under development by Nils. Until it's finished, it'll be US by default)
    ["U_B_CTRG_1", 3],
    ["U_B_CTRG_2", 3],
    ["U_B_CTRG_3", 3],
    ["U_B_CTRG_Soldier_F", 3],
    ["U_B_CTRG_Soldier_3_F", 3],
    ["U_B_CTRG_Soldier_urb_1_F", 3],
    ["U_B_CTRG_Soldier_urb_3_F", 3]
];

true

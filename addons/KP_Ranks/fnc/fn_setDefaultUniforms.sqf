/*
    KPR_fnc_setDefaultUniforms

    File: fn_setDefaultUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Applies the default list of uniforms which are tested and working.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

diag_log "[KP RANKS] Applying default uniform list...";

KPR_uniforms = [
    // Format:
    // ["Uniform Classname" as string, faction as int]
    // Factions:
    // 0 = German Flecktarn
    // 1 = German Tropentarn
    // 2 = Vanilla NATO (US Army Ranksigns)
    // 3 = Croatian ranksigns

    // German Flecktarn
    ["BWA3_Uniform_Fleck", 0],
    ["BWA3_Uniform_idz_Fleck", 0],
    ["BWA3_Uniform2_Fleck", 0],
    ["BWA3_Uniform2_idz_Fleck", 0],
    ["BWA3_Uniform3_idz_Fleck", 0],
    ["IP_U_B_CombatUniform_light_KSK_Tropic", 0],
    ["IP_U_B_CombatUniform_light_KSK_Tropic_shortsleeve", 0],
    ["IP_U_B_ReconUniform_KSK_Tropic", 0],
    ["IP_U_B_ReconUniform_Rolled_KSK_Tropic", 0],

    // German Tropentarn
    ["BWA3_Uniform_Tropen", 1],
    ["BWA3_Uniform_idz_Tropen", 1],
    ["BWA3_Uniform2_Tropen", 1],
    ["BWA3_Uniform2_idz_Tropen", 1],
    ["BWA3_Uniform3_idz_Tropen", 1],

    // US Army
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

    // Croatian Army
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
];

true

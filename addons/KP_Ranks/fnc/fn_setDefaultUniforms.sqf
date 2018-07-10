/*
    KPR_fnc_setDefaultUniforms

    File: fn_setDefaultUniforms.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Applies the default list of uniforms which are tested and working.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

diag_log "[KP RANKS] [SERVER] Applying default uniform list...";

KPR_uniforms = [
    // Format:
    // ["Uniform Classname" as string, nation as string]
    // Nations:
    // BWF = German Flecktarn
    // BWT = German Tropentarn
    // USA = Vanilla NATO (US Army Ranksigns)
    // CRO = Croatian ranksigns

    // German Flecktarn
    ["BWA3_Uniform_Fleck", "BWF"],
    ["BWA3_Uniform_idz_Fleck","BWF"],
    ["BWA3_Uniform2_Fleck", "BWF"],
    ["BWA3_Uniform2_idz_Fleck", "BWF"],
    ["BWA3_Uniform3_idz_Fleck", "BWF"],
    ["IP_U_B_CombatUniform_light_KSK_Tropic", "BWF"],
    ["IP_U_B_CombatUniform_light_KSK_Tropic_shortsleeve", "BWF"],
    ["IP_U_B_ReconUniform_KSK_Tropic", "BWF"],
    ["IP_U_B_ReconUniform_Rolled_KSK_Tropic", "BWF"],

    // German Tropentarn
    ["BWA3_Uniform_Tropen", "BWT"],
    ["BWA3_Uniform_idz_Tropen", "BWT"],
    ["BWA3_Uniform2_Tropen", "BWT"],
    ["BWA3_Uniform2_idz_Tropen", "BWT"],
    ["BWA3_Uniform3_idz_Tropen", "BWT"],

    // US Army
    ["U_B_CTRG_1", "USA"],
    ["U_B_CTRG_2", "USA"],
    ["U_B_CTRG_3", "USA"],
    ["U_B_CTRG_Soldier_F", "USA"],
    ["U_B_CTRG_Soldier_3_F", "USA"],
    ["U_B_CTRG_Soldier_urb_1_F", "USA"],
    ["U_B_CTRG_Soldier_urb_3_F", "USA"],
    ["U_B_CombatUniform_mcam", "USA"],
    ["U_B_CombatUniform_mcam_tshirt", "USA"],
    ["U_B_CombatUniform_mcam_vest", "USA"],
    ["U_B_CombatUniform_mcam_worn", "USA"],
    ["U_B_HeliPilotCoveralls", "USA"],
    ["U_B_T_Soldier_F", "USA"],
    ["U_B_T_Soldier_SL_F", "USA"],
    ["U_I_CombatUniform", "USA"],
    ["U_I_CombatUniform_shortsleeve", "USA"],
    ["U_I_HeliPilotCoveralls", "USA"],
    ["U_I_pilotCoveralls", "USA"],

    // Croatian Army
    ["U_DMan_CA_CombatUniform_Des", "CRO"],
    ["U_DMan_CA_CombatUniform_Des_vest", "CRO"],
    ["U_DMan_CA_CombatUniform_Des_tshirt", "CRO"],
    ["U_DMan_CA_CombatUniform_Wdl", "CRO"],
    ["U_DMan_CA_CombatUniform_Wdl_vest", "CRO"],
    ["U_DMan_CA_CombatUniform_Wdl_tshirt", "CRO"],
    ["U_DMan_CA_HeliPilotCoveralls", "CRO"],
    ["U_DMan_CA_HeliPilotCoveralls_Des", "CRO"],
    ["U_DMan_N_CombatUniform_Nav", "CRO"],
    ["U_DMan_N_CombatUniform_Nav_vest", "CRO"],
    ["U_DMan_N_CombatUniform_Nav_tshirt", "CRO"],
    ["U_DMan_SFC_CombatUniform_Blk", "CRO"],
    ["U_DMan_SFC_CombatUniform_Blk_vest", "CRO"],
    ["U_DMan_SFC_CombatUniform_Urb", "CRO"],
    ["U_DMan_SFC_CombatUniform_Urb_vest", "CRO"]
];

true

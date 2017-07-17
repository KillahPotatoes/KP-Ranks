#include "\userconfig\KP_Ranks\Ranks.hpp"
#include "\userconfig\KP_Ranks\Uniforms.hpp"

if ((isNil "KP_Ranks_list") || (isNil "KP_Ranks_uniforms")) then {
	diag_log "[KP RANKS] Server userconfig files not found!";
} else {
	diag_log format ["[KP RANKS] Dedicated server initialised - Listed Players: %1 - Listed Uniforms: %2", count KP_Ranks_list, count KP_Ranks_uniforms];
};
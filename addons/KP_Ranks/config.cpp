class CfgPatches
{
	class KP_Ranks
	{
		name = "KP Ranks";
		author = "Wyqer";
		url = "http://www.killahpotatoes.de";
 
		requiredVersion = 1.64; 
		requiredAddons[] = {"A3_Modules_F","Extended_EventHandlers"};
		units[] = {"KP_forceRanks"};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class KP_Ranks: NO_CATEGORY
	{
		displayName = "KP Ranks";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	
    class KP_forceRanks: Module_F
	{
		scope = 2;
		displayName = "Force KP Ranks";
		icon = "\KP_Ranks\kplogo_ca.paa";
		category = "KP_Ranks";
		
		function = "KP_fnc_forceRanks";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		
		class ModuleDescription: ModuleDescription
		{
			description = "Force usage of KP Ranks for every client";
			sync[] = {"Anything"};
			position = 0;
			direction = 0;
			optional = 1;
			duplicate = 0;
		}
    };
	
};

class CfgFunctions 
{
	class KP
	{
		class KP_Ranks
		{
			file = "\KP_Ranks\functions";
			class forceRanks{};
		};
	};
};

class Extended_PostInit_EventHandlers {
    class KP_Ranks_post_init_event {
        init = "call compile preprocessFileLineNumbers '\KP_Ranks\XEH_postInit.sqf'";
    };
};
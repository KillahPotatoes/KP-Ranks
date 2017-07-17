class CfgPatches {
	class KP_Ranks {
		name = "KP Ranks";
		author = "Wyqer";
		url = "https://www.killahpotatoes.de";
 
		requiredVersion = 1.72; 
		requiredAddons[] = {"A3_Modules_F","Extended_EventHandlers"};
		units[] = {"KP_forceRanks"};
	};
};

class CfgFactionClasses {
	class NO_CATEGORY;
	class KP_Ranks: NO_CATEGORY {
		displayName = "KP Ranks";
	};
};

class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class AttributesBase {
			class Default;
			class ModuleDescription;
		};
		class ModuleDescription {
			class AnyBrain;
		};
	};
	
    class KP_forceRanks: Module_F {
		scope = 2;
		displayName = "Enable KP Ranks";
		icon = "\KP_Ranks\kplogo_ca.paa";
		category = "KP_Ranks";
		
		function = "KP_fnc_forceRanks";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		
		class Attributes: AttributesBase {
			class ModuleDescription: ModuleDescription{};
		};

		class ModuleDescription: ModuleDescription {
			description = "Force usage and activate the KP Ranks automatic insignia assignment function";
			sync[] = {"AnyPlayer"};
			position = 0;
			direction = 0;
			optional = 1;
			duplicate = 0;
		};
    };	
};

class CfgFunctions {
	class KP {
		class KP_Ranks {
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

class CfgUnitInsignia {
	// Bundeswehr Flecktarn
	class KP_Ranks_BWF_0 {
		displayName = "BWF00 Schütze";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd0_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_1 {
		displayName = "BWF01 Gefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd1_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_2 {
		displayName = "BWF02 Obergefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd2_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_3 {
		displayName = "BWF03 Hauptgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd3_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_4 {
		displayName = "BWF04 Stabsgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd4_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_5 {
		displayName = "BWF05 Oberstabsgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd5_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_6 {
		displayName = "BWF06 Unteroffizier";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd6_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_7 {
		displayName = "BWF07 Stabsunteroffizier";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd7_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_8 {
		displayName = "BWF08 Feldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd8_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_9 {
		displayName = "BWF09 Oberfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd9_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_10 {
		displayName = "BWF10 Hauptfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd10_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_11 {
		displayName = "BWF11 Stabsfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd11_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_12 {
		displayName = "BWF12 Oberstabsfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd12_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_13 {
		displayName = "BWF13 Leutenant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd13_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_14 {
		displayName = "BWF14 Oberleutnant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd14_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_15 {
		displayName = "BWF15 Hauptmann";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd15_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_16 {
		displayName = "BWF16 Stabshauptmann";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd16_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_17 {
		displayName = "BWF17 Major";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd17_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_18 {
		displayName = "BWF18 Oberstleutnant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd18_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWF_19 {
		displayName = "BWF19 Oberst";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\green\kpd19_ca.paa";
		textureVehicle = "";
	};

	// Bundeswehr Tropentarn
	class KP_Ranks_BWT_0 {
		displayName = "BWT00 Schütze";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd0_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_1 {
		displayName = "BWT01 Gefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd1_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_2 {
		displayName = "BWT02 Obergefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd2_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_3 {
		displayName = "BWT03 Hauptgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd3_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_4 {
		displayName = "BWT04 Stabsgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd4_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_5 {
		displayName = "BWT05 Oberstabsgefreiter";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd5_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_6 {
		displayName = "BWT06 Unteroffizier";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd6_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_7 {
		displayName = "BWT07 Stabsunteroffizier";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd7_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_8 {
		displayName = "BWT08 Feldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd8_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_9 {
		displayName = "BWT09 Oberfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd9_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_10 {
		displayName = "BWT10 Hauptfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd10_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_11 {
		displayName = "BWT11 Stabsfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd11_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_12 {
		displayName = "BWT12 Oberstabsfeldwebel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd12_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_13 {
		displayName = "BWT13 Leutenant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd13_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_14 {
		displayName = "BWT14 Oberleutnant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd14_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_15 {
		displayName = "BWT15 Hauptmann";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd15_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_16 {
		displayName = "BWT16 Stabshauptmann";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd16_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_17 {
		displayName = "BWT17 Major";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd17_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_18 {
		displayName = "BWT18 Oberstleutnant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd18_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_BWT_19 {
		displayName = "BWT19 Oberst";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\brown\kpd19_ca.paa";
		textureVehicle = "";
	};

	// US Army
	class KP_Ranks_USA_1 {
		displayName = "USA00 Private E2";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd1_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_2 {
		displayName = "USA01 Private First Class";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd2_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_4 {
		displayName = "USA02 Corporal";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd4_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_6 {
		displayName = "USA03 Sergeant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd6_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_8 {
		displayName = "USA04 Staff Sergeant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd8_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_10 {
		displayName = "USA05 Sergeant First Class";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd10_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_11 {
		displayName = "USA06 Master Sergeant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd11_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_12 {
		displayName = "USA07 Sergeant Major";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd12_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_13 {
		displayName = "USA08 Second Lieutenant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd13_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_14 {
		displayName = "USA09 First Lieutenant";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd14_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_15 {
		displayName = "USA10 Captain";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd15_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_17 {
		displayName = "USA11 Major";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd17_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_18 {
		displayName = "USA12 Lieutenant Colonel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd18_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_USA_19 {
		displayName = "USA13 Colonel";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\us\kpd19_ca.paa";
		textureVehicle = "";
	};

	// Croatian Army
	class KP_Ranks_CRO_1 {
		displayName = "CRO00 Pozornik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd1_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_3 {
		displayName = "CRO01 Razvodnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd3_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_6 {
		displayName = "CRO02 Skupnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd6_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_7 {
		displayName = "CRO03 Desetnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd7_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_8 {
		displayName = "CRO04 Narednik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd8_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_9 {
		displayName = "CRO05 Nadnarednik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd9_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_10 {
		displayName = "CRO06 Stozerni Narednik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd10_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_11 {
		displayName = "CRO07 Casnicki Namjesnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd11_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_13 {
		displayName = "CRO08 Porucnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd13_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_14 {
		displayName = "CRO09 Natporucnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd14_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_15 {
		displayName = "CRO10 Satnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd15_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_17 {
		displayName = "CRO11 Bojnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd17_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_18 {
		displayName = "CRO12 Pukovnik";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd18_ca.paa";
		textureVehicle = "";
	};
	class KP_Ranks_CRO_19 {
		displayName = "CRO013 Brigadir";
		author = "[KP] Wyqer";
		texture = "\KP_Ranks\ranks\cro\kpd19_ca.paa";
		textureVehicle = "";
	};
};

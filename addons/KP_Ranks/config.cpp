class CfgPatches {
    class KP_Ranks {
        author = "Wyqer";
        name = "KP Ranks";
        url = "https://www.killahpotatoes.de";
        units[] = {"KPR_force"};
        weapons[] = {};
        requiredVersion = 1.82;
        requiredAddons[] = {
            "A3_Modules_F",
            "cba_main"
        };
        versionDesc = "KP Ranks";
        version = 2.0.0;
        versionStr = "2.0.0";
        versionAr[] = {2,0,0};
        authors[] = {"Wyqer"};
    };
};

class CfgSettings {
    class CBA {
        class Versioning {
            class KP_Ranks {
                main_addon = "KP_Ranks";
                class Dependencies {
                    CBA[]={"cba_main", {3,7,1}, "true"};
                };
            };
        };
    };
};

class Extended_PreInit_EventHandlers {
    class KPR_preInit {
        init = "call KPR_fnc_initCBA";
    };
};

class Extended_PostInit_EventHandlers {
    class KPR_postInit {
        init = "call KPR_fnc_initRanks";
    };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class KPR_Category: NO_CATEGORY {
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

    class KPR_force: Module_F {
        scope = 2;
        displayName = "Force KP Ranks";
        icon = "\KP_Ranks\kplogo_ca.paa";
        category = "KPR_Category";

        function = "KPR_fnc_forceRanks";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 0;
        is3DEN = 0;

        class Attributes: AttributesBase {
            class ModuleDescription: ModuleDescription{};
        };

        class ModuleDescription: ModuleDescription {
            description[] = {
                "$STR_KPR_CONFIG_MODULEDESC1",
                "$STR_KPR_CONFIG_MODULEDESC2"
            };
            position = 0;
            direction = 0;
            optional = 1;
            duplicate = 0;
        };
    };
};

class CfgFunctions {
    class KPR {
        class KP_Ranks {
            file = "\KP_Ranks\fnc";

            // Add vanilla actions
            class addActions {};

            // Adds a new player to the player list
            class addPlayer {};

            // Applies rank insignia to player
            class applyRank {};

            // Loop for automatic mode
            class autoLoop {};

            // Dummy function of the editor module to force a dependency to KP Ranks
            class forceRanks {};

            // Inizialize ACE self interaction entries
            class initACE {};

            // Initialize the CBA Settings
            class initCBA {};

            // Initialize KP Ranks
            class initRanks {};

            // Updates and saves player ranks list
            class savePlayers{};

            // Apply the default values for the uniform list
            class setDefaultUniforms {};

            // Shows a hint for 3 seconds
            class showHint{};
        };
    };
};

class CfgUnitInsignia {
    // Bundeswehr Flecktarn
    class KPR_BWF_0 {
        author = "Nils";
        displayName = "BWF00 Schuetze";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd0_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_1: KPR_BWF_0 {
        displayName = "BWF01 Gefreiter";
        texture = "\KP_Ranks\ranks\green\kpd1_ca.paa";
    };
    class KPR_BWF_2: KPR_BWF_0 {
        displayName = "BWF02 Obergefreiter";
        texture = "\KP_Ranks\ranks\green\kpd2_ca.paa";
    };
    class KPR_BWF_3: KPR_BWF_0 {
        displayName = "BWF03 Hauptgefreiter";
        texture = "\KP_Ranks\ranks\green\kpd3_ca.paa";
    };
    class KPR_BWF_4: KPR_BWF_0 {
        displayName = "BWF04 Stabsgefreiter";
        texture = "\KP_Ranks\ranks\green\kpd4_ca.paa";
    };
    class KPR_BWF_5: KPR_BWF_0 {
        displayName = "BWF05 Oberstabsgefreiter";
        texture = "\KP_Ranks\ranks\green\kpd5_ca.paa";
    };
    class KPR_BWF_6: KPR_BWF_0 {
        displayName = "BWF06 Unteroffizier";
        texture = "\KP_Ranks\ranks\green\kpd6_ca.paa";
    };
    class KPR_BWF_7: KPR_BWF_0 {
        displayName = "BWF07 Stabsunteroffizier";
        texture = "\KP_Ranks\ranks\green\kpd7_ca.paa";
    };
    class KPR_BWF_8: KPR_BWF_0 {
        displayName = "BWF08 Feldwebel";
        texture = "\KP_Ranks\ranks\green\kpd8_ca.paa";
    };
    class KPR_BWF_9: KPR_BWF_0 {
        displayName = "BWF09 Oberfeldwebel";
        texture = "\KP_Ranks\ranks\green\kpd9_ca.paa";
    };
    class KPR_BWF_10: KPR_BWF_0 {
        displayName = "BWF10 Hauptfeldwebel";
        texture = "\KP_Ranks\ranks\green\kpd10_ca.paa";
    };
    class KPR_BWF_11: KPR_BWF_0 {
        displayName = "BWF11 Stabsfeldwebel";
        texture = "\KP_Ranks\ranks\green\kpd11_ca.paa";
    };
    class KPR_BWF_12: KPR_BWF_0 {
        displayName = "BWF12 Oberstabsfeldwebel";
        texture = "\KP_Ranks\ranks\green\kpd12_ca.paa";
    };
    class KPR_BWF_13: KPR_BWF_0 {
        displayName = "BWF13 Leutenant";
        texture = "\KP_Ranks\ranks\green\kpd13_ca.paa";
    };
    class KPR_BWF_14: KPR_BWF_0 {
        displayName = "BWF14 Oberleutnant";
        texture = "\KP_Ranks\ranks\green\kpd14_ca.paa";
    };
    class KPR_BWF_15: KPR_BWF_0 {
        displayName = "BWF15 Hauptmann";
        texture = "\KP_Ranks\ranks\green\kpd15_ca.paa";
    };
    class KPR_BWF_16: KPR_BWF_0 {
        displayName = "BWF16 Stabshauptmann";
        texture = "\KP_Ranks\ranks\green\kpd16_ca.paa";
    };
    class KPR_BWF_17: KPR_BWF_0 {
        displayName = "BWF17 Major";
        texture = "\KP_Ranks\ranks\green\kpd17_ca.paa";
    };
    class KPR_BWF_18: KPR_BWF_0 {
        displayName = "BWF18 Oberstleutnant";
        texture = "\KP_Ranks\ranks\green\kpd18_ca.paa";
    };
    class KPR_BWF_19: KPR_BWF_0 {
        displayName = "BWF19 Oberst";
        texture = "\KP_Ranks\ranks\green\kpd19_ca.paa";
    };

    // Bundeswehr Tropentarn
    class KPR_BWT_0: KPR_BWF_0 {
        displayName = "BWT00 Schuetze";
        texture = "\KP_Ranks\ranks\brown\kpd0_ca.paa";
    };
    class KPR_BWT_1: KPR_BWF_0 {
        displayName = "BWT01 Gefreiter";
        texture = "\KP_Ranks\ranks\brown\kpd1_ca.paa";
    };
    class KPR_BWT_2: KPR_BWF_0{
        displayName = "BWT02 Obergefreiter";
        texture = "\KP_Ranks\ranks\brown\kpd2_ca.paa";
    };
    class KPR_BWT_3: KPR_BWF_0 {
        displayName = "BWT03 Hauptgefreiter";
        texture = "\KP_Ranks\ranks\brown\kpd3_ca.paa";
    };
    class KPR_BWT_4: KPR_BWF_0 {
        displayName = "BWT04 Stabsgefreiter";
        texture = "\KP_Ranks\ranks\brown\kpd4_ca.paa";
    };
    class KPR_BWT_5: KPR_BWF_0 {
        displayName = "BWT05 Oberstabsgefreiter";
        texture = "\KP_Ranks\ranks\brown\kpd5_ca.paa";
    };
    class KPR_BWT_6: KPR_BWF_0 {
        displayName = "BWT06 Unteroffizier";
        texture = "\KP_Ranks\ranks\brown\kpd6_ca.paa";
    };
    class KPR_BWT_7: KPR_BWF_0 {
        displayName = "BWT07 Stabsunteroffizier";
        texture = "\KP_Ranks\ranks\brown\kpd7_ca.paa";
    };
    class KPR_BWT_8: KPR_BWF_0 {
        displayName = "BWT08 Feldwebel";
        texture = "\KP_Ranks\ranks\brown\kpd8_ca.paa";
    };
    class KPR_BWT_9: KPR_BWF_0 {
        displayName = "BWT09 Oberfeldwebel";
        texture = "\KP_Ranks\ranks\brown\kpd9_ca.paa";
    };
    class KPR_BWT_10: KPR_BWF_0 {
        displayName = "BWT10 Hauptfeldwebel";
        texture = "\KP_Ranks\ranks\brown\kpd10_ca.paa";
    };
    class KPR_BWT_11: KPR_BWF_0 {
        displayName = "BWT11 Stabsfeldwebel";
        texture = "\KP_Ranks\ranks\brown\kpd11_ca.paa";
    };
    class KPR_BWT_12: KPR_BWF_0 {
        displayName = "BWT12 Oberstabsfeldwebel";
        texture = "\KP_Ranks\ranks\brown\kpd12_ca.paa";
    };
    class KPR_BWT_13: KPR_BWF_0 {
        displayName = "BWT13 Leutenant";
        texture = "\KP_Ranks\ranks\brown\kpd13_ca.paa";
    };
    class KPR_BWT_14: KPR_BWF_0 {
        displayName = "BWT14 Oberleutnant";
        texture = "\KP_Ranks\ranks\brown\kpd14_ca.paa";
    };
    class KPR_BWT_15: KPR_BWF_0 {
        displayName = "BWT15 Hauptmann";
        texture = "\KP_Ranks\ranks\brown\kpd15_ca.paa";
    };
    class KPR_BWT_16: KPR_BWF_0 {
        displayName = "BWT16 Stabshauptmann";
        texture = "\KP_Ranks\ranks\brown\kpd16_ca.paa";
    };
    class KPR_BWT_17: KPR_BWF_0 {
        displayName = "BWT17 Major";
        texture = "\KP_Ranks\ranks\brown\kpd17_ca.paa";
    };
    class KPR_BWT_18: KPR_BWF_0 {
        displayName = "BWT18 Oberstleutnant";
        texture = "\KP_Ranks\ranks\brown\kpd18_ca.paa";
    };
    class KPR_BWT_19: KPR_BWF_0 {
        displayName = "BWT19 Oberst";
        texture = "\KP_Ranks\ranks\brown\kpd19_ca.paa";
    };

    // US Army
    class KPR_USA_1: KPR_BWF_0 {
        displayName = "USA00 Private E2";
        texture = "\KP_Ranks\ranks\us\kpd1_ca.paa";
    };
    class KPR_USA_2: KPR_BWF_0 {
        displayName = "USA01 Private First Class";
        texture = "\KP_Ranks\ranks\us\kpd2_ca.paa";
    };
    class KPR_USA_3: KPR_USA_2 {};
    class KPR_USA_4: KPR_BWF_0 {
        displayName = "USA02 Corporal";
        texture = "\KP_Ranks\ranks\us\kpd4_ca.paa";
    };
    class KPR_USA_5: KPR_USA_4 {};
    class KPR_USA_6: KPR_BWF_0 {
        displayName = "USA03 Sergeant";
        texture = "\KP_Ranks\ranks\us\kpd6_ca.paa";
    };
    class KPR_USA_7: KPR_USA_6 {};
    class KPR_USA_8: KPR_BWF_0 {
        displayName = "USA04 Staff Sergeant";
        texture = "\KP_Ranks\ranks\us\kpd8_ca.paa";
    };
    class KPR_USA_9: KPR_USA_8 {};
    class KPR_USA_10: KPR_BWF_0 {
        displayName = "USA05 Sergeant First Class";
        texture = "\KP_Ranks\ranks\us\kpd10_ca.paa";
    };
    class KPR_USA_11: KPR_BWF_0 {
        displayName = "USA06 Master Sergeant";
        texture = "\KP_Ranks\ranks\us\kpd11_ca.paa";
    };
    class KPR_USA_12: KPR_BWF_0 {
        displayName = "USA07 Sergeant Major";
        texture = "\KP_Ranks\ranks\us\kpd12_ca.paa";
    };
    class KPR_USA_13: KPR_BWF_0 {
        displayName = "USA08 Second Lieutenant";
        texture = "\KP_Ranks\ranks\us\kpd13_ca.paa";
    };
    class KPR_USA_14: KPR_BWF_0 {
        displayName = "USA09 First Lieutenant";
        texture = "\KP_Ranks\ranks\us\kpd14_ca.paa";
    };
    class KPR_USA_15: KPR_BWF_0 {
        displayName = "USA10 Captain";
        texture = "\KP_Ranks\ranks\us\kpd15_ca.paa";
    };
    class KPR_USA_16: KPR_USA_15 {};
    class KPR_USA_17: KPR_BWF_0 {
        displayName = "USA11 Major";
        texture = "\KP_Ranks\ranks\us\kpd17_ca.paa";
    };
    class KPR_USA_18: KPR_BWF_0 {
        displayName = "USA12 Lieutenant Colonel";
        texture = "\KP_Ranks\ranks\us\kpd18_ca.paa";
    };
    class KPR_USA_19: KPR_BWF_0 {
        displayName = "USA13 Colonel";
        texture = "\KP_Ranks\ranks\us\kpd19_ca.paa";
    };

    // Croatian Army
    class KPR_CRO_1 {
        author = "Degman";
        displayName = "CRO00 Pozornik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_2: KPR_CRO_1 {};
    class KPR_CRO_3: KPR_CRO_1 {
        displayName = "CRO01 Razvodnik";
        texture = "\KP_Ranks\ranks\cro\kpd3_ca.paa";
    };
    class KPR_CRO_4: KPR_CRO_3 {};
    class KPR_CRO_5: KPR_CRO_3 {};
    class KPR_CRO_6: KPR_CRO_1 {
        displayName = "CRO02 Skupnik";
        texture = "\KP_Ranks\ranks\cro\kpd6_ca.paa";
    };
    class KPR_CRO_7: KPR_CRO_1 {
        displayName = "CRO03 Desetnik";
        texture = "\KP_Ranks\ranks\cro\kpd7_ca.paa";
    };
    class KPR_CRO_8: KPR_CRO_1 {
        displayName = "CRO04 Narednik";
        texture = "\KP_Ranks\ranks\cro\kpd8_ca.paa";
    };
    class KPR_CRO_9: KPR_CRO_1 {
        displayName = "CRO05 Nadnarednik";
        texture = "\KP_Ranks\ranks\cro\kpd9_ca.paa";
    };
    class KPR_CRO_10: KPR_CRO_1 {
        displayName = "CRO06 Stozerni Narednik";
        texture = "\KP_Ranks\ranks\cro\kpd10_ca.paa";
    };
    class KPR_CRO_11: KPR_CRO_1 {
        displayName = "CRO07 Casnicki Namjesnik";
        texture = "\KP_Ranks\ranks\cro\kpd11_ca.paa";
    };
    class KPR_CRO_12: KPR_CRO_11 {};
    class KPR_CRO_13: KPR_CRO_1 {
        displayName = "CRO08 Porucnik";
        texture = "\KP_Ranks\ranks\cro\kpd13_ca.paa";
    };
    class KPR_CRO_14: KPR_CRO_1 {
        displayName = "CRO09 Natporucnik";
        texture = "\KP_Ranks\ranks\cro\kpd14_ca.paa";
    };
    class KPR_CRO_15: KPR_CRO_1 {
        displayName = "CRO10 Satnik";
        texture = "\KP_Ranks\ranks\cro\kpd15_ca.paa";
    };
    class KPR_CRO_16: KPR_CRO_15 {};
    class KPR_CRO_17: KPR_CRO_1 {
        displayName = "CRO11 Bojnik";
        texture = "\KP_Ranks\ranks\cro\kpd17_ca.paa";
    };
    class KPR_CRO_18: KPR_CRO_1 {
        displayName = "CRO12 Pukovnik";
        texture = "\KP_Ranks\ranks\cro\kpd18_ca.paa";
    };
    class KPR_CRO_19: KPR_CRO_1 {
        displayName = "CRO013 Brigadir";
        texture = "\KP_Ranks\ranks\cro\kpd19_ca.paa";
    };
};

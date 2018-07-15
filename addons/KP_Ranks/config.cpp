/*
    KP Ranks config file

    File: config.cpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-09
    Last Update: 2018-07-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Mod config file.
*/

/*
    --- General Mod Info ---
*/

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

/*
    --- CBA Version Info ---
*/

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

/*
    --- CBA PreInit ---
*/

class Extended_PreInit_EventHandlers {
    class KPR_preInit {
        init = "call KPR_fnc_initCBA";
    };
};

/*
    --- CBA PostInit ---
*/

class Extended_PostInit_EventHandlers {
    class KPR_postInit {
        init = "call KPR_fnc_initRanks";
    };
};

/*
    --- Editor Category ---
*/

class CfgFactionClasses {
    class NO_CATEGORY;
    class KPR_Category: NO_CATEGORY {
        displayName = "KP Ranks";
    };
};

/*
    --- Editor Module ---
*/

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

/*
    --- Functions library ---
*/

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

            // Check if player is server or KPR admin
            class isAdmin {};

            // Opens the player management dialog
            class openDialogPlayers {};

            // Opens the uniform management dialog
            class openDialogUniforms {};

            // Adds edits to a temporary variable until it gets saved
            class playerAddEdit {};

            // Exports player data
            class playerExport {};

            // Imports player data
            class playerImport {};

            // Sends edits from the player management dialog to the server
            class playerSave {};

            // Handles edits on the player list
            class playerSaveServer{};

            // Updates and saves player ranks list
            class savePlayers {};

            // Apply the default values for the uniform list
            class setDefaultUniforms {};

            // Shows a hint for 3 seconds
            class showHint {};

            // Updates a player name in the player list
            class updatePlayer {};
        };
    };
};

/*
    --- Insignia config classes ---
*/

class CfgUnitInsignia {
    // Bundeswehr Flecktarn
    class KPR_BWF_0 {
        author = "Nils";
        displayName = "BWF00 Schuetze";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd0_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_1 {
        author = "Nils";
        displayName = "BWF01 Gefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_2 {
        author = "Nils";
        displayName = "BWF02 Obergefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd2_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_3 {
        author = "Nils";
        displayName = "BWF03 Hauptgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd3_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_4 {
        author = "Nils";
        displayName = "BWF04 Stabsgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd4_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_5 {
        author = "Nils";
        displayName = "BWF05 Oberstabsgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd5_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_6 {
        author = "Nils";
        displayName = "BWF06 Unteroffizier";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd6_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_7 {
        author = "Nils";
        displayName = "BWF07 Stabsunteroffizier";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd7_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_8 {
        author = "Nils";
        displayName = "BWF08 Feldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd8_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_9 {
        author = "Nils";
        displayName = "BWF09 Oberfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd9_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_10 {
        author = "Nils";
        displayName = "BWF10 Hauptfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd10_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_11 {
        author = "Nils";
        displayName = "BWF11 Stabsfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd11_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_12 {
        author = "Nils";
        displayName = "BWF12 Oberstabsfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd12_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_13 {
        author = "Nils";
        displayName = "BWF13 Leutenant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd13_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_14 {
        author = "Nils";
        displayName = "BWF14 Oberleutnant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd14_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_15 {
        author = "Nils";
        displayName = "BWF15 Hauptmann";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_16 {
        author = "Nils";
        displayName = "BWF16 Stabshauptmann";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd16_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_17 {
        author = "Nils";
        displayName = "BWF17 Major";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd17_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_18 {
        author = "Nils";
        displayName = "BWF18 Oberstleutnant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd18_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWF_19 {
        author = "Nils";
        displayName = "BWF19 Oberst";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\green\kpd19_ca.paa";
        textureVehicle = "";
    };

    // Bundeswehr Tropentarn
    class KPR_BWT_0 {
        author = "Nils";
        displayName = "BWT00 Schuetze";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd0_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_1 {
        author = "Nils";
        displayName = "BWT01 Gefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_2 {
        author = "Nils";
        displayName = "BWT02 Obergefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd2_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_3 {
        author = "Nils";
        displayName = "BWT03 Hauptgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd3_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_4 {
        author = "Nils";
        displayName = "BWT04 Stabsgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd4_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_5 {
        author = "Nils";
        displayName = "BWT05 Oberstabsgefreiter";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd5_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_6 {
        author = "Nils";
        displayName = "BWT06 Unteroffizier";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd6_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_7 {
        author = "Nils";
        displayName = "BWT07 Stabsunteroffizier";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd7_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_8 {
        author = "Nils";
        displayName = "BWT08 Feldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd8_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_9 {
        author = "Nils";
        displayName = "BWT09 Oberfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd9_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_10 {
        author = "Nils";
        displayName = "BWT10 Hauptfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd10_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_11 {
        author = "Nils";
        displayName = "BWT11 Stabsfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd11_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_12 {
        author = "Nils";
        displayName = "BWT12 Oberstabsfeldwebel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd12_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_13 {
        author = "Nils";
        displayName = "BWT13 Leutenant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd13_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_14 {
        author = "Nils";
        displayName = "BWT14 Oberleutnant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd14_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_15 {
        author = "Nils";
        displayName = "BWT15 Hauptmann";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_16 {
        author = "Nils";
        displayName = "BWT16 Stabshauptmann";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd16_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_17 {
        author = "Nils";
        displayName = "BWT17 Major";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd17_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_18 {
        author = "Nils";
        displayName = "BWT18 Oberstleutnant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd18_ca.paa";
        textureVehicle = "";
    };
    class KPR_BWT_19 {
        author = "Nils";
        displayName = "BWT19 Oberst";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\brown\kpd19_ca.paa";
        textureVehicle = "";
    };

    // Croatian Army
    class KPR_CRO_0 {
        author = "Degman";
        displayName = "CRO00 Nothing";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "#(rgb,8,8,3)color(0,0,0,0)";
        textureVehicle = "";
    }
    class KPR_CRO_1 {
        author = "Degman";
        displayName = "CRO01 Pozornik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_2 {
        author = "Degman";
        displayName = "CRO02 Pozornik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_3 {
        author = "Degman";
        displayName = "CRO03 Razvodnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd3_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_4 {
        author = "Degman";
        displayName = "CRO04 Razvodnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd3_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_5 {
        author = "Degman";
        displayName = "CRO05 Razvodnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd3_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_6 {
        author = "Degman";
        displayName = "CRO06 Skupnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd6_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_7 {
        author = "Degman";
        displayName = "CRO07 Desetnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd7_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_8 {
        author = "Degman";
        displayName = "CRO08 Narednik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd8_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_9 {
        author = "Degman";
        displayName = "CRO09 Nadnarednik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd9_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_10 {
        author = "Degman";
        displayName = "CRO10 Stozerni Narednik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd10_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_11 {
        author = "Degman";
        displayName = "CRO11 Casnicki Namjesnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd11_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_12 {
        author = "Degman";
        displayName = "CRO12 Casnicki Namjesnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd11_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_13 {
        author = "Degman";
        displayName = "CRO13 Porucnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd13_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_14 {
        author = "Degman";
        displayName = "CRO14 Natporucnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd14_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_15 {
        author = "Degman";
        displayName = "CRO15 Satnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_16 {
        author = "Degman";
        displayName = "CRO16 Satnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_17 {
        author = "Degman";
        displayName = "CRO17 Bojnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd17_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_18 {
        author = "Degman";
        displayName = "CRO18 Pukovnik";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd18_ca.paa";
        textureVehicle = "";
    };
    class KPR_CRO_19 {
        author = "Degman";
        displayName = "CRO19 Brigadir";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\cro\kpd19_ca.paa";
        textureVehicle = "";
    };

        // US Army
    class KPR_USA_0 {
        author = "Nils";
        displayName = "USA00 Private E1";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "#(rgb,8,8,3)color(0,0,0,0)";
        textureVehicle = "";
    };
    class KPR_USA_1 {
        author = "Nils";
        displayName = "USA01 Private E2";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd1_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_2 {
        author = "Nils";
        displayName = "USA02 Private First Class";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd2_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_3 {
        author = "Nils";
        displayName = "USA03 Private First Class";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd2_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_4 {
        author = "Nils";
        displayName = "USA04 Corporal";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd4_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_5 {
        author = "Nils";
        displayName = "USA05 Corporal";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd4_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_6 {
        author = "Nils";
        displayName = "USA06 Sergeant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd6_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_7 {
        author = "Nils";
        displayName = "USA07 Sergeant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd6_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_8 {
        author = "Nils";
        displayName = "USA08 Staff Sergeant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd8_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_9 {
        author = "Nils";
        displayName = "USA09 Staff Sergeant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd8_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_10 {
        author = "Nils";
        displayName = "USA10 Sergeant First Class";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd10_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_11 {
        author = "Nils";
        displayName = "USA11 Master Sergeant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd11_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_12 {
        author = "Nils";
        displayName = "USA12 Sergeant Major";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd12_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_13 {
        author = "Nils";
        displayName = "USA13 Second Lieutenant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd13_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_14 {
        author = "Nils";
        displayName = "USA14 First Lieutenant";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd14_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_15 {
        author = "Nils";
        displayName = "USA15 Captain";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_16 {
        author = "Nils";
        displayName = "USA16 Captain";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd15_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_17 {
        author = "Nils";
        displayName = "USA17 Major";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd17_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_18 {
        author = "Nils";
        displayName = "USA18 Lieutenant Colonel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd18_ca.paa";
        textureVehicle = "";
    };
    class KPR_USA_19 {
        author = "Nils";
        displayName = "USA19 Colonel";
        material = "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat";
        texture = "\KP_Ranks\ranks\us\kpd19_ca.paa";
        textureVehicle = "";
    };
};

/*
    --- UI Defines ---
*/
#include "\KP_Ranks\KP_uiDefines.hpp"
#include "\KP_Ranks\KPR_dialogs.hpp"

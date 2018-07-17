/*
    KP Ranks dialog defines

    File: KPR_dialogs.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines of the dialogs which are used in the KP Ranks mod.
*/

class KPR_playerList {
    idd = 7580821;
    movingEnable = 0;
    onLoad = "KPR_editPlayers = [[],[]]";
    onUnload = "KPR_editPlayers = nil";

    class controlsBackground {
        class KPR_DialogTitle: KP_DialogTitle {
            text = "$STR_KPR_DIALOG_PLAYERMANAGE";
        };

        class KPR_DialogBackground: KP_DialogBackground {};
    };

    class controls {
        class KPR_DialogCross: KP_DialogCross {};

        class KPR_ControlsGroup: KP_ControlsGroup {
            idc = 75801;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,1);
            w = KP_GETW(KP_WIDTH_VAL,1);
            h = KP_GETH(KP_HEIGHT_VAL,1);

            class controls {
                class KPR_HeaderBackground: KP_Text {
                    colorBackground[] = KP_COLOR_BACKGROUND;
                    x = 0;
                    y = 0;
                    w = KP_GETW(KP_WIDTH_VAL,1);
                    h = safeZoneH * 0.04;
                };

                class KPR_HeaderName: KP_Text {
                    style = 2;
                    text = "$STR_KPR_DIALOG_PLAYER";
                    x = safeZoneW * 0.01;
                    y = safeZoneH * 0.005;
                    w = safeZoneW * 0.08;
                    h = safeZoneH * 0.03;
                    sizeEx = KP_TEXT_L;
                };

                class KPR_HeaderAdmin: KPR_HeaderName {
                    text = "$STR_KPR_DIALOG_ADMIN";
                    x = safeZoneW * 0.11;
                };

                class KPR_HeaderRank: KPR_HeaderName {
                    text = "$STR_KPR_DIALOG_RANK";
                    x = safeZoneW * 0.21;
                };

                class KPR_HeaderNation: KPR_HeaderName {
                    text = "$STR_KPR_DIALOG_NATION";
                    x = safeZoneW * 0.31;
                };

                class KPR_HeaderDelete: KPR_HeaderName {
                    text = "$STR_KPR_DIALOG_DEL";
                    x = safeZoneW * 0.41;
                };
            };
        };

        class KPR_DialogButtonS1: KP_DialogButton {
            text = "$STR_KPR_DIALOG_RESET";
            tooltip = "$STR_KPR_DIALOG_RESETDESC";
            onButtonClick = "closeDialog 0; [{!dialog}, {call KPR_fnc_openDialogPlayers;}] call CBA_fnc_waitUntilAndExecute";
        };

        class KPR_DialogButtonS2: KP_DialogButton {
            idc = 75802;
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            text = "$STR_KPR_DIALOG_IMPORT";
            tooltip = "$STR_KPR_DIALOG_IMPORTDESC";
            onButtonClick = "call KPR_fnc_playerImport";
        };

        class KPR_DialogButtonS3: KP_DialogButton {
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,2,4);
            text = "$STR_KPR_DIALOG_EXPORT";
            tooltip = "$STR_KPR_DIALOG_EXPORTDESC";
            onButtonClick = "call KPR_fnc_playerExport";
        };

        class KPR_DialogButtonS4: KP_DialogButton {
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            text = "$STR_KPR_DIALOG_SAVE";
            tooltip = "$STR_KPR_DIALOG_SAVEDESC";
            onButtonClick = "call KPR_fnc_playerSave";
        };
    };
};

class KPR_uniformList {
    idd = 7580822;
    movingEnable = 0;
    onLoad = "KPR_editUniforms = []; KPR_activeUniforms = []; KPR_inactiveUniforms = []";
    onUnload = "KPR_editUniforms = nil; KPR_activeUniforms = nil; KPR_inactiveUniforms = nil;";

    class controlsBackground {
        class KPR_DialogTitle: KP_DialogTitle {
            text = "$STR_KPR_DIALOG_UNIFORMMANAGE";
        };

        class KPR_DialogBackground: KP_DialogBackground {};

        class KP_HeaderActive: KP_Text {
            style = 2;
            colorBackground[] = KP_COLOR_BACKGROUND;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,8);
            text = "$STR_KPR_DIALOG_UNIFORMACTIVE";
            sizeEx = KP_TEXT_L;
        };

        class KP_HeaderDetails: KP_Text {
            style = 2;
            colorBackground[] = KP_COLOR_BACKGROUND;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,8);
            w = KP_GETW(KP_WIDTH_VAL,2);
            h = KP_GETH(KP_HEIGHT_VAL,8);
            text = "$STR_KPR_DIALOG_UNIFORMDETAILS";
            sizeEx = KP_TEXT_L;
        };

        class KPR_UniformPicture: KP_PictureRatio {
            idc = 75803;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,8);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,2);
            text = "";
        };

        class KPR_UniformClass: KP_Text {
            idc = 75804;
            style = 2;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,8);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,5,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            text = "";
        };

        class KPR_UniformAuthor: KP_Text {
            idc = 75805;
            style = 2;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,8);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,11,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            text = "";
        };

        class KP_HeaderInactive: KP_Text {
            style = 2;
            colorBackground[] = KP_COLOR_BACKGROUND;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,8);
            text = "$STR_KPR_DIALOG_UNIFORMINACTIVE";
            sizeEx = KP_TEXT_L;
        };
    };

    class controls {
        class KPR_DialogCross: KP_DialogCross {};

        class KPR_ListActive: KP_Listbox {
            idc = 75801;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,1.15);
            onLBSelChanged = "if ((_this select 1) > -1) then {['active', _this select 1] call KPR_fnc_uniformLBChange;}";
        };

        class KPR_ListInactive: KP_Listbox {
            idc = 75802;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,1.15);
            onLBSelChanged = "if ((_this select 1) > -1) then {['inactive', _this select 1] call KPR_fnc_uniformLBChange;}";
        };

        class KPR_ComboFaction: KP_Combo {
            idc = 75806;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,8);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,6,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPR_addActive: KP_DialogButton {
            idc = 75807;
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,3,8);
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,5,16);
            w = KP_GETWPLAIN(KP_WIDTH_VAL,16);
            text = "<<";
            tooltip = "$STR_KPR_DIALOG_ADDUNIFORMDESC";
        };

        class KPR_saveUniform: KPR_addActive {
            idc = 75808;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,7,16);
            w = KP_GETWPLAIN(KP_WIDTH_VAL,8);
            text = "$STR_KPR_DIALOG_SAVE";
        };

        class KPR_delActive: KPR_addActive {
            idc = 75809;
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,9,16);
            text = ">>";
            tooltip = "$STR_KPR_DIALOG_DELUNIFORMDESC";
        };

        class KPR_DialogButtonS2: KP_DialogButton {
            idc = 758010;
            text = "$STR_KPR_DIALOG_IMPORT";
            tooltip = "$STR_KPR_DIALOG_IMPORTDESC";
            onButtonClick = "hint 'Import'";
        };

        class KPR_DialogButtonS3: KP_DialogButton {
            x = KP_GETX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            text = "$STR_KPR_DIALOG_EXPORT";
            tooltip = "$STR_KPR_DIALOG_EXPORTDESC";
            onButtonClick = "hint 'Export'";
        };
    };
};

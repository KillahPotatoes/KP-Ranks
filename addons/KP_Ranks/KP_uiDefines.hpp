/*
    Killah Potatoes UI defines and classes

    File: KP_uiDefines.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-07-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    UI defines and classes used in mods and missions from the Killah Potatoes Gaming Community.
*/

// BI class includes
// Details via: "Default" call BIS_fnc_exportGUIBaseClasses;
class ScrollBar;
class RscActiveText;
class RscButton;
class RscCheckBox;
class RscCombo;
class RscControlsGroup;
class RscShortcutButton;
class RscText;
class RscXListBox;


/*
    --- General Defines ---
*/

// Text sizes
#define KP_GUI_TEXT_S                   safeZoneH * 0.015
#define KP_GUI_TEXT_M                   safeZoneH * 0.02
#define KP_GUI_TEXT_L                   safeZoneH * 0.025
#define KP_GUI_TEXT_XL                  safeZoneH * 0.03

// Blank values for calculation
#define KP_GUI_SPACING_X                0.002
#define KP_GUI_SPACING_Y                0.004
#define KP_GUI_HEIGTH_TITLE             0.035
#define KP_GUI_WIDTH_BUTTON             0.1235
#define KP_GUI_HEIGTH_BUTTON            0.025

// Colors
#define KP_GUI_COLOR_PLAYERDEFINE       {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"}
#define KP_GUI_COLOR_BACKGROUND         {0, 0, 0, 0.5}


/*
    --- General Classes ---
*/

// Title bar for dialogs
class KP_Title: RscText {
    colorBackground[] = KP_GUI_COLOR_PLAYERDEFINE;
    text = "DIALOG TITLE";
    h = safeZoneH * KP_GUI_HEIGTH_TITLE;
    shadow = 1;
    sizeEx = KP_GUI_TEXT_XL;
};

// Cross symbol for dialog close
class KP_CloseCross: RscActiveText {
    style = 48;
    color[] = {1, 1, 1, 0.75};
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 0.75};
    colorActive[] = {1, 1, 1, 1};
    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
    tooltip = "$STR_DISP_CLOSE";
    action = "closeDialog 0";
};

// General background for the dialog area
class KP_Background: RscText {
    colorBackground[] = KP_GUI_COLOR_BACKGROUND;
};

// Normal Text
class KP_Text: RscText {
    sizeEx = KP_GUI_TEXT_M;
};

// Active Text
class KP_ActiveText: RscActiveText {
    style = 2;
    sizeEx = KP_GUI_TEXT_M;
};

// Button
class KP_Button: RscButton {
    sizeEx = KP_GUI_TEXT_M;
};

// Shortcut Button
class KP_ShortcutButton: RscShortcutButton {
    colorBackground[] = {0.2, 0.2, 0.2, 1};
    colorBackgroundFocused[] = {0.25, 0.25, 0.25, 1};
    colorBackground2[] = {0.25, 0.25, 0.25, 1};
    style = 2;
    sizeEx = KP_GUI_TEXT_M;
}

// Controls group
class KP_ControlsGroup: RscControlsGroup {};

// Combo
class KP_Combo: RscCombo {
    sizeEx = KP_GUI_TEXT_M;
};

// Checkbox
class KP_CheckBox: RscCheckBox {
    style = 2;
    w = safeZoneW * 0.014;
    h = safeZoneH * 0.025;
};

// XListBox
class KP_XListBox: RscXListBox {
    sizeEx = KP_GUI_TEXT_M;
};

/*
    --- Standard sized dialog components ---
    (X from 0.25 - 0.75, Y from 0.2 - 0.8)
*/

// Defines
#define KP_GUI_POS_X                    safeZoneX + safeZoneW * 0.25
#define KP_GUI_POS_X_CROSS              safeZoneX + safeZoneW * 0.73
#define KP_GUI_POS_X_AREA               safeZoneX + safeZoneW * 0.25
#define KP_GUI_POS_X_AREA_R             safeZoneX + safeZoneW * (0.25 + (0.5 - KP_GUI_SPACING_X) / 2 + KP_GUI_SPACING_X)
#define KP_GUI_POS_X_CONTENT            safeZoneX + safeZoneW * (0.25 + KP_GUI_SPACING_X)
#define KP_GUI_POS_X_B1                 safeZoneX + safeZoneW * 0.25
#define KP_GUI_POS_X_B2                 safeZoneX + safeZoneW * (0.25 + KP_GUI_WIDTH_BUTTON + KP_GUI_SPACING_X)
#define KP_GUI_POS_X_B3                 safeZoneX + safeZoneW * (0.25 + 2 * (KP_GUI_WIDTH_BUTTON + KP_GUI_SPACING_X))
#define KP_GUI_POS_X_B4                 safeZoneX + safeZoneW * (0.25 + 3 * (KP_GUI_WIDTH_BUTTON + KP_GUI_SPACING_X))

#define KP_GUI_POS_Y                    safeZoneY + safeZoneH * 0.2
#define KP_GUI_POS_Y_CROSS              safeZoneY + safeZoneH * 0.205
#define KP_GUI_POS_Y_AREA               safeZoneY + safeZoneH * (0.2 + KP_GUI_HEIGTH_TITLE + KP_GUI_SPACING_Y)
#define KP_GUI_POS_Y_CONTENT            safeZoneY + safeZoneH * (0.2 + KP_GUI_HEIGTH_TITLE + 2 * KP_GUI_SPACING_Y)
#define KP_GUI_POS_Y_B                  safeZoneY + safeZoneH * (0.8 - KP_GUI_HEIGTH_BUTTON)

#define KP_GUI_WIDTH                    safeZoneW * 0.5
#define KP_GUI_WIDTH_AREA               safeZoneW * 0.5
#define KP_GUI_WIDTH_AREA_2             safeZoneW * ((0.5 - KP_GUI_SPACING_X) / 2)
#define KP_GUI_WIDTH_CONTENT            safeZoneW * (0.5 - 2 * KP_GUI_SPACING_X)
#define KP_GUI_WIDTH_B                  safeZoneW * KP_GUI_WIDTH_BUTTON

#define KP_GUI_HEIGHT_AREA              safeZoneH * (0.6 - KP_GUI_HEIGTH_TITLE - KP_GUI_HEIGTH_BUTTON - 2 * KP_GUI_SPACING_Y)
#define KP_GUI_HEIGHT_CONTENT           safeZoneH * (0.6 - KP_GUI_HEIGTH_TITLE - KP_GUI_HEIGTH_BUTTON - 4 * KP_GUI_SPACING_Y)
#define KP_GUI_HEIGHT_B                 safezoneH * KP_GUI_HEIGTH_BUTTON

// Title bar
class KP_DialogTitle: KP_Title {
    x = KP_GUI_POS_X;
    y = KP_GUI_POS_Y;
    w = KP_GUI_WIDTH;
};

// Cross symbol
class KP_DialogCross: KP_CloseCross {
    x = KP_GUI_POS_X_CROSS;
    y = KP_GUI_POS_Y_CROSS;
};

// Background
class KP_DialogBackground: KP_Background {
    x = KP_GUI_POS_X_AREA;
    y = KP_GUI_POS_Y_AREA;
    w = KP_GUI_WIDTH_AREA;
    h = KP_GUI_HEIGHT_AREA;
};

// Background left
class KP_DialogBackgroundLeft: KP_Background {
    x = KP_GUI_POS_X_AREA;
    y = KP_GUI_POS_Y_AREA;
    w = KP_GUI_WIDTH_AREA_2;
    h = KP_GUI_HEIGHT_AREA;
};

// Background right
class KP_DialogBackgroundRight: KP_Background {
    x = KP_GUI_POS_X_AREA_R;
    y = KP_GUI_POS_Y_AREA;
    w = KP_GUI_WIDTH_AREA_2;
    h = KP_GUI_HEIGHT_AREA;
};

// Button pos 1
class KP_DialogButtonS1: KP_Button {
    x = KP_GUI_POS_X_B1;
    y = KP_GUI_POS_Y_B;
    w = KP_GUI_WIDTH_B;
    h = KP_GUI_HEIGHT_B;
};

// Button pos 2
class KP_DialogButtonS2: KP_DialogButtonS1 {
    x = KP_GUI_POS_X_B2;
};

// Button pos 3
class KP_DialogButtonS3: KP_DialogButtonS1 {
    x = KP_GUI_POS_X_B3;
};

// Button pos 4
class KP_DialogButtonS4: KP_DialogButtonS1 {
    x = KP_GUI_POS_X_B4;
};

// Large
#define KP_GUI_POS_X_LARGE              safeZoneX + safeZoneW * 0.15
#define KP_GUI_POS_Y_LARGE              safeZoneY + safeZoneH * 0.15
#define KP_GUI_WIDTH_LARGE              safeZoneW * 0.7
#define KP_GUI_POS_X_CROSS_LARGE        safeZoneX + safeZoneW * 0.83
#define KP_GUI_POS_Y_CROSS_LARGE        safeZoneY + safeZoneH * 0.155
#define KP_GUI_POS_X_AREA_LARGE         safeZoneX + safeZoneW * 0.15
#define KP_GUI_POS_Y_AREA_LARGE         safeZoneY + safeZoneH * (0.15 + KP_GUI_HEIGTH_TITLE + KP_GUI_SPACING_Y)
#define KP_GUI_WIDTH_AREA_LARGE         safeZoneW * 0.7
#define KP_GUI_HEIGHT_AREA_LARGE        safeZoneH * (0.7 - KP_GUI_HEIGTH_TITLE - KP_GUI_SPACING_Y)
#define KP_GUI_POS_X_CONTENT_LARGE      safeZoneX + safeZoneW * (0.15 + KP_GUI_SPACING_X)
#define KP_GUI_POS_Y_CONTENT_LARGE      safeZoneY + safeZoneH * (0.15 + KP_GUI_HEIGTH_TITLE + 2 * KP_GUI_SPACING_Y)
#define KP_GUI_WIDTH_CONTENT_LARGE      safeZoneW * (0.7 - 2 * KP_GUI_SPACING_X)

// Upper left corner
#define KP_GUI_POS_X_CORNER             safeZoneX + safeZoneW * 0.035
#define KP_GUI_POS_Y_CORNER             safeZoneY + safeZoneH * 0.05
#define KP_GUI_WIDTH_CORNER             safeZoneW * 0.25
#define KP_GUI_POS_X_CROSS_CORNER       safeZoneX + safeZoneW * 0.265
#define KP_GUI_POS_Y_CROSS_CORNER       safeZoneY + safeZoneH * 0.055
#define KP_GUI_POS_X_AREA_CORNER        safeZoneX + safeZoneW * 0.035
#define KP_GUI_POS_Y_AREA_CORNER        safeZoneY + safeZoneH * (0.05 + KP_GUI_HEIGTH_TITLE + KP_GUI_SPACING_Y)
#define KP_GUI_WIDTH_AREA_CORNER        safeZoneW * 0.25
#define KP_GUI_HEIGHT_AREA_CORNER       safeZoneH * (0.75 - KP_GUI_HEIGTH_TITLE - KP_GUI_SPACING_Y)
#define KP_GUI_POS_X_CONTENT_CORNER     safeZoneX + safeZoneW * (0.035 + KP_GUI_SPACING_X)
#define KP_GUI_POS_Y_CONTENT_CORNER     safeZoneY + safeZoneH * (0.05 + KP_GUI_HEIGTH_TITLE + 2 * KP_GUI_SPACING_Y)
#define KP_GUI_WIDTH_CONTENT_CORNER     safeZoneW * (0.25 - 2 * KP_GUI_SPACING_X)

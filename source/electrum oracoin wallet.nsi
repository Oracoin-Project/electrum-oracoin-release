;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Electrum Oracoin Wallet"
  OutFile "dist/electrum-oracoin-setup.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\Electrum Oracoin Wallet"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Electrum Oracoin Wallet" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Variables

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  ;!insertmacro MUI_PAGE_LICENSE "tmp/LICENCE"
  ;!insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY

  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Electrum Oracoin Wallet"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

  ;!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  file /r dist\electrum-oracoin\*.*

  ;Store installation folder
  WriteRegStr HKCU "Software\Electrum Oracoin Wallet" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"


  CreateShortCut "$DESKTOP\Electrum Oracoin Wallet.lnk" "$INSTDIR\electrum-oracoin.exe" ""

  ;create start-menu items
  CreateDirectory "$SMPROGRAMS\Electrum Oracoin Wallet"
  CreateShortCut "$SMPROGRAMS\Electrum Oracoin Wallet\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\Electrum Oracoin Wallet\Electrum Oracoin Wallet.lnk" "$INSTDIR\electrum-oracoin.exe" "" "$INSTDIR\electrum-oracoin.exe" 0

SectionEnd

;--------------------------------
;Descriptions

  ;Assign language strings to sections
  ;!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  ;  !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  ;!insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  RMDir /r "$INSTDIR\*.*"

  RMDir "$INSTDIR"

  Delete "$DESKTOP\Electrum Oracoin Wallet.lnk"
  Delete "$SMPROGRAMS\Electrum Oracoin Wallet\*.*"
  RmDir  "$SMPROGRAMS\Electrum Oracoin Wallet"

  DeleteRegKey /ifempty HKCU "Software\Electrum Oracoin Wallet"

SectionEnd

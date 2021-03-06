﻿; Copyright (C) 2020  ManlyMarco
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;--------------------------------------------Full game name for naming patch itself and desktop icons
#define NAME "AI-Shoujo"
;----------------------------------------------------------------------------Current HF Patch version
#define VERSION "2.2"
;----------------------------------------------------------------------------------------------------
#include "_Common\Header.iss"

[Setup]
AppName=HF Patch for AI-Syoujyo and AI-Shoujo
OutputBaseFilename=AI-Shoujo HF Patch v{#VERSION}
ArchitecturesInstallIn64BitMode=x64
CloseApplications=yes
RestartApplications=no
CloseApplicationsFilter=*.exe,*.dll
Compression=lzma2/ultra64
;lzma2/ultra64 | zip | lzma2/fast
LZMAUseSeparateProcess=yes
;LZMADictionarySize=208576
LZMADictionarySize=208576
LZMANumFastBytes=273
LZMANumBlockThreads=5
DiskSpanning=yes
DefaultDirName=C:\Illusion\AI-Syoujyo

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "sc"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

#include "Translations.iss"

[Types]
Name: "full_en";  Description: "{cm:fullInstall}"; Languages: en;
Name: "full";     Description: "{cm:fullInstall}"; Languages: jp sc;
Name: "extra_en"; Description: "{cm:extraInstall}"; Languages: en;
Name: "extra";    Description: "{cm:extraInstall}"; Languages: jp sc;
Name: "bare";     Description: "{cm:bareInstall}"
Name: "none";     Description: "{cm:noneInstall}"
Name: "custom";   Description: "{cm:customInstall}"; Flags: iscustom

#define CurrentDate GetDateTimeString('yyyy-mm-dd', '-', ':');

[Components]
Name: "Patch";                                 Description: "All free updates up to 2020-07-03 + game repair"                                      ; Types: full_en full extra_en extra custom bare none; Flags: fixed
Name: "BepInEx";                               Description: "BepInEx v5.3 Plugin framework + MessageCenter v1.1.1 + ConfigurationManager v16.1"    ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "BepInEx\Dev";                           Description: "{cm:CompDev}"                                                                         
Name: "KKManager";                             Description: "KKManager v0.14.3 (Manage and update mods)"                                           ; Types: full_en full extra extra_en custom bare; Flags: fixed
Name: "Modpack";                               Description: "Sideloader Modpacks {#CurrentDate} (Add additional content to the game, needs at least BepisPlugins to work)"
Name: "Modpack\General";                       Description: "General (Content for making characters, always recommended)"                          ; Types: full_en full extra_en extra
; Name: "Modpack\Fixes"                        ; Description: "Fixes (Fixes to some of the official content, always recommended)"                    ; Types: full_en full extra_en extra
; Name: "Modpack\Studio"                       ; Description: "Studio (Additional content for making Studio scenes)"                                 ; Types: full_en full extra_en extra
; Name: "Modpack\Animations"                   ; Description: "Animations (Additional adnimations for use in Studio and Free H)"                     ; Types: full_en full extra_en extra
; Name: "Modpack\Maps"                         ; Description: "Maps (Additional maps for use in Studio and H scenes)"                                ; Types: full_en full extra_en extra
Name: "Modpack\MaterialEditor";                Description: "KK_MaterialEditor (Materials for use with MaterialEditor)"                            ; Types: full_en full extra_en extra
Name: "Modpack\UncensorSelector";              Description: "KK_UncensorSelector (Uncensors for use with UncensorSelector)"                        ; Types: full_en full extra_en extra
Name: "Launcher";                              Description: "IllusionLaunchers v2.1.1 (Multilangual launcher)"                                     ; Types: full_en full extra extra_en custom

[Files]
Source: "HelperLib.dll";                                    DestDir: "{app}"; Flags: dontcopy
Source: "Input\start.bat";                                  DestDir: "{tmp}\hfp"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "Input\DirectX\Jun2010\*";                          DestDir: "{tmp}\hfp\DirectXRedist2010"; Flags: ignoreversion recursesubdirs createallsubdirs deleteafterinstall; Check: DirectXRedistNeedsInstall
Source: "Plugin Readme.md";                                 DestDir: "{app}"
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_Patch\empty_ud\*";                          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs solidbreak; Components: Patch
Source: "Input\_Patch\empty_ud_eng\*";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch; Languages: en
Source: "Input\_Patch\2020-08-14-all_common\*";             DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch
Source: "Input\_Patch\2020-08-14-all_jp\*";                 DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: not IsSteam
Source: "Input\_Patch\2020-08-14-all_steam\*";              DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\steam_StudioCompat\*";                DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: IsSteam
Source: "Input\_Patch\0501-steam_ect\*";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Patch; Check: IsSteam
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack\*";  DestDir: "{app}\mods\Sideloader Modpack"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\General
Source: "D:\Games\AI-Shoujo_jp\mods\Sideloader Modpack - Exclusive AIS\*"; DestDir: "{app}\mods\Sideloader Modpack - Exclusive AIS"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\General
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Bleeding Edge\*"  ; DestDir: "{app}\mods\Sideloader Modpack - Bleeding Edge"  ; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\Bleeding
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Studio\*"         ; DestDir: "{app}\mods\Sideloader Modpack - Studio"         ; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\Studio
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Maps\*"           ; DestDir: "{app}\mods\Sideloader Modpack - Maps"           ; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\Maps
; Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Maps (HS2 Game)\*"; DestDir: "{app}\mods\Sideloader Modpack - Maps (HS2 Game)"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\Maps
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - MaterialEditor Shaders\*"; DestDir: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\MaterialEditor
Source: "E:\Games\HoneySelect2\mods\Sideloader Modpack - Uncensor Selector\*"; DestDir: "{app}\mods\Sideloader Modpack - Uncensor Selector"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Modpack\UncensorSelector
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\BepInEx_x64\*";                              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx
Source: "Input\BepInEx_Essentials\*";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx
Source: "Input\BepInEx_Dev\*";                              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: BepInEx\Dev
Source: "Input\KKManager\*";                                DestDir: "{app}\[UTILITY] KKManager\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: KKManager
Source: "Input\_Plugins\AI_UncensorSelector Base.zipmod";   DestDir: "{app}\mods"; Flags: ignoreversion; Components: UNC\Selector
; Always install critical fixes
Source: "Input\_Plugins\_out\IllusionFixes_AIGirl\BepInEx\patchers\*"; DestDir: "{app}\BepInEx\patchers"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Patch
Source: "Input\_Misc\save.ila";                             DestDir: "{app}\UserData\save\"; Flags: ignoreversion recursesubdirs; Components: MISC\FullSave
; -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Source: "Input\_TL\AI-Girl-Translations-master\*";          DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator\EnglishTranslation; Check: not IsSteam
Source: "Input\_TL\AI-Girl-Translations-master_steam\*";    DestDir: "{app}\BepInEx"; Flags: ignoreversion recursesubdirs; Components: TL\AutoTranslator\EnglishTranslation; Check: IsSteam
Source: "Input\_TL\_lang jp\*";                             DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: jp
Source: "Input\_TL\_lang ch\*";                             DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: sc
Source: "Input\_TL\_lang eng\*";                            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Languages: en
Source: "Input\Launcher_jp\*";                              DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Launcher; Check: not IsSteam
Source: "Input\Launcher_steam\*";                           DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: Launcher; Check: IsSteam

#include "components.iss"

[InstallDelete]
; Clean up old translations
Type: filesandordirs; Name: "{app}\BepInEx\translation"; Components: TL\AutoTranslator\EnglishTranslation
Type: files; Name: "{app}\InitSetting.exe"
Type: files; Name: "{app}\InitSetting.exe.config"
Type: files; Name: "{app}\Initial Settings.exe"
Type: files; Name: "{app}\Initial Settings.exe.config"                     
Type: filesandordirs; Name: "{app}\UserData\LauncherEN"; Components: Launcher
; Used by stock launcher in steam release, remove to declutter if using custom launcher
Type: filesandordirs; Name: "{app}\ja-JP"; Components: Launcher   
Type: filesandordirs; Name: "{app}\zh-CN"; Components: Launcher
Type: filesandordirs; Name: "{app}\zh-TW"; Components: Launcher

; Clean up old modpacks. Large modpacks might not be fully included so don't remove here, instead they get cleaned up from old versions later
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack"                       ; Components: Content\Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Bleeding Edge"       ; Components: Content\Modpack
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Maps"                ; Components: Content\ModpackMaps
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - MaterialEditor Shaders" ; Components: Content\HS2_MaterialEditor
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Studio"              ; Components: Content\ModpackStudio
;Type: filesandordirs; Name: "{app}\mods\Sideloader Modpack - Uncensor Selector"   ; Components: UNC\Selector\Pack

; Clean up old patches and packs
Type: files; Name: "{app}\start.bat"
Type: files; Name: "{app}\desktop.ini"
Type: files; Name: "{app}\*.ico"
Type: files; Name: "{app}\[BR]*"

; Always not necessary
Type: files; Name: "{app}\0Harmony.dll"
Type: files; Name: "{app}\BepInEx.dll"
Type: files; Name: "{app}\Mono.Cecil.dll"

; Junk
Type: filesandordirs; Name: "{app}\BepInEx\bepinex4_backup"
Type: filesandordirs; Name: "{app}\BepInEx\cache"
Type: filesandordirs; Name: "{app}\temp"
Type: files; Name: "{app}\README.*"
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\*.pdb"
Type: files; Name: "{app}\changelog.txt"
Type: files; Name: "{app}\HF_Patch_log.txt"
Type: files; Name: "{app}\output_log.txt"
Type: files; Name: "{app}\AI-Syoujyo_Data\output_log.txt"
Type: files; Name: "{app}\AI-Shoujo_Data\output_log.txt"
; Yikes, someone extracted a sideloader mod...
Type: files; Name: "{app}\manifest.xml"

; Just in case. Also resets any hash caches
Type: filesandordirs; Name: "{app}\[UTILITY] KKManager"; Components: KKManager
Type: filesandordirs; Name: "{app}\temp"

; Will get replaced, makes sure there are no stale files left
Type: filesandordirs; Name: "{app}\BepInEx\cache"; Components: BepInEx
Type: filesandordirs; Name: "{app}\BepInEx\core"; Components: BepInEx
Type: files; Name: "{app}\BepInEx.Patcher.exe"; Components: BepInEx
Type: files; Name: "{app}\version.dll"; Components: BepInEx
Type: files; Name: "{app}\winhttp.dll"; Components: BepInEx
Type: files; Name: "{app}\doorstop_config.ini"; Components: BepInEx

; Potentially incompatible, outdated or buggy plugins
Type: files; Name: "{app}\BepInEx\plugins\Heelz.dll"; Check: IsSteam
Type: files; Name: "{app}\BepInEx\plugins\PushUpAI.dll"; Check: IsSteam

; Prevent both disabled and enabled dlls existing at the same time, they will get restored later
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dll"
Type: files; Name: "{app}\BepInEx\plugins\DHH_AI4.dl_"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dll"
Type: files; Name: "{app}\BepInEx\plugins\Graphics\Graphics.dl_"

; Clean dlls completely to fix problems with copied/unnecessary/old dlls. All dlls are included in the patch data
Type: filesandordirs; Name: "{app}\AI-Syoujyo_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\AI-Shoujo_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\StudioNEOV2_Data\Managed"; Components: Patch
Type: filesandordirs; Name: "{app}\MonoBleedingEdge"; Components: Patch

[Tasks]
Name: desktopicon; Description: "{cm:TaskIcon}"; Flags: unchecked
Name: delete; Description: "{cm:TaskDelete}";
Name: delete\Sidemods; Description: "{cm:TaskDeleteSide}"
Name: delete\Plugins; Description: "{cm:TaskDeletePlugins}";
Name: delete\Config; Description: "{cm:TaskDeletePluginSettings}"; Flags: unchecked
Name: delete\scripts; Description: "Delete old scripts"
;Name: delete\Listfiles; Description: "{cm:TaskDeleteLst}"
Name: fixSideloaderDupes; Description: "{cm:TaskSideDupes}";

[Icons]
Name: "{userdesktop}\{cm:IconGame}"; Filename: "{app}\InitSetting.exe"; IconFilename: "{app}\InitSetting.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"
Name: "{userdesktop}\AI-Shoujo"; Filename: "{app}\Initial Settings.exe"; IconFilename: "{app}\Initial Settings.exe"; WorkingDir: "{app}\"; Flags: createonlyiffileexists; Tasks: desktopicon; Comment: "{cm:IconGame}"

[Run]
Filename: "{tmp}\hfp\DirectXRedist2010\DXSETUP.exe"; Parameters: "/silent"; Description: "Installing DirectX redistributables"; Flags: skipifdoesntexist runascurrentuser

Filename: "{tmp}\hfp\start.bat"; Parameters: """{app}"""; Description: "{cm:RunGame}"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist

Filename: "notepad.exe"; Parameters: """{app}\Plugin Readme.md"""; Description: "Show information about included plugins"; Flags: postinstall runasoriginaluser nowait skipifsilent skipifdoesntexist unchecked

Filename: "https://wiki.anime-sharing.com/hgames/index.php?title=AI_Syoujyo"; Description: "{cm:RunWiki}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent
Filename: "https://discord.gg/F3bDEFE"; Description: "{cm:RunDiscord}"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

Filename: "{app}\[UTILITY] KKManager\StandaloneUpdater.exe"; Parameters: """{app}"""; Description: "{cm:StartUpdate}"; Flags: postinstall runascurrentuser unchecked nowait skipifsilent skipifdoesntexist

Filename: "https://github.com/ManlyMarco/AI-HF_Patch"; Description: "Latest releases and source code"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent

Filename: "https://www.patreon.com/ManlyMarco"; Description: "ManlyMarco Patreon (Creator of this patch)"; Flags: shellexec runasoriginaluser postinstall unchecked nowait skipifsilent;

[Code]
procedure CreateBackup(path: String);
external 'CreateBackup@files:HelperLib.dll stdcall';

procedure FixConfig(path: String);
external 'FixConfig@files:HelperLib.dll stdcall';

procedure PostInstallCleanUp(path: String);
external 'PostInstallCleanUp@files:HelperLib.dll stdcall';

procedure WriteVersionFile(path, version: String);
external 'WriteVersionFile@files:HelperLib.dll stdcall';

procedure SetConfigDefaults(path: String);
external 'SetConfigDefaults@files:HelperLib.dll stdcall';

procedure FixPermissions(path: String);
external 'FixPermissions@files:HelperLib.dll stdcall';

procedure RemoveJapaneseCards(path: String);
external 'RemoveJapaneseCards@files:HelperLib.dll stdcall';

procedure RemoveNonstandardListfiles(path: String);
external 'RemoveNonstandardListfiles@files:HelperLib.dll stdcall';

procedure RemoveSideloaderDuplicates(path: String);
external 'RemoveSideloaderDuplicates@files:HelperLib.dll stdcall';

procedure RemoveModsExceptModpacks(path: String);
external 'RemoveModsExceptModpacks@files:HelperLib.dll stdcall';

function IsSteam(): Boolean;
begin
  Result := FileExists(ExpandConstant('{app}\AI-Shoujo.exe'));
end;

function DirectXRedistNeedsInstall(): Boolean;
begin
  Result := not RegKeyExists(HKLM, 'SOFTWARE\WOW6432Node\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010')
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
  begin
    // If garbage plugins are detected, delete all old mods by default
    if(FileExists(ExpandConstant('{app}\BepInEx\config\EC.Core.Fixes.MakerFPS.cfg')) or FileExists(ExpandConstant('{app}\BepInEx\CardCacher.dll')) or FileExists(ExpandConstant('{app}\BepInEx\0Harmony.dll')) or FileExists(ExpandConstant('{app}\BepInEx\TexResPatch.dll')) or FileExists(ExpandConstant('{app}\BepInEx\KK_GUIDMigration.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Sideloader.dll')) or FileExists(ExpandConstant('{app}\BepInEx\Assembly-CSharp.dll'))) then
    begin
      WizardForm.TasksList.CheckItem(WizardForm.TasksList.Items.Count - 6, coCheckWithChildren);
    end;
    
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  // allow the setup turning to the next page
  Result := True;

  if (CurPageID = wpSelectDir) then
  begin
    if ((not FileExists(ExpandConstant('{app}\AI-Syoujyo_Data\resources.assets'))) and (not FileExists(ExpandConstant('{app}\AI-Shoujo_Data\resources.assets')))) then
    begin
      if(SuppressibleMsgBox(ExpandConstant('{cm:MsgExeNotFound}'), mbError, MB_YESNO, 0) = IDNO) then
        Result := False;
    end;
    
    if Result = True then
    begin
      if (Length(ExpandConstant('{app}')) > 100) then
      begin
        MsgBox(ExpandConstant('{cm:MsgDeepPath}'), mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if (Pos(LowerCase(ExpandConstant('{app}\')), LowerCase(ExpandConstant('{src}\'))) > 0) then
      begin
        MsgBox('This patch is inside of the game directory you are attempting to install to. You have to move the patch files outside of the game directory and try again.', mbError, MB_OK);
        Result := False;
      end
    end;

    if Result = True then
    begin
      if (FileExists(ExpandConstant('{app}\EmotionCreators.exe')) 
      or FileExists(ExpandConstant('{app}\Koikatu.exe')) 
      or FileExists(ExpandConstant('{app}\Koikatsu Party.exe')) 
      or FileExists(ExpandConstant('{app}\PlayHome.exe')) 
      or FileExists(ExpandConstant('{app}\HoneySelect2.exe'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgDifferentGameDetected}'), mbError, MB_OK);
        Result := False;
      end
    end;
    
    if Result = True then
    begin
      // Check for file corruptions
      if (not FileExists(ExpandConstant('{app}\abdata\sound\setting\object\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\sound3dsettingdata\00.unity3d')) or not FileExists(ExpandConstant('{app}\abdata\sound\setting\soundsettingdata\00.unity3d'))) then
      begin
        MsgBox(ExpandConstant('{cm:MsgMissingGameFiles}'), mbError, MB_OK);
        Result := False;
      end;
    end;
    
    if Result = True then
    begin
      // Check for extracted zipmods
      if FileExists(ExpandConstant('{app}\manifest.xml')) then
      begin
        SuppressibleMsgBox(ExpandConstant('{cm:MsgExtractedZipmod}'), mbError, MB_OK, 0);
      end;
    end;
  end;

  // After install completes
  if (CurPageID = wpFinished) then
  begin
    // Delete Japanese versions of cards and bgs if English versions are installed (only those with different names)
    //if IsComponentSelected('AT\TL\EnglishTranslation\UserData') then
    //    RemoveJapaneseCards(ExpandConstant('{app}'));
    
    // Always clean up sideloader mods in case user already messed up
    if IsTaskSelected('fixSideloaderDupes') then
        RemoveSideloaderDuplicates(ExpandConstant('{app}'));
        
    FixConfig(ExpandConstant('{app}'));
    WriteVersionFile(ExpandConstant('{app}'), '{#VERSION}');

    // Always turn these off just to be safe, user can turn them back on in launcher
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dll'), ExpandConstant('{app}\BepInEx\plugins\DHH_AI4.dl_'));
    if(FileExists(ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dll'))) then
      RenameFile(ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dll'), ExpandConstant('{app}\BepInEx\plugins\Graphics\Graphics.dl_'));
      
    // Prevent trying to install the redist again
    Exec('reg', 'add HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\Apps\CommonRedist\DirectX\Jun2010 /v dxsetup /t REG_DWORD /d 1 /f /reg:32', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    
    PostInstallCleanUp(ExpandConstant('{app}'));
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ResultCode: Integer;
begin
  NeedsRestart := false;
  try
    // Close the game if it's running
    Exec('taskkill', '/F /IM StudioNEOV2.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM AI-Syoujyo.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM AI-Shoujo.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM InitSetting.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM Initial Settings.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM BepInEx.Patcher.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM KKManager.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Exec('taskkill', '/F /IM StandaloneUpdater.exe', ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Fix file permissions
    //Exec('takeown', ExpandConstant('/f "{app}" /r /SKIPSL /d y'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    //Exec('icacls', ExpandConstant('"{app}" /grant everyone:F /t /c /l'), ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);
    FixPermissions(ExpandConstant('{app}'));
  except
    ShowExceptionMessage();
  end;
  
  CreateBackup(ExpandConstant('{app}'));
  
  // Backup plugin settings
  if (not IsTaskSelected('delete\Config') and FileExists(ExpandConstant('{app}\BepInEx\config.ini'))) then
    FileCopy(ExpandConstant('{app}\BepInEx\config.ini'), ExpandConstant('{app}\config.ini'), false);
  
  // Remove BepInEx folder
  if (IsTaskSelected('delete\Config') and IsTaskSelected('delete\Plugins')) then begin
    DelTree(ExpandConstant('{app}\BepInEx'), True, True, True);
  end
  else
  begin
    // Or only remove plugins
    if (IsTaskSelected('delete\Plugins')) then begin
      DelTree(ExpandConstant('{app}\BepInEx\plugins'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\patchers'), True, True, True);
      DelTree(ExpandConstant('{app}\BepInEx\IPA'), True, True, True);
      DelTree(ExpandConstant('{app}\scripts'), True, True, True);
      Exec(ExpandConstant('{cmd}'), '/c del *.dll', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
      Exec(ExpandConstant('{cmd}'), '/c del *.dl_', ExpandConstant('{app}\BepInEx'), SW_SHOW, ewWaitUntilTerminated, ResultCode);
    end;
  end;
  
  if (not IsTaskSelected('delete\Config')) then
  begin
    // Restore the settings and remove the backup
    CreateDir(ExpandConstant('{app}\BepInEx'));
    if(FileExists(ExpandConstant('{app}\config.ini'))) then
    begin
      FileCopy(ExpandConstant('{app}\config.ini'), ExpandConstant('{app}\BepInEx\config.ini'), false);
      DeleteFile(ExpandConstant('{app}\config.ini'));
    end;
  end
  else
  begin
    // Or remove settings
    DeleteFile(ExpandConstant('{app}\BepInEx\config.ini'));
  end;
    
  if (IsTaskSelected('delete\Sidemods')) then
    RemoveModsExceptModpacks(ExpandConstant('{app}'));
    
  //if (IsTaskSelected('delete\Listfiles')) then
  //  RemoveNonstandardListfiles(ExpandConstant('{app}'));
    
  if (IsTaskSelected('delete\scripts')) then
    DelTree(ExpandConstant('{app}\scripts'), True, True, True);
    
  SetConfigDefaults(ExpandConstant('{app}'));
end;
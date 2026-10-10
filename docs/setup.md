# Installation and compatibility notes

This guide describes the recorded **Windows / GOG / Remastered 5.0** setup.
The executable version was `5.0.0.1044392` on the snapshot date, October 4, 2026.
A GOG game patch on October 8, 2026 updated it to `5.0.0.1048522`; see [the October 8 game patch](#october-8-2026-game-patch).
VAXIS's ULTRA Plus Blood Physics standard 1.2 was added to the record on October 6, 2026; the earlier inventory was not rechecked in full.
Paths below are relative to the game installation unless specified otherwise.

## Before installation

1. Back up saves and settings from `Documents/The Witcher 3`.
2. Close the game before changing files.
3. Select the Remastered release where a download offers multiple game versions.
4. Keep only one installed copy of each mod, from one installation channel.

Version labels matter: a download for Next-Gen 4.04 is not automatically suitable for Remastered 5.0.
CD PROJEKT RED identifies scripts, XML, and string files as affected by the Remastered update.
See its [mod support guide](https://support.cdprojektred.com/en/witcher-3/pc/gameplay/issue/3001/cross-platform-mod-support-how-to).

## Manual installations

Start with Sharedutils and Brothers In Arms, then add the other mods and their required files.
This is an installation sequence; it does not establish a universal conflict priority.

Copy each archive's folders into the matching game folders.
Preserve their names and structure: `mods/<mod>/content`, `dlc/<dlc>/content`, and any supplied `bin` paths.
For an archive with loose `mod...` and `dlc...` folders, place them inside `mods` and `dlc` respectively.

| Mod | Required installed locations |
| --- | --- |
| Sharedutils | `mods/modzzz_sharedutils`, `dlc/dlcsharedutils` |
| Brothers In Arms | `mods/modbrothersinarms`, `dlc/dlcbrothersinarms`, menu `BrothersInArms.xml` |
| Dynamic Appearances Project | `mods/moddynamicappearancesprojectremastered-bia`, `dlc/dlcdynamicapp` |
| Light Rewrite | `mods/modLightRewrite`, `dlc/dlclightrewrite`, menu `LightRewrite.xml` |
| A Proper Send-off | `mods/moddandelionsballad`, `dlc/dlcdandelionjh1` |
| A Witcher Can Hide Another | `mods/modAWitcherCanHideAnother`, `dlc/dlcAWitcherCanHideAnother`; input bindings in the Documents settings |
| VAXIS's ULTRA Plus Blood Physics | `mods/modULTRAplussVaxisBlood`, menu `modULTRAplussVaxisBlood.xml` |
| PT Optimization | `bin/x64_dx12/xinput9_1_0.dll`, `bin/config/platform/pc/RTOptimization.ini`, menu `pt_optimization.xml` |

The menu XML directory is `bin/config/r4game/user_config_matrix/pc`.
Keep the supplied XML files for this Remastered setup.
Remastered loads mod menus without the older DX11/DX12 file-list step.
See the [Remastered menu explanation](https://www.nexusmods.com/witcher3/mods/12933?tab=posts).

### Brothers In Arms and Sharedutils

Use the [Remastered Brothers In Arms files](https://www.nexusmods.com/witcher3/mods/11260?tab=files) and [Sharedutils All-In-One 4.1](https://www.nexusmods.com/witcher3/mods/12997?tab=files).
Missing Sharedutils can cause inheritance errors such as `SU_MenuDescriptor`.
Check both Sharedutils folders before attempting unrelated script changes.

The October 4 snapshot recorded Brothers In Arms 4.0.1.
Release 4.0.3 (uploaded October 4) replaced it later that day; its `info.json` reports `4.0.2`.
The author released 4.0.4 on October 8, 2026, the same day as the game patch.
Brothers In Arms 4.0.4 and Sharedutils 4.1 were installed on October 10, 2026.
Follow the author's upgrade instructions when moving from an older installation.
The Started Playthrough Patch applies only to saves previously played with Brothers In Arms: Ultimate Edition below 4.0.
Do not add it to a new game or a first-time installation.

#### Updating Brothers In Arms to 4.0.4

On the patched executable (`5.0.0.1048522`) with 4.0.3 installed, reading the *Lands of North Velen* book crashed the game with an access violation (`0xc0000005`) in `witcher3.exe`.
The crash dump shows a stale object reference being released during script execution; no mod DLL is on the crashing stack.
Brothers In Arms wraps two book-reading methods of `CInventoryComponent`, `UpdateInitialReadState` and `AddBestiaryFromBook`, which add and remove glossary items while a book is read.
The game patch changed `inventoryComponent.ws`; in the patched file, `ReadBook` calls `ReadBookByNameId`, which calls `AddBestiaryFromBook`.
Brothers In Arms 4.0.3 ships precompiled scripts (`precompiled.rsblob`) installed on October 4, before that patch.
The crash dump alone could not prove this cause, but updating Brothers In Arms fixed the crash.

To update:

1. Back up `mods/modbrothersinarms`, `dlc/dlcbrothersinarms`, and `Documents/The Witcher 3/mods.settings`.
2. Delete both old folders before installing, so no stale files remain.
3. Install the [4.0.4 Remastered main file](https://www.nexusmods.com/witcher3/mods/11260?tab=files) with its menu file.
4. Confirm that Dynamic Appearances Project still has priority over Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority).
5. Load a save from before the crash and read *Lands of North Velen* again.

The update was applied on October 10, 2026, together with Sharedutils 4.1.
All 75 files of the 4.0.4 archive match the installed files by SHA-256, and no extra files remain in the mod and DLC folders.
The player confirmed that reading *Lands of North Velen* no longer crashes.
The 4.0.4 changelog was not checked.

### Animations, appearances, and lighting

- **Complete Animations Redux:** removed on October 7, 2026 and no longer part of this list. Its leftover inventory props break saves; see [why it was removed](complete-animations-redux.md).
- **Dynamic Appearances Project:** use the [BiA-compatible Remastered main file](https://www.nexusmods.com/witcher3/mods/9219?tab=files) (3.0b). The author says this variant needs no extra BiA patch. Install one main variant only. It must have priority over Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority). Its presence here does not prove complete 5.0 compatibility.
- **Light Rewrite:** copy the complete archive. Its [release notes](https://github.com/webspam/LightRewrite/releases) describe the Remastered lighting changes; the installed release is 0.19.1. The Shared Imports requirement in older 4.04 instructions does not apply to the Remastered instructions.

#### Upgrading Dynamic Appearances Project to 3.0b

Release 3.0b renamed its mod folder: 2.1.1 used `mods/moddynamicappearancesproject`, and 3.0b uses `mods/moddynamicappearancesprojectremastered-bia`.
Both releases use the same DLC folder, `dlc/dlcdynamicapp`.
Extracting 3.0b over 2.1.1 therefore replaces the DLC files but leaves the old mod folder installed beside the new one.

Do not leave both folders installed: the 2.1.1 folder sorts first and can take priority with character files written for the 2.1.1 DLC.

To upgrade:

1. Close the game. Never add, remove, or move mod files while it is running.
2. Delete `mods/moddynamicappearancesproject`.
3. Install the 3.0b archive, replacing `dlc/dlcdynamicapp`.
4. Confirm that `mods` contains only `moddynamicappearancesprojectremastered-bia` for this mod.
5. Give it priority over Brothers In Arms, as described below.

The first launch after the cleanup crashed once while loading a save made with both folders installed; the same save loaded on the next attempt.
If a save keeps crashing, load an earlier one.

#### Brothers In Arms priority

Brothers In Arms and Dynamic Appearances Project both replace Keira Metz's character files, including `quests\secondary_npcs\keira_metz.w2ent` and `characters\npc_entities\main_npc\keira_metz.w2ent`.
Only one copy of each file is used.

Dynamic Appearances Project adds new appearances to those files, such as `__q104__keira_metz`, and its replacement `keira_metz.w2comm` community file uses that appearance after Keira's bath in Wandering in the Dark.
The Brothers In Arms copy of the character file has only the vanilla appearances.
When Brothers In Arms won, the game requested an appearance that did not exist, and Keira stayed in her bath appearance (`naked_wet`) in the ruins.
Her nudity in the bath scene at her hut is vanilla content.

`mods.settings` gives Brothers In Arms `Priority=99`, and Dynamic Appearances Project had no entry.
Adding this entry to `Documents/The Witcher 3/mods.settings` fixed it after a game restart on October 7, 2026:

```ini
[moddynamicappearancesprojectremastered-bia]
Enabled=1
Priority=98
```

Lower numbers have higher priority.
The setting is read only at game launch.
The Dynamic Appearances copy omits Brothers In Arms' custom Keira lingerie reference (`dlc\dlcbia\characters\models\t_02_wa__lingerie_keira.w2ent`), so that Brothers In Arms change does not apply.

### A Proper Send-off

The installed folders named `moddandelionsballad` and `dlcdandelionjh1` belong to [A Proper Send-off](https://www.nexusmods.com/witcher3/mods/10881).
The installed variant is the **PL Remaster version 1.21**, with Polish performances and English translations.
All 14 installed files match that archive.

Both expansions, **Hearts of Stone** and **Blood and Wine**, are required.
The author permits installation during a playthrough.
Complete **Carnal Sins** and the **Final Preparations** tasks; the Lodge conversation is optional.
Finish the added quest before sailing to Skellige with Avallac'h, or it fails.

### A Witcher Can Hide Another

Install both folders and the bindings supplied in `NGCL_add_to_input.settings`.
Append or merge those bindings into `Documents/The Witcher 3/input.settings`; do not replace the entire personal settings file.
The author requires both expansions and completion of **A Poet Under Pressure**, with level 40 or higher suggested.
See the [author's page](https://www.nexusmods.com/witcher3/mods/9453).

This installation also needed two script repairs: the `InitializeAreaMusic` parameter type and the missing `GetStateByName` method.
Follow the [exact repair instructions](a-witcher-can-hide-another.md), including backups and rollback.

### Path Tracing and Ray Tracing Optimization

Copy the supplied `bin` folder into the game directory.
The [author's instructions](https://www.nexusmods.com/witcher3/mods/13025?tab=description) place the controls at the bottom of **Options → Video → Graphics**.
Another mod that supplies `xinput9_1_0.dll` requires a conflict decision before installation.

The matched download is Nexus release **4**, while its configuration and log identify **PT Optimization 2.0**.
The local log confirms that the DLL loaded and exposed its settings.
It records `PTEnable=0`, so this is not evidence of a path-tracing performance test.
No frame-rate improvement has been measured for this setup.

## In-game installations

1. Open **Mods** from the main menu.
2. Sign in with a CD PROJEKT RED account and connect mod.io.
3. Subscribe to the six mod.io entries linked in the [mod list](../README.md#in-game-installations).
4. Let the downloads complete and restart the game.
5. Check that each mod appears under **Installed** with its checkbox selected.

These steps follow [CD PROJEKT RED's installation instructions](https://support.cdprojektred.com/en/witcher-3/pc/gameplay/issue/3001/cross-platform-mod-support-how-to).
Keep the in-game packages in the game's managed storage.
Do not duplicate them by copying Nexus versions into `mods`.

### Recorded priorities

These are the numeric values saved in `modioModsConfig.json`, sorted by that value.
They record the current configuration, rather than a proven optimal order or a rule for mixed manual/mod.io precedence.

| Configured priority | Mod | Enabled |
| --- | --- | --- |
| 0 | Hoods | Yes |
| 1 | Corvo Bianco Enhanced Collection | Yes |
| 2 | The Last Wish Final Scene Restoration | Yes |
| 3 | Ciri Witcher Ending Restoration | Yes |
| 4 | Fast Travel Pack | Yes |
| 5 | The Spider and The Wolf | Yes |

The manual `mods.settings` entry for Brothers In Arms is enabled with `Priority=99`.
Dynamic Appearances Project is enabled with `Priority=98`, so it overrides Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority).
The other five manual `mods` folders have no matching entries in that file; the PT DLL is outside this mechanism.
Absence of an explicit entry does not establish that a mod is disabled.

The [Corvo Bianco author](https://www.nexusmods.com/witcher3/mods/12982) requests priority over Brothers In Arms.
The two configuration files alone do not prove that the mixed installation meets that requirement.
Verify the collection's interactions in game before treating the order as validated.

### Notes for individual mods

- **[VAXIS's ULTRA Plus Blood Physics](https://www.nexusmods.com/witcher3/mods/13506):** the installed 1.4 archive contains `mods/modULTRAplussVaxisBlood` and the menu file `bin/config/r4game/user_config_matrix/pc/modULTRAplussVaxisBlood.xml`. Copy both; this package contains no DLC or native DLL files. Release 1.2 had no menu file. Nexus tags it Remastered Compatible. Enablement, performance, and compatibility with the full mod set have not been tested in game.
- **Hoods:** the installed package includes both mod and DLC components. It does not include the optional `Hoods.input.settings` file. Use the [documented inventory controls](https://www.nexusmods.com/witcher3/mods/4242) for compatible equipped hoods; a keyboard shortcut is not established here.
- **Corvo Bianco Enhanced Collection:** use the collection instead of its five individual component mods. See the [Remastered edition](https://www.nexusmods.com/witcher3/mods/12982) for unlock conditions and features.
- **The Last Wish Final Scene Restoration:** other mods that replace `sq202_10_ending_djinn` can conflict. See the [author's compatibility notes](https://www.nexusmods.com/witcher3/mods/10653).
- **Ciri Witcher Ending Restoration:** the content applies to Ciri's witcher ending. Dialogue varies with the relevant story and romance choices. See the [author's page](https://www.nexusmods.com/witcher3/mods/9651).
- **Fast Travel Pack:** discover the added signposts on foot; some depend on quest progress. The installed mod.io payload has no `bin` settings files, so the [Nexus package's menu instructions](https://www.nexusmods.com/witcher3/mods/7202) do not describe this exact package.
- **The Spider and The Wolf:** both expansions are required. The [author](https://www.nexusmods.com/witcher3/mods/9803) places its start in Velen after Vizima, around level 17, and recommends playing before the main ending. Preserve a save from before installation, particularly when upgrading an older release.

## Versions and inventory evidence

The [manual inventory](../inventory/manual.json) records eight manual installations; Complete Animations Redux is kept under `removedMods` for reference.
The [in-game inventory](../inventory/ingame.json) records six installed payloads and their enabled configuration entries.
All six in-game packages have files on disk; their file sizes match the local package metadata.

For six manual downloads (as of October 4, 2026), installed scripts, metadata, menu XML, configuration, or DLL files were compared with local ZIP contents using SHA-256.
All compared files matched: Brothers In Arms (37), Complete Animations Redux (15, since removed), Dynamic Appearances Project (2, for 2.1.1), Light Rewrite (36), Sharedutils (53), and PT Optimization (3).
These comparisons did not cover every asset in those six packages.
A Proper Send-off received a full comparison of all 14 files.
Dynamic Appearances Project 3.0b received a full SHA-256 comparison of all 12 archive files on October 7, 2026; all matched the installed files (128,776,535 bytes total).
VAXIS's ULTRA Plus Blood Physics standard 1.2 received a full SHA-256 comparison of all 29 archive files on October 6, 2026; all matched the installed files (5,325,009 bytes total).
The repair document records separate evidence for A Witcher Can Hide Another.

On October 10, 2026, four updated installations received a full SHA-256 comparison of every archive file, and all matched, with no leftover files from the previous release:

| Mod | Release | Files | Bytes |
| --- | --- | --- | --- |
| Brothers In Arms | 4.0.4 | 75 | 576,698,743 |
| Sharedutils | 4.1 | 56 | 182,836 |
| Light Rewrite | 0.19.1 | 62 | 562,325 |
| VAXIS's ULTRA Plus Blood Physics | 1.4 | 48 | 5,367,666 |

Before that update, a full comparison showed that Light Rewrite 0.16.0 had been installed since October 5, not the 0.14.0 recorded in the snapshot.
PT Optimization 2.0 was rechecked on the same day and still matches its three files.

Internal metadata can retain older labels.
For example, the matched Brothers In Arms 4.0.4 archive reports `4.0.2` internally, and Sharedutils 4.1 reports `3.1.1`.
Those are metadata differences, not proof of separate installed versions.

Nexus and mod.io also use different releases:

| Project | Installed mod.io version | Nexus version observed on the snapshot date |
| --- | --- | --- |
| Ciri Witcher Ending Restoration | 0.2 | 1.3 |
| The Last Wish Final Scene Restoration | 0.1 | 1.1 |
| Fast Travel Pack | 2.1.0 | 3.0.0 Remastered |
| The Spider and The Wolf | 1.2.2 | 2.01 Remastered |

The Nexus pages in the mod list are the source references for these observations.
These packages have not been proven interchangeable.
Use the installed channel when reproducing the snapshot; review author instructions before switching channels or updating.

`mods.settings` also contains historical entries whose files are absent.
Those entries are excluded from the inventory.
The mod.io configuration uses repeated top-level `mod` keys; a parser that keeps only the final duplicate loses entries.
Each entry was read separately for this inventory.

## October 8, 2026 game patch

GOG updated `bin/x64_dx12/witcher3.exe` from `5.0.0.1044392` to `5.0.0.1048522` (Windows reports `5.0.15.61352` and `5.0.15.65482`).
The patch changed 19 base scripts under `content/content0/scripts`, including `inventoryComponent.ws`, `r4Player.ws`, `commonMenu.ws`, `mapMenu.ws`, and `commonMapManager.ws`.
No installed manual or in-game mod replaces any of those files.
Brothers In Arms wraps methods of `CInventoryComponent`, defined in the patched `inventoryComponent.ws`.
Scripts still compile, but mod releases from before the patch are not verified on the new executable.
PT Optimization detected the new build and applied its rendering changes, according to its log.

## Available updates

Checked on October 10, 2026 against the Nexus files pages and the mod.io pages.

| Mod | Installed | Latest | Released | Notes |
| --- | --- | --- | --- | --- |
| PT Optimization | 2.0 (Nexus release 4) | 2.1 BETA (Nexus release 6) | October 8, 2026 | Not installed because it is a BETA. The author says it works with game patch 5.01 and moves its settings to Options > Mods. |

All other manual installations are on the latest Nexus release.
All six in-game mod.io installations match the current mod.io versions: Hoods 3.6, Corvo Bianco Enhanced Collection 5.00, The Last Wish Final Scene Restoration 0.1, Ciri Witcher Ending Restoration 0.2, Fast Travel Pack 2.1.0, and The Spider and The Wolf 1.2.2.

## Gameplay checks still needed

- Confirm a clean launch and script compilation with the full set enabled.
- Check the documented mod menus and input controls.
- Check the Corvo Bianco interactions and their priority against Brothers In Arms.
- Play the added quests and restored scenes through their relevant triggers.
- Revisit an observed blank quest-journal entry; its cause remains unresolved.

The player reports that the A Witcher Can Hide Another repair worked.
The two edits are independently verified, but full quest completion and compatibility of every installed mod remain unverified.

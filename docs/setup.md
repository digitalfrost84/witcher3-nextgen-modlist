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
| Fixed and Slimmer Griffin Armor | `mods/modSlimmer_Griffin_Armor` |
| Griffin Armour (On The Path) | `mods/modGriffinArmorOnThePath` |
| SGA T5 for On The Path | `mods/modSGA_T5_for_OTP` |
| The Living Continent | `mods/modW3LivingSky`; `bin/x64_dx12/W3LivingSky.addon64`, `w3_living_sky.hlsl`, `w3_living_sky_font.bin`, `w3_living_sky_leaves.bin`; menu `mod00LivingContinent.xml`; needs ReShade |
| ReShade (for The Living Continent) | `bin/x64_dx12/dxgi.dll`, `ReShade.ini`, `reshade-shaders` |
| Deaths Reworked | `mods/modDeathsReworkedWoundsAndBrutality` |
| Blood And Steel | `mods/modBloodAndSteel`, `dlc/dlcBloodAndSteel`, menu `modBloodAndSteel.xml` |
| PT Optimization | `bin/x64_dx12/xinput9_1_0.dll`, `bin/config/platform/pc/RTOptimization.ini`, menu `pt_optimization.xml`, strings in `mods/modPTOptimization` |
| Gwent Redux | `mods/modGwentRedux`, menu `modGwentReduxConfig.xml` |
| Gwent Redux Animated Gwent Cards | `mods/modGwentAnimatedCards` |
| ModjiggleRR | `mods/modjiggleRR_MED` |

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

### Griffin armor: retexture, slim mesh, and T5 patch

Three mods work together here; each does a different job.

- **[Griffin Armour (On The Path)](https://www.nexusmods.com/witcher3/mods/3251):** the retexture, Final release (June 2020 file); the author's update adds the Grandmaster tier. Folder `mods/modGriffinArmorOnThePath`. Nexus tags it Remastered and Next-Gen Update Compatible.
- **[Fixed and Slimmer Griffin Armor](https://www.nexusmods.com/witcher3/mods/5631?tab=files):** release 1.5, main file. It slims the breastplate on all tiers. Folder `mods/modSlimmer_Griffin_Armor`.
- **SGA T5 for On The Path:** release 1.5, optional file on the same page. It makes the slim Grandmaster chainmail match OTP. Folder `mods/modSGA_T5_for_OTP`. Its descriptor is named `Slim T5 for OTP`.

All three were installed on October 11, 2026. Every archive file matches the installed file by SHA-256: OTP 4 of 4, the slim main file 6 of 6, and the T5 patch 6 of 6. The Vanilla Laces variants are not installed.

`mods.settings` has these entries, all enabled:

| Mod folder | Priority |
| --- | --- |
| `modGriffinArmorOnThePath` | 41 |
| `modSlimmer_Griffin_Armor` | 42 |
| `modSGA_T5_for_OTP` | 43 |

The slim mod's page requires the T5 patch to have a higher priority than the slim mod and any other Griffin mod. Putting the slim mod above OTP, so its mesh wins, is a choice made here rather than something the authors specify. An old `[modSlimT5forOTP]` entry (priority 40) with no matching folder was removed.

Not yet checked in game: the slim breastplate and OTP textures on each Griffin tier, and the Grandmaster chainmail with the T5 patch. One commenter on Nexus reported odd shoulder-pad colors on the T5 tier with OTP.

### The Living Continent and ReShade

- **[The Living Continent - Seasons - Sky - Weather](https://www.nexusmods.com/witcher3/mods/13650):** release 1.5, installed on October 15, 2026 over 1.4 (installed October 11). It adds four seasons, snow, icicles, a real night sky, daytime halos, and seasonal villager behaviour. It is for Remastered on DirectX 12 only (game version 5.0 or newer); DX11 is not supported.
- **ReShade is required, not optional.** The main component, `W3LivingSky.addon64`, is a ReShade add-on DLL that only ReShade can load. Install [ReShade](https://reshade.me) 6.8 or newer using the **"with full add-on support"** installer (the regular build cannot load add-ons), for `bin/x64_dx12/witcher3.exe` under DirectX 12. No effects or presets are needed.
- Installed: ReShade 6.8.0.2155 from `ReShade_Setup_6.8.0_Addon.exe`, as `bin/x64_dx12/dxgi.dll`. It loaded in the same session as PT Optimization's `xinput9_1_0.dll` without errors.
- Copy the archive's `bin` and `Mods` folders into the game folder. The W3 Mod Manager copies only `Mods`, so with it the four `bin/x64_dx12` files and `mod00LivingContinent.xml` must be copied by hand. Every installed file matches the 1.5 archive (39 of 39; the readme is not installed), with no leftover files.
- Check: `bin/x64_dx12/ReShade.log` must contain `Registered add-on "The Living Continent"`, and `w3_living_sky_errors.txt` should read `ok`. Both were confirmed with 1.4 on October 11, 2026, and the in-game calendar and winter snow appeared in Velen. Release 1.5 has not been launched yet.
- Settings are under Options > Mods > The Living Continent. The game can open only about 230 options across all mod pages together.
- Uninstall: turn off Winter Clothes for the Villagers and play a little first, then delete the files listed on the mod page.
- The ReShade installer also added some effects (Deband, DisplayDepth, UIMask). They stay off unless enabled in the ReShade overlay and are not needed.
- Release 1.5 adds realistic cloud lighting, nebulae, frozen marshes, drifting snow, Darker Nights in HDR, and seasons that follow the story. Update by copying `bin` and `Mods` over the old files; settings carry over.
- Overlap: its bundle replaces 14 NPC entity files that Brothers In Arms also replaces, among them `nml_villager_woman.w2ent`, `skellige_villager.w2ent`, and several Toussaint and Novigrad community NPCs. Brothers In Arms has `Priority=99` and The Living Continent has no entry, so the Brothers In Arms copies are used, and those NPC types may not get the winter clothes.
- Not yet checked: the night sky together with Light Rewrite.

### Deaths Reworked

- **[Deaths Reworked - Wounds and Brutality](https://www.nexusmods.com/witcher3/mods/11964):** release 2.70, Next Gen main file. The installed descriptor still says version 1.0, internal name `dynamicragdoll`.
- Folder `mods/modDeathsReworkedWoundsAndBrutality`; all 6 archive files match.
- The author's notes: remove older versions first. The Next Gen main file needs the mod's wound script; script-heavy setups can use an older optional file without it. Run Script Merger with other script mods. The author expects conflicts with other death-animation, ragdoll, finisher, wound, or damage-processor mods.
- It changes death animations and blood. Check it together with VAXIS's Blood Physics and Blood And Steel. Not yet tested in game.
- Overlap: it and VAXIS's Blood Physics replace the same four ragdoll files, `dwarf_base_ragdoll`, `man_base_ragdoll`, `wildhunt_base_ragdoll`, and `woman_base_ragdoll` (`.w2ragdoll`). Neither has a `mods.settings` entry, so the game's default order for unlisted folders decides; which copy wins has not been determined. To decide it, give the preferred mod an entry; the author asks to load Deaths Reworked after other physics packs.
- Release 2.72 (October 12, 2026) is available; see [available updates](#available-updates).

### Blood And Steel

- **[Blood And Steel](https://www.nexusmods.com/witcher3/mods/9674):** release 3.02, Remastered file. It changes attack animations and targeting, and adds dodges while holding block.
- Folders `mods/modBloodAndSteel` and `dlc/dlcBloodAndSteel`, plus the optional settings menu `modBloodAndSteel.xml`. All 24 archive files match.
- The author says it conflicts with mods that change attack animations and recommends Script Merger for other conflicts. The author also writes that compatibility with Remastered mods has not been established yet.
- Its scripts are precompiled (`precompiled.rsblob`); no loose `.ws` files are installed. A bundle check on October 15, 2026 found no file overlaps with the other installed mods. The author recommends turning off **Target With Movement Keys On Keyboard**.
- Not yet tested in game, particularly with Brothers In Arms and Deaths Reworked.

### Animations, appearances, and lighting

- **Complete Animations Redux:** removed on October 7, 2026 and no longer part of this list. Its leftover inventory props break saves; see [why it was removed](complete-animations-redux.md).
- **Dynamic Appearances Project:** use the [BiA-compatible Remastered main file](https://www.nexusmods.com/witcher3/mods/9219?tab=files) (3.0b). The author says this variant needs no extra BiA patch. Install one main variant only. It must have priority over Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority). Its presence here does not prove complete 5.0 compatibility.
- **Light Rewrite:** copy the complete archive. Its [release notes](https://github.com/webspam/LightRewrite/releases) describe the Remastered lighting changes; the installed release is 0.23.0. The Shared Imports requirement in older 4.04 instructions does not apply to the Remastered instructions.

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

Copy the supplied `bin` and `mods` folders into the game directory; the top-level `PT-Optimization-README.txt` is documentation only.
Release 2.1 moves the settings to **Options → Mods → RT/PT optimization**; `mods/modPTOptimization` holds only their translated strings.
Another mod that supplies `xinput9_1_0.dll` requires a conflict decision before installation.

This setup uses **PT Optimization 2.1 FINAL** (Nexus release **7**, uploaded October 13, 2026), installed on October 15.
The author lists it for game patches 5.01 (GOG, Steam, Epic), 5.00c, and 5.00b; updating from the BETA means replacing all files.
Release 2.0 stays on Nexus as an optional file for anyone who has problems with 2.1.

Before this update, the 2.1 BETA (release 6) had been installed on October 11, which the October 10 record did not show.
Its log, last written at 11:54 on October 15, showed the DLL loading and set `path tracer: bounces = 1, indirect light = 105%`.
The FINAL DLL has not run yet; check `bin/x64_dx12/rt_optimizer.log` after the next launch.
No frame-rate improvement has been measured for this setup.

### Gwent Redux and Animated Gwent Cards

[Gwent Redux BiA Compatible (Remastered)](https://www.nexusmods.com/witcher3/mods/13403?tab=files) offers four main files: Gwent Redux and Gwent Redux REDOING, each with and without Brothers In Arms.
Install exactly one.
This setup uses **Gwent Redux (Remastered 5.X Port)** release 20, the BiA edition.
Copy `Mods/modGwentRedux` and the menu file `modGwentReduxConfig.xml`; the top-level `README-Remastered-Port.txt` is documentation only.

According to the author's README, the BiA edition blanks Brothers In Arms' own Gwent card files (`def_gwint_cards_final_bia.xml` and `def_item_bia_gwint.xml`, under `items` and `items_plus`) because they collide with Gwent Redux's cards.
Use it only with Brothers In Arms installed; without it, the README warns that DLC items disappear on load.
The mod ships patched `gwint_game.redswf` and `deck_builder.redswf` files; other mods that replace them conflict.
Its options are under **Mods → Gwent Redux** (Alternative Cards and Treasure of Madness).
The README recommends a new game or a save without an earlier Gwent Redux installation.

[Gwent Redux Animated Gwent Cards](https://www.nexusmods.com/witcher3/mods/13403?tab=files) is an optional file on the same page, release 4.
EthanBlackBT made the original animations; oerdi25 ported them to Remastered.
It animates Geralt, Ciri, Triss, Yennefer, and the base leaders Emhyr, Eredin, Foltest, and Francesca when their **base card** art is selected; alternative art is not animated.
Uninstall the old Animated Gwent Cards mod first, because its 4.0x Flash files break mouse input on Remastered.
The author requires release 3 or newer with Gwent Redux 13 or newer.

#### Animated Gwent Cards load order

The add-on replaces the same two Flash files as Gwent Redux, so it must load **above Gwent Redux**.
Script Merger reports the conflict as not mergeable; that is expected.

The add-on's README says its folder name sorts before `modGwentRedux` and therefore wins by default.
That does not hold here: `mods.settings` gives `modGwentRedux` an explicit `Priority=99`, and `modGwentAnimatedCards` had no entry.
Dynamic Appearances Project showed on this setup that a mod without an entry loses to one with `Priority=99`; see [Brothers In Arms priority](#brothers-in-arms-priority).
`Documents/The Witcher 3/mods.settings` therefore needs this entry; the game reads it at launch:

```ini
[modGwentAnimatedCards]
Enabled=1
Priority=97
```

Any number below 99 works; 97 keeps it clear of Dynamic Appearances Project's 98.
The entry was added on October 15, 2026 (backup: `mods.settings.bak-2026-10-15-gwent`).
It takes effect at the next game launch; the animations have not been checked in game yet.

### ModjiggleRR

[ModjiggleRR](https://www.nexusmods.com/witcher3/mods/13695) is an adult mod; its Nexus page is hidden unless adult content is enabled.
It is offered in several strengths, such as MED and HIGH; install only one.
This setup uses the **MED** variant, release 1, installed as `mods/modjiggleRR_MED`.
Its `info.json` identifies it as Jiggle Physics Adjustments Medium 1.1: it strengthens breast physics only on characters that already have physics.
The archive has no DLC folder, menu file, or scripts.

Its bundle replaces 194 character, rig, and constraint files.
Two installed mods also replace some of them:

- **Brothers In Arms:** four Novigrad sorceress torsos and five Keira Metz body files.
- **Dynamic Appearances Project:** the same five Keira Metz body files and `body_yennefer__lingerie.w2ent`.

ModjiggleRR has no `mods.settings` entry, so those two mods win, and its physics changes do not apply to those meshes.
Before giving ModjiggleRR priority over either mod, check Keira's and Yennefer's appearances in game; see [Brothers In Arms priority](#brothers-in-arms-priority).

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
The three Griffin mods have enabled entries at priorities 41-43; see the [Griffin armor note](#griffin-armor-retexture-slim-mesh-and-t5-patch).
Gwent Redux is enabled with `Priority=99`, and Animated Gwent Cards with `Priority=97` so it wins; see [Animated Gwent Cards load order](#animated-gwent-cards-load-order).
The other ten manual `mods` folders, including the strings-only `modPTOptimization`, have no matching entries in that file; the PT DLL and the Living Continent ReShade add-on are outside this mechanism.
Absence of an explicit entry does not establish that a mod is disabled.

The [Corvo Bianco author](https://www.nexusmods.com/witcher3/mods/12982) requests priority over Brothers In Arms.
The two configuration files alone do not prove that the mixed installation meets that requirement.
Verify the collection's interactions in game before treating the order as validated.

### Notes for individual mods

- **[VAXIS's ULTRA Plus Blood Physics](https://www.nexusmods.com/witcher3/mods/13506):** the installed 1.5 archive contains `mods/modULTRAplussVaxisBlood` and the menu file `bin/config/r4game/user_config_matrix/pc/modULTRAplussVaxisBlood.xml`. Copy both; this package contains no DLC or native DLL files. Release 1.2 had no menu file. Nexus tags it Remastered Compatible. Enablement, performance, and compatibility with the full mod set have not been tested in game.
- **Hoods:** the installed package includes both mod and DLC components. It does not include the optional `Hoods.input.settings` file. Use the [documented inventory controls](https://www.nexusmods.com/witcher3/mods/4242) for compatible equipped hoods; a keyboard shortcut is not established here.
- **Corvo Bianco Enhanced Collection:** use the collection instead of its five individual component mods. See the [Remastered edition](https://www.nexusmods.com/witcher3/mods/12982) for unlock conditions and features.
- **The Last Wish Final Scene Restoration:** other mods that replace `sq202_10_ending_djinn` can conflict. See the [author's compatibility notes](https://www.nexusmods.com/witcher3/mods/10653).
- **Ciri Witcher Ending Restoration:** the content applies to Ciri's witcher ending. Dialogue varies with the relevant story and romance choices. See the [author's page](https://www.nexusmods.com/witcher3/mods/9651).
- **Fast Travel Pack:** discover the added signposts on foot; some depend on quest progress. The installed mod.io payload has no `bin` settings files, so the [Nexus package's menu instructions](https://www.nexusmods.com/witcher3/mods/7202) do not describe this exact package.
- **The Spider and The Wolf:** both expansions are required. The [author](https://www.nexusmods.com/witcher3/mods/9803) places its start in Velen after Vizima, around level 17, and recommends playing before the main ending. Preserve a save from before installation, particularly when upgrading an older release.

## Versions and inventory evidence

The [manual inventory](../inventory/manual.json) records seventeen manual installations; Complete Animations Redux is kept under `removedMods` for reference.
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

On October 15, 2026, every installation added or updated that day received a full SHA-256 comparison of every archive file; all matched, with no leftover files from the previous release:

| Mod | Release | Files | Bytes |
| --- | --- | --- | --- |
| Gwent Redux (BiA edition) | 20 | 27 | 131,075,568 |
| Gwent Redux Animated Gwent Cards | 4 | 3 | 78,159,444 |
| ModjiggleRR MED | 1 | 3 | 1,101,353 |
| Light Rewrite | 0.23.0 | 70 | 660,412 |
| VAXIS's ULTRA Plus Blood Physics | 1.5 | 48 | 5,369,048 |
| PT Optimization | 2.1 FINAL (Nexus release 7) | 21 | 137,903 |
| The Living Continent | 1.5 | 39 | 23,447,455 |

The top-level readme files of the Gwent Redux, PT Optimization, and Living Continent archives are not installed and are not counted.

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

Checked on October 10, 2026 against the Nexus files pages and the mod.io pages, and again on October 15 for the manual mods.

| Mod | Installed | Latest | Released | Notes |
| --- | --- | --- | --- | --- |
| Deaths Reworked - Wounds and Brutality | 2.70 | 2.72 | October 12, 2026 | More death-animation variety, new Aard kills, and a new crawling wounded variant. Remove the old folder first. |

All other manual installations are on the latest Nexus release.
On October 15, 2026, these were the latest files: Gwent Redux release 20, Animated Gwent Cards release 4, Blood And Steel Remastered v3.02, Light Rewrite 0.23.0, VAXIS's Blood Physics 1.5, The Living Continent 1.5, and PT Optimization 2.1 FINAL.
The Griffin armor mods were not rechecked on October 15. The ModjiggleRR page could not be checked without adult content enabled; release 1 is the downloaded version.
All six in-game mod.io installations match the current mod.io versions: Hoods 3.6, Corvo Bianco Enhanced Collection 5.00, The Last Wish Final Scene Restoration 0.1, Ciri Witcher Ending Restoration 0.2, Fast Travel Pack 2.1.0, and The Spider and The Wolf 1.2.2.

## Gameplay checks still needed

- Confirm a clean launch and script compilation with the full set enabled.
- Check the documented mod menus and input controls.
- Confirm that the slim mesh and OTP textures load on each Griffin tier, including the T5 chainmail and shoulder pads.
- Test combat with Deaths Reworked and Blood And Steel together, alongside Brothers In Arms and VAXIS's Blood Physics.
- Check The Living Continent at night with Light Rewrite, and whether villagers that Brothers In Arms overrides get its winter clothes.
- Check which ragdoll files win between Deaths Reworked and VAXIS's Blood Physics.
- Check that the animated Gwent cards appear and that mouse input works in a match and the deck builder, now that Animated Gwent Cards has `Priority=97`.
- Check that PT Optimization 2.1 FINAL loads (`bin/x64_dx12/rt_optimizer.log`) and its settings appear under Options → Mods.
- Check the Corvo Bianco interactions and their priority against Brothers In Arms.
- Play the added quests and restored scenes through their relevant triggers.
- Revisit an observed blank quest-journal entry; its cause remains unresolved.

The player reports that the A Witcher Can Hide Another repair worked.
The two edits are independently verified, but full quest completion and compatibility of every installed mod remain unverified.

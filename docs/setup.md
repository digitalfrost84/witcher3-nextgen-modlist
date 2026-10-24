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
| The Living Continent | `mods/modW3LivingSky`; `bin/x64_dx12/W3LivingSky.addon64` and four `w3_living_sky*` files (`.hlsl`, `_font.bin`, `_leaves.bin`, `_moon.bin`); menu `mod00LivingContinent.xml`; needs ReShade |
| The Living Continent - The Hunt | `mods/modW3LSHunt`, `dlc/dlcw3lshunt`, `dlc/dlcw3lsrewards`; `bin/x64_dx12/w3_living_sky_codex.bin`, `w3_living_sky_codex.hlsl`, `w3_living_sky_codex_img.bin`, `w3_living_sky_codex_font_OFL.txt`; menu `mod01LivingContinentHunt.xml` |
| ReShade (for The Living Continent) | `bin/x64_dx12/dxgi.dll`, `ReShade.ini`, `reshade-shaders` |
| Deaths Reworked | `mods/modDeathsReworkedWoundsAndBrutality` |
| Blood And Steel | `mods/modBloodAndSteel`, `dlc/dlcBloodAndSteel`, menu `modBloodAndSteel.xml` |
| PT Optimization | `bin/x64_dx12/xinput9_1_0.dll`, `bin/config/platform/pc/RTOptimization.ini`, menu `pt_optimization.xml`, strings in `mods/modPTOptimization` |
| Gwent Redux | `mods/modGwentRedux`, menu `modGwentReduxConfig.xml` |
| Gwent Redux Animated Gwent Cards | `mods/modGwentAnimatedCards` |
| ModjiggleRR | `mods/modjiggleRR_MED` |
| Map Remastered | `mods/modmapredraw` |
| Nudes Collection – Should Be Nude | `mods/modShouldBeNude`; `mods.settings` `Priority=98` |
| The Elder Bush | `mods/modACiriPube`; `mods.settings` `Priority=8` |
| Females of the Continent (Bushy) | `mods/modHC4K02FemalesVanillaBushy`; `mods.settings` `Priority=99` |
| New Hairstyles and Beards For Geralt | `mods/modNewHairstylesAndBeards`; `mods.settings` `Priority=94` |
| Better Torches Next-Gen | `mods/modBetterTorchesNextGen` |
| No Indignant NPCs | `mods/modNoIndignantNPCs`, menu `NoIndignantNPCs.xml` |
| No Loading Screen Narrations | `mods/modMuteLoadingNarrations` |
| W3LoadFix | `bin/x64_dx12/dsound.dll`, `w3loadfix.dll`, `w3loadfix.ini`; menu `w3loadfix.xml` |

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
Brothers In Arms 4.1.1 (uploaded October 17) replaced 4.0.4 on October 20, 2026; its `info.json` now reports `4.1.1`.
All 77 files of the 4.1.1 archive match the installed files by SHA-256, with no extra files in the mod and DLC folders.
The author asks to read the new installation instructions before installing; the 4.1.1 changelog was not checked.
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

- **[The Living Continent - Seasons - Sky - Weather](https://www.nexusmods.com/witcher3/mods/13650):** release 1.7 (uploaded October 22), installed on October 23, 2026 over 1.6 (October 20), 1.5 (October 15), and 1.4 (October 11). It adds four seasons, snow, icicles, a real night sky, daytime halos, a detailed 4K moon, and seasonal villager behaviour. Since 1.7 the hunting is a separate mod, [The Living Continent - The Hunt](#the-living-continent---the-hunt). It is for Remastered on DirectX 12 only (game version 5.0 or newer); DX11 is not supported.
- **ReShade is required, not optional.** The main component, `W3LivingSky.addon64`, is a ReShade add-on DLL that only ReShade can load. Install [ReShade](https://reshade.me) 6.8 or newer using the **"with full add-on support"** installer (the regular build cannot load add-ons), for `bin/x64_dx12/witcher3.exe` under DirectX 12. No effects or presets are needed.
- Installed: ReShade 6.8.0.2155 from `ReShade_Setup_6.8.0_Addon.exe`, as `bin/x64_dx12/dxgi.dll`. It loaded in the same session as PT Optimization's `xinput9_1_0.dll` without errors.
- Copy the archive's `bin` and `Mods` folders into the game folder; 1.7 has no `dlc` folder. The W3 Mod Manager copies only `Mods`, so with it the five `bin/x64_dx12` files and `mod00LivingContinent.xml` must be copied by hand. Every installed file matches the 1.7 archive (56 of 56; the readme is not installed).
- Check: `bin/x64_dx12/ReShade.log` must contain `Registered add-on "The Living Continent"`, and `w3_living_sky_errors.txt` should read `ok`. Both were confirmed with 1.4 on October 11, 2026, and the in-game calendar and winter snow appeared in Velen. The 1.5 and 1.6 add-ons both registered as `v1.5.0.0`; the 1.7 add-on registers as `v1.7.0.0`.
- **Updating from 1.6 to 1.7:** extract 1.7 over 1.6, replacing everything; it replaces 1.6's 14 hunting scripts in `modW3LivingSky` with empty files. Then install [The Hunt](#the-living-continent---the-hunt), whose DLC folders and codex files replace 1.6's. To drop the hunting instead, delete `dlc/dlcw3lshunt`, `dlc/dlcw3lsrewards`, and the four `w3_living_sky_codex*` files in `bin/x64_dx12`.
- **Do not leave 1.7 alone over 1.6.** That is what happened here on October 23: the 1.7 add-on included 1.6's leftover `w3_living_sky_codex.hlsl`, and the compendium shader failed to compile. `w3_living_sky_errors.txt` listed five undeclared identifiers such as `CX_W_K_P_BACK` at the launch on October 24 at 08:58; the seasons, sky, and weather still ran. Installing The Hunt 1.0 replaced the stale files; at the 13:43 launch the error file read `ok`, and the compendium pictures loaded.
- Settings are under Options > Mods > The Living Continent. The game can open only about 230 options across all mod pages together.
- Uninstall: turn off Winter Clothes for the Villagers and play a little first, then delete the files listed on the mod page.
- The ReShade installer also added some effects (Deband, DisplayDepth, UIMask). They stay off unless enabled in the ReShade overlay and are not needed.
- Release 1.5 adds realistic cloud lighting, nebulae, frozen marshes, drifting snow, Darker Nights in HDR, and seasons that follow the story.
- Release 1.6, *The Hunt*, added a hunting bow, wounds and blood trails, skinning, twenty new animals, legendary animals, and the Huntsman's Compendium in the game menu, in `dlc/dlcw3lshunt` and `dlc/dlcw3lsrewards`.
- Release 1.7 moves that hunting into its own mod and adds a detailed 4K moon (`w3_living_sky_moon.bin`), one switch for the whole mod, translatable texts, and a Snow on People option. It also lists fixes for flickering footprints and for the lightning flashes in thunderstorms.
- Its scripts are all loose, annotated scripts under `content/scripts/local`; 1.7 ships 14 of them empty. They extend classes that Map Remastered, Brothers In Arms, Light Rewrite, and A Witcher Can Hide Another also extend, but none of them adds a field or method with the same name. It reads Map Remastered's `W3MerchantComponent` without replacing it.
- Overlap: its bundle replaces 14 NPC entity files that Brothers In Arms also replaces, among them `nml_villager_woman.w2ent`, `skellige_villager.w2ent`, and several Toussaint and Novigrad community NPCs. Brothers In Arms has an explicit priority (96) and The Living Continent has no entry, so the Brothers In Arms copies are used, and those NPC types may not get the winter clothes. This overlap was found with 1.5 and not rechecked for 1.6.
- **Lightning in Storms is turned off (October 23, 2026).** With 1.6, the whole screen flickered between bright and dark during a thunderstorm at night, in an inn with a fireplace burning, and it stopped with seasons off. Turning off Lightning in Storms (`StormLightning`, Sky and Nights page) alone fixed it. The flash is part of the seasonal colour pass (`e_season_grade` in `w3_living_sky.hlsl`), which is why turning off seasons also stops it. Nexus has the same report, [Flashing light during thunderstorm](https://www.nexusmods.com/witcher3/mods/13650?tab=bugs), still open for 1.6. The 1.7 readme lists a fix ("one soft glow per strike now", none indoors or over the interface); the option stays off until that is checked in a thunderstorm.
- Not yet checked: the night sky together with Light Rewrite, and the 1.7 moon.

### The Living Continent - The Hunt

- **[The Living Continent - The Hunt](https://www.nexusmods.com/witcher3/mods/14718):** release 1.0 (uploaded October 22, 2026), installed on October 24. It is the hunting part of The Living Continent 1.6 as a mod of its own: the hunting bow, wounds and blood trails, skinning, 21 animals, 10 legendary animals, and the Huntsman's Compendium. It needs no ReShade. With The Living Continent 1.7, the animals follow its seasons, and its add-on draws the compendium's illustrated page from the codex files.
- Copy `bin`, `dlc`, and `Mods`. It installs `mods/modW3LSHunt`, `dlc/dlcw3lshunt`, `dlc/dlcw3lsrewards`, the four `w3_living_sky_codex*` files in `bin/x64_dx12`, and the menu `mod01LivingContinentHunt.xml`. All 52 installed files match the archive; the readme and sound credits are not installed. No 1.6 files remain in its folders.
- Its 18 scripts are loose and annotated. `content/scripts/local/w3ls_shared.ws` is identical to the copy in `modW3LivingSky` at the same path, so only one is compiled; the author ships it that way. Its other classes and functions do not clash with The Living Continent's.
- **The bow:** with the option Hunting Bow on, the mod puts a Hunter's Bow, 30 hunting arrows, and 15 small game arrows in Geralt's pack **once per save**; it records that with the fact `w3ls_bow_given` and never gives it again. Smiths and quartermasters sell bows and arrows. The bow goes in the crossbow slot: choose it in the quick menu's crossbow slot, hold the crossbow key to draw. Kills with one or two arrows give perfect pelts; a long fight gives a poor one.
- Progress from 1.6 carries over, according to the author: the compendium pages, the legends, and the bow, arrows, and pelts in the inventory.
- **Option limit:** its options page adds 46 entries. All mod menu files together now have 314 `Var` entries, more than the author's stated limit of about 230 options across all mod pages. If a mod page does not open at all, that limit is the cause; the mods keep running on their defaults. Not yet checked which pages still open.
- No `mods.settings` entry. Not yet checked in game beyond the compendium pictures loading.

### Deaths Reworked

- **[Deaths Reworked - Wounds and Brutality](https://www.nexusmods.com/witcher3/mods/11964):** release 2.75 (uploaded October 22, 2026), Next Gen main file, installed on October 24 over 2.73 (October 20) and 2.70. The installed descriptor still says version 1.0, internal name `dynamicragdoll`.
- Folder `mods/modDeathsReworkedWoundsAndBrutality`; all 5 archive files match. 2.75 no longer ships `content/en.w3strings`; the 2.73 copy left behind by extracting over it was moved to the Recycle Bin on October 24, so delete the old folder before updating.
- Releases 2.72 and 2.73 add more death-animation variety, new Aard kills, and a new crawling wounded variant; 2.73 restores the legless crawling animations. 2.75 adds two optional files, Script Friendly 1.1 and High Finisher Chance; neither is installed.
- The author's notes: remove older versions first. The Next Gen main file needs the mod's wound script; script-heavy setups can use an older optional file without it. Run Script Merger with other script mods. The author expects conflicts with other death-animation, ragdoll, finisher, wound, or damage-processor mods.
- It changes death animations and blood. Check it together with VAXIS's Blood Physics and Blood And Steel. Not yet tested in game.
- Overlap: it and VAXIS's Blood Physics replace the same four ragdoll files, `dwarf_base_ragdoll`, `man_base_ragdoll`, `wildhunt_base_ragdoll`, and `woman_base_ragdoll` (`.w2ragdoll`). Neither has a `mods.settings` entry, so the game's default order for unlisted folders decides; which copy wins has not been determined. To decide it, give the preferred mod an entry; the author asks to load Deaths Reworked after other physics packs. A bundle check on October 20 found the same four shared files in 2.73.

### Blood And Steel

- **[Blood And Steel](https://www.nexusmods.com/witcher3/mods/9674):** release 3.02, Remastered file. It changes attack animations and targeting, and adds dodges while holding block.
- Folders `mods/modBloodAndSteel` and `dlc/dlcBloodAndSteel`, plus the optional settings menu `modBloodAndSteel.xml`. All 24 archive files match.
- The author says it conflicts with mods that change attack animations and recommends Script Merger for other conflicts. The author also writes that compatibility with Remastered mods has not been established yet.
- Its scripts are precompiled (`precompiled.rsblob`); no loose `.ws` files are installed. A bundle check on October 15, 2026 found no file overlaps with the other installed mods. The author recommends turning off **Target With Movement Keys On Keyboard**.
- Not yet tested in game, particularly with Brothers In Arms and Deaths Reworked.

### Animations, appearances, and lighting

- **Complete Animations Redux:** removed on October 7, 2026 and no longer part of this list. Its leftover inventory props break saves; see [why it was removed](complete-animations-redux.md).
- **Dynamic Appearances Project:** use the [BiA-compatible Remastered main file](https://www.nexusmods.com/witcher3/mods/9219?tab=files). Release 3.0.2 (uploaded October 19) replaced 3.0b on October 20, 2026; it keeps the 3.0b folder names, and all 12 archive files match. The author says this variant needs no extra BiA patch. Install one main variant only. It must have priority over Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority). Its presence here does not prove complete 5.0 compatibility.
- **Light Rewrite:** copy the complete archive. Its [release notes](https://github.com/webspam/LightRewrite/releases) describe the Remastered lighting changes; the installed release is 0.26.2 (uploaded October 23), installed on October 24, 2026 (74 files, all matching). The Shared Imports requirement in older 4.04 instructions does not apply to the Remastered instructions.

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

`mods.settings` gave Brothers In Arms `Priority=99`, and Dynamic Appearances Project had no entry.
Adding an entry with `Priority=98` for Dynamic Appearances Project fixed it after a game restart on October 7, 2026.
On October 15 both were renumbered to make room for a nude mod below them; the order is unchanged:

```ini
[moddynamicappearancesprojectremastered-bia]
Enabled=1
Priority=95

[modBrothersInArms]
Enabled=1
Priority=96
```

Lower numbers have higher priority.
Dynamic Appearances Project must keep a lower number than Brothers In Arms.
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

**Remastered compatibility is unconfirmed.** Nexus warns that the mod may only work with older game versions.
On October 24, the English conversion from version `163` to `164` preserved all 755 strings.
An independent reader also verified the converted text.
The converted English file is installed, and the player's follow-up screenshot confirms that the notice title and body display correctly.
This confirms the noticeboard repair, not full quest compatibility.
The mod remains enabled with its earlier script repairs. See the [diagnosis, conversion, and validation limits](a-witcher-can-hide-another.md#3-convert-the-english-text-for-remastered).

### Path Tracing and Ray Tracing Optimization

Copy the supplied `bin` and `mods` folders into the game directory; the top-level `PT-Optimization-README.txt` is documentation only.
Release 2.1 moves the settings to **Options → Mods → RT/PT optimization**; `mods/modPTOptimization` holds only their translated strings.
Another mod that supplies `xinput9_1_0.dll` requires a conflict decision before installation.

This setup uses **PT Optimization 2.2** (Nexus release **8**, uploaded October 16, 2026), installed on October 20.
Release 2.2 removes the stutter when leaving a full-screen menu with DLSS Frame Generation on; the fix is a new switch in the mod menu, on by default.
To update, replace all files. All 21 installed archive files match, with no leftover files.
`RTOptimization.ini` still says v2.1 in its header; the DLL identifies itself as 2.2.
At the launch on October 20 at 22:08, `rt_optimizer.log` reported `PT Optimization 2.2 loaded`.

Release 2.1 FINAL (Nexus release 7, uploaded October 13) was installed from October 15 to 20.
The author lists it for game patches 5.01 (GOG, Steam, Epic), 5.00c, and 5.00b; updating from the BETA means replacing all files.
Release 2.0 stays on Nexus as an optional file for anyone who has problems with 2.1.

Before this update, the 2.1 BETA (release 6) had been installed on October 11, which the October 10 record did not show.
Its log, last written at 11:54 on October 15, showed the DLL loading and set `path tracer: bounces = 1, indirect light = 105%`.
At the launch on October 15 at 14:50, `rt_optimizer.log` reported `PT Optimization 2.1 loaded`, with the mod enabled and 14 settings registered in the menu.
No frame-rate improvement has been measured for this setup.

**Crashes under investigation.**
From October 17 to 18, the game crashed three times in Novigrad on a worker thread that updates the objects attached to characters.
"CPU: fast bone reads" was turned off after the first two crashes, but the third crash happened with it off, so it is not the cause.
PT Optimization is the first suspect to test; see the [crash analysis and next tests](novigrad-worker-thread-crashes.md).

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

Any number below 99 works; 97 sits between Brothers In Arms (96) and the Nudes Collection (98), which share no files with it.
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

### Nudes Collection Ultimate Edition

> **Removed on October 15, 2026, and replaced by `modShouldBeNude` (the collection's "Should Be Nude" file) at the same `Priority=98`.**
> Besides the scene characters, the Ultimate Edition undresses about 47 everyday community women, for example `novigrad_citizen_woman`, `novigrad_peasant_woman`, and `novigrad_poor_woman` in Novigrad, plus villagers in Velen, Skellige, the prologue, and Toussaint. Ordinary townswomen walked the streets nude.
> Should Be Nude covers only characters who are nude in their scene: Passiflora and Pegleg Peggy's girls, the q302 bathhouse, succubi, quest NPCs, and Ciri's sauna and lingerie bodies. The only plain townsfolk in it are the game's own "naked" variants (`novigrad_naked_citizen_woman`, `skellige_naked_woman`). Main characters still come from Dynamic Appearances Project and Brothers In Arms.
> The installed `modShouldBeNude` matches the Nexus archive **B01. Should Be Nude 3.8.F** (`B01. Should Be Nude-5436-3-8-F-1642435997.7z`, uploaded January 17, 2022) by SHA-256 for all 3 files: `blob0.bundle` `4058F2D5…`, `metadata.store` `A18F50DF…`, `texture.cache` `7D72A22E…`.
> On the Nexus files tab the Ultimate Edition is B01 plus the single-character files B02–B32 (several "nude all the time") and the crowd packs B33–B49. **B48. Community NPCs Nude Pack** undresses the everyday townswomen. Add-ons the author built for B01 (B42, Opt03, Opt04, Opt06, Opt07, Opt11) only affect their own scenes. Opt05 Keira is incompatible with other mods that edit Keira's `.w2ent`, which includes Brothers In Arms and Dynamic Appearances Project.
> The installed Ultimate folder is gone, and only a stray `metadata.store` remains in `mod-fix-backups/removed-2026-10-15/modNudesCollectionUltimate`. The original archive is still in Downloads. `mods.settings` backup: `mods.settings.bak-2026-10-15-shouldbenude`. The notes below describe the removed Ultimate Edition.

PaulR0013's [Nudes Collection](https://www.nexusmods.com/witcher3/mods/5436) is an adult collection of nude characters and scenes: nobody is completely nude, everyone keeps some accessories, and the focus is on secondary NPCs.
Each character is also offered as a standalone file; this setup uses the all-in-one **A01. All Together Ultimate Edition 4.2.1.F** (uploaded August 9, 2024), installed on October 15, 2026 as `mods/modNudesCollectionUltimate`.
All 4 archive files match the installed files by SHA-256 (79,655,817 bytes).
Nexus tags it Remastered and Next-Gen compatible, and the description says it is compatible with Remastered, but the author also writes that it was built and tested on game version 1.32.
It adds no pubic hair or genital textures; the author recommends separate texture mods such as [Humans of the Continent](https://www.nexusmods.com/witcher3/mods/5710) and [The Elder Bush](https://www.nexusmods.com/witcher3/mods/3433).

Its bundle lists about 300 files, almost all character `.w2ent` files: 77 from Blood and Wine, 47 community NPCs, Ciri's body variants and character files, Triss, Yennefer, Keira, Philippa, Shani, Anna Henrietta, Syanna, and many quest NPCs.
It also replaces the Skellige sauna scene, `q205_08a_3b_sauna_changing_clothes.w2scene`; no other installed mod replaces that file.
In game on October 15, Ciri keeps a bandage in the sauna scene, consistent with the collection's accessories approach.

Shared files and the winner at `Priority=98`:

| Also in | Files | Winner | Effect |
| --- | --- | --- | --- |
| Dynamic Appearances Project (95) | 27, including `ciri.w2ent`, `ciri_player.w2ent`, `triss.w2ent`, `yennefer.w2ent`, `keira_metz.w2ent`, `shani.w2ent`, `syanna.w2ent` | Dynamic Appearances Project | These main characters keep the Dynamic Appearances versions and are not changed by the collection. |
| Brothers In Arms (96) | 15, including `keira_metz.w2ent`, `philippa_eilhart.w2ent`, `whistling_wendy.w2ent`, and Toussaint community women | Brothers In Arms | Keeps the Brothers In Arms versions. |
| ModjiggleRR (no entry) | 11 Ciri body files, including `body_01_wa__ciri_bandaged_naked.w2ent` | Nudes Collection | No jiggle changes on those Ciri bodies. |
| The Living Continent (no entry) | 55 community NPCs (Toussaint, Novigrad, Velen, Skellige, White Orchard women) | Nudes Collection | No winter clothes for those villager types. The Living Continent checks that an entity has its `lc_winter_` twin appearance before switching (`Wants` and `HasTwin` in `w3livingsky_folk.ws`), so nothing breaks. |

Dynamic Appearances Project and Brothers In Arms must keep winning: their scenes and community files request appearances that exist only in their own copies, as with [Keira](#brothers-in-arms-priority).
The author recommends giving the collection a higher priority than other mods; that is deliberately not done here.
`Priority=98` reuses the slot of `modShouldBeNude` (backup: `mods.settings.bak-2026-10-15-nudes`).
The collection's old-gen character files may undo Next-Gen and Remastered model changes on the NPCs it replaces; check them in game.

#### Removed: modShouldBeNude and modAllNudeBushy

Both were reinstalled on October 15, 2026 from the earlier `G:\The Witcher 3 Wild Hunt.v40modded` installation and removed again the same day.

- **modShouldBeNude** is the "Should Be Nude" file of the same collection, files dated January 2022. The Ultimate Edition contains 54 of its 55 files in a newer release; only `q210_avallach_lover.w2ent` is not included. It worked in game: Ciri was nude without a bandage in the sauna.
- **modAllNudeBushy** is [All Nudes Bushy](https://www.nexusmods.com/witcher3/mods/1127) 1.1, files dated January 2016. It replaced 17 body textures (generic and old women, Ciri, Yennefer, the Crones' beauty forms, and the burned prostitute) and predates Next-Gen. It was installed only for a test.

While modShouldBeNude was installed, its stale `Priority=80` entry made it override Dynamic Appearances Project and Brothers In Arms on five NPCs.
Every `mods.settings` file on this setup, including old backups, stays within 0-99, so a value above 99 was not used.
Instead the entries were renumbered (backup: `mods.settings.bak-2026-10-15-renumber`):

| Mod folder | Before | After |
| --- | --- | --- |
| `moddynamicappearancesprojectremastered-bia` | 98 | 95 |
| `modBrothersInArms` | 99 | 96 |
| `modGwentAnimatedCards` | 97 | 97 |
| `modShouldBeNude`, now `modNudesCollectionUltimate` | 80 | 98 |
| `modGwentRedux` | 99 | 99 |

Brothers In Arms shares no files with either Gwent mod, so moving it from 99 to 96 changes nothing else.
The stale `[modAllNudeBushy]` and `[modBushyOptionB]` entries (both `Priority=2`) remain in `mods.settings` with no folders installed.

### Body textures: The Elder Bush and Females of the Continent

The Nudes Collection adds no pubic hair; its author recommends separate texture mods.
Two of them were installed on October 15, 2026, both texture-only, with no scripts, scenes, or character files:

- **[The Elder Bush](https://www.nexusmods.com/witcher3/mods/3433)** (archive `Ciri Pube-3433-1-1545496436.rar`, files dated October 21, 2018), installed as `mods/modACiriPube`. It replaces one texture, Ciri's body diffuse map `characters\models\main_npc\ciri\model\body_03__wa_ciri_d01.xbm`, with white pubic hair. All 3 archive files match the installed files (6,923,975 bytes).
- **[Humans of the Continent](https://www.nexusmods.com/witcher3/mods/5710), B3. Females of the Continent – Bushy Option** 1.0 (archive `B3. Females of the Continent - Bushy Option-5710-1-0-1620778213.rar`, files dated May 10, 2021), installed as `mods/modHC4K02FemalesVanillaBushy`. It replaces 231 female body and head textures in 4K, in a 1.3 GB `texture.cache`. All 3 archive files match the installed files by SHA-256, streamed from the archive.

Both were built before Next-Gen. If Remastered cannot read their `texture.cache` format, the game falls back to its own textures without an error; check in game.
They may also look softer than the Remastered textures around them.

Shared textures and the winners:

| Texture | Mods | Winner |
| --- | --- | --- |
| Ciri's body (`body_03__wa_ciri_d01.xbm`) | The Elder Bush (8), Females of the Continent (99) | The Elder Bush |
| Cerys's head (`h_01_wa__cerys_d01.xbm`) | Females of the Continent (99), Nudes Collection (98) | Nudes Collection, whose credits describe a Cerys head texture that removes the neck seam |
| Burned prostitute's body | Females of the Continent (99), Nudes Collection (98) | Nudes Collection |

Neither shares files with Dynamic Appearances Project, Brothers In Arms, or any other installed mod.
Both had old `mods.settings` entries from an earlier setup (`modACiriPube` 8, `modHC4K02FemalesVanillaBushy` 20), which became active on install.
Females of the Continent was moved from 20 to 99 so the Nudes Collection keeps its Cerys texture (backup: `mods.settings.bak-2026-10-15-hc4k`).
It shares 99 with Gwent Redux, but the two have no files in common.
The other Humans of the Continent parts (`modHC4K01MalesVanilla`, `modHC4K03ChildrenVanilla`) still have old entries but are not installed.

### New Hairstyles and Beards For Geralt

[New Hairstyles and Beards For Geralt](https://www.nexusmods.com/witcher3/mods/4400) (DLC2 Improved) adds hairstyles and beards for Geralt, offered by barbers; several have HairWorks versions.
This setup uses the main file **4.0** (uploaded October 14, 2026), tagged Remastered Compatible, installed on October 15 as `mods/modNewHairstylesAndBeards`.
All 25 archive files match the installed files by SHA-256 (6,867,117 bytes).
Release 4.0 is a single main file; earlier releases had a separate Brothers In Arms edition (3.0.2).
It has loose, annotated scripts; its only hook into game code is `@wrapMethod SetScar` in `dlc2improved_head.ws`, which no other installed mod uses.
Release 4.0 renamed its console commands; a commenter mentions `addHairDLC5`.

It shares four files with Brothers In Arms: the Skellige barber scenes `shop_brokvar_barber_01.w2scene`, `shop_glinsk_barber_01.w2scene`, and `shop_kaer_trolde_sjusta.w2scene`, and the quest phase file `dlc\dlc2\data\quests\dlc2.w2phase`.
With Brothers In Arms winning, those barbers offer only the vanilla styles; players in the mod's comments report the same and recommend loading it above Brothers In Arms.
One player reported on October 9-10 that the 3.x BiA edition showed only vanilla styles even above Brothers In Arms; that was before 4.0.
It was given `Priority=94` (backup: `mods.settings.bak-2026-10-15-hair`), above Dynamic Appearances Project (95) and Brothers In Arms (96).
It shares only shader-graph files with Dynamic Appearances Project and the other mods.
Check in game that the new styles appear at the Skellige barbers.

### Map Remastered

[Map Remastered](https://www.nexusmods.com/witcher3/mods/13347) redraws the regional maps, the world map and its region emblems, and the map and minimap icons, keeping their original size and position.
The author says the artwork was AI-generated and then checked against the game's resources.
This setup uses the main file **Map and Icons Remastered 2.4.2** (uploaded October 16, 2026), installed on October 20 as `mods/modmapredraw` over 2.4.1 (October 15).
The archive's folder goes straight into `mods`; its `README.txt` and `CHANGELOG.txt` are documentation only.
When updating, **replace the whole folder** instead of extracting over it, as the changelog says, and keep only one copy.
Extracting 2.4.2 over 2.4.1 here left two old scripts, `mapRedrawQuestLevels.ws` and `mapRedrawSettings.ws`, which 2.4.2 no longer ships; both were moved to the Recycle Bin on October 20.
All 7 installed files now match the 2.4.2 archive, with no extra files.

Release 2.4.2 keeps the redrawn map terrain but uses the game's original icon artwork on both maps.
It drops the custom icon toggle, the quest-level setting, and the quest-level labels, so the mod has no options left.
It keeps its merchant, armorer, and blacksmith pin caching.
The author lists one known issue: stash icons can disappear.

Its bundle replaces two Flash files: the world map, `gameplay\gui_new\swf\worldmap\panel_worldmap.redswf`, and the HUD minimap, `gameplay\gui_new\swf\hud\hud_minimap2.redswf`.
No other installed mod replaces either file.
It has loose, annotated scripts (`useLooseScripts: true`) and no `mods.settings` entry.

Its script hooks:

- `@wrapMethod` on `CR4MapMenu.OnConfigUI` and `CR4HudModuleMinimap2.OnConfigUI`.
- `@wrapMethod` on `CR4HudModuleMinimap2.OnTick`, also wrapped by The Living Continent for its calendar. Both wrappers call the original method, so they chain rather than replace each other.
- `@replaceMethod` on `W3MerchantComponent.GetScriptInfo`, for the pin cache. No other installed mod replaces that method.

Release 2.4.1 also wrapped `CR4MapMenu.UpdateEntityPins`, which Brothers In Arms wraps too; 2.4.2 no longer does.

Sharedutils adds its own map pins; whether they keep their icons on the redrawn map has not been checked.
Nothing has been checked in game yet.

#### Removed: Restored High Quality Weather Icons and Moon Phases

[Restored High Quality Weather Icons and Moon Phases - Remastered](https://www.nexusmods.com/witcher3/mods/14389) release 1 was installed on October 15, 2026 and removed the same day.
It restores the higher-resolution weather icons of the game's 1.0 release and adds full-moon and red-moon phases.
Its icons are in its own copy of `hud_minimap2.redswf`, the file Map Remastered also replaces, so only one of the two can take effect.
Map Remastered was given the minimap, which left the weather mod with only its scripts (`UpdateWeatherDisplay`, `GetCurMoonState`, `IsFullMoon`, `IsRedMoon`) and none of its artwork.
The Living Continent also hides the game's weather box by the minimap while its calendar is showing (`W3lsShowWorldCondition` in `w3livingsky.ws`), so the icons would rarely have been visible.
All 4 installed files had matched the archive.
The folder was moved to `mod-fix-backups/removed-2026-10-15/modHighQualityWeatherIcons`; it never had a `mods.settings` entry.
It adds no items or quests, so removing it should not affect saves, according to its description.

### Better Torches and No Indignant NPCs

Both were installed on October 17, 2026 from their Remastered main files; No Indignant NPCs was updated to 3.2 on October 20.
Better Torches is a classic script mod that ships full copies of base game scripts. Since 3.2, No Indignant NPCs uses an annotated script instead.
Neither mod has a `mods.settings` entry, and no other installed manual or mod.io mod replaces any of their scripts or methods, so no Script Merger run is needed for this set.

[Better Torches Next-Gen (and Remastered)](https://www.nexusmods.com/witcher3/mods/7186) by Phaz42, a port of Syynx's Better Torches, lets Geralt ride, sail, cast signs, block, parry, heavy attack, and climb ladders without putting his torch away.
Climbing ledges with a torch is already part of the game since Next-Gen.
This setup uses **Better Torches Next-Gen for W3 Remastered 5.01**, release **5.1.0** (uploaded October 9, 2026), installed as `mods/modBetterTorchesNextGen` (6 files, 677,835 bytes, all matching the Nexus file manifest).
Do not use the optional 4.4.0 file, which is for Next-Gen 4.04 only.

- It replaces `explorationStateInteraction.ws`, `itemEntity.ws`, `playerInput.ws`, `r4Player.ws`, `mountHorse.ws`, and `useVehicle.ws`.
- Each copy equals the patched `5.0.0.1048522` script plus the lines marked `// modBetterTorchesNextGen`, so it keeps the [October 8 patch](#october-8-2026-game-patch) changes to `r4Player.ws`. Release 5.1.0 also brings the torch back into Geralt's hand after he whistles for Roach.
- Light Rewrite wraps `CItemEntity.OnAttachmentUpdate` and `CR4Player.OnInteriorStateChanged`; Brothers In Arms wraps `CPlayerInput.Initialize` and `CR4Player.GetSpecialAttackTimeRatio`. The mod does not change those methods, so the wrappers still apply.
- Known issue from the author: Igni's alternate mode (the fire stream) points the wrong way while a torch is held. Put the torch away first.
- After a future game patch, check that the author has updated the file before playing; the replaced scripts would otherwise undo the patch's changes to them.

[No Indignant NPCs](https://www.nexusmods.com/witcher3/mods/3190) stops townsfolk from screaming, stumbling, and complaining when Geralt brushes past them, and when they walk into him while he stands still.
Since 2.3 they also ignore non-hostile signs, such as Igni lighting a fire; hostile magic still gets a reaction, according to the author.
This setup uses **No Indignant NPCs - Reworked and Customizable** release **3.2** (uploaded October 18, 2026), installed on October 20.
Extract the archive into the game directory: it installs `mods/modNoIndignantNPCs` and the menu file `NoIndignantNPCs.xml`, 19 files (27,484 bytes), all matching.

- 3.2 is a rework with its own settings menu. It is one annotated script, `content/scripts/local/NoIndignantNPCs.ws`, plus strings in 17 languages, and no longer replaces any base script.
- It wraps `CExplorationCollisionManager` (`CanNPCsCollide`, `UpdateCollisionWithNPCs`, `CanPlayerBePushed`), `W3HorseComponent.MakeNPCCollide`, `CR4Player.CanAttackWhenNotInCombat`, the sign-cast and channeling broadcasts, and the loot popups. It replaces `WeaponHolsterStateSelectingWeapon.SignalDrawSwordAction` and `SignalHolsterSwordAction`.
- No other installed mod replaces those methods. Better Torches replaces `r4Player.ws`, and the `CR4Player` wrapper applies to that copy.
- **Upgrading from 2.4:** delete `content/scripts/game/behavior_tree/ai_parameters/humanReactionParams.ws` from the mod folder, or the whole folder before extracting. Extracting 3.2 over 2.4 here left that file behind, and it kept replacing the base script. It was moved to the Recycle Bin on October 20.

Release 2.4 (uploaded October 13, 2026, installed October 17 to 20) replaced `game/behavior_tree/ai_parameters/humanReactionParams.ws` only. It commented out the bump reaction (`CAIActionBumpTree`) and the cast-sign reaction (`CAIActionCastSign`) in the NPC reaction trees, so NPCs no longer got shoved out of the way and Geralt had to walk around crowds.

Neither mod adds items or quests; removing the folder undoes it.
Nothing has been checked in game yet.

### No Loading Screen Narrations

[No Loading Screen Narrations](https://www.nexusmods.com/witcher3/mods/13280) removes the narrated storybook recap that plays while a save loads. It is a cooked bundle: `blob0.bundle` carries a short silent clip, and `metadata.store` points 19 clips under `movies\cutscenes\storybook` (`st_1.usm` to `st_23.usm`) at it, so the game plays silence instead of the narration.
This setup uses Nexus release **2** (archive stamped October 8, 2026), installed on October 24 as `mods/modMuteLoadingNarrations`. Its `info.json` says "Mute Loading Narrations - Remastered" 1.0.1, game version 29, no dependencies.
Extract the archive into the game directory: it installs 3 files (36,067 bytes), and all three match the archive by SHA-256. The archive's `SHA256SUMS.txt` is not installed.

- It has no menu, no DLC, no scripts, and no `mods.settings` entry. Removing the folder undoes it.
- No other installed mod replaces the storybook videos; the `metadata.store` files of the other `mods` and `dlc` folders contain no storybook entries.
- It does not touch the startup logos or the in-game cutscenes.
- Not yet tested in game: check that a loaded save skips straight to the world with no narrated recap and no hang on a black screen.

### W3LoadFix

[W3LoadFix](https://www.nexusmods.com/witcher3/mods/13881) speeds up the loading screens after death, quick load, and fast travel. It patches the running game in memory and changes no game file. The author lists eight switches, one per part, and the log names each as ON, OFF, or UNAVAILABLE: a parallel batch request for the terrain and occlusion tiles, an index for the interior-area scan (`AttachLayers`), libdeflate with decompression spread over helper threads, the engine's loading mode for the whole loading screen, an index for the tag manager, fewer controller checks (Linux and Steam Deck only), and a `FoliageFix` (not described in the readme). Three sliders in the menu can shorten the loading-screen fades (game default 3 / 3 / 1.5 s).
This setup uses release **1.0.8** (archive stamped October 19, 2026), installed on October 24. Copy `bin` from the archive: it installs 4 files (606,193 bytes), and all four match the archive by SHA-256. The readme and `W3LoadFix_licenses` folder are not installed.

- **Loader:** `dsound.dll` (the game loads it at startup; it loads `w3loadfix.dll` and forwards sound calls to the Windows copy). Only one `dsound.dll` can exist, so an ASI loader that uses that name conflicts; none is installed here. PT Optimization's `xinput9_1_0.dll` is a separate file and both load; the log lists `dxgi.dll` (ReShade) and `xinput9_1_0.dll` as the other proxy DLLs.
- **Game version:** the author built it for the Steam game build 5.01 (`0x6AC555A3`) and says other builds are untested. This install is GOG, and the log reports store GOG, game build `0x6AC555A3`, and "all 32 functions checked at the known addresses". After a game patch it finds its code by signature and switches a part off if the code changed, so check `w3loadfix.log` after patching.
- **Settings:** Options > Mods > W3LoadFix adds 13 menu entries to the already crowded [option limit](#the-living-continent---the-hunt). All parts are on (the shipped `w3loadfix.ini` is unchanged) except `ExperimentalStreaming`, which is off by default. `ZlibHelpers=0` gives 7 helper threads here, and 3 threads for the decompression tasks.
- **First run (October 24, 21:07):** startup took 5.9 s, the first save load (Skellige) 10.3 s, and a world change (Novigrad) 7.2 s, as the log's engine loading stages. The author measured 22.4 s down to 4.7 s on his PC, so this is no comparison without an off-run on this PC.
- **Disable or remove:** create an empty `bin/x64_dx12/w3loadfix_disabled` to switch it off, or delete the four files. The fade sliders keep their last value after removal.
- If a crash or visual glitch appears while loading, the author asks to turn off `TagFix`, `ParallelDecompression`, and `FastZlib` first, then the rest.

## In-game installations

1. Open **Mods** from the main menu.
2. Sign in with a CD PROJEKT RED account and connect mod.io.
3. Subscribe to the six mod.io entries linked in the [mod list](../README.md#in-game-installations).
4. Let the downloads complete and restart the game.
5. Check that each mod appears under **Installed** with its checkbox selected.

The packages are unpacked to `C:\Users\Public\mod.io`, so keep at least 5 GB free on C:.
On October 20, 2026, updates failed on a full drive, the game switched three mods off, and a save loaded without their items lost most of the inventory and Geralt's body.
After the game updates in-game mods, restart it and check this list before loading a save; see [mod.io updates on a full drive](modio-update-missing-items.md).

These steps follow [CD PROJEKT RED's installation instructions](https://support.cdprojektred.com/en/witcher-3/pc/gameplay/issue/3001/cross-platform-mod-support-how-to).
Keep the in-game packages in the game's managed storage.
Do not duplicate them by copying Nexus versions into `mods`.

### Recorded priorities

These are the numeric values saved in `modioModsConfig.json`, sorted by that value.
They record the current configuration, rather than a proven optimal order or a rule for mixed manual/mod.io precedence.

| Configured priority | Mod | Enabled |
| --- | --- | --- |
| 0 | The Last Wish Final Scene Restoration | Yes |
| 1 | Ciri Witcher Ending Restoration | Yes |
| 2 | Fast Travel Pack | Yes |
| 3 | Hoods | Yes |
| 4 | Corvo Bianco Enhanced Collection | Yes |
| 5 | The Spider and The Wolf | Yes |

The game renumbered these on October 20, 2026, when Hoods, Corvo Bianco, and The Spider and The Wolf were enabled again after a failed update; see [mod.io updates on a full drive](modio-update-missing-items.md).
Before that the order was Hoods 0, Corvo Bianco 1, The Last Wish 2, Ciri Witcher Ending 3, Fast Travel Pack 4, and The Spider and The Wolf 5.

The manual `mods.settings` entries, renumbered on October 15, 2026 (lower numbers win):

| Priority | Mod folder | Why |
| --- | --- | --- |
| 8 | `modACiriPube` | Wins Ciri's body texture over Females of the Continent; see [body textures](#body-textures-the-elder-bush-and-females-of-the-continent). |
| 41-43 | Griffin armor mods | See the [Griffin armor note](#griffin-armor-retexture-slim-mesh-and-t5-patch). |
| 94 | `modNewHairstylesAndBeards` | Must override Brothers In Arms' Skellige barber scenes; see [New Hairstyles and Beards](#new-hairstyles-and-beards-for-geralt). |
| 95 | `moddynamicappearancesprojectremastered-bia` | Must override Brothers In Arms; see [Brothers In Arms priority](#brothers-in-arms-priority). |
| 96 | `modBrothersInArms` | |
| 97 | `modGwentAnimatedCards` | Must override Gwent Redux; see [Animated Gwent Cards load order](#animated-gwent-cards-load-order). |
| 98 | `modShouldBeNude` | Must lose to Dynamic Appearances Project and Brothers In Arms; see [Nudes Collection](#nudes-collection-ultimate-edition). |
| 99 | `modGwentRedux` | |
| 99 | `modHC4K02FemalesVanillaBushy` | Below the Nudes Collection; no files in common with Gwent Redux. |

All entries are enabled.
The other fifteen manual `mods` folders, including the strings-only `modPTOptimization` and The Hunt's `modW3LSHunt`, have no matching entries in that file; the PT DLL, W3LoadFix, and the Living Continent ReShade add-on are outside this mechanism.
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

The [manual inventory](../inventory/manual.json) records twenty-seven manual installations; Complete Animations Redux and Restored High Quality Weather Icons are kept under `removedMods` for reference.
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
| Map Remastered | 2.4.1 | 8 | 598,947,435 |

The top-level readme files of the Gwent Redux, PT Optimization, Living Continent, and Map Remastered archives (and Map Remastered's changelog) are not installed and are not counted.

On October 17, 2026, the two new installations were compared by SHA-256 with every file listed in their Nexus file manifests; all matched, with no extra installed files:

| Mod | Release | Files | Bytes |
| --- | --- | --- | --- |
| Better Torches Next-Gen | 5.1.0 | 6 | 677,835 |
| No Indignant NPCs | 2.4 | 1 | 37,222 |

On October 20, 2026, eight updated installations received a full SHA-256 comparison of every installed archive file; all matched:

| Mod | Release | Files | Bytes |
| --- | --- | --- | --- |
| Brothers In Arms | 4.1.1 | 77 | 576,705,928 |
| Dynamic Appearances Project (BiA) | 3.0.2 | 12 | 128,607,975 |
| Light Rewrite | 0.25.1 | 74 | 476,563 |
| PT Optimization | 2.2 (Nexus release 8) | 21 | 141,023 |
| The Living Continent | 1.6 | 67 | 625,573,141 |
| Deaths Reworked | 2.73 | 6 | 80,418,487 |
| Map Remastered | 2.4.2 | 7 | 598,940,487 |
| No Indignant NPCs | 3.2 | 19 | 27,484 |

Map Remastered and No Indignant NPCs had been extracted over their previous releases, which left old scripts behind: `mapRedrawQuestLevels.ws` and `mapRedrawSettings.ws` from Map Remastered 2.4.1, and `humanReactionParams.ws` from No Indignant NPCs 2.4.
All three were moved to the Recycle Bin; after that, no installed folder holds files that its archive lacks.
The Living Continent's readme and sound credits are not installed and are not counted.

On October 24, 2026, three updated installations and one new one received a full SHA-256 comparison of every installed archive file; all matched, with no leftover files:

| Mod | Release | Files | Bytes |
| --- | --- | --- | --- |
| Light Rewrite | 0.26.2 | 74 | 480,012 |
| Deaths Reworked | 2.75 | 5 | 80,442,824 |
| The Living Continent | 1.7 | 56 | 43,528,727 |
| The Living Continent - The Hunt | 1.0 | 52 | 608,464,122 |

Deaths Reworked's 2.73 `en.w3strings` was moved to the Recycle Bin first. The readme and sound-credits files of both Living Continent archives are not installed and are not counted.

No Loading Screen Narrations (release 2, 3 files, 36,067 bytes) and W3LoadFix 1.0.8 (4 files, 606,193 bytes) were installed later that day and compared the same way; all files match and nothing extra is installed.

Internal metadata can retain older labels.
For example, the matched Brothers In Arms 4.0.4 archive reports `4.0.2` internally, and Sharedutils 4.1 reports `3.1.1`.
Those are metadata differences, not proof of separate installed versions.

Nexus and mod.io also use different releases:

| Project | Installed mod.io version | Nexus version observed on the snapshot date |
| --- | --- | --- |
| Ciri Witcher Ending Restoration | 0.2 | 1.3 |
| The Last Wish Final Scene Restoration | 0.1 | 1.1 |
| Fast Travel Pack | 2.1.0 | 3.0.0 Remastered |
| The Spider and The Wolf | 1.2.3 (1.2.2 until October 20, 2026) | 2.01 Remastered |

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
When the patch was recorded, no installed manual or in-game mod replaced any of those files.
Better Torches Next-Gen 5.1.0, added on October 17, replaces `r4Player.ws` with a copy based on the patched script; see [its note](#better-torches-and-no-indignant-npcs).
Brothers In Arms wraps methods of `CInventoryComponent`, defined in the patched `inventoryComponent.ws`.
Scripts still compile, but mod releases from before the patch are not verified on the new executable.
PT Optimization detected the new build and applied its rendering changes, according to its log.

## Available updates

Checked on October 24, 2026 against the Nexus files pages and the mod.io pages.
Light Rewrite 0.26.2, Deaths Reworked 2.75, and The Living Continent 1.7 were installed that day, together with the new The Living Continent - The Hunt 1.0; see [the comparisons](#versions-and-inventory-evidence).

| Mod | Installed | Latest | Released | Notes |
| --- | --- | --- | --- | --- |
| VAXIS's ULTRA Plus Blood Physics | 1.5 | 1.6 (darker blood version) | October 15, 2026 | A second main file next to 1.5, not a replacement. 1.5 stays current unless darker blood is wanted. |

The game updated three in-game mods on October 20: Hoods 3.6 → 3.7, Corvo Bianco Enhanced Collection 5.00 → 5.01, and The Spider and The Wolf 1.2.2 → 1.2.3.
mod.io first listed them as update pending (state 2 in `mod.io/8254/metadata/state.json`), but with 1.3 GB free on C: the new files could not be unpacked.
The game then switched the three mods off, and a save loaded in that state lost most of the inventory and Geralt's body; see [mod.io updates on a full drive](modio-update-missing-items.md).
After space was freed, all three show state 1, installed, and each payload's file count and size match the mod.io metadata.
All six were enabled again in the **Mods** menu, and the game renumbered the priorities; see [recorded priorities](#recorded-priorities).
Hoods 3.7 moved its language string files from `dlc/dlchoods` to `mods/modhoods`.

All other installations are on the latest release.
On October 24 these were the latest Nexus files: Brothers In Arms 4.1.1, Sharedutils 4.1, Dynamic Appearances Project 3.0.2, Light Rewrite 0.26.2, A Proper Send-off 1.21, A Witcher Can Hide Another 1.1.1, PT Optimization 2.2, the three Griffin armor files (Slimmer Griffin Armor and SGA T5 1.5, OTP Final), The Living Continent 1.7, The Living Continent - The Hunt 1.0, Deaths Reworked 2.75, Blood And Steel Remastered v3.02, Gwent Redux release 20, Animated Gwent Cards release 4, New Hairstyles and Beards 4.0, Map Remastered 2.4.2, Better Torches 5.1.0, and No Indignant NPCs 3.2.
All six in-game mods match mod.io: Hoods 3.7, Corvo Bianco Enhanced Collection 5.01, The Last Wish Final Scene Restoration 0.1, Ciri Witcher Ending Restoration 0.2, Fast Travel Pack 2.1.0, and The Spider and The Wolf 1.2.3.
The pages of ModjiggleRR, the Nudes Collection, The Elder Bush, and Humans of the Continent could not be checked without adult content enabled.

## Gameplay checks still needed

- Confirm a clean launch and script compilation with the full set enabled.
- Check the documented mod menus and input controls.
- Confirm that the slim mesh and OTP textures load on each Griffin tier, including the T5 chainmail and shoulder pads.
- Test combat with Deaths Reworked and Blood And Steel together, alongside Brothers In Arms and VAXIS's Blood Physics.
- Check The Living Continent at night with Light Rewrite, and whether villagers that Brothers In Arms overrides get its winter clothes.
- Check The Hunt: the bow (a save that already had the bow once does not get a new one), skinning, the new animals, and the Huntsman's Compendium in the game menu.
- Check that every mod page under Options → Mods still opens, now that the mod menus have more entries than the stated limit of about 230.
- Check whether The Living Continent 1.7 fixed the lightning flashes before turning Lightning in Storms back on.
- Check which ragdoll files win between Deaths Reworked and VAXIS's Blood Physics.
- Check that the animated Gwent cards appear and that mouse input works in a match and the deck builder, now that Animated Gwent Cards has `Priority=97`.
- Check Map Remastered 2.4.2's world map, minimap icons, and region emblems, including Brothers In Arms and Sharedutils map pins and the stash icons.
- Check that the new hairstyles and beards appear at the Skellige barbers (Brokvar, Glinsk, Kaer Trolde).
- Check Better Torches: mount Roach, cast a sign, block, and climb a ladder with a torch out, and whistle for Roach with a torch in hand; check that Light Rewrite's torch light still follows the torch.
- Check No Indignant NPCs 3.2: open its settings menu, walk and sprint through a crowd in Novigrad, and light a brazier with Igni near townsfolk.
- Check No Loading Screen Narrations: load a save and a fast-travel destination, and confirm that no narrated recap plays and the load does not hang.
- Check W3LoadFix: confirm that saves, deaths, and fast travel load with no crash, missing foliage, or stuck loading screen; compare load times with `w3loadfix_disabled` present; and check that its menu page opens.
- Check that Hoods 3.7, Corvo Bianco 5.01, and The Spider and The Wolf 1.2.3 load after the update and with the renumbered mod.io priorities.
- Find the cause of the Novigrad worker-thread crashes with the [next tests](novigrad-worker-thread-crashes.md#next-tests): about 30 minutes in Novigrad at dusk or night per test.
- Check that The Elder Bush and Females of the Continent textures load on Remastered, and Cerys's neck with the Nudes Collection's head texture.
- Check the NPCs that the Nudes Collection replaces for broken or old-gen models, and that the main characters it shares with Dynamic Appearances Project and Brothers In Arms keep those mods' looks.
- Check the Corvo Bianco interactions and their priority against Brothers In Arms.
- Play the added quests and restored scenes through their relevant triggers.
- Revisit an observed blank quest-journal entry; its cause remains unresolved.

The player reports that the A Witcher Can Hide Another repair worked.
The two edits are independently verified, but full quest completion and compatibility of every installed mod remain unverified.

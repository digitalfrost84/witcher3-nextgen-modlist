# My Witcher 3 Remastered mod list

My mod list for **The Witcher 3: Wild Hunt — Remastered (5.0)** on PC: bug fixes, restored scenes, new quests, character details, and lighting.
This guide records the versions I have installed and the extra steps needed to reproduce the setup.

**Snapshot: October 4, 2026.** GOG installation; DirectX 12 executable version `5.0.0.1044392`.
**Addition: October 6, 2026.** VAXIS's ULTRA Plus Blood Physics standard 1.2 was verified against the installed files.
**Removal: October 7, 2026.** Complete Animations Redux was removed after its item handling was found to corrupt the inventory; see [Removed mods](#removed-mods).
**Update: October 7, 2026.** Dynamic Appearances Project was upgraded from BiA-compatible 2.1.1 to 3.0b Remastered; see the [upgrade note](docs/setup.md#upgrading-dynamic-appearances-project-to-30b).
**Fix: October 7, 2026.** Dynamic Appearances Project needs priority over Brothers In Arms in `mods.settings`; otherwise Keira Metz stays nude after her bath in Wandering in the Dark. See the [priority note](docs/setup.md#brothers-in-arms-priority).
**Game patch: October 8, 2026.** GOG updated the DirectX 12 executable to `5.0.0.1048522` and changed 19 base scripts, including `inventoryComponent.ws`.
**Update: October 10, 2026.** Four mods were updated: Brothers In Arms 4.0.4, Sharedutils 4.1, Light Rewrite 0.19.1, and VAXIS's Blood Physics 1.4. Every installation matches its archive file for file. Brothers In Arms 4.0.4 fixed a crash when reading the *Lands of North Velen* book on the patched executable; see the [Brothers In Arms update note](docs/setup.md#updating-brothers-in-arms-to-404). PT Optimization stays on 2.0; its 2.1 release is a BETA. See [available updates](docs/setup.md#available-updates).
**Addition: October 11, 2026.** Fixed and Slimmer Griffin Armor 1.5 was added and verified file for file against its archive. It slims the Griffin breastplate. It has not been launched in game yet; see the [setup note](docs/setup.md#fixed-and-slimmer-griffin-armor).
**Addition: October 11, 2026 (evening).** Griffin Armour (On The Path) Final and its SGA T5 for On The Path patch 1.5 were added next to Fixed and Slimmer Griffin Armor and verified file for file against their archives. The three Griffin mods have explicit `mods.settings` priorities 41-43; see the [Griffin armor note](docs/setup.md#griffin-armor-retexture-slim-mesh-and-t5-patch). Not yet checked in game.
**Addition: October 11, 2026 (night).** Three mods were added and verified file for file against their archives: The Living Continent 1.4 (seasons, sky, and weather; **requires ReShade 6.8+ with full add-on support**), Deaths Reworked 2.70, and Blood And Steel 3.02. ReShade 6.8.0 with add-on support is installed as a requirement. The Living Continent was confirmed working in game; the two combat mods have not been tested yet. See the [notes for these mods](docs/setup.md#the-living-continent-and-reshade).
**Addition: October 15, 2026.** Three manual mods were added: Gwent Redux (Remastered port) release 20 in its BiA edition, its optional Animated Gwent Cards add-on release 4, and ModjiggleRR MED release 1. Every installation matches its archive file for file. Animated Gwent Cards must load above Gwent Redux, so `mods.settings` now gives it `Priority=97`. See the [Gwent Redux notes](docs/setup.md#gwent-redux-and-animated-gwent-cards) and the [ModjiggleRR notes](docs/setup.md#modjigglerr).
**Update: October 15, 2026.** Four mods were updated: Light Rewrite 0.23.0, VAXIS's Blood Physics 1.5, The Living Continent 1.5, and PT Optimization 2.1 FINAL (Nexus release 7), which moves its settings to Options → Mods. Every installation matches its archive file for file, with no leftovers. The record had missed that the PT Optimization 2.1 BETA was installed on October 11; see the [PT Optimization notes](docs/setup.md#path-tracing-and-ray-tracing-optimization). A file check also found overlaps between The Living Continent and Brothers In Arms, and between Deaths Reworked and VAXIS's Blood Physics; see the [notes for these mods](docs/setup.md#the-living-continent-and-reshade).
**Addition: October 15, 2026.** Map Remastered 2.4.1 was added and verified file for file against its archive. Restored High Quality Weather Icons and Moon Phases was installed the same day and removed again, because Map Remastered replaces the same minimap file; see [Removed mods](#removed-mods).
**Priorities: October 15, 2026.** `mods.settings` was renumbered so Dynamic Appearances Project (95) and Brothers In Arms (96) keep their character files against the nude mods below them; see [Recorded priorities](docs/setup.md#recorded-priorities).
**Addition: October 15, 2026.** PaulR0013's [Nudes Collection](https://www.nexusmods.com/witcher3/mods/5436) Ultimate Edition 4.2.1.F (adult) replaced two older nude mods, `modShouldBeNude` and `modAllNudeBushy`. It loads below Dynamic Appearances Project and Brothers In Arms (`Priority=98`), so the main characters they define keep their looks; see the [Nudes Collection note](docs/setup.md#nudes-collection-ultimate-edition).
**Checked at launch: October 15, 2026.** PT Optimization 2.1 FINAL and The Living Continent 1.5 both loaded without errors.
There are **25 installed mods: nineteen manual installations and six enabled in-game installations**, including Sharedutils as a dependency. ReShade is installed as a requirement of The Living Continent and is not counted as a mod.

**Review status:** the installed files and settings have been checked.
The A Witcher Can Hide Another repair is documented below, but the complete combination has not passed an end-to-end gameplay test.
The list remains a recommendation draft while those checks are pending.

## Start here

1. Read the [installation and compatibility notes](docs/setup.md).
2. Install the correct **Remastered** releases and their dependencies.
3. Use the recorded installation channel for each mod.
4. Apply the [A Witcher Can Hide Another repair](docs/a-witcher-can-hide-another.md) if its scripts still contain the old code.
5. Check the result on a separate save before continuing a playthrough.

The repository contains links, instructions, and small local patches. Download each mod from its author.

## Manual installations

The version column identifies the locally matched download where available.
Some internal `info.json` labels differ from the release number; see [version evidence](docs/setup.md#versions-and-inventory-evidence).

| Mod / Nexus link | Installed release | What it adds | Setup note |
| --- | --- | --- | --- |
| [Brothers In Arms — Ultimate Edition](https://www.nexusmods.com/witcher3/mods/11260) | Remastered 4.0.4 | Bug fixes and restored dialogue, quests, and other content. | Install Sharedutils; retain the mod, DLC, and menu files. Use 4.0.4 or later with the October 8 game patch; see the [update note](docs/setup.md#updating-brothers-in-arms-to-404). |
| [Sharedutils — All In One](https://www.nexusmods.com/witcher3/mods/12997) | 4.1 | Shared functions required by other mods, including Brothers In Arms. | Keep `modzzz_sharedutils` and `dlcsharedutils`. |
| [Dynamic Appearances Project](https://www.nexusmods.com/witcher3/mods/9219) | BiA-compatible 3.0b Remastered | Character appearances that change with story progress. | Use the BiA-compatible Remastered main file. When upgrading from 2.x, delete the old mod folder first. Give it priority over Brothers In Arms in `mods.settings`; see the [priority note](docs/setup.md#brothers-in-arms-priority). |
| [Light Rewrite](https://www.nexusmods.com/witcher3/mods/12144) | 0.23.0 | Changes to local lights, including candles and torches. | Install all supplied folders; inspect the in-game mod settings. |
| [A Proper Send-off](https://www.nexusmods.com/witcher3/mods/10881) | PL Remaster 1.21 | A voiced quest with Dandelion and Zoltan during Final Preparations. | Polish Remaster variant; installed as `moddandelionsballad`. Mind its quest window. |
| [A Witcher Can Hide Another](https://www.nexusmods.com/witcher3/mods/9453) | 1.1.1 script baseline + local fixes | A voiced questline with a new location and playable character. | Add its input bindings and apply the [two documented script repairs](docs/a-witcher-can-hide-another.md). |
| [Path Tracing and Ray Tracing Optimization](https://www.nexusmods.com/witcher3/mods/13025) | Nexus release 7 / PT Optimization 2.1 FINAL | Rendering controls for light bounces, shadows, and caustics. | Installs under `bin` plus a strings-only `mods/modPTOptimization`; settings are in Options → Mods. Another `xinput9_1_0.dll` mod can conflict. |
| [VAXIS's ULTRA Plus Blood Physics](https://www.nexusmods.com/witcher3/mods/13506) | 1.5 | Physics-based blood spray and wall drips, according to the author. | Keep `mods/modULTRAplussVaxisBlood` and its menu file; tagged Remastered Compatible on Nexus. Gameplay compatibility remains unverified. |
| [Fixed and Slimmer Griffin Armor](https://www.nexusmods.com/witcher3/mods/5631) | 1.5 (main file) | Slims the Griffin breastplate by reducing its curvature, plus smaller fixes. | Priority 42. Part of the three-mod Griffin setup; see the [Griffin armor note](docs/setup.md#griffin-armor-retexture-slim-mesh-and-t5-patch). Not yet checked in game. |
| [Griffin Armour (On The Path) Update](https://www.nexusmods.com/witcher3/mods/3251) | Final (June 2020 file) | Retextures the Griffin armor tiers up to the Grandmaster tier. | Priority 41. Retexture only; it does not change the shape. |
| [SGA T5 for On The Path](https://www.nexusmods.com/witcher3/mods/5631?tab=files) | 1.5 (optional file of Slimmer Griffin Armor) | Matches the slim Grandmaster Griffin chainmail to OTP's textures. | Priority 43, the highest of the three, as the author requires. |
| [The Living Continent - Seasons - Sky - Weather](https://www.nexusmods.com/witcher3/mods/13650) | 1.5 | Four seasons with snow and icicles, a real night sky, daytime halos, and living weather. | **Requires [ReShade](https://reshade.me) 6.8+ with full add-on support** for `bin/x64_dx12/witcher3.exe`; no effects needed. Copy both `bin` and `Mods`; the W3 Mod Manager copies only `Mods`. 1.4 was confirmed working in game; 1.5 not yet launched. Brothers In Arms overrides 14 of its NPC files. |
| [Deaths Reworked - Wounds and Brutality](https://www.nexusmods.com/witcher3/mods/11964) | 2.70 (Next Gen main file) | 60+ human death animations, wounds, dismemberment, heavier ragdolls, and new monster deaths. | Remove older versions first. The author expects conflicts with other death, ragdoll, finisher, wound, or damage mods. Shares four ragdoll files with VAXIS's Blood Physics. 2.72 is available. Not yet tested in game. |
| [Blood And Steel](https://www.nexusmods.com/witcher3/mods/9674) | 3.02 (Remastered file) | Combat animations, targeting, and new dodges while holding block. | Copy `mods` and `dlc`; `bin` adds an optional settings menu. Conflicts with mods that change attack animations. Not yet tested in game. |
| [Gwent Redux BiA Compatible (Remastered)](https://www.nexusmods.com/witcher3/mods/13403) | Gwent Redux (Remastered 5.X Port) release 20, BiA edition | Remastered port of Gwent Redux: new cards, leaders, decks, and Gwent options in the Mods menu. | Use the BiA main file only with Brothers In Arms installed; take exactly one of the four main files. Keep `modGwentReduxConfig.xml`. |
| [Gwent Redux Animated Gwent Cards](https://www.nexusmods.com/witcher3/mods/13403?tab=files) | Optional file, release 4 | Animated cards for Geralt, Ciri, Triss, Yennefer, and the base leaders Emhyr, Eredin, Foltest, and Francesca. | Optional file on the Gwent Redux page; original animations by EthanBlackBT. **Load order above Gwent Redux** (`Priority=97` against 99); see the [load-order note](docs/setup.md#animated-gwent-cards-load-order). Remove the old Animated Gwent Cards mod first. |
| [ModjiggleRR](https://www.nexusmods.com/witcher3/mods/13695) | MED variant, release 1 | Stronger breast physics on characters that already have physics (`info.json`: Jiggle Physics Adjustments Medium 1.1). | Adult content. Install one variant only. Brothers In Arms and Dynamic Appearances Project override some of its body files; see the [ModjiggleRR notes](docs/setup.md#modjigglerr). |
| [Nudes Collection – Ultimate Edition](https://www.nexusmods.com/witcher3/mods/5436) | A01. All Together Ultimate Edition 4.2.1.F | Nudity with accessories for about 300 character and scene files across the base game and both expansions, including Ciri in the Skellige sauna. | Adult content. Adds no pubic hair. `Priority=98`, below Dynamic Appearances Project and Brothers In Arms; see the [Nudes Collection note](docs/setup.md#nudes-collection-ultimate-edition). |
| [Map Remastered](https://www.nexusmods.com/witcher3/mods/13347) | Map and Icons Remastered 2.4.1 | Redrawn regional and world maps, region emblems, and clearer coloured map and minimap icons at their original size. | Installed as `mods/modmapredraw`. Replaces the world map and minimap Flash files; no other installed mod replaces them. See the [Map Remastered note](docs/setup.md#map-remastered). |

## In-game installations

These six mods are installed through the game's **Mods** menu and are enabled in the recorded configuration.
The versions below come from the installed mod.io packages.
Nexus links identify the corresponding projects; their downloads can have different versions and contents.

| Mod / Nexus link | Installed mod.io version | What it adds | In-game source |
| --- | --- | --- | --- |
| [Hoods](https://www.nexusmods.com/witcher3/mods/4242) | 3.6 | Hoods, capes, scarves, hats, and masks. | [mod.io](https://mod.io/g/the-witcher-3/m/hoods) |
| [Corvo Bianco Enhanced Collection](https://www.nexusmods.com/witcher3/mods/12982) | 5.00 | Gardening, harvests, honey, wine-cellar interactions, and meals. | [mod.io](https://mod.io/g/the-witcher-3/m/corvo-bianco-enhanced-collection) |
| [The Last Wish Final Scene Restoration](https://www.nexusmods.com/witcher3/mods/10653) | 0.1 | Cut dialogue from the quest's final scene. | [mod.io](https://mod.io/g/the-witcher-3/m/the-last-wish-final-scene-restoration) |
| [Ciri Witcher Ending Restoration](https://www.nexusmods.com/witcher3/mods/9651) | 0.2 | Cut scenes and dialogue for Ciri's witcher ending. | [mod.io](https://mod.io/g/the-witcher-3/m/ciri-witcher-ending-restoration) |
| [Fast Travel Pack](https://www.nexusmods.com/witcher3/mods/7202) | 2.1.0 | Additional signposts at useful locations. | [mod.io](https://mod.io/g/the-witcher-3/m/fast-travel-pack) |
| [The Spider and The Wolf](https://www.nexusmods.com/witcher3/mods/9803) | 1.2.2 | A new questline in Velen. | [mod.io](https://mod.io/g/the-witcher-3/m/new-questline-the-spider-and-the-wolf) |

## Removed mods

| Mod / Nexus link | Last installed release | Removed | Reason |
| --- | --- | --- | --- |
| [Complete Animations Redux](https://www.nexusmods.com/witcher3/mods/5012) | Remastered 3.2.0 | October 7, 2026 | Adds a hidden prop item to Geralt's inventory for every animation and never removes it. The props pile up in the save, likely caused inventory crashes, and removing the mod left saves with missing items and no body. See [the full analysis](docs/complete-animations-redux.md). |
| [modShouldBeNude](https://www.nexusmods.com/witcher3/mods/5436) ("Should Be Nude" from the Nudes Collection) | Unknown release; files dated January 2022 | October 15, 2026 | Reinstalled from an earlier setup the same day, then replaced by the Nudes Collection Ultimate Edition, which contains 54 of its 55 files in a newer release. |
| [All Nudes Bushy](https://www.nexusmods.com/witcher3/mods/1127) (`modAllNudeBushy`) | 1.1; files dated January 2016 | October 15, 2026 | Reinstalled from an earlier setup for a test and removed the same day. A 2016 texture mod (17 body textures) that predates Next-Gen. |
| [Restored High Quality Weather Icons and Moon Phases - Remastered](https://www.nexusmods.com/witcher3/mods/14389) | 1 | October 15, 2026 | Its icons and moon phases are in its copy of the minimap Flash file `hud_minimap2.redswf`, which Map Remastered also replaces. Map Remastered was given that file, so this mod had almost no effect; The Living Continent's calendar also hides the weather box. See the [Map Remastered note](docs/setup.md#map-remastered). |

Do not reinstall Complete Animations Redux on this setup.
If a save was already played with it, follow the [safe removal steps](docs/complete-animations-redux.md#removing-the-mod-safely) before deleting it.

## Fixes and checks

- [Installation, dependencies, quest requirements, and recorded priorities](docs/setup.md)
- [A Witcher Can Hide Another: exact script repair and rollback](docs/a-witcher-can-hide-another.md)
- [Complete Animations Redux: why it was removed, with a fix and safe removal steps](docs/complete-animations-redux.md)
- [Graphics and lighting settings: RT shadows and the mods' picture options](docs/graphics-settings.md)
- [Manual installation inventory](inventory/manual.json)
- [In-game installation inventory](inventory/ingame.json)

The inventories count installed files, rather than old entries in `mods.settings` or downloaded archives alone.
An archive on disk does not mean that its mod is installed.

All mod credits belong to the authors linked above.

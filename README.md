# My Witcher 3 Remastered mod list

My mod list for **The Witcher 3: Wild Hunt — Remastered (5.0)** on PC: bug fixes, restored scenes, new quests, character details, and lighting.
This guide records the versions I have installed and the extra steps needed to reproduce the setup.

**Snapshot: October 4, 2026.** GOG installation; DirectX 12 executable version `5.0.0.1044392`.
**Addition: October 6, 2026.** VAXIS's ULTRA Plus Blood Physics standard 1.2 was verified against the installed files.
**Fix: October 7, 2026.** Complete Animations Redux received a local script fix for prop items left in the inventory.
There are **15 installed mods: nine manual installations and six enabled in-game installations**, including Sharedutils as a dependency.

**Review status:** the installed files and settings have been checked.
The A Witcher Can Hide Another and Complete Animations Redux repairs are documented below, but the complete combination has not passed an end-to-end gameplay test.
The list remains a recommendation draft while those checks are pending.

## Start here

1. Read the [installation and compatibility notes](docs/setup.md).
2. Install the correct **Remastered** releases and their dependencies.
3. Use the recorded installation channel for each mod.
4. Apply the [A Witcher Can Hide Another repair](docs/a-witcher-can-hide-another.md) if its scripts still contain the old code.
5. Apply the [Complete Animations Redux prop fix](docs/complete-animations-redux.md).
6. Check the result on a separate save before continuing a playthrough.

The repository contains links, instructions, and small local patches. Download each mod from its author.

## Manual installations

The version column identifies the locally matched download where available.
Some internal `info.json` labels differ from the release number; see [version evidence](docs/setup.md#versions-and-inventory-evidence).

| Mod / Nexus link | Installed release | What it adds | Setup note |
| --- | --- | --- | --- |
| [Brothers In Arms — Ultimate Edition](https://www.nexusmods.com/witcher3/mods/11260) | Remastered 4.0.1 | Bug fixes and restored dialogue, quests, and other content. | Install Sharedutils; retain the mod, DLC, and menu files. |
| [Sharedutils — All In One](https://www.nexusmods.com/witcher3/mods/12997) | 4.0 | Shared functions required by other mods, including Brothers In Arms. | Keep `modzzz_sharedutils` and `dlcsharedutils`. |
| [Complete Animations Redux](https://www.nexusmods.com/witcher3/mods/5012) | Remastered 3.2.0 | Animations for item use, oils, repairs, and looting. | Choose the Remastered build; install its menu XML too. Apply the [leftover prop fix](docs/complete-animations-redux.md). |
| [Dynamic Appearances Project](https://www.nexusmods.com/witcher3/mods/9219) | BiA-compatible 2.1.1 | Character appearances that change with story progress. | Use the BiA-compatible main file; broader 5.0 compatibility remains unverified. |
| [Light Rewrite](https://www.nexusmods.com/witcher3/mods/12144) | 0.14.0 | Changes to local lights, including candles and torches. | Install all supplied folders; inspect the in-game mod settings. |
| [A Proper Send-off](https://www.nexusmods.com/witcher3/mods/10881) | PL Remaster 1.21 | A voiced quest with Dandelion and Zoltan during Final Preparations. | Polish Remaster variant; installed as `moddandelionsballad`. Mind its quest window. |
| [A Witcher Can Hide Another](https://www.nexusmods.com/witcher3/mods/9453) | 1.1.1 script baseline + local fixes | A voiced questline with a new location and playable character. | Add its input bindings and apply the [two documented script repairs](docs/a-witcher-can-hide-another.md). |
| [Path Tracing and Ray Tracing Optimization](https://www.nexusmods.com/witcher3/mods/13025) | Nexus release 4 / PT Optimization 2.0 | Rendering controls for light bounces, shadows, and caustics. | Installs under `bin`; another `xinput9_1_0.dll` mod can conflict. |
| [VAXIS's ULTRA Plus Blood Physics](https://www.nexusmods.com/witcher3/mods/13506) | Standard 1.2 | Physics-based blood spray and wall drips, according to the author. | Keep `mods/modULTRAplussVaxisBlood`; tagged Remastered Compatible on Nexus. Gameplay compatibility remains unverified. |

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

## Fixes and checks

- [Installation, dependencies, quest requirements, and recorded priorities](docs/setup.md)
- [A Witcher Can Hide Another: exact script repair and rollback](docs/a-witcher-can-hide-another.md)
- [Complete Animations Redux: leftover prop item fix and safe removal](docs/complete-animations-redux.md)
- [Manual installation inventory](inventory/manual.json)
- [In-game installation inventory](inventory/ingame.json)

The inventories count installed files, rather than old entries in `mods.settings` or downloaded archives alone.
An archive on disk does not mean that its mod is installed.

All mod credits belong to the authors linked above.

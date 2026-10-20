# Total Immersion Mod List: what still makes sense on Remastered

[Total Immersion Mod List](https://www.nexusmods.com/witcher3/mods/3735) (lexo1000, version 11.5, April 2020) was the setup used on the original game 1.31/1.32.
This review sorts its mods for the current setup: Remastered 5.x with Brothers In Arms, Dynamic Appearances Project, Light Rewrite, The Living Continent, and the other mods in the [mod list](../README.md).

**Checked on October 15, 2026** through the Nexus API: the newest release of each mod and its last update date.
Remastered came out at the end of September 2026, so "updated since September 23" is used as a sign of a Remastered release.
An update date alone does not prove compatibility; check each page's *Remastered Compatible* tag and description before installing.

## Rules of thumb

- **Old script mods do not work.** Remastered compiles its scripts differently, and mods that replace whole vanilla `.ws` files fail to compile or bring back old code (see the Gwent Redux port notes). Use a Remastered release with annotated scripts, or skip the mod.
- **Old UI files break the UI.** Mods that ship `.redswf` Flash files from 1.3x or 4.0x can break menus and mouse input; the original Animated Gwent Cards did exactly that.
- **Character file mods clash with Brothers In Arms and Dynamic Appearances.** Mods that replace character `.w2ent` files must lose to those two, or quests can request appearances that no longer exist (see [Brothers In Arms priority](setup.md#brothers-in-arms-priority)).
- **Old textures load, but may look worse.** Texture-only mods from 2016-2021 often still work, but can be lower resolution than Remastered's own textures.

## Already covered by the current setup

| Old mod | Covered by |
| --- | --- |
| Ghost Mode, Community Patch – Besserwisser and Nitpickers, Localization Fixes, LOD Bug Fix | Brothers In Arms (bug fixes, restored content) and the game's own Next-Gen and Remastered fixes. Ghost Mode was last updated in 2020 and has no Remastered release. |
| Gwent Redux and its Ghost Mode patch | Gwent Redux Remastered port (installed). |
| Phoenix Lighting Mod, Natural Torchlight | Light Rewrite (installed). Phoenix Lighting 8.1 (August 2025) is a Next-Gen release, not tagged Remastered; do not combine two lighting overhauls. |
| CLOUDS, New Clouds, Volumetric clouds over Skellige, Ice Breath for PLM, Cold-weather breath | The Living Continent (installed): realistic clouds, breath in the cold for Geralt, Roach, and NPCs, and weather. |
| Brutal Blood | VAXIS's ULTRA Plus Blood Physics and Deaths Reworked (installed). |
| Minimalist Minimap, World Map Fixes, Colored Map Markers | Map Remastered (installed). |
| All Nudes Bushy, Nude Girls Uncensored / Remove Lingerie | Nudes Collection, The Elder Bush, and Females of the Continent (installed). |
| Complete Animations | Do not use: Complete Animations Redux corrupted inventories here; see [the analysis](complete-animations-redux.md). |
| Script Merger 0.6.2 and its unofficial patch | [Script Merger – Remastered](https://www.nexusmods.com/witcher3/mods/13076). |

## No longer needed

| Old mod | Why |
| --- | --- |
| The Witcher 3 HD Reworked Project | Integrated into the game by CD PROJEKT RED with the Next-Gen update. |
| 60 fps GUI and its adaptations | Old Flash UI files; they would replace Remastered's rebuilt menus and break them. Do not install. |
| Mod Limit Adjuster, Ultimate ASI Loader, Place of Power DLL Boost | Made for the old `bin/x64` executable; Remastered uses `bin/x64_dx12`, and PT Optimization already uses the `xinput9_1_0.dll` slot. |
| Community Patch – Base, Bootstrap, Menu Strings, Shared Imports | Old script frameworks. Remastered mods use script annotations and Sharedutils instead; Light Rewrite's Remastered notes say Shared Imports no longer applies. |
| Tweaks (hidden graphics options) | Remastered has its own extended graphics menu, ray tracing, and PT Optimization. |
| Hair Physics 60FPS Fix, NPC Physics 60FPS Fix | 1.3x fixes for the old engine; no current release. |
| Toxicity Decoction Critical Fix | Old script fix; for potion and decoction changes on Remastered see [Duration Tweaks Remastered](https://www.nexusmods.com/witcher3/mods/13092). |

## Current releases available

Updated since Remastered came out (September 23, 2026 or later):

| Old mod | Current release | Updated |
| --- | --- | --- |
| Friendly HUD | [(Remastered) Friendly HUD](https://www.nexusmods.com/witcher3/mods/13130) 0.9.3R | 2026-10-08 |
| Less Is More | [Less Is More (Remastered Compatible)](https://www.nexusmods.com/witcher3/mods/3684) 5.0cUI | 2026-10-02 |
| Better Torches | [Better Torches Next-Gen (and Remastered)](https://www.nexusmods.com/witcher3/mods/7186) 5.1.0 | 2026-10-09 |
| Sort Everything | [Sort Everything](https://www.nexusmods.com/witcher3/mods/1710) 1.54 | 2026-10-14 |
| Unread Descriptions | [Unread Descriptions – Sort Everything Minor Tweaks – Remastered Compatible](https://www.nexusmods.com/witcher3/mods/12961) 5.01.00 | 2026-10-11 |
| More Quick Slots | [More Quick Slots – Updated and Fixed](https://www.nexusmods.com/witcher3/mods/11790) 1.0.4 | 2026-09-28 |
| Fast Stash Menu | [Fast Stash Menu – Remastered](https://www.nexusmods.com/witcher3/mods/8650) 1.1 | 2026-10-09 |
| Action Log | [Action Log Customization](https://www.nexusmods.com/witcher3/mods/3680) 5.01.0 | 2026-10-15 |
| All Quest Objectives On Map | [All Quest Markers Plus](https://www.nexusmods.com/witcher3/mods/13087) (alx713), a Remastered replacement; the original was last updated in 2023 | 2026-10-14 |
| Disable storybook videos | [Disable skip storybook intro warnings videos](https://www.nexusmods.com/witcher3/mods/816) | 2026-09-29 |
| Unseen Monsters | [Unseen Monsters](https://www.nexusmods.com/witcher3/mods/646) 1.50 | 2026-10-03 |
| Manual Bomb Aiming | [Manual Bomb Aiming – Remastered](https://www.nexusmods.com/witcher3/mods/13358) | 2026-10-03 |
| Walk by Default | [Walk by Default – Remastered](https://www.nexusmods.com/witcher3/mods/7178) 3.0.0 | 2026-09-29 |
| No More Rolling Down Stairs | [No More Rolling Down Stairs (Remastered – Annotation)](https://www.nexusmods.com/witcher3/mods/13002) | 2026-09-29 |
| No Indignant NPCs | [No Indignant NPCs](https://www.nexusmods.com/witcher3/mods/3190) 2.4 | 2026-10-13 |
| No Consumable Autofill | [No Consumable Slots Autofill – Remastered](https://www.nexusmods.com/witcher3/mods/13469) | 2026-10-04 |
| No Potion Drinking Screen FX | [No Potion Drinking Screen FX – Remastered](https://www.nexusmods.com/witcher3/mods/13949) | 2026-10-09 |
| Block and Dodge Whenever You Want | [Block and Dodge – remastered](https://www.nexusmods.com/witcher3/mods/13820) 0.1 (very early; may overlap Blood and Steel's dodges) | 2026-10-07 |
| Vampires Have No Shadows | [Vampires Have No Shadows](https://www.nexusmods.com/witcher3/mods/1749) 1.50 | 2026-09-30 |
| New Hairstyles For Geralt | [New Hairstyles and Beards For Geralt](https://www.nexusmods.com/witcher3/mods/4400) 4.0 | 2026-10-13 |
| Book Inspired Medallion | [Book Inspired Medallion](https://www.nexusmods.com/witcher3/mods/3770) 3.2 | 2026-10-04 |
| Bring Back Life Into The Bathhouse | [Geralt and Friends – Everybody Comes To The Bathhouse](https://www.nexusmods.com/witcher3/mods/8542) 3.0 | 2026-10-06 |
| Quicksave Menu | [Controller Quicksave in Pause Menu](https://www.nexusmods.com/witcher3/mods/13355) or [Quicksave After Meditation](https://www.nexusmods.com/witcher3/mods/10763) | 2026-10-03 / 2026-10-10 |

## Next-Gen releases only (4.0x)

These have a Next-Gen edition but no Remastered release yet. Script-based ones are unlikely to compile on 5.x; wait for an update.

| Old mod | Next-Gen release | Updated |
| --- | --- | --- |
| Friendly Meditation | [(Next Gen Edition) Friendly Meditation](https://www.nexusmods.com/witcher3/mods/7343) | 2024-05 |
| Preparations | [(Next Gen Edition) Preparations](https://www.nexusmods.com/witcher3/mods/7680) | 2024-05 |
| Combat Stance, Enhanced Targeting | [(Next Gen Edition) Combat Stance](https://www.nexusmods.com/witcher3/mods/8460), [Enhanced Targeting](https://www.nexusmods.com/witcher3/mods/8459) | 2023-08 |
| Friendly Stash | [(Next Gen Edition) Friendly Stash](https://www.nexusmods.com/witcher3/mods/8023) | 2023-08 |
| Immersive Cam | [Immersive Camera for Next Gen](https://www.nexusmods.com/witcher3/mods/8387) | 2025-01 |
| Hud Positioning and Scale | [Next Gen Edition](https://www.nexusmods.com/witcher3/mods/7392) | 2025-03 |
| Smart Magic Lamp, Natural Torchlight | [Smart Magic Lamp (NEXT GEN)](https://www.nexusmods.com/witcher3/mods/8966), [Natural Torchlight (NEXT GEN)](https://www.nexusmods.com/witcher3/mods/8963) | 2024-2025 |
| E3 Improved Combat Animations | [Next Gen](https://www.nexusmods.com/witcher3/mods/7457); conflicts with Blood and Steel's attack animations | 2024-11 |
| Fast Travel from Roach, Leave Roach Alone, GuardShowRespect, Component Part Stock, Item Stock on Crafting, Sensible Map Borders, Dhu's Roach, No More Glowing, Skellige Ice Breath | Next-Gen releases from 2023-2025 | 2023-2025 |
| Slower Gametime | Its Next-Gen version is marked outdated; The Living Continent has its own season length options. | — |

## Probably still fine: textures and character looks

Texture and appearance mods without scripts often still load. Check those that replace character `.w2ent` files against Brothers In Arms and Dynamic Appearances before installing.

| Mod | Last update | Note |
| --- | --- | --- |
| [The Butcher of Blaviken Lore-Friendly Geralt](https://www.nexusmods.com/witcher3/mods/2283) | 2023-12 | Geralt textures. |
| [Ciri Grey Hair](https://www.nexusmods.com/witcher3/mods/4337) | 2026-02 | Ciri is in Dynamic Appearances; check the overlap. |
| [Avallach Blond Hair](https://www.nexusmods.com/witcher3/mods/4335), [Avallach Aen Elle Height](https://www.nexusmods.com/witcher3/mods/4298) | 2025 / 2020 | |
| [Letho LOD Extended](https://www.nexusmods.com/witcher3/mods/4289), [White Hair for Vimme Vivaldi](https://www.nexusmods.com/witcher3/mods/4331) | 2025 | |
| [Orianna's New Style](https://www.nexusmods.com/witcher3/mods/2625), [Toussaint's Atelier](https://www.nexusmods.com/witcher3/mods/3472) | 2026-07 / 2026-08 | Toussaint characters; check overlaps with the Nudes Collection and Dynamic Appearances. |
| [VGX Eredin Appearance](https://www.nexusmods.com/witcher3/mods/6358) | 2025-02 | Replaces the old Eredin VGX Armour and Mask. |
| [Improved Lady of the Lake – Next-Gen Edition](https://www.nexusmods.com/witcher3/mods/3037) | 2022-12 | The Nudes Collection also replaces the Lady of the Lake. |
| [Unique Witcher Eyes (except Geralt) NEXT-GEN](https://www.nexusmods.com/witcher3/mods/3056), [Realistic Eyes (Book-Friendly)](https://www.nexusmods.com/witcher3/mods/4341) | 2023 / 2026-02 | |
| [Yennefer Concept Hair](https://www.nexusmods.com/witcher3/mods/2567), [4KRW – 4K Reworked Women](https://www.nexusmods.com/witcher3/mods/4018) | 2021 / 2023 | Yennefer, Triss, and Ciri are in Dynamic Appearances and the Nudes Collection; expect overlaps. |
| [E3 HD Birds Reworked – Next Gen Remastered](https://www.nexusmods.com/witcher3/mods/3204), [UHD Chickens](https://www.nexusmods.com/witcher3/mods/3734), [Immersive Wildlife Project](https://www.nexusmods.com/witcher3/mods/3527) | 2018-2020 | Textures; the birds mod's name claims Remastered. |
| [HDMR – HD Monsters Reworked](https://www.nexusmods.com/witcher3/mods/3580) | 2023-03 | Next-Gen release; large texture pack. |
| [New Fires](https://www.nexusmods.com/witcher3/mods/3539), [Lightsource Yrden And Igni](https://www.nexusmods.com/witcher3/mods/2853), [The Aard](https://www.nexusmods.com/witcher3/mods/2346), [Axii cooler](https://www.nexusmods.com/witcher3/mods/594), [VGX Burning Village Cutscene](https://www.nexusmods.com/witcher3/mods/3537) | 2017-2025 | Effects; check against Light Rewrite and The Living Continent. |
| [Lamp on Player's boat](https://www.nexusmods.com/witcher3/mods/2770) | 2026-04 | |

## Outdated, no current release

Last updated before Next-Gen and without a newer edition; skip unless a Remastered port appears:
Immersive Horse Whistling, No Infinite Horse Galloping Fix, Reduced Falling damage, Witcher 3 Gameplay Additions, Live Bestiary, Hide Sound Effects Subtitles, Subtitles for Foreign Languages, Trollonly Subtitles, Runestone Icons, Nosferatu Font, Silent UI, No Chatterboxes, Music Overhaul Project, Both hands on sword, Lip Movement and HiRes Shadows, Dampen Horse Turning, Loot Drops Don't Sparkle, No Horse Combat Slow Mo, No Witcher Senses During Mounted Combat, Player Interior No Run Lock, TW3 Gameplay Tweaks, Manual Sheathing Only, Thoughtful Roach, Quest level on NoticeBoard, Ladders camera fix, Changed Horse controls, Screen FX Removal, Cat Potion No Enemy Glow, Adrenaline Rush FX Remover, Pesky sword trails begone, All NPC Scabbards, Witcher 1 style HUD Medallion (Next-Gen 2024 at most), Consequences of war, Character swap, Witchers Lair (2020).

Several of these, such as All Quest Objectives On Map's level display or Quest level on NoticeBoard, are covered by current mods like [All Quest Markers Plus](https://www.nexusmods.com/witcher3/mods/13087).

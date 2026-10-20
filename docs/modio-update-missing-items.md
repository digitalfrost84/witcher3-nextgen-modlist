# mod.io updates on a full drive: missing items and no body

On **October 20, 2026**, a save loaded with most of Geralt's inventory gone and his body invisible.
The three in-game mods with pending updates had been switched off because drive C: was full.
The save itself was not damaged: with the mods installed and enabled again, it loaded normally.

## Symptoms

- In the world, only Geralt's head and his newly given bow were visible.
- The inventory showed him in underwear with no equipped armor or swords and only a few items in the bag.
- The Living Continent 1.6 then gave a Hunter's Bow with a quiver, because Geralt had no ranged weapon left.

## Cause

1. On October 20 at 21:53, mod.io registered updates for Hoods 3.7, Corvo Bianco Enhanced Collection 5.01, and The Spider and The Wolf 1.2.3.
2. Drive C: had 1.3 GB free.
   The in-game packages are unpacked to `C:\Users\Public\mod.io\8254\mods`, and The Spider and The Wolf alone is a 544 MB download that unpacks to 680 MB.
3. The updates were not installed.
   `mod.io/8254/metadata/state.json` kept the three mods in `State` 2 with the new release names, while their files on disk stayed the old releases, byte for byte.
4. At 21:54 the game rewrote `Documents/The Witcher 3/modioModsConfig.json` with only the other three in-game mods.
   Hoods, Corvo Bianco, and The Spider and The Wolf were no longer enabled.
5. The save was loaded without them.
   It held items that only those mods define, and the game dropped most of the inventory while loading.
   Geralt's body parts are hidden inventory items, so they were lost with it.

The same pattern appeared when [Complete Animations Redux](complete-animations-redux.md) was removed.
Which item stopped the load was not identified.

### Ruled out

- **The Living Continent 1.6:** its script gives the bow only when Geralt has no ranged weapon at all, and the body was already missing when its message appeared.
  The inventory was empty before the mod acted.
- **Brothers In Arms 4.1.1:** its `CInventoryComponent` wrapper only reads and removes glossary books.
- **Item definitions:** no installed mod or mod.io package overrides the base game's item definition files.
  The new definition files of The Living Continent (`def_w3ls_hunting.xml`, `def_w3ls_rewards.xml`) and Brothers In Arms only add their own items.

## Recovery

1. Quit without saving.
   Do not sleep, meditate, or fast travel either, because those can autosave.
   Here no save was written in the broken session; the newest save was from October 19 at 20:48.
2. Copy the `gamesaves` folder to another drive.
   Here all 1,600 files went to `G:\non-Steam Games\The Witcher 3 Wild Hunt GOTY\_save_backup_2026-10-20`.
3. Free space on C:.
   4.6 GB was enough for these three updates.
4. Start the game and open **Mods** in the main menu.
   The pending updates installed there: all three reached `State` 1, and each folder's byte total matched the new package size.
5. Enable the three mods again and restart the game before loading a save.
6. Load the last save made before the broken session and check Geralt's body, equipped gear, and inventory count.
   Here the October 19 save showed 104 of 130 items, with armor, both swords, and the hoods in place.
7. Save in a new slot and keep the older save.

When the game re-enabled the three mods, it renumbered the in-game priorities; see [Recorded priorities](setup.md#recorded-priorities).

## Prevention

- Keep at least 5 GB free on C: when the game may update mod.io packages; the largest one here needs about 1.2 GB during the update.
- After the game updates in-game mods, restart it and check **Mods** before loading a save: every mod should be installed and enabled.
- If Geralt is invisible or his inventory is suddenly empty, quit without saving and check `modioModsConfig.json` and `state.json` before anything else.

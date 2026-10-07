# Complete Animations Redux: why it was removed

[Complete Animations Redux on Nexus Mods](https://www.nexusmods.com/witcher3/mods/5012) plays animations for eating, drinking, oils, repairs, and looting.
The Remastered 3.2.0 release was part of this list until **October 7, 2026**, when it was removed.

## Decision

The mod adds a hidden prop item to Geralt's inventory for every animation and never removes it.
Those props stay in the save permanently and depend on the mod's DLC.
A local fix stopped the inventory crashes, but the mod remains unreliable for a long playthrough:

- Every save played with it collects props that only the mod's DLC can define.
- Uninstalling it without cleanup left a save with missing items and no body.
- It needs an unofficial fix for basic inventory handling, and any update could bring the problem back.

Do not reinstall it on this setup.
The analysis and fix below are kept for anyone who wants to keep using the mod, or needs to remove it from an existing playthrough.

## Symptoms

- With the mod installed, the game sometimes crashed when the inventory was opened.
- With the mod removed, an existing save loaded with many items missing, and Geralt's body did not render.

## Cause

For each animation, the mod adds a prop item to the player's inventory and mounts it in Geralt's hand.
Examples include `Drink_Bottle`, `Food_Bread_Mask`, `Potion_Bottle_Horn`, and `Whetstone_left`.
The props are defined only in `dlc/dlcCompleteAnimationsRedux` (`dlc\car\data\gameplay\items\def_item_work.xml`).

After the animation, the mod unmounts the prop but never removes it:

- `MountItem` and `MountSecondItem` in `completeAnimationsReduxStates.ws` and `PerformMovableAnimation` in `completeAnimationsRedux.ws` call `inv.AddAnItem(...)`.
- The `UnmountItem` and `UnmountSecondItem` timers in `completeAnimationsReduxOverrides.ws` only call `inv.UnmountItem(...)`.
- No code path calls `RemoveItem`. The only other cleanup, `DropItems`, runs when an animation is interrupted.

The hidden props therefore accumulate in the save.
A decompressed save from this playthrough referenced 17 different prop item names.

When the DLC folder is removed, the save still refers to items that no longer have definitions.
Geralt's body parts are also stored as hidden inventory items.
The most likely explanation for the missing body is that the game discards part of the inventory while loading these unknown items.
This explanation fits the evidence but was not confirmed in the engine.
The leftover props are also the leading suspect for the inventory crash, because the inventory preview builds Geralt from the items he carries.

## Fix result

The fix was installed on October 7, 2026.
The game compiled the patched scripts, and the inventory no longer crashed in play.
The mod was removed anyway, for the reasons in [Decision](#decision).

## Applying the fix

The steps below are for anyone who keeps the mod. They are not part of this list.

### Before editing

Close the game.
Back up `mods/modCompleteAnimationsRedux/content/scripts` to a folder outside `mods`.
Paths in this guide start at the game installation directory.

### 1. Add the cleanup functions

Copy [`completeAnimationsReduxCleanup.ws`](../patches/complete-animations-redux/completeAnimationsReduxCleanup.ws) to:

```text
mods/modCompleteAnimationsRedux/content/scripts/local/completeAnimationsReduxCleanup.ws
```

It defines three global functions:

- `CARIsPropItemName` recognizes the 50 prop names that the mod's scripts mount.
- `CARRemovePropItem` unmounts and removes every copy of one prop.
- `CARRemoveAllPropItems` removes every recognized prop from an inventory.

The list contains only the mod's prop names, so ordinary food, drinks, potions, and tools are not affected.

### 2. Call them from the mod

Apply [`completeAnimationsReduxOverrides.diff`](../patches/complete-animations-redux/completeAnimationsReduxOverrides.diff) to `mods/modCompleteAnimationsRedux/content/scripts/local/completeAnimationsReduxOverrides.ws`.
The diff adds three lines and one blank line:

```diff
 		completeAnimationsRedux.Initialize();
+
+		CARRemoveAllPropItems(inv); // local fix: purge props left in the save by earlier animations
```

```diff
 	inv.UnmountItem(inv.GetItemId(completeAnimationsRedux.itemForMount), true);
+	CARRemovePropItem(inv, completeAnimationsRedux.itemForMount); // local fix: don't leave props in inventory
```

```diff
 	inv.UnmountItem(inv.GetItemId(completeAnimationsRedux.secondItemForMount), true);
+	CARRemovePropItem(inv, completeAnimationsRedux.secondItemForMount); // local fix
```

The first call runs in the `OnSpawned` wrapper, after the mod initializes, and removes props already stored in a save.
The other two delete a prop when the mod puts it away.
Every animation adds its prop again before mounting it, so removing it afterwards does not affect later animations.

### Check the result

1. Launch the game and let it compile scripts.
2. Load a save made **with** the mod installed. Do not use a save made after removing it.
3. Use a few eating, drinking, and potion animations, then open the inventory several times.
4. Make a new save. It should no longer contain the prop items.

## Removing the mod safely

With this fix installed, load the playthrough once and make a new save.
The load-time cleanup removes the props from the inventory.
Then close the game and remove `mods/modCompleteAnimationsRedux`, `dlc/dlcCompleteAnimationsRedux`, and `bin/config/r4game/user_config_matrix/pc/completeAnimationsRedux.xml`.
Continue from the new save.

If you already removed the mod and loaded a save with a missing body, do not overwrite your old saves.
Reinstall the mod with this fix and load a save made before the removal.

## Recorded file hashes

These SHA-256 values describe the inspected installation.
Line endings or a different release produce different hashes.

| File | State | SHA-256 |
| --- | --- | --- |
| `completeAnimationsReduxOverrides.ws` | Original 3.2.0 | `10A6363DA6796AB4A6F69C6989B157B2B707E0CC7C07167F3A69668A56D48558` |
| `completeAnimationsReduxOverrides.ws` | Patched (CRLF) | `586DB974DA442716D18DC0E4658847D239332FE04A8D383CABC8A17E96AFEA60` |

## Rollback and updates

With the game closed, delete `completeAnimationsReduxCleanup.ws` and restore the original `completeAnimationsReduxOverrides.ws`.
Without the fix, the mod again leaves props in the inventory.

A mod reinstall or update may overwrite the edit.
Check whether a newer release removes its props before reapplying the fix.

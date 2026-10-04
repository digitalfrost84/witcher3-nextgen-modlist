# A Witcher Can Hide Another: Remastered 5.0 compatibility fix

[A Witcher Can Hide Another on Nexus Mods](https://www.nexusmods.com/witcher3/mods/9453) adds a custom quest. This installation needed two small script changes to match the interfaces in the installed Remastered 5.0 game.

The player reports that the mod works after these changes.
The edits have been checked against the saved originals.
Successful script compilation was not independently recorded, and the quest has not been verified from start to finish.
Treat this as a repair for the specific errors below, not a claim of complete compatibility.

The downloaded archive `A Witcher Can Hide Another-9453-1-1-1-1761481305.7z` is labeled `1.1.1`.
Its two original scripts match the pre-fix backups byte for byte, and its `content/info.json` matches the installed descriptor.
That descriptor reports version `1.0`, so keep both labels.
These checks establish that the repair applies to the inspected scripts from the `1.1.1` archive.
The entire archive payload was not compared.
The hashes below identify the exact files inspected.

## Before editing

Close the game.
Back up both files listed below to a folder outside `mods`.
Keep their relative paths so you can restore them.
Paths in this guide start at the game installation directory.

Check the original code before changing it. If the downloaded mod already uses `CName` and already defines `GetStateByName`, do not apply the same changes again. If the files differ materially, compare them with the scripts supplied by your installed game before adapting the fix.

## 1. Match the music function's parameter type

Edit `mods/modAWitcherCanHideAnother/content/scripts/local/ngcl/annotations.ws`:

```diff
-function InitializeAreaMusic( worldArea : EAreaName ) {
+function InitializeAreaMusic( worldArea : CName ) {
```

In the same function, change the area comparison:

```diff
-	if (worldArea == AN_HubSlot_17) {
+	if (worldArea == 'AN_HubSlot_17') {
```

The game defines this function with a `CName` parameter in `content/content0/scripts/engine/sound.ws`. The wrapper must match that signature. Quoting the area identifier makes the comparison use a name literal instead of the old enum value.

## 2. Restore the state lookup method

Edit `mods/modAWitcherCanHideAnother/content/scripts/game/explorations/exploration_movement_system/explorationStateManager.ws`.

Inside `CExplorationStateManager`, insert the following immediately before the class's final closing brace. Do not replace the rest of the file or add a second copy of the method.

```witcherscript
	// Preserve the installed game's state lookup used by player and camera scripts.
	public function GetStateByName( stateName : name ) : CExplorationStateAbstract
	{
		var stateIndex : int;

		stateIndex = FindState( stateName );

		return m_StatesSArr[stateIndex];
	}
```

This is the implementation from the installed game's corresponding file under `content/content0/scripts`. The mod replaces that class but omitted this method. The game's `r4Player.ws` and `game/player/states/exploration.ws` call it to obtain jump and climb states. That explains why the missing-function errors can report `[content0]` even though the incompatible class comes from the mod.

## Check the result

Launch the game and let it compile scripts. Confirm that the `InitializeAreaMusic` type mismatch and the three reported `GetStateByName` errors are gone. Then load a separate test save and check the quest and its skating controls. The script edits do not install the mod's required input bindings; follow the instructions provided with the mod for those.

The recorded repair changed only the two expressions in `annotations.ws` and added the method and comment above to `explorationStateManager.ws`. All other original script text was preserved.

## Recorded file hashes

These SHA-256 values describe the inspected installation. Whitespace, line endings, encoding, or a different release can produce different hashes even when the code is equivalent.

| File | State | SHA-256 |
| --- | --- | --- |
| `annotations.ws` | Original | `A8C904E1A8E2B118D00884FBB9F4FE5892494410812A9162E5E9792B7D6856A4` |
| `annotations.ws` | Patched | `4A439EFC7143D12DE5997E34F2D03D270F179D6D757FC3FE1B7281C18D35044D` |
| `explorationStateManager.ws` | Original | `7C2D2A99C968EC24B3385075EE280522AF8B6E710DA4BBB7B0552391938BEFA4` |
| `explorationStateManager.ws` | Patched | `F0BDCC80DFBE3391287B633F7FA3ADD37FFCD0F36D62966BC3AF016B5DF1F4B1` |

Both originals used UTF-16LE with a byte-order mark. The recorded patched `annotations.ws` uses UTF-8 without a byte-order mark; `explorationStateManager.ws` retains UTF-16LE with a byte-order mark. These details matter when comparing exact hashes.

## Rollback and updates

With the game closed, restore your two original files over their edited counterparts. This reverses the local repair and can bring back the original compilation errors. Backups and full mod scripts are not included in this repository.

A mod reinstall or update may overwrite the edits. Recheck the actual code and the current game interfaces before reapplying them; a newer release may already include a compatible implementation.

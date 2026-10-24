# A Witcher Can Hide Another: Remastered 5.0 compatibility fixes

**Remastered compatibility is unconfirmed.** The local repairs below do not establish support for the full quest.

[A Witcher Can Hide Another on Nexus Mods](https://www.nexusmods.com/witcher3/mods/9453) adds a custom quest. This installation needed two small script changes to match the interfaces in the installed Remastered 5.0 game.

The player previously reported that the mod worked after these script changes.
The edits have been checked against the saved originals.
Successful script compilation was not independently recorded, and the quest has not been verified from start to finish.
Treat this as a repair for the specific errors below, not a claim of complete compatibility.

On October 24, 2026, a noticeboard screenshot showed unreadable text.
The installed English string file still used format version `163`.
It was converted to Remastered format `164`, with all decoded text preserved.
The original version `163` file is currently installed; the experimental converted file is retained locally.
The mod remains enabled; the notice and full quest still need an in-game check.
See [English text conversion](#3-convert-the-english-text-for-remastered).

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

## 3. Convert the English text for Remastered

### Diagnosis and compatibility

The author's [mod page](https://www.nexusmods.com/witcher3/mods/9453) targets **Next-Gen**, but does not claim Remastered compatibility.
Nexus displays this warning: **“Not tagged ‘Remastered Compatible’. The mod may only work with older versions of The Witcher 3.”**
This installation runs Remastered, with DirectX 12 executable version `5.0.0.1048522`.
Next-Gen support does not establish compatibility with Remastered's script interfaces or string format.

The screenshot showed random characters and missing glyphs in the notice title and body.
The selected notice could not be identified conclusively from the screenshot.
This mod is the leading suspect: it starts at a Novigrad noticeboard and supplied an older English string file.
The installed A Proper Send-off and Brothers In Arms English files already used version `164`.

Decoding this mod's English file recovered these notice entries:

| String ID | Text or purpose |
| --- | --- |
| `2119453078` | `An Opportunity To Serve Redanian Army!` |
| `2119453079` | `Mysterious request from the Redanian Army` |
| `2119453080` | Requests service for the Redanian army and directs the reader to an officer near the Temple of Eternal Fire during the day. |

The nearby journal entries describe missing Redanian soldiers and the objective to check a noticeboard in Novigrad.
This identifies the mod's notice, but does not prove that it was the selected notice in the screenshot.

### Conversion procedure

This is an experimental text repair, not a verified Remastered port.

Use [w3strings Remastered](https://www.nexusmods.com/witcher3/mods/13094), Windows version `1.1.0` (Nexus file `77186`).
The tool writes Remastered's version `164` UTF-8 format by default when no source version metadata is present.
Changing only the binary version number is not a conversion.

Close the game and copy `dlc/dlcAWitcherCanHideAnother/content/en.w3strings` into a backup directory outside `mods` and `dlc`.
Keep the original file there, and create a separate output directory.
Run these commands from that working directory, with the converter on the command path:

```powershell
w3stringsr -d original/en.w3strings --no-meta-version -o original/en.csv
w3stringsr --no-verify original/en.csv -o converted/en.w3strings
w3stringsr -d converted/en.w3strings --no-meta-version -o converted/en.csv
Get-FileHash original/en.csv, converted/en.csv -Algorithm SHA256
```

Stop if any command fails or the two CSV hashes differ.
The `--no-meta-version` option prevents retention of the old format during encoding.
The `--no-verify` option bypasses only the tool's string-ID range check.
This mod already has 274 IDs outside the tool's `9453` allocation; preserve those IDs instead of renumbering them.

After verification, copy `converted/en.w3strings` over the installed English file.
Keep the two script repairs above and the supplied input bindings.
The recorded conversion changed only the English file; other languages remain unconverted.

### Recorded result and limits

The October 24 conversion preserved all **755 strings** and **24 key entries** in the decoded CSV output.
The original and converted CSV files have the same SHA-256 hash:
`E50F5F1E35E90CCF7F2BB1FAF67D6B4E6ABB7C21362CA9550C02A5A39A4D757D`.
An independent [version 164 reader](https://github.com/yuxingxiao/Witcher3_Dual_Subtitles) also decoded all 755 strings and matched their text to the original CSV.

| File | SHA-256 |
| --- | --- |
| Original English `en.w3strings`, version `163` | `A6193190D9DB6D476028FE7610DD26BABEFE335B7B0B18697F64D425404CEA17` |
| Converted English `en.w3strings`, version `164` (retained locally, not currently installed) | `EA2A26278E851327CFB82D3297B40F94B546B0FF0DB525F415366B5D435DF5AA` |
| Conversion tool `w3stringsr.exe`, version `1.1.0` | `5C8735F8161A3670530EF341682E37880C1590BAB832D3A3A4766BA3754291DE` |

The local backup is `mod-fix-backups/awcha-strings-20261024/original/en.w3strings`, relative to the game directory.
The converted file is `mod-fix-backups/awcha-strings-20261024/converted/en.w3strings`.
The conversion was briefly installed, then reversed before any in-game test.
The restored installed file matches the original hash above.
With the game closed, restore that file over the installed English file to reverse the text conversion.
The backup, tool, decoded quest text, and converted binary are not distributed in this repository.

File validation passed, but the converted text has not been checked in game.
After installing the experimental conversion, check the noticeboard on a separate save.
This text repair does not establish full quest compatibility or resolve unrelated gameplay faults.
The available evidence does not establish whether this conversion alone makes the quest usable on Remastered.

## Check the result

Launch the game and let it compile scripts. Confirm that the `InitializeAreaMusic` type mismatch and the three reported `GetStateByName` errors are gone. Then load a separate test save and check the quest and its skating controls. The script edits do not install the mod's required input bindings; follow the instructions provided with the mod for those.

Return to the affected noticeboard with English text selected and check the title and body.
Also check the quest journal and dialogue subtitles.
If the same notice remains unreadable, its source is still unresolved; do not mark the screenshot diagnosis as confirmed.

The script repair changed only the two expressions in `annotations.ws` and added the method and comment above to `explorationStateManager.ws`. All other original script text was preserved.

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

# Worker-thread crashes in Novigrad, October 17-18

The game crashed three times between October 17 and 18, 2026, always in Novigrad streets with crowds, at dusk or at night.
All three crash dumps go through the same engine code on a game worker thread.
That code walks the list of objects attached to a character or entity and updates them, and it reached an attached object that had already been freed.

**Status: the cause is not found yet.**
The first two crashes pointed to PT Optimization's **CPU: fast bone reads** option.
The third crash ruled that out: it happened with the option off, and the mod reported that it handled no bone updates.
The next step is a [test without PT Optimization](#next-tests).

## Setup at the time

| Item | Value |
| --- | --- |
| Game | GOG, DirectX 12, `witcher3.exe` 5.0.0.1048522 (October 8 patch) |
| PT Optimization | 2.1 FINAL, `bin/x64_dx12/xinput9_1_0.dll`, SHA-256 `C3EA428C5CD12D2EBFAD4B947942FBFF85C28B7B1A33E15AF797D57F79A0640F` |
| PT Optimization settings | Enabled; 1 bounce, indirect light 1.05, RT shadows on; CPU options on (distant trees, physics LOD, no wait for the RT scene). Fast bone reads was on for crashes 1 and 2 and off for crash 3. |
| Path tracing | Off |
| Other native code | ReShade 6.8.0 (add-on build, `dxgi.dll`) with The Living Continent 1.5 (`W3LivingSky.addon64`); DLSS/Streamline and FSR files from the game |

## The crashes

| # | Time | Thread | What failed |
| --- | --- | --- | --- |
| 1 | Oct 17, 23:18:34, 1 h 47 min into the session | `redTask3` | Virtual call on a freed object; execution jumped to `0x1` |
| 2 | Oct 17, 23:34:24, 14 min into the session | `redTask5` | 64-byte matrix written into a null buffer at `witcher3.exe+0x2596314` |
| 3 | Oct 18, 21:00:47, 14 min into the session | `redTask7` | Virtual call on a freed object; execution jumped into heap memory (`0x22B860DB040`) |

All three are access violations (`0xC0000005`) with only `witcher3.exe` code on the crashing thread.
They share this call chain, up to the task scheduler:

```text
witcher3.exe+0x22686C5/D4 -> +0x225D1CF -> +0x24981CA -> +0x942F35
```

Crashes 1 and 3 fail at exactly the same instruction.
The function at `witcher3.exe+0x2266E00` walks a linked list at `[object+0x60]`.
For each active entry, it takes the attached object at `[entry+0x60]`, skips it if flag `0x8000` is set at `+0x54`, and calls method `[vtable+0x210]` on it (at `+0x2266E5F`).
In both crashes, the attached object's vtable pointer pointed into heap memory instead of the executable, so the object had already been freed or reused.
Crash 2 went down the same chain into a matrix update whose destination buffer had not been allocated.

Crashes 1 and 2 came shortly after loading a save; crash 3 came one second after a quest checkpoint save.
The Living Continent's crash log records each exception, but that line comes from its crash handler; no crashing thread was inside the add-on.

## Why PT Optimization's fast bone reads is ruled out

On October 17, the mod logged `bones on: mod N, game 0` with N rising fast just before crashes 1 and 2, for example from 0 to 84,183 three seconds before crash 2.
That looked like the cause, so the option was turned off at 23:35:53 that day.

On October 18, the option was off from 20:46:58, one second after launch.
From then on, the log showed `bones off: mod 0`, with the game doing its own bone updates (`game 22089`, `game 20470`).
Crash 3 still happened, at the same instruction as crash 1.
The option stays off for now, but it is not the cause.

## Suspects

Only two installed components run native code inside the game: PT Optimization's `xinput9_1_0.dll` and The Living Continent's ReShade add-on.
Script mods cannot free engine memory directly, but they can make the engine attach, detach, or swap objects in a way that exposes an engine bug.

- **PT Optimization** is still installed and still hooks the game at launch (`bone matrices: streaming reads installed`), even with the option off.
- **Better Torches Next-Gen 5.1.0** and **No Indignant NPCs 2.4** were installed on October 17 at 16:14. All three crashes happened after that.
  Better Torches attaches and detaches the torch from Geralt's hand often, and No Indignant NPCs changes how crowds react.
  On October 16, about 2.5 hours of play without a crash came before this install, but that session was mostly underground, with few NPCs.
- **ModjiggleRR**, **The Living Continent** (seasonal clothing), and the appearance mods change what is attached to NPCs, and Novigrad has many NPCs.

Seven earlier crashes, from October 7 to 11, happened at other places inside `witcher3.exe` and were not analyzed in this detail.

## Next tests

Each test needs about 30 minutes in Novigrad at dusk or at night; the last two crashes took 14 minutes there.

1. Remove PT Optimization's `bin/x64_dx12/xinput9_1_0.dll` for the session. This is the only remaining native hook on the engine side.
2. If it still crashes, put the DLL back and remove `mods/modBetterTorchesNextGen` and `mods/modNoIndignantNPCs`.
3. If it still crashes, remove `mods/modjiggleRR_MED`.

## Report to the PT Optimization author

A first report about fast bone reads was prepared for the [PT Optimization bug section on Nexus](https://www.nexusmods.com/witcher3/mods/13025?tab=bugs).
If it was posted, follow up there: the option was ruled out by crash 3, and the result of test 1 shows whether the mod is involved at all.
Share the crash dumps from `%LOCALAPPDATA%\CrashDumps` only privately, because they can contain personal data from memory.

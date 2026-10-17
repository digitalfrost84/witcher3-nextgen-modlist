# PT Optimization 2.1: crashes with "CPU: fast bone reads"

On October 17, 2026, the game crashed twice within 16 minutes with [PT Optimization](https://www.nexusmods.com/witcher3/mods/13025) 2.1 FINAL (Nexus release 7) installed.
Both crash dumps point at the same engine path: per-character bone matrix updates on a game worker thread.
The mod's **CPU: fast bone reads** option was taking over those updates when each crash happened.

**Workaround:** in **Options → Mods → RT/PT optimization**, turn **CPU: fast bone reads** off.
The other PT Optimization options can stay on.
The option was turned off at 23:35:53 on October 17; `rt_optimizer.log` then reported `menu: bone reads off` and `bones off`.
Whether this stops the crashes has not been confirmed by a longer session yet.

The evidence is strong but circumstantial.
Neither crashing thread was running mod code at the moment of the crash, and the game has no symbols, so the dumps cannot prove that the mod corrupted the data.
The option is the only installed component that hooks bone data, the crashes are in exactly that code, and both followed a jump in the mod's bone counter right after a load.

## Setup at the time

| Item | Value |
| --- | --- |
| Game | GOG, DirectX 12, `witcher3.exe` 5.0.0.1048522 (October 8 patch) |
| PT Optimization | 2.1 FINAL, `bin/x64_dx12/xinput9_1_0.dll`, SHA-256 `C3EA428C5CD12D2EBFAD4B947942FBFF85C28B7B1A33E15AF797D57F79A0640F` |
| PT Optimization settings | Enabled; 1 bounce, indirect light 1.05, RT shadows on; all four CPU options on (distant trees, physics LOD, fast bone reads, no wait for the RT scene) |
| Path tracing | Off |
| Other native code | ReShade 6.8.0 (add-on build, `dxgi.dll`) with The Living Continent 1.5 (`W3LivingSky.addon64`); DLSS/Streamline and FSR files from the game |

## Crash 1: 23:18:34, about 1 h 47 min into the session

- Exception `0xC0000005` on worker thread `redTask3`. The instruction pointer was `0x1`, so the code jumped to an invalid address.
- The caller at `witcher3.exe+0x2266E5F` makes a virtual call (`call [rax+0x210]`) on an object.
  The object's vtable pointer pointed into heap memory instead of the executable's image, so the object had already been freed or overwritten.
- The stack is entirely inside `witcher3.exe`: `+0x2266E65`, `+0x22686D4`, `+0x225D1CF`, `+0x24981CA`, `+0x942F35`, then the task scheduler.
- In the six minutes before the crash, saves were loaded five times, each 1-2 minutes apart.

## Crash 2: 23:34:24, about 14 min into the next session

- Exception `0xC0000005` on worker thread `redTask5`, writing to address `0x0`.
- The faulting code at `witcher3.exe+0x2596314` copies a 64-byte matrix (indexed with `shl rcx,6`) into the buffer pointed to by `[r14+0xAC]`.
  That buffer pointer was null.
- Frames 04 to 07 of the stack (`+0x22686C5`, `+0x225D1CF`, `+0x24981CA`, `+0x942F35`) are the same call chain as crash 1.
- The crash came about 10 seconds after a load.

## What PT Optimization logged

The option is listed at load as `bone matrices: streaming reads installed`.
Every 5 seconds the mod logs how many bone updates it handled (`bones on: mod N, game 0`).
Before crash 2, the counter jumped from 0 to 6,908 to 84,183 between 23:34:11 and 23:34:21; the crash followed three seconds later.
Before crash 1, it went up and down between 0 and about 180,000 across the save loads.

The Living Continent's crash log recorded both exceptions (`CRASH - exception 0xC0000005 at ...`).
That line comes from its crash handler; neither crashing thread was inside the add-on.

## Earlier crashes

Seven earlier crashes, from October 7 to 11, were access violations at other places inside `witcher3.exe`.
PT Optimization 2.0 was installed on most of those days, and those crashes were not analyzed in this detail.
They show that the game was not fully stable with this mod list before 2.1.

## Report to the author

The report below can be posted in the [PT Optimization comments or bug section on Nexus](https://www.nexusmods.com/witcher3/mods/13025?tab=bugs).
Attach the two `.dmp` files from `%LOCALAPPDATA%\CrashDumps` and `bin\x64_dx12\rt_optimizer.log` if the author asks for them; the dumps can contain personal data from memory, so share them privately.

> **2.1 FINAL: worker-thread crashes in bone matrix updates with "CPU: fast bone reads" on**
>
> GOG 5.0.0.1048522 (DX12), PT Optimization 2.1 FINAL (release 7), path tracing off, all four CPU options on. Also installed: ReShade 6.8 add-on build with The Living Continent 1.5.
>
> Two crashes in 16 minutes, both access violations on game worker threads (`redTask3`, `redTask5`) in the same call chain (`witcher3.exe+0x22686C5/D4 → +0x225D1CF → +0x24981CA → +0x942F35`):
>
> 1. A virtual call at `+0x2266E5F` on an object whose vtable pointer points into the heap (freed or stale object), so execution jumps to `0x1`.
> 2. `+0x2596314` writes a 64-byte matrix into a null destination buffer (`[r14+0xAC]` = 0).
>
> Both happened shortly after loading a save. Each time, your log showed `bones on: mod N, game 0` rising fast right before the crash, for example 0 → 6,908 → 84,183 three seconds before the second crash. It looks as if the streaming bone reads can still be in use for a character whose skeleton data was just released or not allocated yet, possibly around loads. I turned "CPU: fast bone reads" off and will report whether the crashes stop. I can share the minidumps if they help.

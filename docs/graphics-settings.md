# Graphics and lighting settings

The game's own graphics settings used with this mod list, and the lighting options of the mods that affect the picture.
These are preferences, not requirements: they record what looked best on this setup.
The values come from `Documents/The Witcher 3/dx12user.settings` (DirectX 12).

## Recommended: ray-traced shadows on

**Changed on October 11, 2026:** RT shadows were turned on (`[Rendering/RT]` `Shadows=1`, previously `0`).
With ray-traced global illumination already on, this was the single biggest improvement to the lighting: sun shadows become sharper and properly grounded, and objects no longer look flat or floating.
It costs some performance.

PT Optimization also reads this option: its log shows `RT shadows option: ... reads of Rendering/RT/Shadows redirected` and `path tracer: ray-traced shadows on`.
Set the shadows in the game's own graphics menu; PT Optimization follows it.

## Current game settings

| Setting | Value | Note |
| --- | --- | --- |
| Ray tracing (`EnableRT`) | On | |
| RT global illumination (`EnableRtRadiance`) | On | |
| RT ambient occlusion (`RTAOEnabled`) | On | |
| RT shadows (`Shadows`) | **On** | See above. |
| Path tracing (`PTEnable`) | Off | PT Optimization's bounce and light settings only take effect with path tracing on. |
| DLSS Ray Reconstruction (`EnableDLSSRR`) | Off | |
| HDR (`HdrEnabled`) | Off | |
| Gamma (`GammaValue`) | 1.0 | Default. |
| Sharpening (`SharpenAmount`) | 0 | |

## Mod options that change the picture

| Mod | Option | Current value | Effect |
| --- | --- | --- | --- |
| [The Living Continent](https://www.nexusmods.com/witcher3/mods/13650) | Seasonal colours (`SeasonalGrade`) | On | A colour grade on the final image. Winter lifts the blacks, drains some colour, and cools the shadows, which can look like gamma set too high, especially in fog. Off indoors and weaker at night. Toggle in the quick panel (Numpad 0) to compare. |
| The Living Continent | Darker Nights (`DarkerNights`) | As the game made it | Darker / dark / very dark make nights darker while stars, aurora, fires, and torches keep their light. Only with HDR off. |
| [Light Rewrite](https://www.nexusmods.com/witcher3/mods/12144) | Fog Removal (Advanced) | 0 | Removes the game's own indoor fog at the chosen strength (0-100), only while inside. Raise it if interiors look hazy. |
| Light Rewrite | Fog Fade Time (Advanced) | 2 s | How quickly the indoor fog removal blends in and out at doors. |
| Light Rewrite | Profile | 2 | The lighting preset for candles, torches, and other local lights. |

## How to change them

Change these in the game's menus (Options > Graphics, and Options > Mods for the mod options) rather than in `dx12user.settings`: the game rewrites that file while it runs.

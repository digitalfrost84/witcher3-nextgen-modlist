# Gameplay notes

## Delusion 3 for Axii dialogue options

Some quests have Axii dialogue options that need **Delusion at level 3**.
One example is the Novigrad side quest [Of Swords and Dumplings](https://thewitcher3.wiki.fextralife.com/Of+Swords+and+Dumplings).
Without enough Delusion, the option is missing, and the quest takes another path.

Delusion must be **equipped in a skill slot**, not only bought.
The game's scripts compute the Axii dialogue level as 1 plus the Delusion level, but only count Delusion while it is equipped (`GetAxiiLevel` in `player/playerWitcher.ws`, `CanUseSkill` in `gameplay/ability/PlayerAbilityManager.ws`).
Equip it before starting conversations that might have an Axii option.

## Moving a skill point with the console

The game has no console command that removes one point from a skill.
Delusion's internal ID is `S_Magic_s17`.

Add a free skill point and spend it in the character menu:

```
addskillpoints(1)
```

Or add one level to Delusion directly:

```
learnskillId(S_Magic_s17)
```

To take points out of a skill, spawn a Potion of Clearance and drink it.
It refunds every skill point, not only one, so all points must be spent again:

```
additem('Clearing Potion')
```

Do not use `cleardevelop`: it resets Geralt to level 1 and clears his inventory.

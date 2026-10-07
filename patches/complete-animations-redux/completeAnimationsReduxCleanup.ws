// Local fix: the mod adds a temporary prop item (bottle, food, whetstone...) to the
// player's inventory for every animation, but only ever unmounts it. The hidden props
// pile up in the save and break the inventory when the mod's DLC is removed.

function CARIsPropItemName(itemName : name) : bool
{
	switch (itemName)
	{
		case 'Drink_Bottle': case 'Drink_Bottle_Horn': case 'Drink_Cup':
		case 'Drink_Jug': case 'Drink_Jug_Horn': case 'Drink_Juice_Bottle':
		case 'Drink_Juice_Bottle_Horn': case 'Drink_Wine_Cup':
		case 'Food_Apple': case 'Food_Apple_Horn': case 'Food_Bread': case 'Food_Bread_Mask':
		case 'Food_Cheese': case 'Food_Cheese_Mask': case 'Food_Chicken': case 'Food_Chicken_Mask':
		case 'Food_Egg': case 'Food_Egg_Horn': case 'Food_Fish': case 'Food_Fish_Mask':
		case 'Food_Grapes': case 'Food_Grapes_Mask': case 'Food_Grilled_Meat': case 'Food_Grilled_Meat_Mask':
		case 'Food_Meat': case 'Food_Meat_Mask': case 'Food_Meat_Leg': case 'Food_Meat_Leg_Mask':
		case 'Food_Mushroom': case 'Food_Mushroom_Horn': case 'Food_Onion': case 'Food_Onion_Horn':
		case 'Food_Pepper_Red': case 'Food_Pepper_Red_Horn': case 'Food_Pie': case 'Food_Pie_Mask':
		case 'Food_Potato': case 'Food_Potato_Horn': case 'Food_Sandwich': case 'Food_Sandwich_Mask':
		case 'Food_Tomato': case 'Food_Tomato_Horn':
		case 'Hammer_Rotated': case 'Whetstone_left':
		case 'Potion_Bottle': case 'Potion_Bottle_Horn': case 'Potion_Bottle_Right': case 'Potion_Bottle_Right_Long':
		case 'TPB_Potion_Bottle': case 'TPB_Potion_Bottle_Horn':
			return true;
	}

	return false;
}

function CARRemovePropItem(inv : CInventoryComponent, itemName : name)
{
	var ids	: array<SItemUniqueId>;
	var i	: int;

	if (!inv || !CARIsPropItemName(itemName))
		return;

	ids = inv.GetItemsByName(itemName);

	for (i = 0; i < ids.Size(); i += 1)
	{
		if (inv.IsItemMounted(ids[i]) || inv.IsItemHeld(ids[i]))
			inv.UnmountItem(ids[i], true);

		inv.RemoveItem(ids[i], Max(1, inv.GetItemQuantity(ids[i])));
	}
}

function CARRemoveAllPropItems(inv : CInventoryComponent)
{
	var ids	: array<SItemUniqueId>;
	var i	: int;

	if (!inv)
		return;

	inv.GetAllItems(ids);

	for (i = ids.Size() - 1; i >= 0; i -= 1)
	{
		if (CARIsPropItemName(inv.GetItemName(ids[i])))
		{
			if (inv.IsItemMounted(ids[i]) || inv.IsItemHeld(ids[i]))
				inv.UnmountItem(ids[i], true);

			inv.RemoveItem(ids[i], Max(1, inv.GetItemQuantity(ids[i])));
		}
	}
}

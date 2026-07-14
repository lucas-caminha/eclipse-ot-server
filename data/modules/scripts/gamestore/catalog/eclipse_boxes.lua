local function equipmentBoxOffer(itemId, name, price, description)
	return {
		icons = { "Category_UsefulThings.png" },
		name = name,
		price = price,
		id = itemId,
		itemtype = itemId,
		count = 1,
		description = description .. "\n\n{character}\n{storeinbox}\n{useicon} use it to receive one random reward",
		type = GameStore.OfferTypes.OFFER_TYPE_ITEM,
	}
end

return {
	icons = { "Category_UsefulThings.png" },
	name = "Eclipse Boxes",
	parent = "Extras",
	rookgaard = true,
	state = GameStore.States.STATE_NEW,
	offers = {
		equipmentBoxOffer(60058, "Cobra Box", 250, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(60513, "Cobra Chest", 250, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(60514, "Falcon Chest", 250, "<i>Contains one random falcon item.</i>"),
		equipmentBoxOffer(60510, "Naga Chest", 250, "<i>Contains one random naga item.</i>"),
		equipmentBoxOffer(60511, "Eldritch Chest", 250, "<i>Contains one random eldritch item.</i>"),
		equipmentBoxOffer(60512, "Lion Chest", 250, "<i>Contains one random lion item.</i>"),
		equipmentBoxOffer(60523, "Gnome Chest", 250, "<i>Contains one random gnome item.</i>"),
		equipmentBoxOffer(60508, "Monk Box", 250, "<i>Contains one random monk item.</i>"),
		equipmentBoxOffer(60525, "Random Soul Core Box", 150, "<i>Contains one random soul core.</i>"),
		equipmentBoxOffer(60509, "Misterious Bag", 300, "<i>Contains one random Eclipse equipment item.</i>"),
	},
}

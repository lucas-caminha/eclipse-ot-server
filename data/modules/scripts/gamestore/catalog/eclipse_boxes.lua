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
		equipmentBoxOffer(60523, "Gnome Chest", 200, "<i>Contains one random gnome item.</i>"),
		equipmentBoxOffer(60512, "Lion Chest", 250, "<i>Contains one random lion item.</i>"),
		equipmentBoxOffer(60058, "Cobra Box", 300, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(60513, "Cobra Chest", 300, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(60514, "Falcon Chest", 350, "<i>Contains one random falcon item.</i>"),
		equipmentBoxOffer(60510, "Naga Chest", 450, "<i>Contains one random naga item.</i>"),
		equipmentBoxOffer(60511, "Eldritch Chest", 550, "<i>Contains one random eldritch item.</i>"),
		equipmentBoxOffer(60525, "Random Soul Core Box", 200, "<i>Contains one random soul core.</i>"),
		equipmentBoxOffer(60509, "Misterious Bag", 600, "<i>Contains one random Eclipse equipment item.</i>"),
		equipmentBoxOffer(34109, "Bag You Desire", 800, "<i>Contains one random Soul War item.</i>"),
		equipmentBoxOffer(39546, "Primal Bag", 1000, "<i>Contains one random Primal Ordeal item.</i>"),
		equipmentBoxOffer(43895, "Bag You Covet", 1400, "<i>Contains one random Sanguine item.</i>"),
	},
}

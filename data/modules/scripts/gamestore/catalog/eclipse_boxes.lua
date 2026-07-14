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
	rookgaard = false,
	state = GameStore.States.STATE_NEW,
	offers = {
		equipmentBoxOffer(51303, "Cobra Box", 250, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(38756, "Cobra Chest", 250, "<i>Contains one random cobra item.</i>"),
		equipmentBoxOffer(39396, "Falcon Chest", 250, "<i>Contains one random falcon item.</i>"),
		equipmentBoxOffer(37561, "Naga Chest", 250, "<i>Contains one random naga item.</i>"),
		equipmentBoxOffer(36980, "Eldritch Chest", 250, "<i>Contains one random eldritch item.</i>"),
		equipmentBoxOffer(28905, "Lion Chest", 250, "<i>Contains one random lion item.</i>"),
		equipmentBoxOffer(29433, "Gnome Chest", 250, "<i>Contains one random gnome item.</i>"),
		equipmentBoxOffer(29436, "Monk Box", 250, "<i>Contains one random monk item.</i>"),
		equipmentBoxOffer(30316, "Random Soul Core Box", 150, "<i>Contains one random soul core.</i>"),
		equipmentBoxOffer(35479, "Misterious Bag", 300, "<i>Contains one random Eclipse equipment item.</i>"),
	},
}

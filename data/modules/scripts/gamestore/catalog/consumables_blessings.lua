return {
	icons = { "Category_Blessings.png" },
	name = "Blessings",
	parent = "Consumables",
	rookgaard = true,
	state = GameStore.States.STATE_NONE,
	offers = {
		{
			icons = { "All_PvE_Blessings.png" },
			name = "All Regular Blessings",
			price = 100,
			id = GameStore.SubActions.BLESSING_ALL_PVE,
			count = 1,
			description = "<i>Reduces your character's chance to lose any items as well as the amount of your character's experience and skill loss upon death.</i>\n\n{character}\n{limit|1}\n{info} added directly to the Record of Blessings\n{info} characters with a red or black skull will always lose all equipment upon death",
			type = GameStore.OfferTypes.OFFER_TYPE_ALLBLESSINGS,
		},
	},
}

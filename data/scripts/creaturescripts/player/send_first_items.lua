local config = {
	[VOCATION.ID.NONE] = {
		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
		},
	},

	[VOCATION.ID.SORCERER] = {
		items = {
			{ 3387, 1 }, -- demon helmet
			{ 3567, 1 }, -- blue robe
			{ 3398, 1 }, -- dwarven legs
			{ 3079, 1 }, -- boots of haste
			{ 3059, 1 }, -- spellbook
			{ 3072, 1 }, -- wand of decay
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 268, 50 }, -- mana potion
		},
	},

	[VOCATION.ID.DRUID] = {
		items = {
			{ 3387, 1 }, -- demon helmet
			{ 3567, 1 }, -- blue robe
			{ 3398, 1 }, -- dwarven legs
			{ 3079, 1 }, -- boots of haste
			{ 3059, 1 }, -- spellbook
			{ 3070, 1 }, -- moonlight rod
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 268, 50 }, -- mana potion
		},
	},

	[VOCATION.ID.PALADIN] = {
		items = {
			{ 3387, 1 }, -- demon helmet
			{ 8063, 1 }, -- paladin armor
			{ 3398, 1 }, -- dwarven legs
			{ 3079, 1 }, -- boots of haste
			{ 7438, 1 }, -- elvish bow
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 266, 30 }, -- health potion
			{ 268, 30 }, -- mana potion
			{ 3447, 100 }, -- arrow
		},
	},

	[VOCATION.ID.KNIGHT] = {
		items = {
			{ 3387, 1 }, -- demon helmet
			{ 3366, 1 }, -- magic plate armor
			{ 3398, 1 }, -- dwarven legs
			{ 3079, 1 }, -- boots of haste
			{ 3414, 1 }, -- mastermind shield
			{ 3265, 1 }, -- two handed sword
		},

		container = {
			{ 3266, 1 }, -- battle axe
			{ 3311, 1 }, -- clerical mace
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 266, 50 }, -- health potion
		},
	},

	[VOCATION.ID.MONK] = {
		items = {
			{ 3387, 1 }, -- demon helmet
			{ 50258, 1 }, -- monk robe
			{ 3398, 1 }, -- dwarven legs
			{ 3079, 1 }, -- boots of haste
			{ 50271, 1 }, -- fists of enlightenment
		},

		container = {
			{ 50181, 1 }, -- pair of monk fists
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 266, 30 }, -- health potion
			{ 268, 30 }, -- mana potion
		},
	},
}

local sendFirstItems = CreatureEvent("SendFirstItems")

function sendFirstItems.onLogin(player)
	local targetVocation = config[player:getVocation():getBaseId()]
	if not targetVocation or player:getLastLoginSaved() ~= 0 then
		return true
	end

	if targetVocation.items then
		for i = 1, #targetVocation.items do
			player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
		end
	end

	local backpack = player:addItem(2854)
	if not backpack then
		return true
	end

	if targetVocation.container then
		for i = 1, #targetVocation.container do
			backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
		end
	end
	return true
end

sendFirstItems:register()

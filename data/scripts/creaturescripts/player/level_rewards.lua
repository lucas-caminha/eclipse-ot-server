local CRYSTAL_COIN_ID = ITEM_CRYSTAL_COIN or 3043

local RewardType = {
	ITEM = "item",
	MOUNT = "mount",
	OUTFIT = "outfit",
	SKILL_ITEM = "skill_item",
}

local function itemReward(id, count, name)
	return { type = RewardType.ITEM, id = id, count = count or 1, name = name }
end

local commonRewards = {
	[50] = {
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 5, name = "5 crystal coins" },
		{ type = RewardType.MOUNT, id = 13, name = "Donkey" },
	},
	[100] = {
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 10, name = "10 crystal coins" },
		{ type = RewardType.OUTFIT, female = 136, male = 128, name = "Citizen outfit" },
	},
	[150] = {
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 15, name = "15 crystal coins" },
	},
	[200] = {
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 20, name = "20 crystal coins" },
		{ type = RewardType.MOUNT, id = 23, name = "Armoured War Horse" },
	},
	[250] = {
		{ type = RewardType.ITEM, id = 51464, count = 1, name = "powerful vampirism scroll" },
	},
	[275] = {
		{ type = RewardType.ITEM, id = 51462, count = 1, name = "powerful strike scroll" },
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 27, name = "27 crystal coins" },
	},
	[300] = {
		{ type = RewardType.ITEM, id = 51467, count = 1, name = "powerful void scroll" },
		{ type = RewardType.ITEM, id = CRYSTAL_COIN_ID, count = 30, name = "30 crystal coins" },
	},
}

local progressionRewards = {
	[VOCATION.BASE_ID.SORCERER] = {
		[40] = {
			itemReward(8092, 1, "wand of starstorm"),
			itemReward(8073, 1, "spellbook of warding"),
		},
		[50] = {
			itemReward(8074, 1, "spellbook of mind control"),
			itemReward(9103, 1, "batwing hat"),
		},
		[60] = {
			itemReward(8075, 1, "spellbook of lost souls"),
			itemReward(10439, 1, "Zaoan robe"),
		},
		[75] = {
			itemReward(8039, 1, "dragon robe"),
		},
		[80] = {
			itemReward(8864, 1, "yalahari mask"),
		},
		[100] = {
			itemReward(11687, 1, "royal scale robe"),
			itemReward(11691, 1, "snake god's wristguard"),
		},
		[130] = {
			itemReward(16107, 1, "spellbook of vigilance"),
			itemReward(19391, 1, "furious frock"),
		},
		[150] = {
			itemReward(14769, 1, "spellbook of ancient arcana"),
			itemReward(35522, 1, "jungle wand"),
		},
		[180] = {
			itemReward(29431, 1, "spirit guide"),
			itemReward(32618, 1, "soulful legs"),
		},
		[200] = {
			itemReward(27457, 1, "wand of destruction"),
		},
	},
	[VOCATION.BASE_ID.DRUID] = {
		[40] = {
			itemReward(8082, 1, "underworld rod"),
			itemReward(8073, 1, "spellbook of warding"),
		},
		[50] = {
			itemReward(8074, 1, "spellbook of mind control"),
			itemReward(9103, 1, "batwing hat"),
		},
		[60] = {
			itemReward(8075, 1, "spellbook of lost souls"),
			itemReward(10439, 1, "Zaoan robe"),
		},
		[75] = {
			itemReward(8038, 1, "robe of the ice queen"),
		},
		[80] = {
			itemReward(8864, 1, "yalahari mask"),
		},
		[100] = {
			itemReward(11687, 1, "royal scale robe"),
			itemReward(11691, 1, "snake god's wristguard"),
		},
		[130] = {
			itemReward(16107, 1, "spellbook of vigilance"),
			itemReward(19391, 1, "furious frock"),
		},
		[150] = {
			itemReward(14769, 1, "spellbook of ancient arcana"),
			itemReward(35521, 1, "jungle rod"),
		},
		[180] = {
			itemReward(29431, 1, "spirit guide"),
			itemReward(32618, 1, "soulful legs"),
		},
		[200] = {
			itemReward(27458, 1, "rod of destruction"),
		},
	},
	[VOCATION.BASE_ID.PALADIN] = {
		[50] = {
			itemReward(8027, 1, "composite hornbow"),
			itemReward(10384, 1, "Zaoan armor"),
		},
		[60] = {
			itemReward(8022, 1, "chain bolter"),
			itemReward(3394, 1, "amazon armor"),
		},
		[80] = {
			itemReward(8026, 1, "warsinger bow"),
			itemReward(8863, 1, "yalahari leg piece"),
		},
		[100] = {
			itemReward(8060, 1, "master archer's armor"),
			itemReward(11689, 1, "elite draken helmet"),
		},
		[120] = {
			itemReward(22866, 1, "rift bow"),
			itemReward(16110, 1, "prismatic armor"),
		},
		[150] = {
			itemReward(13994, 1, "depth lorica"),
			itemReward(16111, 1, "prismatic legs"),
			itemReward(35518, 1, "jungle bow"),
		},
		[180] = {
			itemReward(29427, 1, "dark whispers"),
		},
		[200] = {
			itemReward(27455, 1, "bow of destruction"),
		},
	},
	[VOCATION.BASE_ID.KNIGHT] = {
		[40] = {
			itemReward(7386, 1, "mercenary sword"),
			itemReward(7413, 1, "titan axe"),
		},
		[50] = {
			itemReward(7391, 1, "thaian sword"),
			itemReward(3335, 1, "twin axe"),
			itemReward(3279, 1, "war hammer"),
			itemReward(10384, 1, "Zaoan armor"),
		},
		[75] = {
			itemReward(6527, 1, "avenger"),
			itemReward(20064, 1, "crude umbral blade"),
			itemReward(20070, 1, "crude umbral axe"),
			itemReward(20076, 1, "crude umbral mace"),
		},
		[80] = {
			itemReward(8862, 1, "yalahari armor"),
			itemReward(11688, 1, "shield of corruption"),
		},
		[100] = {
			itemReward(8053, 1, "fireborn giant armor"),
		},
		[130] = {
			itemReward(14000, 1, "ornate shield"),
		},
		[150] = {
			itemReward(16109, 1, "prismatic helmet"),
		},
		[180] = {
			itemReward(29430, 1, "ectoplasmic shield"),
			itemReward(13999, 1, "ornate legs"),
		},
		[200] = {
			itemReward(27449, 1, "blade of destruction"),
			itemReward(27451, 1, "axe of destruction"),
			itemReward(27453, 1, "mace of destruction"),
		},
	},
	[VOCATION.BASE_ID.MONK] = {
		[40] = {
			itemReward(50182, 1, "nunchaku"),
			itemReward(50269, 1, "legs of enlightenment"),
		},
		[50] = {
			itemReward(50273, 1, "nunchaku of enlightenment"),
			itemReward(50259, 1, "Zaoan monk robe"),
		},
		[70] = {
			itemReward(50274, 1, "coned hat of enlightenment"),
		},
		[80] = {
			itemReward(50187, 1, "legs of wisdom"),
			itemReward(50289, 1, "yalahari footwraps"),
		},
		[100] = {
			itemReward(50272, 1, "sai of enlightenment"),
			itemReward(50263, 1, "merudri scale mail"),
		},
		[125] = {
			itemReward(50261, 1, "merudri nanbando"),
		},
		[135] = {
			itemReward(50176, 1, "depth claws"),
			itemReward(50186, 1, "jungle survivor legs"),
		},
		[150] = {
			itemReward(50270, 1, "bambus jo"),
			itemReward(50268, 1, "robe of enlightenment"),
			itemReward(50290, 1, "gnomish footwraps"),
		},
		[180] = {
			itemReward(50190, 1, "dark vision bandana"),
		},
		[200] = {
			itemReward(50168, 1, "nunchaku of destruction"),
		},
	},
}

local vocationRewards = {
	[VOCATION.BASE_ID.SORCERER] = {
		[250] = {
			{ type = RewardType.OUTFIT, female = 141, male = 133, name = "Summoner outfit" },
		},
		[350] = {
			{ type = RewardType.ITEM, id = 20090, count = 1, name = "umbral master spellbook" },
		},
	},
	[VOCATION.BASE_ID.DRUID] = {
		[250] = {
			{ type = RewardType.OUTFIT, female = 148, male = 144, name = "Druid outfit" },
		},
		[350] = {
			{ type = RewardType.ITEM, id = 20090, count = 1, name = "umbral master spellbook" },
		},
	},
	[VOCATION.BASE_ID.PALADIN] = {
		[250] = {
			{ type = RewardType.OUTFIT, female = 137, male = 129, name = "Hunter outfit" },
		},
		[350] = {
			{ type = RewardType.ITEM, id = 20084, count = 1, name = "umbral master bow" },
			{ type = RewardType.ITEM, id = 20087, count = 1, name = "umbral master crossbow" },
		},
	},
	[VOCATION.BASE_ID.KNIGHT] = {
		[250] = {
			{ type = RewardType.OUTFIT, female = 139, male = 131, name = "Knight outfit" },
		},
		[350] = {
			{
				type = RewardType.SKILL_ITEM,
				name = "highest melee skill umbral master weapon",
				choices = {
					{ skill = SKILL_SWORD, id = 20066, count = 1, name = "umbral masterblade" },
					{ skill = SKILL_AXE, id = 20072, count = 1, name = "umbral master axe" },
					{ skill = SKILL_CLUB, id = 20078, count = 1, name = "umbral master mace" },
				},
			},
		},
	},
	[VOCATION.BASE_ID.MONK] = {
		[250] = {
			{ type = RewardType.OUTFIT, female = 1825, male = 1824, name = "Monk outfit" },
		},
		[350] = {
			{ type = RewardType.ITEM, id = 50165, count = 1, name = "umbral master katar" },
		},
	},
}

local levels = { 40, 50, 60, 70, 75, 80, 100, 120, 125, 130, 135, 150, 180, 200, 250, 275, 300, 350 }

local function appendRewards(target, source)
	if not source then
		return
	end

	for i = 1, #source do
		target[#target + 1] = source[i]
	end
end

local function resolveSkillItemReward(player, reward)
	local selected
	local selectedSkillLevel = -1

	for i = 1, #reward.choices do
		local choice = reward.choices[i]
		local skillLevel = player:getSkillLevel(choice.skill)
		if skillLevel > selectedSkillLevel then
			selected = choice
			selectedSkillLevel = skillLevel
		end
	end

	if not selected then
		return nil
	end

	return {
		type = RewardType.ITEM,
		id = selected.id,
		count = selected.count or 1,
		name = selected.name,
	}
end

local function resolveRewards(player, rewards)
	local resolved = {}

	for i = 1, #rewards do
		local reward = rewards[i]
		if reward.type == RewardType.SKILL_ITEM then
			local resolvedReward = resolveSkillItemReward(player, reward)
			if resolvedReward then
				resolved[#resolved + 1] = resolvedReward
			end
		else
			resolved[#resolved + 1] = reward
		end
	end

	return resolved
end

local function getLevelRewards(player, vocationId, level)
	local levelRewards = {}

	appendRewards(levelRewards, commonRewards[level])

	local rewardsByVocation = vocationRewards[vocationId]
	if rewardsByVocation then
		appendRewards(levelRewards, rewardsByVocation[level])
	end

	return resolveRewards(player, levelRewards)
end

local function getProgressionRewards(player, vocationId, level)
	local rewardsByVocation = progressionRewards[vocationId]
	if not rewardsByVocation then
		return {}
	end

	return resolveRewards(player, rewardsByVocation[level] or {})
end

local function getInboxSlotsNeeded(reward)
	if reward.type ~= RewardType.ITEM then
		return 0
	end

	local count = reward.count or 1
	local itemType = ItemType(reward.id)
	if itemType and itemType:isStackable() then
		return math.ceil(count / itemType:getStackSize())
	end

	return count
end

local function addItemReward(inbox, reward, level)
	local itemType = ItemType(reward.id)
	local stackSize = itemType and itemType:isStackable() and itemType:getStackSize() or 1
	local remaining = reward.count or 1

	while remaining > 0 do
		local count = math.min(remaining, stackSize)
		local item = inbox:addItem(reward.id, count)
		if not item then
			return false
		end

		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format("Level %d reward from Eclipse OT.", level))
		remaining = remaining - count
	end

	return true
end

local function addMountReward(player, reward)
	if not player:hasMount(reward.id) then
		player:addMount(reward.id)
	end

	return true
end

local function addOutfitReward(player, reward)
	if not player:hasOutfit(reward.female) then
		player:addOutfit(reward.female)
	end

	if not player:hasOutfit(reward.male) then
		player:addOutfit(reward.male)
	end

	return true
end

local function giveLevelReward(player, level, rewards)
	local inbox = player:getStoreInbox()
	if not inbox then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your level reward could not be delivered. Please contact the staff.")
		return false
	end

	local slotsNeeded = 0
	for i = 1, #rewards do
		slotsNeeded = slotsNeeded + getInboxSlotsNeeded(rewards[i])
	end

	local inboxItems = inbox:getItems()
	if #inboxItems + slotsNeeded > inbox:getMaxCapacity() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your level %d reward is waiting, but your Store Inbox is full.", level))
		return false
	end

	local received = {}
	for i = 1, #rewards do
		local reward = rewards[i]
		if reward.type == RewardType.ITEM then
			if not addItemReward(inbox, reward, level) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your level %d reward could not be fully delivered. Please contact the staff.", level))
				return false
			end
		elseif reward.type == RewardType.MOUNT then
			addMountReward(player, reward)
		elseif reward.type == RewardType.OUTFIT then
			addOutfitReward(player, reward)
		end

		received[#received + 1] = reward.name or tostring(reward.id)
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Level %d reward granted: %s.", level, table.concat(received, ", ")))
	return true
end

local function processLevelRewards(player, fromLevel, toLevel)
	local vocation = player:getVocation()
	if not vocation then
		return true
	end

	local vocationId = vocation:getBaseId()
	local kv = player:kv():scoped("level-rewards")
	for i = 1, #levels do
		local level = levels[i]
		if fromLevel < level and toLevel >= level then
			local rewards = getLevelRewards(player, vocationId, level)
			if #rewards > 0 and not kv:get(tostring(level)) and giveLevelReward(player, level, rewards) then
				kv:set(tostring(level), true)
			end

			local progressionKey = string.format("progression-vocation-%d-%d", vocationId, level)
			local progressionLevelRewards = getProgressionRewards(player, vocationId, level)
			if #progressionLevelRewards > 0 and not kv:get(progressionKey) and giveLevelReward(player, level, progressionLevelRewards) then
				kv:set(progressionKey, true)
			end
		end
	end

	return true
end

local levelRewards = CreatureEvent("LevelRewards")

function levelRewards.onLogin(player)
	return processLevelRewards(player, 20, player:getLevel())
end

function levelRewards.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	return processLevelRewards(player, oldLevel, newLevel)
end

levelRewards:register()

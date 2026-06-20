local CRYSTAL_COIN_ID = ITEM_CRYSTAL_COIN or 3043

local RewardType = {
	ITEM = "item",
	MOUNT = "mount",
	OUTFIT = "outfit",
	SKILL_ITEM = "skill_item",
}

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

local levels = { 50, 100, 150, 200, 250, 275, 300, 350 }

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
		local rewards = getLevelRewards(player, vocationId, level)
		if fromLevel < level and toLevel >= level and #rewards > 0 and not kv:get(tostring(level)) then
			if giveLevelReward(player, level, rewards) then
				kv:set(tostring(level), true)
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

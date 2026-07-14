local internalNpcName = "Scroll Sage"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Powerful and intricate imbuement scrolls for sale!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I sell {powerful} imbuement scrolls for 1kk and {intricate} imbuement scrolls for 500k. Ask for {trade}.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

local powerfulPrice = 1000000
local intricatePrice = 500000

npcConfig.shop = {
	{ itemName = "powerful bash scroll", clientId = 51444, buy = powerfulPrice },
	{ itemName = "powerful blockade scroll", clientId = 51445, buy = powerfulPrice },
	{ itemName = "powerful chop scroll", clientId = 51446, buy = powerfulPrice },
	{ itemName = "powerful cloud fabric scroll", clientId = 51447, buy = powerfulPrice },
	{ itemName = "powerful demon presence scroll", clientId = 51448, buy = powerfulPrice },
	{ itemName = "powerful dragon hide scroll", clientId = 51449, buy = powerfulPrice },
	{ itemName = "powerful electrify scroll", clientId = 51450, buy = powerfulPrice },
	{ itemName = "powerful epiphany scroll", clientId = 51451, buy = powerfulPrice },
	{ itemName = "powerful featherweight scroll", clientId = 51452, buy = powerfulPrice },
	{ itemName = "powerful frost scroll", clientId = 51453, buy = powerfulPrice },
	{ itemName = "powerful lich shroud scroll", clientId = 51454, buy = powerfulPrice },
	{ itemName = "powerful precision scroll", clientId = 51455, buy = powerfulPrice },
	{ itemName = "powerful punch scroll", clientId = 51456, buy = powerfulPrice },
	{ itemName = "powerful quara scale scroll", clientId = 51457, buy = powerfulPrice },
	{ itemName = "powerful reap scroll", clientId = 51458, buy = powerfulPrice },
	{ itemName = "powerful scorch scroll", clientId = 51459, buy = powerfulPrice },
	{ itemName = "powerful slash scroll", clientId = 51460, buy = powerfulPrice },
	{ itemName = "powerful snake skin scroll", clientId = 51461, buy = powerfulPrice },
	{ itemName = "powerful strike scroll", clientId = 51462, buy = powerfulPrice },
	{ itemName = "powerful swiftness scroll", clientId = 51463, buy = powerfulPrice },
	{ itemName = "powerful vampirism scroll", clientId = 51464, buy = powerfulPrice },
	{ itemName = "powerful venom scroll", clientId = 51465, buy = powerfulPrice },
	{ itemName = "powerful vibrancy scroll", clientId = 51466, buy = powerfulPrice },
	{ itemName = "powerful void scroll", clientId = 51467, buy = powerfulPrice },
	{ itemName = "intricate bash scroll", clientId = 51724, buy = intricatePrice },
	{ itemName = "intricate blockade scroll", clientId = 51725, buy = intricatePrice },
	{ itemName = "intricate chop scroll", clientId = 51726, buy = intricatePrice },
	{ itemName = "intricate cloud fabric scroll", clientId = 51727, buy = intricatePrice },
	{ itemName = "intricate demon presence scroll", clientId = 51728, buy = intricatePrice },
	{ itemName = "intricate dragon hide scroll", clientId = 51729, buy = intricatePrice },
	{ itemName = "intricate electrify scroll", clientId = 51730, buy = intricatePrice },
	{ itemName = "intricate epiphany scroll", clientId = 51731, buy = intricatePrice },
	{ itemName = "intricate featherweight scroll", clientId = 51732, buy = intricatePrice },
	{ itemName = "intricate frost scroll", clientId = 51733, buy = intricatePrice },
	{ itemName = "intricate lich shroud scroll", clientId = 51734, buy = intricatePrice },
	{ itemName = "intricate precision scroll", clientId = 51735, buy = intricatePrice },
	{ itemName = "intricate punch scroll", clientId = 51736, buy = intricatePrice },
	{ itemName = "intricate quara scale scroll", clientId = 51737, buy = intricatePrice },
	{ itemName = "intricate reap scroll", clientId = 51738, buy = intricatePrice },
	{ itemName = "intricate scorch scroll", clientId = 51739, buy = intricatePrice },
	{ itemName = "intricate slash scroll", clientId = 51740, buy = intricatePrice },
	{ itemName = "intricate snake skin scroll", clientId = 51741, buy = intricatePrice },
	{ itemName = "intricate strike scroll", clientId = 51742, buy = intricatePrice },
	{ itemName = "intricate swiftness scroll", clientId = 51743, buy = intricatePrice },
	{ itemName = "intricate vampirism scroll", clientId = 51744, buy = intricatePrice },
	{ itemName = "intricate venom scroll", clientId = 51745, buy = intricatePrice },
	{ itemName = "intricate vibrancy scroll", clientId = 51746, buy = intricatePrice },
	{ itemName = "intricate void scroll", clientId = 51747, buy = intricatePrice },
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)

local freeLootPouch = CreatureEvent("FreeLootPouch")

local function hasLootPouch(inbox)
	for _, item in ipairs(inbox:getItems(true)) do
		if item:getId() == ITEM_GOLD_POUCH then
			return true
		end
	end
	return false
end

function freeLootPouch.onLogin(player)
	local inbox = player:getStoreInbox()
	if not inbox or hasLootPouch(inbox) then
		return true
	end

	if #inbox:getItems() >= inbox:getMaxCapacity() then
		player:sendTextMessage(MESSAGE_LOGIN, "Your free loot pouch is waiting, but your Store Inbox is full.")
		return true
	end

	local pouch = inbox:addItem(ITEM_GOLD_POUCH, 1)
	if pouch then
		pouch:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
		player:sendTextMessage(MESSAGE_LOGIN, "A free loot pouch has been added to your Store Inbox.")
	end

	return true
end

freeLootPouch:register()

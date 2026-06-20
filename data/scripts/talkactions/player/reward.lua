local config = {
	items = {
		{ id = 35285, charges = 14400 }, -- lasting exercise sword
		{ id = 35286, charges = 14400 }, -- lasting exercise axe
		{ id = 35287, charges = 14400 }, -- lasting exercise club
		{ id = 35288, charges = 14400 }, -- lasting exercise bow
		{ id = 35289, charges = 14400 }, -- lasting exercise rod
		{ id = 35290, charges = 14400 }, -- lasting exercise wand
		{ id = 44067, charges = 14400 }, -- lasting exercise shield
		{ id = 50295, charges = 14400 }, -- lasting exercise wraps
	},
	storage = tonumber(Storage.PlayerWeaponReward), -- storage key, player can only win once
}

local function sendExerciseRewardModal(player)
	local window = ModalWindow({
		title = "Exercise Reward",
		message = "Choose your exercise weapon.",
	})
	for _, it in pairs(config.items) do
		local iType = ItemType(it.id)
		if iType then
			window:addChoice(iType:getName(), function(player, button, choice)
				if button.name ~= "Select" then
					return true
				end

				local inbox = player:getStoreInbox()
				if not inbox then
					player:sendTextMessage(MESSAGE_LOOK, "Your store inbox is unavailable.")
					return true
				end

				local inboxItems = inbox:getItems()
				if #inboxItems < inbox:getMaxCapacity() then
					local item = inbox:addItem(it.id, it.charges)
					if item then
						item:setActionId(IMMOVABLE_ACTION_ID)
						item:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
						item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format("You won this exercise weapon as a reward to be a %s player. Use it in a dummy!\nHave a nice game..", configManager.getString(configKeys.SERVER_NAME)))
					else
						player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
						return
					end
					player:sendTextMessage(MESSAGE_LOOK, string.format("Congratulations, you received a %s with %i charges in your store inbox.", iType:getName(), it.charges))
					player:setStorageValue(config.storage, 1)
				else
					player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
				end
			end)
		end
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

local exerciseRewardModal = TalkAction("!reward")
function exerciseRewardModal.onSay(player, words, param)
	if not configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) then
		return true
	end
	if player:getStorageValue(config.storage) > 0 then
		player:sendTextMessage(MESSAGE_LOOK, "You already received your exercise weapon reward!")
		return true
	end
	sendExerciseRewardModal(player)
	return true
end

exerciseRewardModal:separator(" ")
exerciseRewardModal:groupType("normal")
exerciseRewardModal:setDescription("- claims your one-time exercise weapon reward.")
exerciseRewardModal:register()

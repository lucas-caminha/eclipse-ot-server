local fps = TalkAction("!fps")

function fps.onSay(player, words, param)
	if player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
		player:sendCancelMessage("You cannot use this command while in fight.")
		return true
	end

	if player:getSkull() == SKULL_WHITE then
		player:sendCancelMessage("You cannot use this command while having a white skull.")
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Reconnecting your character to refresh the client.")
	player:remove()
	return true
end

fps:setDescription("- safely reconnects your character when the client FPS feels stuck.")
fps:groupType("normal")
fps:register()

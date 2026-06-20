local bossesInfo = TalkAction("!bosses")

function bossesInfo.onSay(player, words, param)
	local text = "Eclipse OT Boss Progression\n\n"
		.. "Boss tiers and the custom teleport room are being prepared for the Eclipse progression plan.\n\n"
		.. "Current useful commands:\n"
		.. "!serverinfo - server rules and PvP limits.\n"
		.. "!rates - current staged rates.\n"
		.. "!rewards - level reward milestones.\n\n"
		.. "Future boss rooms will show level requirements, cooldowns, rewards and access messages."

	player:showTextDialog(639, text)
	return true
end

bossesInfo:setDescription("- shows boss progression information.")
bossesInfo:groupType("normal")
bossesInfo:register()

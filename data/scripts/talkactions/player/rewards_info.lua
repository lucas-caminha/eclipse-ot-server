local rewardsInfo = TalkAction("!rewards")

function rewardsInfo.onSay(player, words, param)
	local text = "Eclipse OT Level Rewards\n\n"
		.. "New characters start at level 20 with a stronger vocation kit.\n\n"
		.. "Vocation gear milestones:\n"
		.. "Sorcerer/Druid: levels 40, 50, 60, 75, 80, 100, 130, 150, 180 and 200.\n"
		.. "Paladin: levels 50, 60, 80, 100, 120, 150, 180 and 200.\n"
		.. "Knight: levels 40, 50, 75, 80, 100, 130, 150, 180 and 200.\n"
		.. "Monk: levels 40, 50, 70, 80, 100, 125, 135, 150, 180 and 200.\n\n"
		.. "Common milestones:\n"
		.. "Level 50: 5 crystal coins and Donkey mount.\n"
		.. "Level 100: 10 crystal coins and Citizen outfit.\n"
		.. "Level 150: 15 crystal coins.\n"
		.. "Level 200: 20 crystal coins and Armoured War Horse mount.\n"
		.. "Level 250: powerful vampirism scroll and vocation outfit.\n"
		.. "Level 275: powerful strike scroll and 27 crystal coins.\n"
		.. "Level 300: powerful void scroll and 30 crystal coins.\n"
		.. "Level 350: vocation Umbral reward.\n\n"
		.. "Item rewards are delivered to your Store Inbox. Keep free slots available."

	player:showTextDialog(639, text)
	return true
end

rewardsInfo:setDescription("- shows level milestone rewards.")
rewardsInfo:groupType("normal")
rewardsInfo:register()

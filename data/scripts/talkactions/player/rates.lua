local rates = TalkAction("!rates")

function rates.onSay(player, words, param)
	local text
	if configManager.getBoolean(configKeys.RATE_USE_STAGES) then
		local skillRate = configManager.getNumber(configKeys.RATE_SKILL)
		text = "Eclipse OT Rates\n\n"
			.. "Experience: "
			.. getRateFromTable(experienceStages, player:getLevel(), expstagesrate)
			.. "x\n"
			.. "Magic level: "
			.. getRateFromTable(magicLevelStages, player:getBaseMagicLevel(), configManager.getNumber(configKeys.RATE_MAGIC))
			.. "x\n"
			.. "Sword: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_SWORD), skillRate)
			.. "x\n"
			.. "Axe: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_AXE), skillRate)
			.. "x\n"
			.. "Club: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_CLUB), skillRate)
			.. "x\n"
			.. "Distance: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_DISTANCE), skillRate)
			.. "x\n"
			.. "Shielding: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_SHIELD), skillRate)
			.. "x\n"
			.. "Fist: "
			.. getRateFromTable(skillsStages, player:getSkillLevel(SKILL_FIST), skillRate)
			.. "x"
	else
		text = "Eclipse OT Rates\n\n"
			.. "Experience: "
			.. configManager.getNumber(configKeys.RATE_EXPERIENCE)
			.. "x\nSkill: "
			.. configManager.getNumber(configKeys.RATE_SKILL)
			.. "x\nMagic: "
			.. configManager.getNumber(configKeys.RATE_MAGIC)
			.. "x"
	end

	text = text
		.. "\n\nLoot: "
		.. configManager.getNumber(configKeys.RATE_LOOT)
		.. "x\nSpawn: "
		.. configManager.getNumber(configKeys.RATE_SPAWN)
		.. "x"

	player:showTextDialog(34266, text)
	return true
end

rates:setDescription("- shows your current staged rates.")
rates:groupType("normal")
rates:register()

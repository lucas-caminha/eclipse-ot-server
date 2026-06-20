local frags = TalkAction("!frags")

local function formatSkullTime(seconds)
	if seconds <= 0 then
		return "none"
	end

	local hours = math.floor(seconds / 3600)
	seconds = seconds % 3600
	local minutes = math.floor(seconds / 60)
	seconds = seconds % 60

	local parts = {}
	if hours > 0 then
		parts[#parts + 1] = hours .. "h"
	end
	if minutes > 0 then
		parts[#parts + 1] = minutes .. "m"
	end
	if seconds > 0 or #parts == 0 then
		parts[#parts + 1] = seconds .. "s"
	end

	return table.concat(parts, " ")
end

function frags.onSay(player, words, param)
	local kills = player:getKills()
	local total = 0
	if kills then
		for _, fragData in pairs(kills) do
			if fragData[1] then
				total = total + 1
			end
		end
	end

	local text = "PvP Frags\n\n"
		.. "Unjustified kills: "
		.. total
		.. "\nSkull time: "
		.. formatSkullTime(math.floor(player:getSkullTime() / 1000))
		.. "\n\nRed skull limits:\n"
		.. "Daily: "
		.. configManager.getNumber(configKeys.DAY_KILLS_TO_RED)
		.. "\nWeekly: "
		.. configManager.getNumber(configKeys.WEEK_KILLS_TO_RED)
		.. "\nMonthly: "
		.. configManager.getNumber(configKeys.MONTH_KILLS_TO_RED)

	player:showTextDialog(3057, text)
	return true
end

frags:setDescription("- shows your PvP frag status.")
frags:groupType("normal")
frags:register()

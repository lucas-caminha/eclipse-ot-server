local uptime = TalkAction("!uptime")
local serverStartTime = os.time()

local function formatDuration(seconds)
	local days = math.floor(seconds / 86400)
	seconds = seconds % 86400
	local hours = math.floor(seconds / 3600)
	seconds = seconds % 3600
	local minutes = math.floor(seconds / 60)
	seconds = seconds % 60

	local parts = {}
	if days > 0 then
		parts[#parts + 1] = days .. "d"
	end
	if hours > 0 then
		parts[#parts + 1] = hours .. "h"
	end
	if minutes > 0 then
		parts[#parts + 1] = minutes .. "m"
	end
	parts[#parts + 1] = seconds .. "s"

	return table.concat(parts, " ")
end

function uptime.onSay(player, words, param)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server uptime: " .. formatDuration(os.time() - serverStartTime) .. ".")
	return true
end

uptime:setDescription("- shows how long the server has been online.")
uptime:groupType("normal")
uptime:register()

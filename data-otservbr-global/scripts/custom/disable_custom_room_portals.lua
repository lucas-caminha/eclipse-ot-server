local disabledCustomRoomPortals = {
	{
		name = "Trainers room",
		position = Position(32365, 32236, 7),
		itemId = 10145,
	},
	{
		name = "Event room",
		position = Position(32373, 32236, 7),
		itemId = 10145,
	},
}

local disableCustomRoomPortals = GlobalEvent("DisableCustomRoomPortals")

function disableCustomRoomPortals.onStartup()
	for _, portal in ipairs(disabledCustomRoomPortals) do
		local tile = Tile(portal.position)
		if tile then
			local item = tile:getItemById(portal.itemId)
			if item then
				item:remove()
				logger.info("Disabled {} portal at {}", portal.name, portal.position:toString())
			end
		end
	end

	return true
end

disableCustomRoomPortals:register()

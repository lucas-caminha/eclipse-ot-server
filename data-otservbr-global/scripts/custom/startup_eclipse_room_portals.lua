local eclipseRoomPortals = GlobalEvent("EclipseRoomPortals")

local portals = {
	{ position = Position(1045, 1034, 7), itemId = 1949 },
	{ position = Position(32365, 32236, 7), itemId = 25778 },
	{ position = Position(32373, 32236, 7), itemId = 1949 },
	{ position = Position(32313, 32260, 15), itemId = 1949 },
}

function eclipseRoomPortals.onStartup()
	for _, portal in pairs(portals) do
		local tile = Tile(portal.position)
		if not tile then
			logger.warn("[EclipseRoomPortals] Missing tile at {},{},{}", portal.position.x, portal.position.y, portal.position.z)
		elseif not tile:getItemById(portal.itemId) then
			Game.createItem(portal.itemId, 1, portal.position)
		end
	end
	return true
end

eclipseRoomPortals:register()

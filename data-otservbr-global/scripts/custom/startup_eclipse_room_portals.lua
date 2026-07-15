local eclipseRoomPortals = GlobalEvent("EclipseRoomPortals")

local portals = {
	{ name = "Eclipse room exit to Thais temple", position = Position(1045, 1034, 7), itemId = 1949 },
	{ name = "Thais temple entrance to Eclipse room", position = Position(32365, 32236, 7), itemId = 25778 },
	{ name = "Boss room entrance", position = Position(32373, 32236, 7), itemId = 28673 },
	{ name = "Boss room exit", position = Position(32313, 32260, 15), itemId = 28673 },
	{ name = "Grand Master Oberon boss entrance", position = Position(32316, 32257, 15), itemId = 28673 },
	{ name = "Drume boss entrance", position = Position(32319, 32257, 15), itemId = 28673 },
}

function eclipseRoomPortals.onStartup()
	for _, portal in pairs(portals) do
		local tile = Tile(portal.position)
		if not tile then
			logger.warn("[EclipseRoomPortals] Missing tile for {} at {},{},{}", portal.name, portal.position.x, portal.position.y, portal.position.z)
		elseif not tile:getItemById(portal.itemId) then
			Game.createItem(portal.itemId, 1, portal.position)
		end
	end
	return true
end

eclipseRoomPortals:register()

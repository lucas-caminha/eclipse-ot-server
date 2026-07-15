local eclipseRoomTeleports = MoveEvent()

local destinations = {
	-- Eclipse room exit to Thais temple.
	["1045:1034:7"] = Position(32369, 32241, 7),
	-- Thais temple entrance to Eclipse room.
	["32365:32236:7"] = Position(1045, 1037, 7),
	-- Boss room entrance.
	["32373:32236:7"] = Position(32317, 32258, 15),
	-- Boss room exit.
	["32313:32260:15"] = Position(32369, 32241, 7),
	-- Dawnport start portal to Eclipse room.
	["32068:31898:6"] = Position(1045, 1037, 7),
}

local positions = {
	Position(1045, 1034, 7),
	Position(32365, 32236, 7),
	Position(32373, 32236, 7),
	Position(32313, 32260, 15),
	Position(32068, 31898, 6),
}

local function getPositionKey(position)
	return string.format("%d:%d:%d", position.x, position.y, position.z)
end

function eclipseRoomTeleports.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local destination = destinations[getPositionKey(position)]
	if not destination then
		return true
	end

	player:teleportTo(destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

for _, position in pairs(positions) do
	eclipseRoomTeleports:position(position)
end

eclipseRoomTeleports:register()

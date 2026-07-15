local eclipseRoomTeleports = MoveEvent()

local teleports = {
	{ name = "Eclipse room exit to Thais temple", from = Position(1045, 1034, 7), to = Position(32369, 32241, 7) },
	{ name = "Thais temple entrance to Eclipse room", from = Position(32365, 32236, 7), to = Position(1045, 1037, 7) },
	{ name = "Boss room entrance", from = Position(32373, 32236, 7), to = Position(32317, 32258, 15) },
	{ name = "Boss room exit", from = Position(32313, 32260, 15), to = Position(32369, 32241, 7) },
	{ name = "Dawnport start portal to Eclipse room", from = Position(32068, 31898, 6), to = Position(1045, 1037, 7) },
	{ name = "Grand Master Oberon boss entrance", from = Position(32316, 32257, 15), to = Position(33362, 31339, 7) },
	{ name = "Grand Master Oberon boss exit", from = Position(33361, 31338, 7), to = Position(32315, 32260, 15) },
	{ name = "Drume boss entrance", from = Position(32319, 32257, 15), to = Position(32427, 32443, 7) },
	{ name = "Drume boss exit", from = Position(32428, 32442, 7), to = Position(32315, 32260, 15) },
}

local function getPositionKey(position)
	return string.format("%d:%d:%d", position.x, position.y, position.z)
end

local destinations = {}
for _, teleport in pairs(teleports) do
	destinations[getPositionKey(teleport.from)] = teleport.to
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

for _, teleport in pairs(teleports) do
	eclipseRoomTeleports:position(teleport.from)
end

eclipseRoomTeleports:register()

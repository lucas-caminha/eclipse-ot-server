local trainerRoomArea = {
	from = { x = 1141, y = 1038, z = 4 },
	to = { x = 1181, y = 1058, z = 9 },
}

local trainerRoomTeleportItemIds = {
	1949, -- magic forcefield
	28673, -- vortex
}

local function isInTrainerRoom(position)
	return position.x >= trainerRoomArea.from.x and position.x <= trainerRoomArea.to.x
		and position.y >= trainerRoomArea.from.y and position.y <= trainerRoomArea.to.y
		and position.z >= trainerRoomArea.from.z and position.z <= trainerRoomArea.to.z
end

local function teleportToTemple(creature)
	if not creature:isPlayer() then
		return true
	end

	local templePosition = creature:getTown():getTemplePosition()
	creature:teleportTo(templePosition)
	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end

local trainerExit = MoveEvent()
function trainerExit.onStepIn(creature, item, position, fromPosition)
	teleportToTemple(creature)
	return true
end

local positions = {
	{ x = 991, y = 1031, z = 7 },
	{ x = 1057, y = 1023, z = 7 },
}
for index, position in pairs(positions) do
	trainerExit:position(position)
end

trainerExit:aid(40015)
trainerExit:aid(4255)
trainerExit:register()

local trainerRoomTeleports = MoveEvent()
function trainerRoomTeleports.onStepIn(creature, item, position, fromPosition)
	if not isInTrainerRoom(position) then
		return true
	end

	teleportToTemple(creature)
	return true
end

for _, itemId in ipairs(trainerRoomTeleportItemIds) do
	trainerRoomTeleports:id(itemId)
end

trainerRoomTeleports:register()

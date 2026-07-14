local vial_remove = TalkAction("!vial")

local flask_ids = {283, 284, 285}
local exaust_storage_key = 545484
local exaust_time = 5 -- seconds

function vial_remove.onSay(player, words, param)
    if player:getStorageValue(exaust_storage_key) > os.time() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait to use this command again")
        return true
    end
    local removed_count = 0

    for _, id in pairs(flask_ids) do
        local count = player:getItemCount(id) or 0
        if count > 0 then
            player:removeItem(id, count)
            removed_count = removed_count + count
        end
    end

    if removed_count > 0 then
        player:sendTextMessage(MESSAGE_LOOK, string.format("%s empty flasks removed from your items", removed_count))
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No empty flasks to remove.")
    end

    player:setStorageValue(exaust_storage_key, os.time() + exaust_time)
    return true
end

vial_remove:separator(" ")
vial_remove:groupType("normal")
vial_remove:register()

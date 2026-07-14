local party = TalkAction("!shareparty")

function party.onSay(player, words, param)
    local party = player:getParty()
    if not party then
        player:sendCancelMessage("You are not part of a party.")
        return true
    end

    if party:getLeader() ~= player then
        player:sendCancelMessage("You are not the leader of the party.")
        return true
    end

    if party:isSharedExperienceActive() then
        player:sendCancelMessage("Party share is already activated.")
        return true
    end

    party:setSharedExperience(true)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Party shared experience has been enabled.")

    return true
end
party:groupType("normal")
party:register()

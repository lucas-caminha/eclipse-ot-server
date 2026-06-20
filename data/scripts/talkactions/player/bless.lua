local bless = TalkAction("!bless")

function bless.onSay(player, words, param)
	Blessings.BuyAllBlesses(player)
	return true
end

bless:groupType("normal")
bless:setDescription("- buys all available blessings.")
bless:register()

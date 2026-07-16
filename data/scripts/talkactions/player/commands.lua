local commandDescriptions = {
	["!addondoll"] = {
		en = "opens the addon doll selection window.",
		pt = "abre a janela de escolha do addon doll.",
	},
	["!aol"] = {
		en = "buys an amulet of loss using bank balance.",
		pt = "compra um amulet of loss usando o saldo do banco.",
	},
	["!autoloot"] = {
		en = "manages your auto loot list.",
		pt = "gerencia sua lista de auto loot.",
	},
	["!balance"] = {
		en = "shows your bank balance.",
		pt = "mostra o saldo do seu banco.",
	},
	["!bless"] = {
		en = "buys all available blessings.",
		pt = "compra todas as blessings disponiveis.",
	},
	["!bosses"] = {
		en = "shows boss progression information.",
		pt = "mostra informacoes de progresso dos bosses.",
	},
	["!buyhouse"] = {
		en = "buys the house in front of your character.",
		pt = "compra a house em frente ao seu personagem.",
	},
	["!commands"] = {
		en = "shows this command list in English.",
		pt = "mostra esta lista de comandos em ingles.",
	},
	["!comandos"] = {
		en = "shows this command list in Portuguese.",
		pt = "mostra esta lista de comandos em portugues.",
	},
	["!deposit"] = {
		en = "deposits money into your bank account.",
		pt = "deposita dinheiro na sua conta do banco.",
	},
	["!emote"] = {
		en = "toggles spell emotes.",
		pt = "ativa ou desativa emotes de magia.",
	},
	["!flask"] = {
		en = "toggles empty flask collection.",
		pt = "ativa ou desativa a coleta de frascos vazios.",
	},
	["!fps"] = {
		en = "safely reconnects your character when the client FPS feels stuck.",
		pt = "reconecta seu personagem com seguranca quando o FPS do client travar.",
	},
	["!frags"] = {
		en = "shows your PvP frag status.",
		pt = "mostra seu status de frags PvP.",
	},
	["!hiddenshop"] = {
		en = "opens the hidden item sell shop.",
		pt = "abre a loja oculta de venda de itens.",
	},
	["!leavehouse"] = {
		en = "leaves your current house.",
		pt = "abandona sua house atual.",
	},
	["!livestream"] = {
		en = "manages livestream status.",
		pt = "gerencia o status de livestream.",
	},
	["!mountsdoll"] = {
		en = "opens the mount doll selection window.",
		pt = "abre a janela de escolha do mount doll.",
	},
	["!online"] = {
		en = "shows online players grouped by activity.",
		pt = "mostra jogadores online agrupados por atividade.",
	},
	["!pz"] = {
		en = "shows your protection zone lock time.",
		pt = "mostra o tempo restante do seu pz lock.",
	},
	["!rates"] = {
		en = "shows your current staged rates.",
		pt = "mostra suas rates atuais por estagio.",
	},
	["!refill"] = {
		en = "refills supported charge items using silver tokens.",
		pt = "recarrega itens suportados usando silver tokens.",
	},
	["!reward"] = {
		en = "claims your one-time exercise weapon reward.",
		pt = "resgata sua recompensa unica de exercise weapon.",
	},
	["!rewards"] = {
		en = "shows level milestone rewards.",
		pt = "mostra as recompensas por marco de level.",
	},
	["!sellhouse"] = {
		en = "starts a house sale transfer.",
		pt = "inicia a transferencia de venda de uma house.",
	},
	["!serverinfo"] = {
		en = "shows server rates, PvP rules and server save.",
		pt = "mostra rates do servidor, regras PvP e server save.",
	},
	["!shareparty"] = {
		en = "toggles shared party experience.",
		pt = "ativa ou desativa a experiencia compartilhada da party.",
	},
	["!time"] = {
		en = "shows Tibia time.",
		pt = "mostra o horario do Tibia.",
	},
	["!transfer"] = {
		en = "transfers money from your bank account.",
		pt = "transfere dinheiro da sua conta do banco.",
	},
	["!uptime"] = {
		en = "shows how long the server has been online.",
		pt = "mostra ha quanto tempo o servidor esta online.",
	},
	["!vial"] = {
		en = "removes empty vials from your inventory.",
		pt = "remove vials vazios do seu inventario.",
	},
	["!vip"] = {
		en = "shows your VIP status.",
		pt = "mostra seu status VIP.",
	},
	["!checkvip"] = {
		en = "shows your VIP status.",
		pt = "mostra seu status VIP.",
	},
	["!withdraw"] = {
		en = "withdraws money from your bank account.",
		pt = "saca dinheiro da sua conta do banco.",
	},
}

local groupTitles = {
	en = {
		[1] = "Player commands",
		[2] = "Tutor commands",
		[3] = "Gamemaster commands",
		[4] = "God commands",
	},
	pt = {
		[1] = "Comandos de jogador",
		[2] = "Comandos de tutor",
		[3] = "Comandos de gamemaster",
		[4] = "Comandos de administrador",
	},
}

local headerByLanguage = {
	en = "Available commands",
	pt = "Comandos disponiveis",
}

local footerByLanguage = {
	en = "Tip: use !comandos to see this list in Portuguese.",
	pt = "Dica: use !commands para ver esta lista em ingles.",
}

local function trimDescription(description)
	if description == nil or description == "" then
		return ""
	end

	description = description:gsub("^%s*%-?%s*", "")
	return description:gsub("%s+$", "")
end

local function getDescription(talkaction, language)
	local name = talkaction:getName()
	local customDescription = commandDescriptions[name]
	if customDescription ~= nil then
		return customDescription[language] or customDescription.en or ""
	end

	return trimDescription(talkaction:getDescription())
end

local function getVisibleCommands(player, language)
	local visibleCommands = {}
	local allTalkActions = Game.getTalkActions()
	local playerGroupId = player:getGroup():getId()

	for _, talkaction in pairs(allTalkActions) do
		local groupType = talkaction:getGroupType()
		if groupType ~= 0 and groupType <= playerGroupId then
			local name = talkaction:getName()
			if name ~= nil and name ~= "" then
				visibleCommands[#visibleCommands + 1] = {
					name = name,
					description = getDescription(talkaction, language),
					groupType = groupType,
				}
			end
		end
	end

	table.sort(visibleCommands, function(left, right)
		if left.groupType == right.groupType then
			return left.name < right.name
		end

		return left.groupType < right.groupType
	end)

	return visibleCommands
end

local function buildCommandText(player, language)
	local text = headerByLanguage[language] .. "\n\n"
	local lastGroupType = nil

	for _, command in ipairs(getVisibleCommands(player, language)) do
		if command.groupType ~= lastGroupType then
			if lastGroupType ~= nil then
				text = text .. "\n"
			end

			local title = groupTitles[language][command.groupType] or groupTitles.en[command.groupType] or "Commands"
			text = text .. title .. ":\n"
			lastGroupType = command.groupType
		end

		text = text .. command.name
		if command.description ~= "" then
			text = text .. " - " .. command.description
		end
		text = text .. "\n"
	end

	return text .. "\n" .. footerByLanguage[language]
end

local function showCommands(player, language)
	player:showTextDialog(639, buildCommandText(player, language))
	return true
end

local commands = TalkAction("!commands")

function commands.onSay(player, words, param)
	return showCommands(player, "en")
end

commands:setDescription("- shows the available commands.")
commands:groupType("normal")
commands:register()

local comandos = TalkAction("!comandos")

function comandos.onSay(player, words, param)
	return showCommands(player, "pt")
end

comandos:setDescription("- mostra os comandos disponiveis.")
comandos:groupType("normal")
comandos:register()

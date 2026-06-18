function onUpdateDatabase()
	logger.info("Updating database to version 59 (configure Eclipse starting characters)")

	if
		not db.query([[
		UPDATE `players`
		SET
			`level` = 20,
			`experience` = 98800,
			`vocation` = CASE `id`
				WHEN 2 THEN 5
				WHEN 3 THEN 6
				WHEN 4 THEN 7
				WHEN 5 THEN 8
				WHEN 6 THEN 10
				ELSE `vocation`
			END,
			`health` = CASE `id`
				WHEN 2 THEN 245
				WHEN 3 THEN 245
				WHEN 4 THEN 305
				WHEN 5 THEN 365
				WHEN 6 THEN 305
				ELSE `health`
			END,
			`healthmax` = CASE `id`
				WHEN 2 THEN 245
				WHEN 3 THEN 245
				WHEN 4 THEN 305
				WHEN 5 THEN 365
				WHEN 6 THEN 305
				ELSE `healthmax`
			END,
			`mana` = CASE `id`
				WHEN 2 THEN 450
				WHEN 3 THEN 450
				WHEN 4 THEN 270
				WHEN 5 THEN 150
				WHEN 6 THEN 210
				ELSE `mana`
			END,
			`manamax` = CASE `id`
				WHEN 2 THEN 450
				WHEN 3 THEN 450
				WHEN 4 THEN 270
				WHEN 5 THEN 150
				WHEN 6 THEN 210
				ELSE `manamax`
			END,
			`cap` = CASE `id`
				WHEN 2 THEN 590
				WHEN 3 THEN 590
				WHEN 4 THEN 710
				WHEN 5 THEN 770
				WHEN 6 THEN 770
				ELSE `cap`
			END,
			`town_id` = 8,
			`posx` = 32369,
			`posy` = 32241,
			`posz` = 7
		WHERE `id` BETWEEN 2 AND 6;
	]])
	then
		logger.error("Failed to update promoted sample characters.")
		return false
	end

	if
		not db.query([[
		UPDATE `players`
		SET
			`level` = 20,
			`experience` = 98800,
			`health` = 245,
			`healthmax` = 245,
			`mana` = 150,
			`manamax` = 150,
			`cap` = 590,
			`town_id` = 8,
			`posx` = 32369,
			`posy` = 32241,
			`posz` = 7
		WHERE `id` = 1;
	]])
	then
		logger.error("Failed to update rook sample character.")
		return false
	end

	if
		not db.query([[
		UPDATE `players`
		SET
			`vocation` = CASE `vocation`
				WHEN 1 THEN 5
				WHEN 2 THEN 6
				WHEN 3 THEN 7
				WHEN 4 THEN 8
				WHEN 9 THEN 10
				ELSE `vocation`
			END,
			`town_id` = 8,
			`posx` = 32369,
			`posy` = 32241,
			`posz` = 7
		WHERE `id` > 7
			AND `group_id` = 1
			AND `vocation` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
			AND (
				`town_id` IN (1, 2)
				OR (`posx` = 32069 AND `posy` = 31901 AND `posz` = 6)
				OR (`posx` = 0 AND `posy` = 0 AND `posz` = 0)
				OR (`posx` BETWEEN 32000 AND 32100 AND `posy` BETWEEN 31800 AND 32000 AND `posz` BETWEEN 5 AND 7)
			);
	]])
	then
		logger.error("Failed to move Dawnport starting characters to Thais.")
		return false
	end

	if
		not db.query([[
		INSERT INTO `kv_store` (`key_name`, `timestamp`, `value`)
		SELECT CONCAT('player.', `id`, '.promoted'), UNIX_TIMESTAMP() * 1000, 0x3001
		FROM `players`
		WHERE `vocation` IN (5, 6, 7, 8, 10)
		ON DUPLICATE KEY UPDATE
			`timestamp` = VALUES(`timestamp`),
			`value` = VALUES(`value`);
	]])
	then
		logger.error("Failed to mark promoted characters in kv_store.")
		return false
	end

	if db.tableExists("myaac_settings") then
		local setting = db.storeQuery("SELECT `id` FROM `myaac_settings` WHERE `name` = 'character_towns' LIMIT 1;")
		local query
		if setting then
			Result.free(setting)
			query = "UPDATE `myaac_settings` SET `key` = '0', `value` = '8' WHERE `name` = 'character_towns';"
		else
			query = "INSERT INTO `myaac_settings` (`name`, `key`, `value`) VALUES ('character_towns', '0', '8');"
		end

		if not db.query(query) then
			logger.error("Failed to update MyAAC character_towns setting.")
			return false
		end
	end

	return true
end

function onUpdateDatabase()
	logger.info("Updating database to version 61 (align Eclipse starting skills)")

	if
		not db.query([[
		UPDATE `players`
		SET
			`maglevel` = CASE `name`
				WHEN 'Sorcerer Sample' THEN 70
				WHEN 'Druid Sample' THEN 70
				ELSE `maglevel`
			END,
			`manaspent` = CASE `name`
				WHEN 'Sorcerer Sample' THEN 0
				WHEN 'Druid Sample' THEN 0
				ELSE `manaspent`
			END,
			`skill_fist` = CASE `name`
				WHEN 'Monk Sample' THEN 80
				ELSE `skill_fist`
			END,
			`skill_fist_tries` = CASE `name`
				WHEN 'Monk Sample' THEN 0
				ELSE `skill_fist_tries`
			END,
			`skill_club` = CASE `name`
				WHEN 'Knight Sample' THEN 80
				ELSE `skill_club`
			END,
			`skill_club_tries` = CASE `name`
				WHEN 'Knight Sample' THEN 0
				ELSE `skill_club_tries`
			END,
			`skill_sword` = CASE `name`
				WHEN 'Knight Sample' THEN 80
				ELSE `skill_sword`
			END,
			`skill_sword_tries` = CASE `name`
				WHEN 'Knight Sample' THEN 0
				ELSE `skill_sword_tries`
			END,
			`skill_axe` = CASE `name`
				WHEN 'Knight Sample' THEN 80
				ELSE `skill_axe`
			END,
			`skill_axe_tries` = CASE `name`
				WHEN 'Knight Sample' THEN 0
				ELSE `skill_axe_tries`
			END,
			`skill_dist` = CASE `name`
				WHEN 'Paladin Sample' THEN 80
				ELSE `skill_dist`
			END,
			`skill_dist_tries` = CASE `name`
				WHEN 'Paladin Sample' THEN 0
				ELSE `skill_dist_tries`
			END,
			`skill_shielding` = CASE `name`
				WHEN 'Paladin Sample' THEN 80
				WHEN 'Knight Sample' THEN 90
				WHEN 'Monk Sample' THEN 60
				WHEN 'Sorcerer Sample' THEN 35
				WHEN 'Druid Sample' THEN 35
				ELSE `skill_shielding`
			END,
			`skill_shielding_tries` = CASE `name`
				WHEN 'Paladin Sample' THEN 0
				WHEN 'Knight Sample' THEN 0
				WHEN 'Monk Sample' THEN 0
				WHEN 'Sorcerer Sample' THEN 0
				WHEN 'Druid Sample' THEN 0
				ELSE `skill_shielding_tries`
			END
		WHERE `name` IN ('Sorcerer Sample', 'Druid Sample', 'Paladin Sample', 'Knight Sample', 'Monk Sample');
	]])
	then
		logger.error("Failed to align Eclipse sample character starting skills.")
		return false
	end

	if db.tableExists("myaac_settings") then
		if
			not db.query([[
			DELETE FROM `myaac_settings`
			WHERE (`name` = 'core' AND `key` = 'use_character_sample_skills')
			   OR (`name` = 'use_character_sample_skills' AND `key` = '');
		]])
		then
			logger.error("Failed to remove duplicate MyAAC sample skill settings.")
			return false
		end

		if
			not db.query([[
			INSERT INTO `myaac_settings` (`name`, `key`, `value`)
			VALUES ('core', 'use_character_sample_skills', '1');
		]])
		then
			logger.error("Failed to enable MyAAC sample skill copying.")
			return false
		end
	end

	if db.tableExists("myaac_config") then
		if
			not db.query([[
			INSERT INTO `myaac_config` (`name`, `value`)
			VALUES ('core.use_character_sample_skills', '1')
			ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
		]])
		then
			logger.error("Failed to enable legacy MyAAC sample skill copying.")
			return false
		end
	end

	return true
end

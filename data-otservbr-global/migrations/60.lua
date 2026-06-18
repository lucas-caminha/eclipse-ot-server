function onUpdateDatabase()
	logger.info("Updating database to version 60 (configure Eclipse starting skills)")

	if
		not db.query([[
		UPDATE `players`
		SET
			`maglevel` = CASE `id`
				WHEN 2 THEN 80
				WHEN 3 THEN 80
				WHEN 4 THEN 25
				WHEN 5 THEN 0
				WHEN 6 THEN 0
				ELSE `maglevel`
			END,
			`manaspent` = CASE `id`
				WHEN 2 THEN 0
				WHEN 3 THEN 0
				WHEN 4 THEN 0
				WHEN 5 THEN 0
				WHEN 6 THEN 0
				ELSE `manaspent`
			END,
			`skill_fist` = CASE `id`
				WHEN 6 THEN 80
				ELSE 10
			END,
			`skill_fist_tries` = 0,
			`skill_club` = CASE `id`
				WHEN 5 THEN 80
				ELSE 10
			END,
			`skill_club_tries` = 0,
			`skill_sword` = CASE `id`
				WHEN 5 THEN 80
				ELSE 10
			END,
			`skill_sword_tries` = 0,
			`skill_axe` = CASE `id`
				WHEN 5 THEN 80
				ELSE 10
			END,
			`skill_axe_tries` = 0,
			`skill_dist` = CASE `id`
				WHEN 4 THEN 80
				ELSE 10
			END,
			`skill_dist_tries` = 0,
			`skill_shielding` = CASE `id`
				WHEN 4 THEN 80
				WHEN 5 THEN 80
				WHEN 6 THEN 50
				ELSE 10
			END,
			`skill_shielding_tries` = 0
		WHERE `id` BETWEEN 2 AND 6;
	]])
	then
		logger.error("Failed to update sample character starting skills.")
		return false
	end

	return true
end

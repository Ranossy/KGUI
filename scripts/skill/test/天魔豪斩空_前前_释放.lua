function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1275)   --获得母技能 天魔豪斩空_前前 的等级
	player.CastSkill(1271,dwSkillLevel)
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
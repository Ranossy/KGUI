function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1589)   --获得母技能 梦泉虎跑 的等级
	player.CastSkill(1590,dwSkillLevel)
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
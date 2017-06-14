function Apply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
		nDamageLevel=player.GetSkillLevel(559)
		player.CastSkill(506,nDamageLevel)
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
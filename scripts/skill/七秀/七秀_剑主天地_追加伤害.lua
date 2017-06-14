function Apply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
		nDamageLevel=player.GetSkillLevel(562)
		player.CastSkill(507,nDamageLevel)
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
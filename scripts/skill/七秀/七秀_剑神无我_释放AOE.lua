function Apply(dwCharacterID)
		local player = GetPlayer(dwCharacterID)
		nDamageLevel=player.GetSkillLevel(559)
		player.CastSkill(506,nDamageLevel)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
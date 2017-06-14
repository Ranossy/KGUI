function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--if player.GetSkillLevel(5806) == 1 then
	if player.IsInMyGroupOrTeam(dwCharacterID) and not target.GetBuff(7913,1) and target.dwShapeShiftID == 0 then
		target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.02*2
		target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.1*2
	end
	--end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
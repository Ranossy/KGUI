
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nBuff = player.GetBuff(6375, 1)
	if not nBuff then
		return
	end
	if nBuff.nStackNum == 5 then
		if player.GetSkillLevel(6828) == 1 then
			--player.ClearCDTime(602)
			player.nCurrentMana = player.nMaxMana
		end
		if player.GetSkillLevel(6829) == 1 then
			--player.ClearCDTime(600)
			player.nCurrentLife = player.nMaxLife
		end
	end	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
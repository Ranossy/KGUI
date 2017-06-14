function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
--	player.nCurrentLife = player.nMaxLife 
	player.AddBuff(0, 99, 4969, 1)	--免控
	--player.AddBuff(0, 99, 7218, 1,172800)	--antiboss
	--player.SetDynamicSkillGroup(23)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	player.DelBuff(4969, 1)	--免控
	--player.DelBuff(7218,1)	--免控
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
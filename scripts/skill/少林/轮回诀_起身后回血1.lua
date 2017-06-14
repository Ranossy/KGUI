function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 	
		return
	end
	player.nCurrentLife = player.nMaxLife * 0.15
	player.nCurrentMana = player.nMaxMana * 0.15
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
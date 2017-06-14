
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 164 then
		if player.nCurrentLife < 4100 then
			player.nCurrentLife = player.nMaxLife
			player.DelBuff(5597, 1)
		else
			player.nCurrentLife = player.nCurrentLife - 4100
		end
	else
		if player.nCurrentLife < 5000 then
			player.nCurrentLife = player.nMaxLife
			player.DelBuff(5597, 1)
		elseif player.nCurrentLife < player.nMaxLife * 0.95 then
			player.nCurrentLife = player.nCurrentLife - 5000
		else
			player.nCurrentLife = player.nMaxLife * 0.5
		end
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
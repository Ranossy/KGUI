--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and IsPlayer(dwCharacterID) then
		player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.025
		local buff = player.GetBuff(2155, 1)
		if player.nCurrentMana  <= 10 and buff == nil then
			player.AddBuff(0, 99, 2155, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
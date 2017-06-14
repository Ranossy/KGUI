function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(5672, 1) then
		local num = player.GetBuff(5672, 1).nLeftActiveCount
		RemoteCallToClient(player.dwID, "OnActivityTipUpdate", 16, 0, {num - 1})
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
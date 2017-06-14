--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
		player.SetPosition(56148, 40356, 1053504)
		player.DelBuff(6584,1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
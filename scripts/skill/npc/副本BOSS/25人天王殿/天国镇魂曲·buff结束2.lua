--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("chiguo")
	if not npcBOSS then
		return
	end
	if player and IsPlayer(dwCharacterID) then
		player.AddBuff(npcBOSS.dwID, npcBOSS.nLevel, 2144, 3)
		player.AddBuff(0,99,4157,2)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
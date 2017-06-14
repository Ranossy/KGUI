--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("fuwang")
	if not npcBoss then
		return
	end
	if npcBoss.nCurrentLife < npcBoss.nMaxLife - 100000 then
		npcBoss.nCurrentLife = npcBoss.nCurrentLife + 100000
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
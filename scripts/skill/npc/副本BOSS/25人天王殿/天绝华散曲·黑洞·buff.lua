--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
		if scene then
			local npc = scene.GetNpcByNickName("boss")
			if npc then
				player.AddBuff(0, 99, 1946, 1)
				npc.CastSkill(1902, 1, TARGET.PLAYER, player.dwID)
			end
		end
	end
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
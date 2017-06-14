--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		local scene = npc.GetScene()
		if scene then
			local Lv = 1
			if scene.dwMapID == 118 then
				Lv = 2
			elseif scene.dwMapID == 119 then
				Lv = 3
			elseif scene.dwMapID == 117 then
				Lv = 4
			end
			local dwID = npc.GetCustomUnsigned4(10)
			local cPlayer = GetPlayer(dwID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				npc.CastSkill(2792, Lv, TARGET.PLAYER, cPlayer.dwID)
				npc.CastSkill(2793, Lv, TARGET.PLAYER, cPlayer.dwID)
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
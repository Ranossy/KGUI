
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID,dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local npc = GetNpc(dwSkillSrcID)
	if not npc then
		return
	end
	if npc.GetBuff(4895,1) then
		player.AddBuff(0,99,4899,1)
	end
	if npc.GetBuff(4896,1) then
		player.AddBuff(0,99,4897,1)
		npc.AddBuff(0,99,4898,1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
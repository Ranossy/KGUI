Include("scripts/Include/Skill.lh")

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if tQichangNpcID[npc.dwTemplateID] and tQichangNpcID[npc.dwTemplateID] == 1 then
		npc.CastSkill(3785, 15)
		npc.SetModelID(3987)
		npc.SetDisappearFrames(12, false)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
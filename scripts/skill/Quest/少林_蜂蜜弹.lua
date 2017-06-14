-- 创建人    :  kingbeyond	
-- 创建时间  :  2008-04-15
-- 用途(模块):  任务技能
-- 武功门派  :  少林任务
-- 技能效果  :  给NPC挂DEBUFF

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	if(IsPlayer(dwCharacterID)) then
		-- 这个任务技能对玩家无效
	else
		local npc = GetNpc(dwCharacterID)
		if npc then
			npc.AddBuff(0, 99, 662, 1, 0)
			npc.AddBuff(0, 99, 422, 1, 0)
			npc.Say(GetEditorString(2, 8039))
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
--function UnApply(dwCharacterID)
--end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
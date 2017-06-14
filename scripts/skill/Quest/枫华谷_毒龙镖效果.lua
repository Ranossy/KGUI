-- 创建人    :  kingbeyond	
-- 创建时间  :  2008-04-15
-- 用途(模块):  任务技能
-- 武功门派  :  枫华谷任务
-- 技能效果  :  杀死特定NPC

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)

	if(IsPlayer(dwCharacterID)) then
		-- 这个任务技能对玩家无效
	else
		local npc = GetNpc(dwCharacterID)
		local dwTemplateID = npc.dwTemplateID
		
		if  dwTemplateID ==  1789 or dwTemplateID ==  1790 or dwTemplateID ==  1791 then
			npc.Die()
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
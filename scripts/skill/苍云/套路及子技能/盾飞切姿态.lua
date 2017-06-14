---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/盾飞切姿态.lua
-- 更新时间:	2014/10/23 19:27:50
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 8278, 1, 1) --刀切姿态
	local Time = 0
	--盾飞延迟在外的时间
	local tRecipeListSP = {1957, 1958}
	for i = 1, #tRecipeListSP do
		if player.IsSkillRecipeActive(tRecipeListSP[i],1) then
			Time = Time + 5
		end
	end

	player.AddBuff(0, 99, 8391, 1, 15 + Time) --切姿态
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "DO_CUSTOM_OTACTION_PROGRESS", 16 * (15 + Time), "盾飞", 2)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ProgressBar.Start", "shield", 1, GetEditorString(6, 9257), GetCurrentTime() + 15 + Time, 15 + Time)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
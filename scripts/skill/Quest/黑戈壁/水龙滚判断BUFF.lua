---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/黑戈壁/水龙滚判断BUFF.lua
-- 更新时间:	2015/9/17 16:54:13
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--添加时触发一次
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.bOnHorse then
		player.DownHorse()
	end	
	if player.GetDynamicSkillGroup() == 0 then
		player.SetDynamicSkillGroup(220)		
		player.AddBuff(0, 99, 9820, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)--
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetDynamicSkillGroup() ~= 0 then
		player.SetDynamicSkillGroup(0)		
	end
	local nQuestID = 14546   --前驱逐虎狼
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, true)
	end
	player.DelBuff(9820, 1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
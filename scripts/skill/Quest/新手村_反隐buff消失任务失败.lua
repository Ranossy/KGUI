---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/新手村_反隐buff消失任务失败.lua
-- 更新时间:	2014/7/14 22:39:26
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nQuest = 844
	local nQuestIndex = player.GetQuestIndex(nQuest)
	local nQuestPhase = player.GetQuestPhase(nQuest)
	if nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
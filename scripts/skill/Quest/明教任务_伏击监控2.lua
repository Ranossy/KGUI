---------------------------------------------------------------------->
-- 脚本名称:	G:/zhugan/client/scripts/skill/Quest/明教任务_伏击监控2.lua
-- 更新时间:	2012-11-12 20:16:21
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetQuestPhase(9364) == 1 then 
		player.SetQuestFailedFlag(player.GetQuestIndex(9364), true)
	end 
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
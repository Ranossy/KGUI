---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/苍山洱海_怀抱婴儿.lua
-- 更新时间:	2012-7-9 16:41:05
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    : 郑海星
-- 创建时间  :  20111202
-- 用途 		 :  苍山洱海
------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local nIndex = player.GetQuestIndex(7734)
	local nPhase = player.GetQuestPhase(7734)
	if nIndex and nPhase < 2 then
    player.SetQuestFailedFlag(nIndex, ture)
		player.SendSystemMessage(GetEditorString(4, 327))
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
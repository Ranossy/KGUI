---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/黑戈壁/抓马BUFF.lua
-- 更新时间:	2015/10/20 16:12:52
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--添加时触发一次

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)--
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local nQuestID = 14595   --奔马且代步
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and nQuestPhase < 3 then
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "驯服失败！野马消失了！", 4)
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
	local npc = scene.GetNpcByNickName("beizhuayema" .. player.dwID)
	if npc then
		npc.SetDisappearFrames(1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
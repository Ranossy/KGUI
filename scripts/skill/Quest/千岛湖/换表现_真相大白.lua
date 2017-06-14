---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/千岛湖/换表现_真相大白.lua
-- 更新时间:	2015/8/8 17:32:25
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<

function Apply(dwCharacterID)

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)

	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local nQuestID = 14020 --真相大白
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, true)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 6697), 3)
		player.SendSystemMessage(GetEditorString(8, 6698))
	end
	--player.SetModelID(0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
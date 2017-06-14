---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/荻花圣殿_少林特殊武器镜头提示.lua
-- 更新时间:	2012-8-10 10:52:54
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	if tplayer.GetQuestPhase(8706) == 0 or tplayer.GetQuestPhase(8706) == 1 then
		--tplayer.SendSystemMessage("可以通过效果性能设置——自定义设置来关闭招式镜头")
		RemoteCallToClient(tplayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(4, 1088), 3)
		tplayer.SendSystemMessage(GetEditorString(4, 1088))
		tplayer.ForceFinishQuest (8706)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
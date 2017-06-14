---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/玩家状态BUFF.lua
-- 更新时间:	03/15/10 14:10:37
-- 更新用户:	chenjiancong
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	
	RemoteCallToClient(player.dwID, "OnCloseExamPanel")
	
	if nLeftFrame == 0 then
		player.SendSystemMessage(GetEditorString(4, 4848))
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
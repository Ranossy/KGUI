---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/玩家状态BUFF.lua
-- 更新时间:	03/15/10 14:10:37
-- 更新用户:	chenjiancong
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npcControl = GetNpc(nCharacterID)
	if not npcControl then
		return
	end

	npcControl.FireAIEvent(2001, 0, 0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/糯米羹提示.lua
-- 更新时间:	2012-7-11 18:12:17
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if target.GetItemAmount(5, 11422) == 0 then
		target.DelGroupBuff(3579, 1)
		return
	end
	local tbuff = target.GetBuff(3579, 1)
	if tbuff.nStackNum == 6 or tbuff.nStackNum == 10 then
		RemoteCallToClient(target.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(4, 451), 10)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
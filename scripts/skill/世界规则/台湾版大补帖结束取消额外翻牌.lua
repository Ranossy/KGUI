---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/世界规则/台湾版大补帖结束取消额外翻牌.lua
-- 更新时间:	2014/10/29 11:54:15
-- 更新用户:	zhengkaifeng
-- 脚本说明:
----------------------------------------------------------------------<

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local dwVIPBuffID = 8443
	local nVIPBuffLevel = 1
	local buff_VipTW = player.GetBuff(dwVIPBuffID, nVIPBuffLevel)
	if not buff_VipTW then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 9068), 4)
		player.SendSystemMessage(GetEditorString(6, 9069))
		RemoteCallToClient(player.dwID, "On_Recharge_EndBigSubsidy")
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
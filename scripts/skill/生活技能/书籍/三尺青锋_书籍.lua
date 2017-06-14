---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/生活技能/书籍/三尺青锋_书籍.lua
-- 更新时间:	2015/6/18 17:18:57
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/世界奇遇/include/三尺青锋_data.lua")
function OnReadPage(player)
	local bBookMemorized = player.IsBookMemorized(218, 1)
	local bQYPhase = player.GetAdventureFlag(g_QYWeapon.nQYValue + 5)	--第一步奇遇开始
	local bQYPhase1 = player.GetAdventureFlag(g_QYWeapon.nQYValue + 6)	--其一步奇遇结束
	if not bQYPhase1 and bQYPhase then
		if player.CanAddItem(5, 23862) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(5, 23862, 1)
			player.SendSystemMessage(GetEditorString(7, 7086))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 7086), 4)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
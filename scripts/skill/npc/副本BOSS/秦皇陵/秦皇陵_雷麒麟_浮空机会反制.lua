---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_雷麒麟_浮空机会反制.lua
-- 更新时间:	2014/2/11 17:31:41
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 7469, 1, 2) --左释放条件
	player.AddBuff(0, 99, 7514, 1, 2) --右释放条件
	local nNum = Random(1, 10000)
	local Tiaoshu = 0
	local BJbuff = player.GetBuff(7467, 1)
	local z_stime = 20 * 62.5  --1帧等于62.5毫秒
	local tData = 
	{
		[1] = {{nSkillID = 8802, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON1", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.43, fPosY = 0.8}},--左翻转
		[2] = {{nSkillID = 8803, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON2", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.57, fPosY = 0.8}},--又翻转翻转

	}
	if not player.GetBuff(7468, 1) then  --避免多次弹出提示
		if nNum <= 5000 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[1], true)
			player.AddBuff(0, 99, 7468, 1, 10) --避免再次弹出
			player.AddBuff(0, 99, 7710, 1, 1) --左失败
		else
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[2], true)
			player.AddBuff(0, 99, 7468, 1, 10)--避免再次弹出
			player.AddBuff(0, 99, 7711, 1, 1) --右失败
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
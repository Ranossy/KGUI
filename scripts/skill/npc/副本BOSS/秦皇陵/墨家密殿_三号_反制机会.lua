---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/墨家密殿_三号_反制机会.lua
-- 更新时间:	2014/3/14 10:21:23
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nNum = Random(1, 10000)
	local Tiaoshu = 0
	local BJbuff = player.GetBuff(7606, 1)
	local z_stime = 22 * 62.5  --1帧等于62.5毫秒

	local JHbuff = player.GetBuff(7606, 1)  --处理剩余跳数额外弹窗的问题
	if JHbuff then
		if JHbuff.nLeftActiveCount <= 1 then
			return 
		end
	end
	------------------------------
	player.AddBuff(0, 99, 7610, 1, 2)  --此时3个技能均可释放
	player.AddBuff(0, 99, 7611, 1, 2)
	player.AddBuff(0, 99, 7623, 1, 2)
	------------------------------
	--player.AddBuff(0, 99, 7624, 1, 1)  --左失败标记
	--player.AddBuff(0, 99, 7625, 1, 1)	--右失败标记
	--player.AddBuff(0, 99, 7626, 1, 1)	--前失败标记
	local tData = 
	{
		[1] = {{nSkillID = 8950, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON1", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.43, fPosY = 0.8}},--左翻转
		[2] = {{nSkillID = 8952, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON2", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.5, fPosY = 0.8}}, --前
		[3] = {{nSkillID = 8951, nSkillLevel = 1, szHotKey = "ACTIONBAR1_BUTTON3", szText = GetEditorString(6, 169), nTotalTime = z_stime, fPosX = 0.57, fPosY = 0.8}}, --右翻转

	}
	if nNum <= 3333 then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[1], true)
		player.AddBuff(0, 99, 7624, 1, 1)  --左失败标记
	elseif  nNum > 3333 and nNum < 6666 then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[2], true)
		player.AddBuff(0, 99, 7626, 1, 1)	--前失败标记
	else
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[3], true)
		player.AddBuff(0, 99, 7625, 1, 1)	--右失败标记
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/DynamicSkillGroupScript.lua
-- 更新时间:	2016/10/6 18:24:55
-- 更新用户:	qinfupi
-- 脚本说明:	动态技能栏的通用调用函数，在切换的时候必定触发
----------------------------------------------------------------------<

Include("scripts/Map/江湖百态/include/IdentityBaseFunc.lua")
Include("scripts/Map/苍山洱海之马场/include/赛马报名处理.lh")
function OnChangeDynamicSkillGroup(player, dwOldGroup, dwNewGroup)
	----------------------载具(必须放在最前面不然有隐患)----------------------
	if player.dwShapeShiftID ~= 0 and dwOldGroup ~= 0 and dwNewGroup == 0 then
		--local buff10766 = player.GetBuff(10766, 1)
		--if buff10766 then
		--player.DelBuff(10766, 1)
		--end
		--player.AddBuff(player.dwID, player.nLevel, 10766, 1, 30)
		--buff10766 = player.GetBuff(10766, 1)
		--if buff10766 then
		--buff10766.nCustomValue = player.nCurrentLife
		--end
		player.EndShapeShift()
	end
	---------------------------------------------------------------------------------

	--退出动态技能栏情况下的判断
	--[[
	if dwOldGroup == 1 and dwNewGroup == 0 then
		player.DelBuff(4099, 1)
		SetBiaoJi_ZhunBei(player, 0)
	 	SetBiaoJi_CanSai(player, 0)
	end
	--]]

	-----七夕外装公主抱退出按钮消失时的补救处理：退出技能栏退出公主抱------
	if dwOldGroup == 301 and dwNewGroup == 0 then
		if player.dwEmotionActionID == 73 then
			player.StopCurrentEmotionAction()
		end
	end
	-----中秋外装公主抱退出按钮消失时的补救处理：退出技能栏退出表情动作------
	if dwOldGroup == 305 and dwNewGroup == 0 then
		if player.dwEmotionActionID == 74 then
			player.StopCurrentEmotionAction()
		end
	end
	-----元宵外装退出按钮消失时的补救处理：退出技能栏退出表情动作------
	if dwOldGroup == 321 and dwNewGroup == 0 then
		if player.dwEmotionActionID == 84 or player.dwEmotionActionID == 85 or player.dwEmotionActionID == 86 then
			player.StopCurrentEmotionAction()
		end
	end
	--------------------------------------------------------------------------------------
	local tGroup = {
		265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285,
	}
	for _, nGroup in pairs(tGroup) do
		if dwOldGroup == nGroup then	-- 退出身份·驭兽师状态
			if player.GetBuff(10864, 1) then
				player.DelBuff(10864, 1)
			end
		end
	end

	if dwOldGroup == 295 and dwNewGroup == 0 then	-- 退出身份·驭兽师状态
		if player.GetBuff(10864, 1) then
			player.DelBuff(10864, 1)
		end
	end

	if dwOldGroup == 259 and dwNewGroup == 0 then
		player.DelBuff(10801, 1)
	end

	if dwOldGroup == 232 and dwNewGroup == 0 then
		player.DelBuff(10261, 1)
	end

	if (dwOldGroup == 202 or dwOldGroup == 203 or dwOldGroup == 204) and dwNewGroup == 0 then
		player.DelBuff(9386, 1)
	end
	if dwOldGroup == 2 and dwNewGroup == 0 then
		local bBuff1 = player.GetBuff(4166, 1)
		local bBuff3 = player.GetBuff(4168, 1)
		local bBuff4 = player.GetBuff(4170, 1)
		local nCount
		if bBuff1 then
			player.DelBuff(4166, 1)
		end
		if bBuff3 then
			player.DelBuff(4168, 1)
		end
		if bBuff4 then
			nCount = bBuff4.dwSkillSrcID
			player.DelBuff(4170, 1)
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		if nCount == nil then
			return
		end
		local npc_pt = scene.GetNpcByNickName("cannon_" .. nCount)
		if npc_pt then
			local bBuff5 = npc_pt.GetBuff(4169, 1)
			if bBuff5 then
				npc_pt.DelBuff(4169, 1)
			end
			npc_pt.SetDialogFlag(1)
		end
	end

	if dwOldGroup == 9 and dwNewGroup == 0 then
		local nDoodadID = 0
		local buff = player.GetBuff(4332, 1)
		if buff then
			nDoodadID = buff.nCustomValue
			player.DelBuff(4332, 1)
		end

		local doodad = GetDoodad(nDoodadID)
		if doodad then
			doodad.SetCustomUnsigned4(1, 0)
		end

		player.DoAction(0, 10261)
		player.AddBuff(0, 99, 3921, 1, 180)
	end
	if dwOldGroup == 10 and dwNewGroup == 0 then
		local buffLKRQ = player.GetBuff(4412, 1)
		if buffLKRQ then
			player.DelBuff(4412, 1)
			player.PlayCameraAnimation(0, 0)
		end
		local StateInfo = GetActivityState(215)
		if StateInfo and (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then
			local scene = player.GetScene()
			if scene.dwMapID == 151 then
				local nQuestID = 11747
				local nQuestIndex = player.GetQuestIndex(nQuestID)
				local nQuestID2 = 11751
				local nQuestIndex2 = player.GetQuestIndex(nQuestID2)
				if nQuestIndex  or nQuestIndex2 then
					player.SetPosition(67342, 80972, 1097728)
					if player.GetBuff(3994, 1) then
						player.DelBuff(3994, 1)
					end
				end
			end
		end
	end

	if dwNewGroup == 0 then	-- 删除载具状态禁止召唤标记BUFF
		if player.GetBuff(4612, 1) then
			player.DelBuff(4612, 1)
		end
	end
	if dwOldGroup == 15 and dwNewGroup == 0 then --删除MT机甲带有的动态技能栏
		local bBuff15 = player.GetBuff(4740, 1)
		local bBuffMTShou = player.GetBuff(4844, 1)
		local bBuffMTTui = player.GetBuff(4845, 1)
		local bBuffMTYao = player.GetBuff(4846, 1)
		local bBuffMTTou = player.GetBuff(4847, 1)
		local bBuffMTXiong = player.GetBuff(4848, 1)
		if bBuff15 then
			player.DelBuff(4740, 1)
		end
		if bBuffMTShou then
			player.DelBuff(4844, 1)
		end
		if bBuffMTTui then
			player.DelBuff(4845, 1)
		end
		if bBuffMTYao then
			player.DelBuff(4846, 1)
		end
		if bBuffMTTou then
			player.DelBuff(4847, 1)
		end
		if bBuffMTXiong then
			player.DelBuff(4848, 1)
		end
	end
	if dwOldGroup == 16 and dwNewGroup == 0 then --删除DPS机甲带有的动态技能栏
		local bBuff16 = player.GetBuff(4740, 2)
		local bBuffDPSShou = player.GetBuff(4844, 2)
		local bBuffDPSTui = player.GetBuff(4845, 2)
		local bBuffDPSYao = player.GetBuff(4846, 2)
		local bBuffDPSTou = player.GetBuff(4847, 2)
		local bBuffDPSXiong = player.GetBuff(4848, 2)
		if bBuff16 then
			player.DelBuff(4740, 2)
		end
		if bBuffDPSShou then
			player.DelBuff(4844, 2)
		end
		if bBuffDPSTui then
			player.DelBuff(4845, 2)
		end
		if bBuffDPSYao then
			player.DelBuff(4846, 2)
		end
		if bBuffDPSTou then
			player.DelBuff(4847, 2)
		end
		if bBuffDPSXiong then
			player.DelBuff(4848, 2)
		end

	end
	if dwOldGroup == 17 and dwNewGroup == 0 then --删除DPS机甲带有的动态技能栏
		local bBuff17 = player.GetBuff(4740, 3)
		local bBuffZLShou = player.GetBuff(4844, 3)
		local bBuffZLTui = player.GetBuff(4845, 3)
		local bBuffZLYao = player.GetBuff(4846, 3)
		local bBuffZLTou = player.GetBuff(4847, 3)
		local bBuffZLXiong = player.GetBuff(4848, 3)
		if bBuff17 then
			player.DelBuff(4740, 3)
		end
		if bBuffZLShou then
			player.DelBuff(4844, 3)
		end
		if bBuffZLTui then
			player.DelBuff(4845, 3)
		end
		if bBuffZLYao then
			player.DelBuff(4846, 3)
		end
		if bBuffZLTou then
			player.DelBuff(4847, 3)
		end
		if bBuffZLXiong then
			player.DelBuff(4848, 3)
		end
	end

	if dwOldGroup == 18 and dwNewGroup == 0 then
		player.DelBuff(4787, 1)
		player.DelBuff(4788, 1)
		player.DelBuff(4789, 1)
	end
	if dwOldGroup == 23 and dwNewGroup == 0 then
		if player.GetBuff(4994, 1) then
			player.DelBuff(4994, 1)
		end
	end
	if dwOldGroup == 34 and dwNewGroup == 0 then
		if player.GetBuff(5402, 1) then
			player.DelBuff(5402, 1)
		end
	end
	if dwOldGroup == 40 and dwNewGroup == 0 then
		if player.GetBuff(4412, 1) then
			player.DelBuff(4412, 1)
		end
	end
	if dwOldGroup == 41 and dwNewGroup == 0 then
		if player.GetBuff(5469, 1) then
			player.DelBuff(5469, 1)
		end
	end
	if dwOldGroup == 42 and dwNewGroup == 0 then
		if player.GetBuff(4412, 1) then
			player.DelBuff(4412, 1)
		end
		player.PlayCameraAnimation(0, 0)--取消镜头动画
		player.RemoveViewPoint()--镜头结束移除视点
	end
	if dwOldGroup == 43 and dwNewGroup == 0 then
		if player.GetBuff(4412, 1) then
			player.DelBuff(4412, 1)
		end
		player.PlayCameraAnimation(0, 0)--取消镜头动画
		player.RemoveViewPoint()--镜头结束移除视点
	end
	if dwOldGroup == 39 and dwNewGroup == 0 then --马嵬驿大桥表现处理
		player.DelBuff(5450, 1)
		player.DelBuff(5451, 1)
		player.DelBuff(5452, 1)
		player.DelBuff(5449, 1)
	end

	if dwOldGroup == 48 and dwNewGroup == 0 then --越狱射箭
		player.DelBuff(5925, 1)
		player.DelBuff(4612, 1)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
	end

	if dwOldGroup == 51 and dwNewGroup == 0 then --越狱锁链
		player.DelBuff(5924, 1)
		player.DelBuff(4612, 1)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
	end
	if (dwOldGroup == 52 and dwNewGroup == 0) or (dwOldGroup == 59 and dwNewGroup == 0) then
		local scene = player.GetScene()
		local bBuff1 = player.GetBuff(4166, 1)
		local bBuff3 = player.GetBuff(4168, 1)
		local bBuff4 = player.GetBuff(4170, 1)
		local nCount
		if bBuff1 then
			player.DelBuff(4166, 1)
		end
		if bBuff3 then
			player.DelBuff(4168, 1)
		end
		if bBuff4 then
			nCount = bBuff4.dwSkillSrcID
			player.DelBuff(4170, 1)
		end
		if player.nX > 4605 and player.nX < 5270 and player.nY > 50609 and player.nY < 51404 then
			local npc_zn = scene.GetNpcByNickName("zhongnu1")
			if npc_zn then
				npc_zn.SetDialogFlag(1)
			end
		elseif player.nX > 7602 and player.nX < 8395 and player.nY > 50450 and player.nY < 51581 then
			local npc_zn = scene.GetNpcByNickName("zhongnu2")
			if npc_zn then
				npc_zn.SetDialogFlag(1)
			end

		elseif player.nX > 11874 and player.nX < 12706 and player.nY > 50400 and player.nY < 51597 then
			local npc_zn = scene.GetNpcByNickName("zhongnu3")
			if npc_zn then
				npc_zn.SetDialogFlag(1)
			end

		elseif player.nX > 15022 and player.nX < 15869 and player.nY > 50406 and player.nY < 51628 then
			local npc_zn = scene.GetNpcByNickName("zhongnu4")
			if npc_zn then
				npc_zn.SetDialogFlag(1)
			end
		end
	end

	if dwOldGroup == 60 and dwNewGroup == 0 then --大唐监狱 - 开锁
		player.DelBuff(6412, 1)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 7964)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 7965)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 7966)
	end

	if dwOldGroup == 62 and dwNewGroup == 0 then --长安内城_铸剑
		--if player.GetBuff(6477, 1) then
		--player.DelBuff(6477, 1)
		--end
		--if player.GetBuff(6475, 1)then
		--player.DelBuff(6475, 1)
		--end
	end

	if dwOldGroup == 68 and dwNewGroup == 0 then --血战天策_前线箭弩车
		local scene = player.GetScene()
		local qianxianjiannuche1 = scene.GetNpcByNickName("qianxianjiannuche1")
		local qianxianjiannuche2 = scene.GetNpcByNickName("qianxianjiannuche2")
		local qianxianjiannuche3 = scene.GetNpcByNickName("qianxianjiannuche3")
		if qianxianjiannuche1 then
			if qianxianjiannuche1.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche1.SetDialogFlag(1)
				qianxianjiannuche1.SetCustomInteger4(8, 0)
				qianxianjiannuche1.SetCustomInteger4(4, 0)
			end
		end

		if qianxianjiannuche2 then
			if qianxianjiannuche2.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche2.SetDialogFlag(1)
				qianxianjiannuche2.SetCustomInteger4(8, 0)
				qianxianjiannuche2.SetCustomInteger4(4, 0)
			end
		end

		if qianxianjiannuche3 then
			if qianxianjiannuche3.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche3.SetDialogFlag(1)
				qianxianjiannuche3.SetCustomInteger4(8, 0)
				qianxianjiannuche3.SetCustomInteger4(4, 0)
			end
		end
		player.DelBuff(4166, 1)
	end

	if dwOldGroup == 69 and dwNewGroup == 0 then --血战天策_举石头
		player.DelBuff(6672, 1)
		player.DoAction(0, 10103)
	end

	if dwOldGroup == 86 and dwNewGroup == 0 then --血战天策_举石头
		player.DelBuff(6672, 1)
		player.DoAction(0, 10103)
	end

	if dwOldGroup == 72 and dwNewGroup == 0 then --血战天策_城墙箭弩车
		local scene = player.GetScene()
		for i = 1, 7 do
			local jiannuche = scene.GetDoodadByNickName("xinanjianjia" .. i)
			if jiannuche then
				if jiannuche.GetCustomInteger4(8) == player.dwID then
					jiannuche.SetCustomInteger4(8, 0)
					jiannuche.SetCustomInteger4(4, 0)
				end
			end
		end
		player.DelBuff(6741, 1)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
		RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
	end

	if dwOldGroup == 88 and dwNewGroup == 0 then --血战天策_前线箭弩车
		local scene = player.GetScene()
		local qianxianjiannuche1 = scene.GetNpcByNickName("qianxianjiannuche1")
		local qianxianjiannuche2 = scene.GetNpcByNickName("qianxianjiannuche2")
		local qianxianjiannuche3 = scene.GetNpcByNickName("qianxianjiannuche3")
		if qianxianjiannuche1 then
			if qianxianjiannuche1.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche1.SetDialogFlag(1)
				qianxianjiannuche1.SetCustomInteger4(8, 0)
				qianxianjiannuche1.SetCustomInteger4(4, 0)
			end
		end

		if qianxianjiannuche2 then
			if qianxianjiannuche2.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche2.SetDialogFlag(1)
				qianxianjiannuche2.SetCustomInteger4(8, 0)
				qianxianjiannuche2.SetCustomInteger4(4, 0)
			end
		end

		if qianxianjiannuche3 then
			if qianxianjiannuche3.GetCustomInteger4(8) == player.dwID then
				qianxianjiannuche3.SetDialogFlag(1)
				qianxianjiannuche3.SetCustomInteger4(8, 0)
				qianxianjiannuche3.SetCustomInteger4(4, 0)
			end
		end
		player.DelBuff(4166, 1)
	end

	if dwOldGroup == 70 and dwNewGroup == 0 then --血战天策_东南投石车
		local scene = player.GetScene()
		local dongnantoushiche1 = scene.GetNpcByNickName("dongnantoushiche1")
		local dongnantoushiche2 = scene.GetNpcByNickName("dongnantoushiche2")
		local dongnantoushiche3 = scene.GetNpcByNickName("dongnantoushiche3")
		if dongnantoushiche1 then
			if dongnantoushiche1.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche1.SetDialogFlag(1)
				dongnantoushiche1.SetCustomInteger4(8, 0)
				dongnantoushiche1.SetCustomInteger4(4, 0)
			end
		end

		if dongnantoushiche2 then
			if dongnantoushiche2.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche2.SetDialogFlag(1)
				dongnantoushiche2.SetCustomInteger4(8, 0)
				dongnantoushiche2.SetCustomInteger4(4, 0)
			end
		end

		if dongnantoushiche3 then
			if dongnantoushiche3.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche3.SetDialogFlag(1)
				dongnantoushiche3.SetCustomInteger4(8, 0)
				dongnantoushiche3.SetCustomInteger4(4, 0)
			end
		end
		player.DelBuff(4166, 1)
	end

	if dwOldGroup == 87 and dwNewGroup == 0 then --血战天策_东南投石车
		local scene = player.GetScene()
		local dongnantoushiche1 = scene.GetNpcByNickName("dongnantoushiche1")
		local dongnantoushiche2 = scene.GetNpcByNickName("dongnantoushiche2")
		local dongnantoushiche3 = scene.GetNpcByNickName("dongnantoushiche3")
		if dongnantoushiche1 then
			if dongnantoushiche1.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche1.SetDialogFlag(1)
				dongnantoushiche1.SetCustomInteger4(8, 0)
				dongnantoushiche1.SetCustomInteger4(4, 0)
			end
		end

		if dongnantoushiche2 then
			if dongnantoushiche2.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche2.SetDialogFlag(1)
				dongnantoushiche2.SetCustomInteger4(8, 0)
				dongnantoushiche2.SetCustomInteger4(4, 0)
			end
		end

		if dongnantoushiche3 then
			if dongnantoushiche3.GetCustomInteger4(8) == player.dwID then
				dongnantoushiche3.SetDialogFlag(1)
				dongnantoushiche3.SetCustomInteger4(8, 0)
				dongnantoushiche3.SetCustomInteger4(4, 0)
			end
		end
		player.DelBuff(4166, 1)
	end

	if dwOldGroup == 63 and dwNewGroup == 0 then --长安内城射箭
		local nQuestID = 11536
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestID1 = 11799
		local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		if player.GetBuff(6486, 1) then
			player.DelBuff(6486, 1)
		end
		if nQuestIndex and nQuestPhase == 1 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
			player.SetQuestValue(nQuestIndex, 1, 0)
			player.SetQuestValue(nQuestIndex, 0, 0)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 9979), 4)
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			player.SetDynamicSkillGroup(0)
			player.CloseLonelyMode()--关闭孤寂
		else
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			player.SetDynamicSkillGroup(0)
			player.CloseLonelyMode()--关闭孤寂
		end
		if nQuestIndex1 and nQuestPhase1 == 1 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
			player.SetQuestValue(nQuestIndex1, 1, 0)
			player.SetQuestValue(nQuestIndex1, 0, 0)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 9979), 4)
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			player.SetDynamicSkillGroup(0)
			player.CloseLonelyMode()--关闭孤寂
		else
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			player.SetDynamicSkillGroup(0)
			player.CloseLonelyMode()--关闭孤寂
		end
	end
	if dwOldGroup == 77 and dwNewGroup == 0 then --血战天策_雷狼_战马
		--player.DelBuff(6672, 1)
	end

	if dwOldGroup == 78 and dwNewGroup == 0 then --血战天策_雷狼_战马
		--player.DelGroupBuff(4166, 1)
		player.DelGroupBuff(7302, 1)
		player.SetDynamicSkillGroup(0)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
		RemoteCallToClient(player.dwID, "SetMaxCameraDistance", 3000)
		local scene = player.GetScene()
		for i = 1, 7 do
			local npcZhongnu = scene.GetNpcByNickName("sanhao_zhongnu" .. i)
			if npcZhongnu then
				if npcZhongnu.GetCustomInteger4(8) == player.dwID then
					npcZhongnu.SetDialogFlag(1)
					npcZhongnu.SetCustomInteger4(8, 0)
					npcZhongnu.SetCustomInteger4(4, 0)
				end
			end
		end
	end
	--英雄血战天策-战俘营-重弩
	if dwOldGroup == 93 and dwNewGroup == 0 then --血战天策_雷狼_战马
		--player.DelGroupBuff(4166, 1)
		player.DelGroupBuff(7302, 1)
		player.SetDynamicSkillGroup(0)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
		RemoteCallToClient(player.dwID, "SetMaxCameraDistance", 3000)
		local scene = player.GetScene()
		for i = 1, 7 do
			local npcZhongnu = scene.GetNpcByNickName("sanhao_zhongnu" .. i)
			if npcZhongnu then
				if npcZhongnu.GetCustomInteger4(8) == player.dwID then
					npcZhongnu.SetDialogFlag(1)
					npcZhongnu.SetCustomInteger4(8, 0)
					npcZhongnu.SetCustomInteger4(4, 0)
				end
			end
		end
	end
	--英雄血战天策-战俘营-重弩
	if dwOldGroup == 83 and dwNewGroup == 0 then --血战天策预热
		local tBuffList = {
			{7079, 1}, {7080, 1}, {7082, 1}, {7086, 1}, {7088, 1},
			{7089, 1}, {7090, 1}, {7101, 1}, {7102, 1},
		}
		for i = 1, #tBuffList do
			if player.GetBuff(tBuffList[i][1], tBuffList[i][2]) then
				player.DelBuff(tBuffList[i][1], tBuffList[i][2])
			end
		end
	end

	--秦皇陵-血麒麟-控制鱼叉
	if dwOldGroup == 115 then
		player.DelBuff(7608, 1)
		local scene = player.GetScene()

		local yucha1 = scene.GetDoodadByNickName("BOSS2_qilinnu1")
		local yucha2 = scene.GetDoodadByNickName("BOSS2_qilinnu2")
		local yucha3 = scene.GetDoodadByNickName("BOSS2_qilinnu3")
		local yucha4 = scene.GetDoodadByNickName("BOSS2_qilinnu4")

		if yucha1 then
			if yucha1.GetCustomInteger4(8) == player.dwID then
				yucha1.SetCustomInteger4(8, 0)
				yucha1.SetCustomInteger4(4, 0)
			end
		end

		if yucha2 then
			if yucha2.GetCustomInteger4(8) == player.dwID then
				yucha2.SetCustomInteger4(8, 0)
				yucha2.SetCustomInteger4(4, 0)
			end
		end

		if yucha3 then
			if yucha3.GetCustomInteger4(8) == player.dwID then
				yucha3.SetCustomInteger4(8, 0)
				yucha3.SetCustomInteger4(4, 0)
			end
		end
		if yucha4 then
			--yucha4.SetDialogFlag(1)
			if yucha4.GetCustomInteger4(8) == player.dwID then
				yucha4.SetCustomInteger4(8, 0)
				yucha4.SetCustomInteger4(4, 0)
			end
		end
	end
	--秦皇陵-血麒麟-控制石俑
	if dwOldGroup == 116 and dwNewGroup == 0 then
		--删除变身BUFF，换模，恢复血量
		local buff = player.GetBuff(7575, 1)
		if buff then
			player.DelBuff(7575, 1)
		end

	end
	if dwOldGroup == 146 and dwNewGroup == 0 then
		--删除变身BUFF，换模，恢复血量
		local buff = player.GetBuff(7575, 2)
		if buff then
			player.DelBuff(7575, 2)
		end

	end
	--秦皇陵_安禄山抛石
	if dwOldGroup == 120 and dwNewGroup == 0 then
		player.DelBuff(7523, 1)
		player.DoAction(0, 10103)
	end

	--秦皇陵_玩家战车
	if dwOldGroup == 135 and dwNewGroup == 0 then
		player.DownHorse()
		player.DelBuff(7590, 1)
		player.DelBuff(7591, 1)
		player.DelGroupBuff(7677, 1)
		player.DoAction(0, 10103)
		player.AddBuff(0, 99, 2587, 3)
	end

	--秦皇陵_25人玩家战车
	if dwOldGroup == 148 and dwNewGroup == 0 then
		player.DownHorse()
		player.DelBuff(7590, 1)
		player.DelBuff(7591, 1)
		player.DelGroupBuff(7677, 2)
		player.DoAction(0, 10103)
		player.AddBuff(0, 99, 2587, 3)
	end

	--春明门_乔装民女
	if dwOldGroup == 153 and dwNewGroup == 0 then
		player.DelBuff(7849, 1)
	end
	--太原之战_玩家战马
	if dwOldGroup == 156 and dwNewGroup == 0 then
		player.DelBuff(7938, 1)
	end

	-- 奇宝之争
	local tWildTreasureList = {
		[94] = 1, [95] = 1, [96] = 1, [97] = 1, [98] = 1,
		[99] = 1, [100] = 1, [101] = 1, [102] = 1, [103] = 1,
	}
	if tWildTreasureList[dwOldGroup] and player.GetBuff(7049, 1) then
		player.DelBuff(7049, 1)
	end
	-- 逐鹿中原
	if dwOldGroup == 140 then
		local buff_Check = player.GetBuff(7525, 0)
		if buff_Check then
			player.DelBuff(7525, buff_Check.nLevel)
		end
	end
	if dwOldGroup == 117 then
		local buff_Check = player.GetBuff(7561, 0)
		if buff_Check then
			player.DelBuff(7561, buff_Check.nLevel)
		end
	end
	--附魔凤凰蛊技能后，切换回正常时
	if dwOldGroup == 167 and dwNewGroup == 0 then
		player.DelBuff(8103, 1)
	end

	--内力对拼时传功的技能栏
	if dwOldGroup == 177 and dwNewGroup == 0 then
		player.DelBuff(8354, 1)
		player.DelBuff(8410, 1)
		player.DelBuff(8408, 1)
		player.DelBuff(8466, 1)
		player.DelGroupBuff(8409, 1)
	end
	if dwOldGroup == 178 and dwNewGroup == 0 then
		player.DelBuff(8354, 1)
		player.DelBuff(8410, 1)
		player.DelBuff(8353, 1)
		player.DelGroupBuff(8409, 1)
		for i = 1, 5 do
			player.DelBuff(8412, i)
		end
	end
	if dwOldGroup == 181 and dwNewGroup == 0 then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseSniperPanel")
		RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
		player.SetDynamicSkillGroup(0)
		player.CloseLonelyMode()
		if player.GetBuff(8543, 1) then
			player.DelBuff(8543, 1)
		end
	end

	if dwOldGroup == 192 and dwNewGroup == 0 then
		player.DelBuff(8692, 1)
		player.SetDynamicSkillGroup(0)
		player.NotifyPainting(player.dwID, 0)
	end
	-- 删除端午节钓鱼的相关buff
	if dwOldGroup == 198 and dwNewGroup == 0 then
		if player.GetBuff(8993, 1) then
			player.DelBuff(8993, 1)
		end
		if player.GetBuff(9001, 1) then
			player.DelBuff(9001, 1)
		end
		if player.GetBuff(9002, 1) then
			player.DelBuff(9002, 1)
		end
		if player.GetBuff(8998, 1) then
			player.DelBuff(8998, 1)
		end
		if player.GetBuff(8999, 1) then
			player.DelBuff(8999, 1)
		end
		if player.GetBuff(9000, 1) then
			player.DelBuff(9000, 1)
		end
		if player.GetBuff(8995, 1) then
			player.DelBuff(8995, 1)
		end
		if player.GetBuff(8996, 1) then
			player.DelBuff(8996, 1)
		end
		if player.GetBuff(8997, 1) then
			player.DelBuff(8997, 1)
		end
	end

	-- 阴山大草原_休整队伍PQ的相关buff
	if dwOldGroup == 209 and dwNewGroup == 0 then
		if player.GetBuff(8993, 1) then
			player.DelBuff(8993, 1)
		end
		if player.GetBuff(9001, 1) then
			player.DelBuff(9001, 1)
		end
		if player.GetBuff(9002, 1) then
			player.DelBuff(9002, 1)
		end
		if player.GetBuff(8998, 1) then
			player.DelBuff(8998, 1)
		end
		if player.GetBuff(8999, 1) then
			player.DelBuff(8999, 1)
		end
		if player.GetBuff(9000, 1) then
			player.DelBuff(9000, 1)
		end
		if player.GetBuff(8995, 1) then
			player.DelBuff(8995, 1)
		end
		if player.GetBuff(8996, 1) then
			player.DelBuff(8996, 1)
		end
		if player.GetBuff(8997, 1) then
			player.DelBuff(8997, 1)
		end
	end
	--千岛湖，炮轰
	if dwOldGroup == 213 and dwNewGroup == 0 then
		if player.GetBuff(9683, 1) then
			player.DelBuff(9683, 1)
		end
		player.PlayCameraAnimation(0, 0)--取消镜头动画
		player.RemoveViewPoint()--镜头结束移除视点
		local scene = player.GetScene()
		if not scene then
			return
		end
		--删除可能存在的标记NPC， "zhanchuanbazi1" .. player.dwID
		for i = 1, 4 do
			local npc = scene.GetNpcByNickName("zhanchuanbazi" .. i .. player.dwID)
			if npc then
				npc.SetDisappearFrames(1)
			end
			for j = 1, 3 do
				local doodad = scene.GetDoodadByNickName("paohong" .. i .. j .. player.dwID)
				if doodad then
					doodad.SetDisappearFrames(1)
				end
			end
		end
	end

	-- 千岛湖泡温泉
	if dwOldGroup == 211 and dwNewGroup == 0 then
		local nCHEST_STYLE = 0
		-- 记录上衣表现STYLEID
		local buff1 = player.GetBuff(9308, 1)
		if buff1 then
			player.DelBuff(9308, 1)
		end
	end 
	-- 奇遇·炼狱水煮鱼
	if dwOldGroup == 225 or dwOldGroup == 226 or dwOldGroup == 227 then
		if player.GetBuff(10043, 1) then
			player.DelBuff(10043, 1)
		end
		if player.GetBuff(10154, 1) then
			player.DelBuff(10154, 1)
		end
	end
--黑戈壁，水龙滚
	if dwOldGroup == 220 and dwNewGroup == 0 then
		if player.GetBuff(9819, 1) then
			player.DelBuff(9819, 1)
		end
	end
--藏剑,95门派事件,搬运寒玉铁
	if dwOldGroup == 230 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		--player.DelGroupBuff(10275, 1)
		player.DelBuff(2587, 1)
		player.DelBuff(10304, 1)   --表现BUFF
	end
	--丐帮95门派事件，钓鱼
	if dwOldGroup == 240 and dwNewGroup == 0 then
		player.DelBuff(10447, 1)
		player.DelGroupBuff(10461, 1)
	end
	--丐帮95门派事件，火雷
	if dwOldGroup == 239 and dwNewGroup == 0 then
		player.DelBuff(10445, 1)
		player.DelGroupBuff(10446, 1)
	end
	--唐门,95门派事件,机甲灵活性测试
	if dwOldGroup == 241 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		player.DelBuff(10451, 1)
		player.DelBuff(10451, 2)   --2边势力的操控BUFF
		player.DelBuff(2587, 1)
		player.PlaySfx(1009, player.nX, player.nY, player.nZ)
	end
	--唐门,95门派事件,机甲防御性测试
	if dwOldGroup == 242 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		player.DelBuff(10473, 1)
		player.DelBuff(10473, 2)
		player.DelBuff(10476, 1) --机甲减伤BUFF
		player.DelBuff(2587, 1)
		player.PlaySfx(1009, player.nX, player.nY, player.nZ)
	end
	--唐门,95门派事件,周六变身
	if dwOldGroup == 243 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		player.DelBuff(10487, 1) --2边势力的操控BUFF
		player.DelBuff(10488, 1) --回血HOT
		player.DelBuff(2587, 1)
		player.PlaySfx(1009, player.nX, player.nY, player.nZ)
		player.DelGroupBuff(10490, 1)  --加伤害BUFF
		local scene = player.GetScene()
		if not scene then
			return
		end
		if not scene.IsNickNameNpcExist("PQMarkNPC139Num1") then
			player.DelGroupBuff(10489, 1)  --契合BUFF
		end
	end
	--唐门，95级门派事件，周日上弩
	if dwOldGroup == 246 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		local scene = player.GetScene()
		if not scene then
			return
		end
		local npcBaxianglianu = scene.GetNpcByNickName("baxiangqiangnu" .. player.dwID)
		if npcBaxianglianu then
			npcBaxianglianu.SetDialogFlag(1)
		end
		if player.GetBuff(10478, 1) then
			player.DelBuff(10478, 1)
		end
	end
	--唐门，95级门派事件，周日上机甲
	if dwOldGroup == 245 and dwNewGroup == 0 then
		if player.GetBuff(10483, 1) then
			player.DelBuff(10483, 1)
		end
		if player.GetBuff(10482, 1) then
			player.DelBuff(10482, 1)
		end

	end
	if dwOldGroup == 244 and dwNewGroup == 0 then
		--删除搬运BUFF和禁止上马BUFF
		player.DelBuff(10487, 2)
		player.DelBuff(2587, 1)
		player.PlaySfx(1009, player.nX, player.nY, player.nZ)
		player.DelGroupBuff(10490, 1)
		local scene = player.GetScene()
		if not scene then
			return
		end
		if not scene.IsNickNameNpcExist("PQMarkNPC139Num1") then
			player.DelGroupBuff(10489, 1)  --契合BUFF
		end
	end

	--长歌门特殊武器
	if dwOldGroup == 250 and dwNewGroup == 0 then
		player.DelBuff(10521, 1)
		player.CastSkill(16493, 1)
	end

	--苍云特殊武器
	if dwOldGroup == 251 and dwNewGroup == 0 then
		player.DelBuff(10565, 1)
		player.DelBuff(10567, 1)
	end

	---[[方士身份,离开灵魂状态，旧接口弃用
	--if dwOldGroup == 264 then
	--player.DelBuff(10826, 1)
	--player.DelBuff(10827, 1)
	--player.DelBuff(2587, 1)
	--player.SetIdentityVisiableID(0)
	--end
	--]]
	if dwOldGroup == 300 and dwNewGroup == 0 then
		player.DelBuff(11025, 1)
	end
	--删除帮会钓鱼的动态技能栏
	if dwOldGroup == 339 and dwNewGroup == 0 then 
		for i = 11964, 11967 do
			if player.GetBuff(i, 1) then
				player.DelBuff(i, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
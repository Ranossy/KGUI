---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_出魂.lua
-- 更新时间:	2016/6/8 10:49:00
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/include/IdentityBaseFunc.lua")
Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/江湖百态/方士_出魂.lua", -- 属性值1
		0														-- 属性值2
	)
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒

	skill.SetNormalCoolDown(1, 1055);	--技能普通CD，入定和还魂CD一样，防止反复切换

	skill.nPrepareFrames = 48;				-- 吟唱帧数

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能	
	local scene = player.GetScene()
	if not scene then
		return SKILL_RESULT_CODE.FAILED
	end

	--防止通过/cast 出魂入定 重复使用技能
	if player.GetBuff(10827,1) then
		return SKILL_RESULT_CODE.FAILED
	end
		
	--大攻防
	if scene.bGongFangFightFlag == true then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
		player.SendSystemMessage(GetEditorString(10, 1910))
		return SKILL_RESULT_CODE.FAILED
	end

	--小攻防准备时间，此活动从小攻防前一小时开始，到小攻防结束时结束，直接判断这个就行
	if CastleFight.CheckPrepareTime() then		
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
			player.SendSystemMessage(GetEditorString(10, 1910))
			return SKILL_RESULT_CODE.FAILED
		end
	end
	if scene.dwMapID == 152 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
		player.SendSystemMessage(GetEditorString(10, 1910))
		return SKILL_RESULT_CODE.FAILED
	end
	local npc = scene.GetNpcByNickName(Identity_Wizard.BodyControlName)
	if npc then
		local nCount = npc.GetCustomUnsigned4(0)
		if nCount >= Identity_Wizard.BodyMaxCount then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6144), 5)
			player.SendSystemMessage(GetEditorString(10, 6144))
			return SKILL_RESULT_CODE.FAILED
		end
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
end

local tWizardData = {
	[1] = {nVisiableID = 2, time = 15},
	[2] = {nVisiableID = 3, time = 15},
	[3] = {nVisiableID = 4, time = 20},
	[4] = {nVisiableID = 5, time = 20},
	[5] = {nVisiableID = 5, time = 30},
}
function Apply(dwCharacterID, dwSkillSrcID)
	--留下肉身，进入灵魂世界
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
--[[	local GV = GetGameVersion()
	if GV and GV.VersionEx == "exp" then
		local scene = player.GetScene()
		local tMap = {
			[6] = 1,
			[150] = 1,
			[102] = 1,
			}
		if scene and not tMap[scene.dwMapID ] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "此处无法感应到魂灵的气息。", 5)
			player.SendSystemMessage("此处无法感应到魂灵的气息。")
			return
		end
	end--]]
	
	player.CastSkill(16713, 1)
	player.SetTimer(8, "scripts/skill/Quest/江湖百态/方士_出魂.lua", 0, 3)
	-- 
end

function OnTimer(player, nParam1, nParam2)
	--[[if not player.GetBuff(10827, 1) then
		return
	end--]]
	if nParam2 == 0 then		
		player.SetTimer(0.9 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_出魂.lua", nParam1, nParam2 + 1)
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowFullScreenSFX", "WIZARD_VISIABLE_OPEN")
		RemoteCallToClient(player.dwID, "SceneSfx", "Insert", {key = "WIZARD_VISIABLE_OPEN", sfxid = "WIZARD_VISIABLE_OPEN", px = -0.5, py = -0.2, pw = 2.0, ph = 1.4, loop = false})				

	elseif  nParam2 == 1 then
		--播放肉身的动作
		local body = GetNpc(nParam1)
		if body then 
			--body.DoAction(0, 60060)
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "enter camera Post render 2")
		--RemoteCallToClient(player.dwID, "EnableColorShift", true)
		local IdentifyManager = player.GetPlayerIdentityManager()
		if not IdentifyManager then
			return
		end
		if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then
			return
		end
		local Identity_MapID = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13)
		if scene.dwMapID ~= Identity_MapID then    --不在同一场景下
			return	
		end
		local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获得身份经验，转化成身份等级
		local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)               

		--player.SetIdentityVisiableID(tWizardData[nIdentifyLevel].nVisiableID)                                  --根据身份等级进入不同位面
		player.SetIdentityVisiableID(3)		
		--player.SetDynamicSkillGroup(264)	--切换动态技能栏
		RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3003)
		if player.bOnHorse then
			player.DownHorse()
		end
		if player.IsFollower() then
			player.FollowStop()
		end
		player.AddBuff(0, 99, 2587, 1)  --禁止上马BUFF
		--player.SetTimer(2.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_出魂.lua", nParam1, nParam2 + 1)
		--elseif  nParam2 == 2 then
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction","ShowFullScreenSFX","WIZARD_VISIABLE_KEEP")
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "SetBalloonGray", true)	-- 聊天泡泡变灰
		local nIndex = 1
		local tList = {
			[6] = 1,
			[150] = 2,
			[102] = 3,
			[193] = 4,
			[158] = 5,
		}
		if tList[scene.dwMapID] then
			nIndex = tList[scene.dwMapID]
		end
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "load custom environment " .. nIndex)	-- 改变天空盒
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "Play dynamicWeather 111")	-- 改变天气
		RemoteCallToClient(player.dwID, "OpenSpringCompass")	-- 关闭挖宝界面

		-- 关闭影子效果
		RemoteCallToClient(player.dwID, "Save3DOption", "IdentityWizard")	-- 先把玩家配置记录
		RemoteCallToClient(player.dwID, "Set3DOption", "ModelShadowType", 0)
		RemoteCallToClient(player.dwID, "Set3DOption", "bHighShadow", false)
	elseif nParam2 == 3 then
		if player.GetBuff(11177, 1) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6076), 5)
			player.SendSystemMessage(GetEditorString(10, 6077))
			player.ClearCDTime(1055)
			return
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		local IdentifyManager = player.GetPlayerIdentityManager()
		if not IdentifyManager then
			return
		end
		if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then
			return
		end
		local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获得身份经验，转化成身份等级
		local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
		local tMapList = {
			[6] = 1,
			[150] = 2,
			[102] = 3,
			[193] = 4,
			[158] = 5,
		}
		if not tMapList[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 5021), 5)
			player.ClearCDTime(1055)
			return
		end
		if nIdentifyLevel < tMapList[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 5022), 5)
			player.ClearCDTime(1055)
			return
		end
		local npc = scene.GetNpcByNickName(Identity_Wizard.BodyControlName)
		if npc then
			local nCount = npc.GetCustomUnsigned4(0)
			if nCount >= Identity_Wizard.BodyMaxCount then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6144), 5)
				player.SendSystemMessage(GetEditorString(10, 6144))
				return
			else
				npc.SetCustomUnsigned4(0, nCount + 1)
			end
		else
			npc = scene.CreateNpc(52910, 1, 1, 1, 0, - 1, Identity_Wizard.BodyControlName)
			npc.SetCustomUnsigned4(0, 1)
		end
		
		local tBodyID = {
			[ROLE_TYPE.STANDARD_FEMALE] = 51713,
			[ROLE_TYPE.LITTLE_GIRL] = 51714,
			[ROLE_TYPE.LITTLE_BOY] = 51715,
			[ROLE_TYPE.STANDARD_MALE] = 51506,
		}
		local nBodyID = 51506
		if tBodyID[player.nRoleType] then
			nBodyID = tBodyID[player.nRoleType]
		end
		local body = scene.CreateNpcWithEmployerID(nBodyID, player.nX, player.nY, player.nZ, player.nFaceDirection, (tWizardData[nIdentifyLevel].time * 60 + 2) * GLOBAL.GAME_FPS, player.dwID, false, 0)
		--scene.CreateNpc(51506, player.nX, player.nY, player.nZ, player.nFaceDirection, time * GLOBAL.GAME_FPS, "body" .. player.dwID)
		if body then
			body.SetRelationProxyID(player.dwID)                          --设置成主人的战斗关系
			body.SetNpcCopyRepresentByPlayerID(body.dwID, player.dwID)   --肉身设置成玩家形象
			body.CopyPlayerRelatedNpcAttrParam(player.dwID)               --设置成主人的属性	
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_出魂.lua", body.dwID, 0)  --延迟播放肉身的打坐动作，否则播不出来
			body.SetCustomInteger4(1, player.dwID) 					     --存储玩家ID
			body.AddBuff(0, 99, 11176, 1)
			--if player.bCampFlag then
			if player.nCamp == CAMP.EVIL then
				body.SetForceID(49)
			elseif player.nCamp == CAMP.GOOD then
				body.SetForceID(50)
			end
			--end
			--body.AddBuff(player.dwID, player.nLevel, 10857, 1)                                 --客户端同步标记BUFF，给程序标记用。
			player.AddBuff(player.dwID, player.nLevel, 10826, 1)       						 --禁止传送
			player.AddBuff(player.dwID, player.nLevel, 10827, 1, tWizardData[nIdentifyLevel].time)  	     --灵魂状态标记
			player.AddBuff(player.dwID, player.nLevel, 11494, 1, tWizardData[nIdentifyLevel].time)  	     --灵魂状态透明度buff
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "PlayBgMusic", GetEditorString(10, 2197), 0, 1)  --更换背景音乐，并且不会被替换
			--RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
			--------------坐标记录到身份变量里---------
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, player.nX)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, player.nY)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, player.nZ)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, scene.dwMapID)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, player.nFaceDirection) 
	
			--教学任务
			local tQuestId = {15459, 15460, 15461}
			for _, nQuestId in pairs(tQuestId) do
				local nQuestIndex = player.GetQuestIndex(nQuestId)
				local nQuestPhase = player.GetQuestPhase(nQuestId)
				if nQuestIndex and nQuestPhase == 1 then
					player.SetQuestValue(nQuestIndex, 0, 1)
				end
			end
			local nQuestId_15459 = 15459
			local nQuestIndex_15459 = player.GetQuestIndex(nQuestId_15459)
			local nQuestPhase_15459 = player.GetQuestPhase(nQuestId_15459)
			if nQuestIndex_15459 and nQuestPhase_15459 == 1 then
				player.SetQuestValue(nQuestIndex_15459, 1, 1)
			end
			local nQuestId_15461 = 15461
			local nQuestIndex_15461 = player.GetQuestIndex(nQuestId_15461)
			local nQuestPhase_15461 = player.GetQuestPhase(nQuestId_15461)
			if nQuestIndex_15461 and nQuestPhase_15461 == 1 then
				if player.dwLastScriptID == GetFileNameHash("scripts/Map/江湖百态/方士/trap/活人却被逝者扰.lua") then
					player.SetQuestValue(nQuestIndex_15461, 1, 1)
				end
			end
		end
		--有宠物则删除
		local dwPetId = player.dwPetID
		local npc_pet = GetNpc(player.dwFellowPetID)
		if npc_pet then	
			npc_pet.SetDisappearFrames(1)
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
		end
		--召唤魂灵状态下的NPC跟宠，有“戏参北斗”宠物，则召唤NPC
		if player.IsFellowPetAcquired(208) then
			local npcLight = scene.GetNpcByNickName("IdentityWizardLight" .. player.dwID)
			if not npcLight then
				local tLight = {
					[1] = 51726,
					[2] = 51926,
					[3] = 51927,
					[4] = 51928,
					[5] = 51928,
				}
				npcLight = scene.CreateNpc(tLight[nIdentifyLevel], player.nX, player.nY, player.nZ, player.nFaceDirection, -1, "IdentityWizardLight" .. player.dwID)
				npcLight.SetCustomUnsigned4(0, player.dwID)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
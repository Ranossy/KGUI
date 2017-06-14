---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_秋千2.lua
-- 更新时间:	2017/2/9 20:19:06
-- 更新用户:	FENGMENGJIE-PC
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
print(123)
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/背挂_秋千2.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 1177);
	print(234)
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 20294 then
		return false
	end
	print(345)
	return nPreResult;	
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end

	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 20294 then
		return
	end

	--剑舞删除
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local buff1 = player.GetBuff(10014, 1)
	if buff1 then
		player.SendSystemMessage(GetEditorString(10, 5165))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 5166), 4)
		return
	end

	local npc = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
	if npc then
		player.SendSystemMessage(GetEditorString(10, 1210))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1272), 4)
		return
	else
		player.ClearCDTime(1177)
		player.DoCustomOTAction(0, 1, GLOBAL.GAME_FPS * 1, TARGET.PLAYER, player.dwID, "scripts/skill/装备/挂件相关/背挂_秋千2.lua", GetEditorString(10, 1312))

		local scene = player.GetScene()
		scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_1" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_2" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_3" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_4" .. player.dwID)

		--	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/背挂_秋千.lua", 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnCustomEvent(player, target)

	local scene = player.GetScene()
	if not scene then
		return
	end

	local szName1 = "FXF_JC_1" .. player.dwID
	local szName2 = "FXF_JC_2" .. player.dwID
	local szName3 = "FXF_JC_3" .. player.dwID
	local szName4 = "FXF_JC_4" .. player.dwID
	local npc1 = scene.GetNpcByNickName(szName1)
	local npc2 = scene.GetNpcByNickName(szName2)
	local npc3 = scene.GetNpcByNickName(szName3)
	local npc4 = scene.GetNpcByNickName(szName4)
	if npc1 and npc2 and npc3 and npc4 then
		local tZ_yutou = {
			npc1.nZ,
			npc2.nZ,
			npc3.nZ,
			npc4.nZ,
			player.nZ,
		}
		table.sort(tZ_yutou)
		local nNum = math.abs(tZ_yutou[5] - tZ_yutou[1])
		if nNum >= 150 then
			--崎岖，不处理
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1273), 4)
			return
		else

			--	player.AddBuff(0, 99, 10822, 1)
			player.PlaySfx(1087, 0, 0, 0)

			if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 379 then
				player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
			end

			--创建NPC--秋千
			local npc_Q = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
			if not npc_Q then
				scene.CreateNpc(55599, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * 3, "QIUQ_fxf0124" .. player.dwID)
			end

			--创建NPC--花树
			local npc_T = scene.GetNpcByNickName("QIUT_fxf0124" .. player.dwID)
			if not npc_T then
				scene.CreateNpc(55598, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * 3, "QIUT_fxf0124" .. player.dwID)
			end

			player.AddBuff(0, 99, 11687, 1)
			player.AddBuff(0, 99, 11686, 1)
			local buff_fj = player.GetBuff(11688, 1)--副驾
			if buff_fj then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1304), 4)
				return
			end

			local tCheckBuffList = {7049, 7525, 7561, 9982} --小攻防buff
			for _, v in pairs(tCheckBuffList) do
				if player.GetBuff(v, 0) then
					RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(9, 111), "yellow")
					return
				end
			end

			if player.dwModelID ~= 0 then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 455), 4)
				return
			end

			if player.bOnHorse then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 453), 4)
				return
			end

			if player.bFightState then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 454), 4)
				return
			end

			if player.nMoveState ~= MOVE_STATE.ON_STAND then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 455), 4)
				return
			end

			local npc_T = scene.GetNpcByNickName("QIUT_fxf0124" .. player.dwID)
			if npc_T then
				npc_T.SetDisappearFrames(16 * 420, 0)
				npc_T.SetCustomUnsigned4(0, player.dwID)
			end
			
			local npc_Q = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
			if npc_Q then
				player.ResetCD(1177)
				npc_Q.SetDisappearFrames(16 * 420, 0)
				npc_Q.SetCustomUnsigned4(0, player.dwID)
				npc_Q.SetPlayerToSocket(0, player.dwID)
				npc_Q.AddBuff(0, 99, 11689, 1, 1000)

				if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
					player.SetDynamicSkillGroup(325)
				elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
					player.SetDynamicSkillGroup(324)
				elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
					player.SetDynamicSkillGroup(325)
				else
					player.SetDynamicSkillGroup(324)
				end
			end
			------------------------------
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
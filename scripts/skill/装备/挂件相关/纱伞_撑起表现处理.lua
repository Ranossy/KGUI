---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/纱伞_撑起表现处理.lua
-- 更新时间:	2015/7/29 16:20:29
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

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
		"skill/装备/挂件相关/纱伞_撑起表现处理.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 931);

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
	if player.dwBackItemIndex ~= 13914 and player.dwBackItemIndex ~= 19196 and player.dwBackItemIndex ~= 19256 then --增加限时版判断
		return false
	end
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

	--  修改前
	--if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD or scene.dwMapID == 25 or scene.dwMapID == 27 then
		--player.SendSystemMessage("当前场景不可使用。")
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "当前场景不可使用", 4)
		--return 
	--end
	-- 修改后
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end
	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 13914 and player.dwBackItemIndex ~= 19196 and player.dwBackItemIndex ~= 19256 then --增加限时版判断
		return
	end
	
	--剑舞删除
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(8, 446))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 446), 4)
		return
	else
		--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)  --卸下背部挂件
		--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 13126)
--		player.AddBuff(0, 99, 8640, 1, 10) --监控
		--	player.AddBuff(0, 99, 7194, 1) --CD
		local scene = player.GetScene()
		scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_1_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_2_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_3_" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_4_" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/纱伞_撑起表现处理.lua", 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nParam1 == 0 then
		local szName1 = "YUTOU_DZ_1_" .. player.dwID
		local szName2 = "YUTOU_DZ_2_" .. player.dwID
		local szName3 = "YUTOU_DZ_3_" .. player.dwID
		local szName4 = "YUTOU_DZ_4_" .. player.dwID
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
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.ClearCDTime(931)
				return
			else
				--创建NPC
				scene.CreateNpc(44133, player.nX, player.nY, player.nZ, player.nFaceDirection, 100 * 16, "ss_yt150813_" .. player.dwID)
				
				local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
				end

				--去除手持，在添加背挂表现处有判断NPC存在与否，存在则不处理添加表现伞到背后，在此备注scripts/skill/技能道具/师徒系统_伞挂件14.lua
				player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
				local buff_san = player.GetBuff(1575, 0)
				if buff_san then
					player.DelBuff(1575, buff_san.nLevel)
				end
				return
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
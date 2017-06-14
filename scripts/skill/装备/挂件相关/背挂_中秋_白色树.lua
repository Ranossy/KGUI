---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_中秋_白色树.lua
-- 更新时间:	2016/9/12 17:53:25
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/背挂_中秋_白色树.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16); -- 公共CD 1.5秒

	skill.SetNormalCoolDown(1, 1120); -- 技能普通CD

	----------------- 经验升级相关 ---------------------------------------------
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE; -- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE; -- 技能施放的最大距离
	----------------- 作用范围 -------------------------------------------------
	-- skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	-- skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	-- skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256; -- 攻击范围的扇形角度范围
	-- skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	-- skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult) -- 判断玩家的状态，以判断是否可以发出技能
	if player.dwBackItemIndex ~= 19081 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return SKILL_RESULT_CODE.FAILED
	end

	if player.dwModelID ~= 0 then -- 检查是不是换装了
		return SKILL_RESULT_CODE.FAILED
	end

	local scene = player.GetScene()
	if scene.dwMapID ~= 258  then
		return SKILL_RESULT_CODE.FAILED
	end
	
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	local scene = player.GetScene()
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	if player.dwBackItemIndex ~= 19081 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end

	--删除剑舞---
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local nH = ((player.nFaceDirection + 10) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT = player.nX + (3 * 64) * math.cos(nH)
	local dwY_POINT = player.nY + (3 * 64) * math.sin(nH)

	local scene = player.GetScene()

	local  npcX = scene.GetNpcByNickName("rabbit_fxf1609_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(10, 5929))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 5929), 4)
		return
	else

		scene.CreateNpc(41160, dwX_POINT, dwY_POINT, player.nZ, 0, 16 * 2, "FXF_JC_160901" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_160902" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_160903" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_160904" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/背挂_中秋_白色树.lua", 0, 0)
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
		local szName1 = "FXF_JC_160901" .. player.dwID
		local szName2 = "FXF_JC_160902" .. player.dwID
		local szName3 = "FXF_JC_160903" .. player.dwID
		local szName4 = "FXF_JC_160904" .. player.dwID
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
				player.ClearCDTime(1120)
				return
			else
				local nH = ((player.nFaceDirection + 10) / 256 * 360) / 360 * 2 * 3.1415926
				local dwX_POINT_T = player.nX + (3 * 64) * math.cos(nH)
				local dwY_POINT_T = player.nY + (3 * 64) * math.sin(nH)

				--创建NPC--跷跷板
				scene.CreateNpc(52769, dwX_POINT_T, dwY_POINT_T, player.nZ, player.nFaceDirection, 60 * 16, "rabbit_fxf1609_" .. player.dwID)
				local npcX = scene.GetNpcByNickName("rabbit_fxf1609_" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
					npcX.SetModelID(54569)
				end
				
				--创建NPC--树
				scene.CreateNpc(52707, dwX_POINT_T, dwY_POINT_T, player.nZ, player.nFaceDirection, 60 * 16, "tree_fxf1609_" .. player.dwID)
				local npcY = scene.GetNpcByNickName("tree_fxf1609_" .. player.dwID)
				if npcY then
					npcY.SetCustomUnsigned4(0, player.dwID)
					npcY.SetModelID(54568)
				end
				
				player.AddBuff(0, 99, 11173, 1, 65)

				if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 355 then
					player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
				end
			end
		end
	end
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
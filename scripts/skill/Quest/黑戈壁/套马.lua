---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/黑戈壁/套马.lua
-- 更新时间:	2015/10/20 16:57:53
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/黑戈壁/套马.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	--skill.nPrepareFrames  	= 160;				-- 吟唱帧数
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 11 * LENGTH_BASE;		-- 技能施放的最大距离

	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 3 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 35;
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

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
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.NPC then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 4839), 4)
		player.SendSystemMessage(GetEditorString(8, 4839))
		return
	end

	local target = GetNpc(dwTargetID)
	if not target then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 1307), 3)
		player.SendSystemMessage(GetEditorString(8, 2789))
		return
	end

	if target.dwTemplateID ~= 47021 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 4839), 4)
		player.SendSystemMessage(GetEditorString(8, 4839))
		return
	end
	if target.bFightState then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7469), 4)
		player.SendSystemMessage(GetEditorString(7, 7469))
		return
	end

	if target.GetCustomInteger1(1) > 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 8307), 4)
		player.SendSystemMessage(GetEditorString(8, 8307))
		return
	end

	player.TurnToCharacter(target.dwID)
	local nQuestID = 14595   --奔马且代步
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, 1)
		local scene = player.GetScene()
		if not scene then
			return
		end
		local npc = scene.GetNpcByNickName("beizhuayema" .. player.dwID)
		if npc then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 8308), 4)
			player.SendSystemMessage(GetEditorString(8, 8308))
			return
		end

		local newnpc = scene.CreateNpc(48078, target.nX, target.nY, target.nZ, target.nFaceDirection, 300 * GLOBAL.GAME_FPS, "beizhuayema" .. player.dwID)  --非私有NPC
		if newnpc then
			newnpc.SetCustomUnsigned4(0, player.dwID)
			newnpc.SetModelID(target.dwModelID + 1082)  --3中表现都是对应的连续ID，直接加上差数
			target.SetDisappearFrames(16, 1)
			target.SetCustomInteger1(1, 1)
			player.SetQuestValue(nQuestIndex, 1, target.dwID)
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.AddBuff(0, 99, 10142, 1, 300)
			target.DoAction(0, 10054)
		end
		--[[
		if player.CanAddItem(ITEM_TABLE_TYPE.OTHER, 25756) then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 25744, 1)
			player.AddItem(ITEM_TABLE_TYPE.OTHER, 25756, 1)
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "背包已满，无法获得道具。", 4)
			player.SendSystemMessage("背包已满，无法获得道具。")
		end
		--]]
	end
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
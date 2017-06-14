---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/黑戈壁/水龙滚.lua
-- 更新时间:	2015/9/17 15:21:54
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
		"skill/Quest/黑戈壁/水龙滚.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒

	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离

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
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2788), 4)
		player.SendSystemMessage(GetEditorString(8, 2788))
		return
	end

	local target = GetNpc(dwTargetID)
	if not target then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 1307), 3)
		player.SendSystemMessage(GetEditorString(8, 2789))
		return
	end

	if target.dwTemplateID ~= 45949 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2788), 4)
		player.SendSystemMessage(GetEditorString(8, 2788))
		return
	end

	local nValue_buffid = 9817
	local nValue_bufflv = 1
	local buff_tx = target.GetBuff(nValue_buffid, nValue_bufflv)
	if buff_tx then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2790), 4)
		player.SendSystemMessage(GetEditorString(8, 2790))
		return
	end

	if GetCharacterDistance(player.dwID, target.dwID) <= 255 then		-- 4尺
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3270), 4)
		player.SendSystemMessage(GetEditorString(0, 3270))
		return
	end

	if GetCharacterDistance(player.dwID, target.dwID) >= 64 * 20 then		-- 20尺
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3267), 4)
		player.SendSystemMessage(GetEditorString(0, 3267))
		return
	end

	--if target.nMoveState ~= MOVE_STATE.ON_STAND then
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "只能对站立静止的目标使用。", 4)
	--player.SendSystemMessage("只能对站立静止的目标使用。")
	--return
	--end

	if target.bFightState then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7469), 4)
		player.SendSystemMessage(GetEditorString(7, 7469))
		return
	end

	player.TurnToCharacter(target.dwID)
	player.CastSkill(14038, 1) --用于触发表现
	--target.AddBuff(player.dwID, player.nLevel, nValue_buffid, nValue_bufflv)
	player.SetTimer(3 * 16, "scripts/skill/Quest/黑戈壁/水龙滚.lua", 0, target.dwID)
	--目标处理
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
---[[
function OnTimer(player, nParam1, nParam2)
	local npc = GetNpc(nParam2)
	if not npc then
		return
	end
	if npc.GetBuff(9817, 1) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2795), 4)
		player.SendSystemMessage(GetEditorString(8, 2795))
		
    	return
    end
	npc.AddBuff(player.dwID, player.nLevel, 9817, 1)

end
--]]
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
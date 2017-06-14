---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/水枪的水弹技能.lua
-- 更新时间:	2015/7/1 1:45:23
-- 更新用户:	zhangyan3
-- 脚本说明:
--[[
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
--]]
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
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
		"skill/装备/挂件相关/水枪的水弹技能.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒

	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end
	--检查水量
	--获取水量-----------------------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	---------------------------------------------------------------
	if nValue_SHUILIANG < 20 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7466), 4)
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
	
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.PLAYER then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7467), 4)
		player.SendSystemMessage(GetEditorString(7, 7467))	
		return
	end
	if dwTargetID == player.dwID then
		return
	end
	local target = GetPlayer(dwTargetID)	
	if not target then
		return
	end
	
	local nValue_buffid = 961
	local nValue_bufflv = 1
	local buff_tx = target.GetBuff(nValue_buffid, nValue_bufflv)
	if buff_tx then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 283), 4)
		player.SendSystemMessage(GetEditorString(8, 283))
		return
	end

	if target.GetBuff(10970, 1) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end

	if target.GetBuff(11638, 1) then -- 郭萌萌直播屏蔽骚扰
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end
	
	if GetCharacterDistance(player.dwID, target.dwID) <= 255 then		-- 4尺
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3270), 4)
		player.SendSystemMessage(GetEditorString(0, 3270))
		return
	end
	
	if GetCharacterDistance(player.dwID, target.dwID) >= 64 * 20 then		-- 10尺
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
	
	if target.bOnHorse then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7470), 4)
		player.SendSystemMessage(GetEditorString(7, 7470))
		return
	end
--交通处理----
	if target.nMoveState == MOVE_STATE.ON_AUTO_FLY then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end

	if target.nMoveState == MOVE_STATE. ON_START_AUTO_FLY then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end
	----------------------------
	local nValue_XIAOHAO = 20
	--减水量---------------------------------------------------------------------------
	--获取水量---------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	------------------------------------------------
	if nValue_SHUILIANG < nValue_XIAOHAO then
		return
	end
	local nValue_NOW = nValue_SHUILIANG - nValue_XIAOHAO
	if nValue_NOW == 0 then
		player.DelBuff(nValue_buffid, 1)
	elseif nValue_NOW > 0 then
		player.DelBuff(nValue_buffid, 1)
		-----------------
		--水量转buff
		local nBuff_NOW = nValue_NOW / 20 - 1 + 9093
		if nBuff_NOW >= 9093 and nBuff_NOW <= 9102 then
			player.AddBuff(0, 99, nBuff_NOW, 1)
		end
		-----------------
	end
	-------------------------------------------------------------------------------------------
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7887), 3)
	player.TurnToCharacter(target.dwID)
	player.CastSkill(14038, 1) --用于触发表现
	target.SetTimer(3 * 16, "scripts/skill/装备/挂件相关/水枪的水弹技能.lua", 0, 0)
	--目标处理
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)

	if player.bFightState then
		return
	end
	
	if player.bOnHorse then
		return
	end
	--交通处理--
	if player.nMoveState == MOVE_STATE.ON_AUTO_FLY then
		return
	end

	if player.nMoveState == MOVE_STATE.ON_START_AUTO_FLY then
		return
	end
	------------
	player.Stop()
	player.AddBuff(0, 99, 9154, 1)--目标加效果
	player.Jump(1,0)
	local scene = player.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 74 or scene.nType == MAP_TYPE.DUNGEON then
		player.AddBuff(0, 99, 9168, 1)--目标加效果
	end
	
	if scene.dwMapID == 222 or scene.dwMapID == 200 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(7, 7913), 3)
		player.AddBuff(0, 99, 8936, 1, 600)--目标加效果
	end
	----------------------------
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
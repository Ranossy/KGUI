---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/水长生_青金莲.lua
-- 更新时间:	2015/7/1 1:40:28
-- 更新用户:	zhangyan3
-- 脚本说明:
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
		"skill/装备/挂件相关/水长生_青金莲.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒

	skill.SetNormalCoolDown(1, 871)							-- 装水3分CD
	
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if player.dwBackItemIndex ~= 13906 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	if player.dwModelID ~= 0 then -- 检查是不是换装了
		return false
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	if player.bFightState then
		return false
	end

	if player.bOnHorse then
		return false
	end
	if player.dwIdentityVisiableID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
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

	if player.dwBackItemIndex ~= 13906 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end

	for i = 1, 100 do
		player.DelGroupBuff(409, i)--剑舞删除
	end

	local scene = player.GetScene()

	--------------------------下面是移植过来的老的召唤流程--------------------------
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(0, 1399), 4)
		player.SendSystemMessage(GetEditorString(0, 112))
		return
	end

	if scene.nType == MAP_TYPE.BATTLE_FIELD then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	local dwMapID = scene.dwMapID

	---------------------
	--换动作和处理动态技能栏切换
	player.AddBuff(0, 99, 9153, 1)
	player.Jump(1,0)
	---------------------
	--local buff_zhuren = player.GetBuff(8660, 1)
	--if buff_zhuren then
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "已经打开一顶帐篷。", 4)
	--player.SetDynamicSkillGroup(184)
	--return
	--end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
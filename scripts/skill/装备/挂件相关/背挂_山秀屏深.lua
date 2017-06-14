---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/背挂_山秀屏深.lua
-- 更新时间:	2017/5/27 15:19:10
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/背挂_山秀屏深.lua",
		0
	);

	skill.SetPublicCoolDown(938);
	skill.SetNormalCoolDown(1, 1218);

	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)
	if dwRepresentID ~= 398 then
		return false
	end

	--检查换装
	if player.dwModelID ~= 0 then
		return false
	end
	--检查状态
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	--检查战斗
	if player.bFightState then
		return false
	end
	--检查乘骑
	if player.bOnHorse then
		return false
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--
	for i = 1, 100 do
		player.DelGroupBuff(409, i)--剑舞删除
	end
	--

	player.ApplyDoEmotionAction(105)--表情动作ID
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
-------------------------------------------------------
--【玩家表现相关判断】BY鱼头

--判断道具的表现ID
--dwRepresentID = player.GetRepresentID(nRepresentIndex)
--EQUIPMENT_REPRESENT.FACE_EXTEND		--面
--EQUIPMENT_REPRESENT.BACK_EXTEND   	--背
--EQUIPMENT_REPRESENT.WAIST_EXTEND   	--腰
--EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND	--左肩
--EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND	--左肩
--EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND	--背（披风）
--EQUIPMENT_REPRESENT.CHEST_STYLE			--外装

-- 检查是不是装了挂件，判断道具ID
-- 背部道具用 player.dwBackItemIndex
-- 面部道具用 player.dwFaceItemIndex
-- 腰部道具用 player.dwWaistItemIndex
------------------------------------------------------------
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
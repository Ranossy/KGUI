---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/鹤梅_收起.lua
-- 更新时间:	2015/11/27 11:21:21
-- 更新用户:	FENGMENGJIE
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
		"skill/装备/挂件相关/鹤梅_收起.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 1014);

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

	if player.GetDynamicSkillGroup() == 231 then
		player.SetDynamicSkillGroup(0)
	end

	local scene = player.GetScene()

	local npc = scene.GetNpcByNickName("xh_fxf1127_" .. player.dwID)
	if npc then
		npc.SetDisappearFrames(1, 0)
	end

	if player.dwBackItemIndex == 16872 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 315)
	end

	player.AddBuff(0, 99, 1593, 1, 1) --驱除所有换模、换动作的Buff
	local buff_san = player.GetBuff(1575, 0)
	if buff_san then
		player.DelBuff(1575, buff_san.nLevel)
	end
	local buff = player.GetBuff(10276, 1)
	if buff then
		player.DelBuff(10276, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
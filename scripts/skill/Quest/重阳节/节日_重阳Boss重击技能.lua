---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/重阳节/节日_重阳Boss重击技能.lua
-- 更新时间:	2014/9/11 15:55:24
-- 更新用户:	renjei1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 23989 * 0.8, nDamageRand = 23989 * 0.4, nCostMana = 0}, --level 1
	{nDamageBase = 23989 * 0.8, nDamageRand = 23989 * 0.4, nCostMana = 0}, --level 2
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 3
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 4
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 5
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 6
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 7
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 8
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 9
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	----------------- 魔法属性 -------------------------------------------------
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
	--tSkillData[dwSkillLevel].nDamageBase * 0.14,
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nDamageRand * 0.14,
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
	--0,
	--0
	--);
skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.KNOCKED_DOWN_RATE,
		2048,
		0
	);

	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
		80,
		0
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.REPULSED_RATE,
	--1024,
	--0
	--);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_REPULSED,
	--18,
	--0
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/重阳节/节日_重阳Boss重击技能.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(2429,	1,	BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2242, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nHeight = 1 * LENGTH_BASE;         -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	skill.nAreaRadius = 17 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 30;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames = ;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数w
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
function Apply(dwCharacterID, dwSkillSrcId)
	--print("Apply")
	local playerT = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwSkillSrcId)
	if not npc then
		return
	end
	playerT.CustomDamage(npc.dwID, 13031, 1, 0, playerT.nMaxLife * 0.15)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
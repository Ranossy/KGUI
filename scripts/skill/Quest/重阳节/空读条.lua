---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/重阳节/空读条.lua
-- 更新时间:	2014/9/21 19:27:21
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

	----------------- 施放距离 -------------------------------------------------

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 24 ;				-- 吟唱帧数
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

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
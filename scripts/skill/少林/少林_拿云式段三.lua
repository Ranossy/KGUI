---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_拿云式段三.lua
-- 更新时间:	2014/6/30 19:28:20
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  韦陀献杵段1.lua
-- 创建人    :  陈翰林
-- 创建时间  :  2008-07-18
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  罗汉棍法
-- 技能名称  :  韦陀献杵
-- 技能效果  :  根据聚气对目标造成外功伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 346 * 0.95, nDamageRand = 346 * 0.1}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 370 * 0.95, nDamageRand = 370 * 0.1}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 394 * 0.95, nDamageRand = 394 * 0.1}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 418 * 0.95, nDamageRand = 418 * 0.1}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 442 * 0.95, nDamageRand = 442 * 0.1}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 466 * 0.95, nDamageRand = 466 * 0.1}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 490 * 0.95, nDamageRand = 490 * 0.1}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 514 * 0.95, nDamageRand = 514 * 0.1}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 538 * 0.95, nDamageRand = 538 * 0.1}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 562 * 0.95, nDamageRand = 562 * 0.1}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 586 * 0.95, nDamageRand = 586 * 0.1}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 610 * 0.95, nDamageRand = 610 * 0.1}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 634 * 0.95, nDamageRand = 634 * 0.1}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 658 * 0.95, nDamageRand = 658 * 0.1}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 682 * 0.95, nDamageRand = 682 * 0.1}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 706 * 0.95, nDamageRand = 706 * 0.1}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 730 * 0.95, nDamageRand = 730 * 0.1}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 754 * 0.95, nDamageRand = 754 * 0.1}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 778 * 0.95, nDamageRand = 778 * 0.1}, -- Level 19
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
		);
	--]]

	--拿云三豆高血量
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CAST_SKILL,
		13685, 
		dwSkillLevel
		);
	--拿云三豆低血量
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CAST_SKILL,
		13686, 
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/3豆回1豆.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/少林_拿云式段三.lua", -- 属性值1
		0														-- 属性值2
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 1928, 3);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= 0;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离
	skill.nMaxRadius = 9 * LENGTH_BASE;					-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	skill.nChannelInterval = 260;			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	nWeaponDamagePercent = 1024;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetSkillLevel(9299) == 1 then
		player.AddBuff(player.dwID,player.nLevel,7981,1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
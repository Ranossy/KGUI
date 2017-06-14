---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_点穴截脉_阳明指10%会心伤害.lua
-- 更新时间:	2015/9/27 21:27:28
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 5, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 5, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 5, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, nDamageRand = 5, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, nDamageRand = 5, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 5, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, nDamageRand = 5, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 5, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 10, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 11, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 12, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 13, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 83, nDamageRand = 14, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 15, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86, nDamageRand = 16, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 90, nDamageRand = 17, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, nDamageRand = 18, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 98, nDamageRand = 19, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 102, nDamageRand = 20, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, nDamageRand = 21, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 110, nDamageRand = 22, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 23, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, nDamageRand = 24, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, nDamageRand = 25, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 135, nDamageRand = 26, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 27, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155, nDamageRand = 28, }, -- Level 28
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE, -- 魔法属性
		1500, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,
		153,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase * (1 - tPit[dwSkillLevel].nReducePercent), -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent), -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0																-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 花间AP加成
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1116,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		2726, -- 属性值1
		1																	-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_点穴截脉_阳明指正常伤害.lua",
		0
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 175);
	--skill.SetCheckCoolDown(1, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- 吟唱帧数  09年6月27改为32 ——CBG
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.365*1.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 4) * 1.365*1.2
	else
		skill.nChannelInterval = 130 * 1.365*1.2;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 130; 				-- 通道技间隔时间
	--skill.nMinChannelInterval = 1;
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 85;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
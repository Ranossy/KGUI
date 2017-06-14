------------------------------------------------
-- 文件名    :  神农洇_战场BOSS_大毒尸_剧毒喷溅.lua
-- 创建人    : CBG
-- 创建时间  :  2009-6-18
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  对周围半径20米内目标造成20398点毒伤害，无视防御力。

------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1251 *0.8/10 , nDamageRand = 1251 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 1		0-4
	{nDamageBase = 2120 *0.8/10 , nDamageRand = 2120 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 2},		--level 2		5-9
	{nDamageBase = 3041 *0.8/10 , nDamageRand = 3041 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 3},		--level 3		10-14
	{nDamageBase = 4425 *0.8/10 , nDamageRand = 4425 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 4		15-19
	{nDamageBase = 5809 *0.8/10 , nDamageRand = 5809 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 5		20-24
	{nDamageBase = 7992 *0.8/10 , nDamageRand = 7992 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 6		25-29
	{nDamageBase = 9529 *0.8/10 , nDamageRand = 9529 *0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 7		30-34
	{nDamageBase = 11067*0.8/10 , nDamageRand = 11067*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 8		35-39
	{nDamageBase = 12604*0.8/10 , nDamageRand = 12604*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 9		40-44
	{nDamageBase = 14142*0.8/10 , nDamageRand = 14142*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 10		45-49
	{nDamageBase = 15679*0.8/10 , nDamageRand = 15679*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 11		50-54
	{nDamageBase = 17217*0.8/10 , nDamageRand = 17217*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 12		55-59
	{nDamageBase = 18754*0.8/10 , nDamageRand = 18754*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 13		60-64
	{nDamageBase = 20292*0.8/10 , nDamageRand = 20292*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 14		65-69
	{nDamageBase = 21829*0.8/10 , nDamageRand = 21829*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 15		70-74
	{nDamageBase = 23367*0.8/10 , nDamageRand = 23367*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 16		75-79
	{nDamageBase = 24904*0.8/10 , nDamageRand = 24904*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 17		80-84
	{nDamageBase = 26442*0.8/10 , nDamageRand = 26442*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 18		85-89
	{nDamageBase = 27979*0.8/10 , nDamageRand = 27979*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 19		90-94
	{nDamageBase = 29516*0.8/10 , nDamageRand = 29516*0.4/10, nCostMana = 38,	nBuffID = 846,	nBuffLevel = 1},		--level 20		95-99	
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0, 
		0
	);

    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
    --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetCoolDown(1, 16);						-- 公共CD 1.5秒
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 8 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit	= 32;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
    ----------------- 阵法相关 -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- 是否阵眼技能
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
    --skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
    ----------------- 目标血量需求 ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 自身血量需求 ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 打断相关 -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
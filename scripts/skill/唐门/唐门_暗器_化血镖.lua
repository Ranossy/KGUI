------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2011-08-12
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 28 * 0.95, nDamageRand = 28 * 0.1, nCostMana = 147},		--level 1
	{nDamageBase = 42 * 0.95, nDamageRand = 42 * 0.1, nCostMana = 220},		--level 2
	{nDamageBase = 56 * 0.95, nDamageRand = 56 * 0.1, nCostMana = 327},		--level 3
	{nDamageBase = 70 * 0.95, nDamageRand = 70 * 0.1, nCostMana = 409},		--level 4
	{nDamageBase = 84 * 0.95, nDamageRand = 84 * 0.1, nCostMana = 490},		--level 5
	{nDamageBase = 98 * 0.95, nDamageRand = 98 * 0.1, nCostMana = 572},		--level 6
	{nDamageBase = 112* 0.95, nDamageRand = 112* 0.1, nCostMana = 654},	--level 7
	{nDamageBase = 171 * 0.95, nDamageRand = 171 * 0.1, nCostMana = 731}, --level 8
	{nDamageBase = 228 * 0.95, nDamageRand = 228 * 0.1, nCostMana = 147},		--level 9
	{nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, nCostMana = 220},		--level 10
	{nDamageBase = 256 * 0.95, nDamageRand = 256 * 0.1, nCostMana = 327},		--level 11
	{nDamageBase = 270 * 0.95, nDamageRand = 270 * 0.1, nCostMana = 409},		--level 12
	{nDamageBase = 284 * 0.95, nDamageRand = 284 * 0.1, nCostMana = 490},		--level 13
	{nDamageBase = 298 * 0.95, nDamageRand = 298 * 0.1, nCostMana = 572},		--level 14
	{nDamageBase = 312* 0.95, nDamageRand = 312* 0.1, nCostMana = 654},	--level 15
	{nDamageBase = 371 * 0.95, nDamageRand = 371 * 0.1, nCostMana = 731}, --level 16
	{nDamageBase = 428 * 0.95, nDamageRand = 428 * 0.1, nCostMana = 147},		--level 17
	{nDamageBase = 442 * 0.95, nDamageRand = 442 * 0.1, nCostMana = 220},		--level 18
	{nDamageBase = 456 * 0.95, nDamageRand = 456 * 0.1, nCostMana = 327},		--level 19
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
 
   	skill.AddAttribute(													-- 迷心蛊触发
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- 属性作用模式
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- 魔法属性
 		3125,												--属性值1
 		dwSkillLevel										--属性值2
 		);

   	skill.AddAttribute(													-- 枯残蛊触发
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- 属性作用模式
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- 魔法属性
 		3126,												--属性值1
 		dwSkillLevel										--属性值2
 		);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(10130, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
    --skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 女娲补天不能用
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2509, dwSkillLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    -- 公共CD
    skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
    -- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 400);
	--skill.SetNormalCoolDown(1, 974);	--技能普通CD
    skill.SetCheckCoolDown(1, 444);
	skill.SetCheckCoolDown(2, 974);	--只检查不走的CD
   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
  	skill.nCostEnergy		= 20;							-- 技能消耗的能量
    --skill.nCostStamina	= 0;									-- 技能消耗的体力
    --skill.nCostItemType	= 0;									-- 技能消耗的物品类型
    --skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
    --skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/8)*329;	-- 技能消耗的内力
    ----------------- 聚气相关 -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- 技能是否需要聚气
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- 链状技能相关 ---------------------------------------------
    --skill.nChainBranch	= 1;					--链状技能分支数
    --skill.nChainDepth		= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    ----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- 吟唱帧数
    --skill.nChannelInterval	= 24; 				-- 通道技间隔时间 
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
    --skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=
    
    ----------------- 打退打断落马相关 -------------------------------------------------
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3835)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
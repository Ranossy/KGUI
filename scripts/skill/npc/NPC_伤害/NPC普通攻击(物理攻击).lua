------------------------------------------------
-- 文件名    :  NPC普通攻击(物理攻击).lua
-- 创建人    :  CBG
-- 创建时间  :  2008-12-31
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  杀GiGi！
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 37  *0.8, nDamageRand = 37  *0.4, nCostMana = 0},		--level 1 
	{nDamageBase = 63  *0.8, nDamageRand = 63  *0.4, nCostMana = 0},		--level 2 
	{nDamageBase = 90  *0.8, nDamageRand = 90  *0.4, nCostMana = 0},		--level 3 
	{nDamageBase = 131 *0.8, nDamageRand = 131 *0.4, nCostMana = 0},		--level 4 
	{nDamageBase = 172 *0.8, nDamageRand = 172 *0.4, nCostMana = 0},		--level 5 
	{nDamageBase = 236 *0.8, nDamageRand = 236 *0.4, nCostMana = 0},		--level 6 
	{nDamageBase = 282 *0.8, nDamageRand = 282 *0.4, nCostMana = 0},		--level 7 
	{nDamageBase = 327 *0.8, nDamageRand = 327 *0.4, nCostMana = 0},		--level 8 
	{nDamageBase = 373 *0.8, nDamageRand = 373 *0.4, nCostMana = 0},		--level 9 
	{nDamageBase = 418 *0.8, nDamageRand = 418 *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 464 *0.8, nDamageRand = 464 *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 509 *0.8, nDamageRand = 509 *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 555 *0.8, nDamageRand = 555 *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 600 *0.8, nDamageRand = 600 *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 650 *0.8, nDamageRand = 650 *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 981 *0.8, nDamageRand = 981 *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1010*0.8, nDamageRand = 1010*0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1039*0.8, nDamageRand = 1039*0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1069*0.8, nDamageRand = 1069*0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1098*0.8, nDamageRand = 1098*0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1127*0.8, nDamageRand = 1127*0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1157*0.8, nDamageRand = 1157*0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1186*0.8, nDamageRand = 1186*0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1256*0.8, nDamageRand = 1256*0.4, nCostMana = 0},		--level 24
	{nDamageBase = 1332*0.8, nDamageRand = 1332*0.4, nCostMana = 0},		--level 25
	{nDamageBase = 1368*0.8, nDamageRand = 1368*0.4, nCostMana = 0},		--level 26
	{nDamageBase = 1403*0.8, nDamageRand = 1403*0.4, nCostMana = 0},		--level 27
	{nDamageBase = 1439*0.8, nDamageRand = 1439*0.4, nCostMana = 0},		--level 28
	{nDamageBase = 1474*0.8, nDamageRand = 1474*0.4, nCostMana = 0},		--level 29
	{nDamageBase = 1510*0.8, nDamageRand = 1510*0.4, nCostMana = 0},		--level 30
	{nDamageBase = 1546*0.8, nDamageRand = 1546*0.4, nCostMana = 0},		--level 31
	{nDamageBase = 1581*0.8, nDamageRand = 1581*0.4, nCostMana = 0},		--level 32
	{nDamageBase = 1617*0.8, nDamageRand = 1617*0.4, nCostMana = 0},		--level 33
	{nDamageBase = 1652*0.8, nDamageRand = 1652*0.4, nCostMana = 0},		--level 34
	{nDamageBase = 1688*0.8, nDamageRand = 1688*0.4, nCostMana = 0},		--level 35
	{nDamageBase = 1723*0.8, nDamageRand = 1723*0.4, nCostMana = 0},		--level 36
	{nDamageBase = 1759*0.8, nDamageRand = 1759*0.4, nCostMana = 0},		--level 37
	{nDamageBase = 1795*0.8, nDamageRand = 1795*0.4, nCostMana = 0},		--level 38
	{nDamageBase = 1830*0.8, nDamageRand = 1830*0.4, nCostMana = 0},		--level 39
	{nDamageBase = 1866*0.8, nDamageRand = 1866*0.4, nCostMana = 0},		--level 40
	{nDamageBase = 2091 * 0.8, nDamageRand = 2091 * 0.4, nCostMana = 0},		--level 51
	{nDamageBase = 2318 * 0.8, nDamageRand = 2318 * 0.4, nCostMana = 0},		--level 52
	{nDamageBase = 2545 * 0.8, nDamageRand = 2545 * 0.4, nCostMana = 0},		--level 53
	{nDamageBase = 2773 * 0.8, nDamageRand = 2773 * 0.4, nCostMana = 0},		--level 54
	{nDamageBase = 3000 * 0.8, nDamageRand = 3000 * 0.4, nCostMana = 0},		--level 55
	{nDamageBase = 3349 * 0.8, nDamageRand = 3349 * 0.4, nCostMana = 0},		--level 56
	{nDamageBase = 3425 * 0.8, nDamageRand = 3425 * 0.4, nCostMana = 0},		--level 57
	{nDamageBase = 3500 * 0.8, nDamageRand = 3500 * 0.4, nCostMana = 0},		--level 58
	{nDamageBase = 3576 * 0.8, nDamageRand = 3576 * 0.4, nCostMana = 0},		--level 59
	{nDamageBase = 3652 * 0.8, nDamageRand = 3652 * 0.4, nCostMana = 0},		--level 60
	{nDamageBase = 3728 * 0.8, nDamageRand = 3728 * 0.4, nCostMana = 0},		--level 61
	{nDamageBase = 3804 * 0.8, nDamageRand = 3804 * 0.4, nCostMana = 0},		--level 62
	{nDamageBase = 3880 * 0.8, nDamageRand = 3880 * 0.4, nCostMana = 0},		--level 63
	{nDamageBase = 3955 * 0.8, nDamageRand = 3955 * 0.4, nCostMana = 0},		--level 64
	{nDamageBase = 4031 * 0.8, nDamageRand = 4031 * 0.4, nCostMana = 0},		--level 65
	{nDamageBase = 4107 * 0.8, nDamageRand = 4107 * 0.4, nCostMana = 0},		--level 66
	{nDamageBase = 4183 * 0.8, nDamageRand = 4183 * 0.4, nCostMana = 0},		--level 67
	{nDamageBase = 4259 * 0.8, nDamageRand = 4259 * 0.4, nCostMana = 0},		--level 68
	{nDamageBase = 4335 * 0.8, nDamageRand = 4335 * 0.4, nCostMana = 0},		--level 69
	{nDamageBase = 4410 * 0.8, nDamageRand = 4410 * 0.4, nCostMana = 0},		--level 70
	{nDamageBase = 4181 * 0.8, nDamageRand = 4181 * 0.4, nCostMana = 0},		--level 71
	{nDamageBase = 4636 * 0.8, nDamageRand = 4636 * 0.4, nCostMana = 0},		--level 72
	{nDamageBase = 5091 * 0.8, nDamageRand = 5091 * 0.4, nCostMana = 0},		--level 73
	{nDamageBase = 5545 * 0.8, nDamageRand = 5545 * 0.4, nCostMana = 0},		--level 74
	{nDamageBase = 6000 * 0.8, nDamageRand = 6000 * 0.4, nCostMana = 0},		--level 75
	{nDamageBase = 6698 * 0.8, nDamageRand = 6698 * 0.4, nCostMana = 0},		--level 76
	{nDamageBase = 6849 * 0.8, nDamageRand = 6849 * 0.4, nCostMana = 0},		--level 77
	{nDamageBase = 7001 * 0.8, nDamageRand = 7001 * 0.4, nCostMana = 0},		--level 78
	{nDamageBase = 7153 * 0.8, nDamageRand = 7153 * 0.4, nCostMana = 0},		--level 79
	{nDamageBase = 7304 * 0.8, nDamageRand = 7304 * 0.4, nCostMana = 0},		--level 80
	{nDamageBase = 7456 * 0.8, nDamageRand = 7456 * 0.4, nCostMana = 0},		--level 81
	{nDamageBase = 7608 * 0.8, nDamageRand = 7608 * 0.4, nCostMana = 0},		--level 82
	{nDamageBase = 7759 * 0.8, nDamageRand = 7759 * 0.4, nCostMana = 0},		--level 83
	{nDamageBase = 7911 * 0.8, nDamageRand = 7911 * 0.4, nCostMana = 0},		--level 84
	{nDamageBase = 8063 * 0.8, nDamageRand = 8063 * 0.4, nCostMana = 0},		--level 85
	{nDamageBase = 8214 * 0.8, nDamageRand = 8214 * 0.4, nCostMana = 0},		--level 86
	{nDamageBase = 8366 * 0.8, nDamageRand = 8366 * 0.4, nCostMana = 0},		--level 87
	{nDamageBase = 8518 * 0.8, nDamageRand = 8518 * 0.4, nCostMana = 0},		--level 88
	{nDamageBase = 8669 * 0.8, nDamageRand = 8669 * 0.4, nCostMana = 0},		--level 89
	{nDamageBase = 8821 * 0.8, nDamageRand = 8821 * 0.4, nCostMana = 0},		--level 90
	{nDamageBase = 9199 * 0.8, nDamageRand = 9199 * 0.4, nCostMana = 0},		--level 91
	{nDamageBase = 10199 * 0.8, nDamageRand = 10199 * 0.4, nCostMana = 0},		--level 92
	{nDamageBase = 11199 * 0.8, nDamageRand = 11199 * 0.4, nCostMana = 0},		--level 93
	{nDamageBase = 12200 * 0.8, nDamageRand = 12200 * 0.4, nCostMana = 0},		--level 94
	{nDamageBase = 13200 * 0.8, nDamageRand = 13200 * 0.4, nCostMana = 0},		--level 95
	{nDamageBase = 14735 * 0.8, nDamageRand = 14735 * 0.4, nCostMana = 0},		--level 96
	{nDamageBase = 15068 * 0.8, nDamageRand = 15068 * 0.4, nCostMana = 0},		--level 97
	{nDamageBase = 15402 * 0.8, nDamageRand = 15402 * 0.4, nCostMana = 0},		--level 98
	{nDamageBase = 15736 * 0.8, nDamageRand = 15736 * 0.4, nCostMana = 0},		--level 99
	{nDamageBase = 16069 * 0.8, nDamageRand = 16069 * 0.4, nCostMana = 0},		--level 100
	{nDamageBase = 16403 * 0.8, nDamageRand = 16403 * 0.4, nCostMana = 0},		--level 101
	{nDamageBase = 16737 * 0.8, nDamageRand = 16737 * 0.4, nCostMana = 0},		--level 102
	{nDamageBase = 17070 * 0.8, nDamageRand = 17070 * 0.4, nCostMana = 0},		--level 103
	{nDamageBase = 17404 * 0.8, nDamageRand = 17404 * 0.4, nCostMana = 0},		--level 104
	{nDamageBase = 17738 * 0.8, nDamageRand = 17738 * 0.4, nCostMana = 0},		--level 105
	{nDamageBase = 18071 * 0.8, nDamageRand = 18071 * 0.4, nCostMana = 0},		--level 106
	{nDamageBase = 18405 * 0.8, nDamageRand = 18405 * 0.4, nCostMana = 0},		--level 107
	{nDamageBase = 18739 * 0.8, nDamageRand = 18739 * 0.4, nCostMana = 0},		--level 108
	{nDamageBase = 19072 * 0.8, nDamageRand = 19072 * 0.4, nCostMana = 0},		--level 109
	{nDamageBase = 19406 * 0.8, nDamageRand = 19406 * 0.4, nCostMana = 0},		--level 110
	{nDamageBase = 19740 * 0.8, nDamageRand = 19740 * 0.4, nCostMana = 0},		--level 111
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);
   	----------------- 魔法属性 -------------------------------------------------

--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- 属性作用模式
--   		ATTRIBUTE_TYPE.nAttributeKey,								-- 魔法属性
--   		nAttributeValue1,											-- 属性值1
--   		nAttributeValue2											-- 属性值2
--   		);

    
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
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
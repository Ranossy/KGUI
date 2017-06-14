---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/90级奇穴/两仪附带AOE9.lua
-- 更新时间:	2013/4/19 9:38:54
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  子技能_两仪交合_10点气.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2008-07-08
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 40*2.1, 	nDamageRand = 40*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 77*2.1, 	nDamageRand = 77*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 114*2.1, 	nDamageRand = 114*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 151*2.1, 	nDamageRand = 151*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 188*2.1, 	nDamageRand = 188*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 225*2.1, 	nDamageRand = 225*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 262*2.1, 	nDamageRand = 262*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 299*2.1, 	nDamageRand = 299*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 336*2.1, 	nDamageRand = 336*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 373*2.1, 	nDamageRand = 373*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 410*2.1, 	nDamageRand = 410*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 447*2.1, 	nDamageRand = 447*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 484*2.1, 	nDamageRand = 484*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 521*2.1, 	nDamageRand = 521*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 558*2.1, 	nDamageRand = 558*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 595*2.1, 	nDamageRand = 595*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 632*2.1, 	nDamageRand = 632*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 669*2.1, 	nDamageRand = 669*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 706*2.1, 	nDamageRand = 706*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 743*2.1, 	nDamageRand = 743*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 780*2.1, 	nDamageRand = 780*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 817*2.1, 	nDamageRand = 817*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 854*2.1, 	nDamageRand = 854*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 891*2.1, 	nDamageRand = 891*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 928*2.1, 	nDamageRand = 928*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 965*2.1, 	nDamageRand = 965*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 1002*2.1, 	nDamageRand = 1002*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 1039*2.1, 	nDamageRand = 1039*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 1076*2.1, 	nDamageRand = 1076*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 1113*2.1, 	nDamageRand = 1113*2.1,  nCostMana = 91}, --level 5
	{ nDamageBase = 1150*2.1, 	nDamageRand = 1150*2.1,  nCostMana = 29}, --level 1
	{ nDamageBase = 1187*2.1, 	nDamageRand = 1187*2.1,  nCostMana = 29}, --level 2
	{ nDamageBase = 1224*2.1, 	nDamageRand = 1224*2.1,  nCostMana = 44}, --level 3
	{ nDamageBase = 1261*2.1, 	nDamageRand = 1261*2.1,  nCostMana = 73}, --level 4
	{ nDamageBase = 1298*2.1, 	nDamageRand = 1298*2.1,  nCostMana = 91}, --level 5	
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 9;
    
	----------------- 魔法属性 -------------------------------------------------
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase/ 16*0.2, -- 属性值1
		0																-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand/ 16/20, -- 属性值1
		0																-- 属性值2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0																-- 属性值2
	);


	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5649, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(3472, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						--公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 489);

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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nHeight = 6 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	skill.nRectWidth = 6 * LENGTH_BASE;         
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nChannelInterval = 126; 				-- 通道技间隔时间 
	--skill.nChannelFrame			= 8 * nSubsection;	-- 通道技持续时间，单位帧数 
	-- 这里用通道时间是为了让AP根据聚气时间来发挥效用
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
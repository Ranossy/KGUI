------------------------------------------------
-- 文件名    :  NPC_治疗_一般治疗_5.lua
-- 创建人    :  zhangqi		
-- 创建时间  :  2008-12-31
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  NPC_治疗_一般治疗_5
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 42  *0.8, nTherapyRand = 42  *0.4, nCostMana = 0},		--level 1 
	{nTherapy = 53  *0.8, nTherapyRand = 53  *0.4, nCostMana = 0},		--level 2 
	{nTherapy = 78  *0.8, nTherapyRand = 78  *0.4, nCostMana = 0},		--level 3 
	{nTherapy = 115 *0.8, nTherapyRand = 115 *0.4, nCostMana = 0},		--level 4 
	{nTherapy = 147 *0.8, nTherapyRand = 147 *0.4, nCostMana = 0},		--level 5 
	{nTherapy = 180 *0.8, nTherapyRand = 180 *0.4, nCostMana = 0},		--level 6 
	{nTherapy = 213 *0.8, nTherapyRand = 213 *0.4, nCostMana = 0},		--level 7 
	{nTherapy = 246 *0.8, nTherapyRand = 246 *0.4, nCostMana = 0},		--level 8 
	{nTherapy = 279 *0.8, nTherapyRand = 279 *0.4, nCostMana = 0},		--level 9 
	{nTherapy = 312 *0.8, nTherapyRand = 312 *0.4, nCostMana = 0},		--level 10
	{nTherapy = 345 *0.8, nTherapyRand = 345 *0.4, nCostMana = 0},		--level 11
	{nTherapy = 378 *0.8, nTherapyRand = 378 *0.4, nCostMana = 0},		--level 12
	{nTherapy = 411 *0.8, nTherapyRand = 411 *0.4, nCostMana = 0},		--level 13
	{nTherapy = 444 *0.8, nTherapyRand = 444 *0.4, nCostMana = 0},		--level 14
	{nTherapy = 477 *0.8, nTherapyRand = 477 *0.4, nCostMana = 0},		--level 15
	{nTherapy = 677 *0.8, nTherapyRand = 677 *0.4, nCostMana = 0},		--level 16
	{nTherapy = 702 *0.8, nTherapyRand = 702 *0.4, nCostMana = 0},		--level 17
	{nTherapy = 726 *0.8, nTherapyRand = 726 *0.4, nCostMana = 0},		--level 18
	{nTherapy = 750 *0.8, nTherapyRand = 750 *0.4, nCostMana = 0},		--level 19
	{nTherapy = 775 *0.8, nTherapyRand = 775 *0.4, nCostMana = 0},		--level 20
	{nTherapy = 799 *0.8, nTherapyRand = 799 *0.4, nCostMana = 0},		--level 21
	{nTherapy = 824 *0.8, nTherapyRand = 824 *0.4, nCostMana = 0},		--level 22
	{nTherapy = 848 *0.8, nTherapyRand = 848 *0.4, nCostMana = 0},		--level 23
	{nTherapy = 900 *0.8, nTherapyRand = 900 *0.4, nCostMana = 0},		--level 24
	{nTherapy = 956 *0.8, nTherapyRand = 956 *0.4, nCostMana = 0},		--level 25
	{nTherapy = 984 *0.8, nTherapyRand = 984 *0.4, nCostMana = 0},		--level 26
	{nTherapy = 1013*0.8, nTherapyRand = 1013*0.4, nCostMana = 0},		--level 27
	{nTherapy = 1042*0.8, nTherapyRand = 1042*0.4, nCostMana = 0},		--level 28
	{nTherapy = 1070*0.8, nTherapyRand = 1070*0.4, nCostMana = 0},		--level 29
	{nTherapy = 1099*0.8, nTherapyRand = 1099*0.4, nCostMana = 0},		--level 30
	{nTherapy = 1128*0.8, nTherapyRand = 1128*0.4, nCostMana = 0},		--level 31
	{nTherapy = 1156*0.8, nTherapyRand = 1156*0.4, nCostMana = 0},		--level 32
	{nTherapy = 1185*0.8, nTherapyRand = 1185*0.4, nCostMana = 0},		--level 33
	{nTherapy = 1213*0.8, nTherapyRand = 1213*0.4, nCostMana = 0},		--level 34
	{nTherapy = 1242*0.8, nTherapyRand = 1242*0.4, nCostMana = 0},		--level 35
	{nTherapy = 1271*0.8, nTherapyRand = 1271*0.4, nCostMana = 0},		--level 36
	{nTherapy = 1299*0.8, nTherapyRand = 1299*0.4, nCostMana = 0},		--level 37
	{nTherapy = 1328*0.8, nTherapyRand = 1328*0.4, nCostMana = 0},		--level 38
	{nTherapy = 1357*0.8, nTherapyRand = 1357*0.4, nCostMana = 0},		--level 39
	{nTherapy = 1385*0.8, nTherapyRand = 1385*0.4, nCostMana = 0},		--level 40
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_THERAPY,
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
	--skill.nMaxRadius		= 3 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- 吟唱帧数
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
  skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
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
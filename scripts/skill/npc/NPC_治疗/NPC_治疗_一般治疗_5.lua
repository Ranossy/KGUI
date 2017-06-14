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
	{nTherapy = 5  *0.8, nTherapyRand = 5  *0.4, nCostMana = 0},		--level 1 
	{nTherapy = 11 *0.8, nTherapyRand = 11 *0.4, nCostMana = 0},		--level 2 
	{nTherapy = 30 *0.8, nTherapyRand = 30 *0.4, nCostMana = 0},		--level 3 
	{nTherapy = 53 *0.8, nTherapyRand = 53 *0.4, nCostMana = 0},		--level 4 
	{nTherapy = 69 *0.8, nTherapyRand = 69 *0.4, nCostMana = 0},		--level 5 
	{nTherapy = 87 *0.8, nTherapyRand = 87 *0.4, nCostMana = 0},		--level 6 
	{nTherapy = 105*0.8, nTherapyRand = 105*0.4, nCostMana = 0},		--level 7 
	{nTherapy = 123*0.8, nTherapyRand = 123*0.4, nCostMana = 0},		--level 8 
	{nTherapy = 141*0.8, nTherapyRand = 141*0.4, nCostMana = 0},		--level 9 
	{nTherapy = 159*0.8, nTherapyRand = 159*0.4, nCostMana = 0},		--level 10
	{nTherapy = 177*0.8, nTherapyRand = 177*0.4, nCostMana = 0},		--level 11
	{nTherapy = 195*0.8, nTherapyRand = 195*0.4, nCostMana = 0},		--level 12
	{nTherapy = 213*0.8, nTherapyRand = 213*0.4, nCostMana = 0},		--level 13
	{nTherapy = 231*0.8, nTherapyRand = 231*0.4, nCostMana = 0},		--level 14
	{nTherapy = 249*0.8, nTherapyRand = 249*0.4, nCostMana = 0},		--level 15
	{nTherapy = 392*0.8, nTherapyRand = 392*0.4, nCostMana = 0},		--level 16
	{nTherapy = 404*0.8, nTherapyRand = 404*0.4, nCostMana = 0},		--level 17
	{nTherapy = 416*0.8, nTherapyRand = 416*0.4, nCostMana = 0},		--level 18
	{nTherapy = 427*0.8, nTherapyRand = 427*0.4, nCostMana = 0},		--level 19
	{nTherapy = 439*0.8, nTherapyRand = 439*0.4, nCostMana = 0},		--level 20
	{nTherapy = 451*0.8, nTherapyRand = 451*0.4, nCostMana = 0},		--level 21
	{nTherapy = 463*0.8, nTherapyRand = 463*0.4, nCostMana = 0},		--level 22
	{nTherapy = 474*0.8, nTherapyRand = 474*0.4, nCostMana = 0},		--level 23
	{nTherapy = 502*0.8, nTherapyRand = 502*0.4, nCostMana = 0},		--level 24
	{nTherapy = 533*0.8, nTherapyRand = 533*0.4, nCostMana = 0},		--level 25
	{nTherapy = 547*0.8, nTherapyRand = 547*0.4, nCostMana = 0},		--level 26
	{nTherapy = 561*0.8, nTherapyRand = 561*0.4, nCostMana = 0},		--level 27
	{nTherapy = 576*0.8, nTherapyRand = 576*0.4, nCostMana = 0},		--level 28
	{nTherapy = 590*0.8, nTherapyRand = 590*0.4, nCostMana = 0},		--level 29
	{nTherapy = 604*0.8, nTherapyRand = 604*0.4, nCostMana = 0},		--level 30
	{nTherapy = 618*0.8, nTherapyRand = 618*0.4, nCostMana = 0},		--level 31
	{nTherapy = 632*0.8, nTherapyRand = 632*0.4, nCostMana = 0},		--level 32
	{nTherapy = 647*0.8, nTherapyRand = 647*0.4, nCostMana = 0},		--level 33
	{nTherapy = 661*0.8, nTherapyRand = 661*0.4, nCostMana = 0},		--level 34
	{nTherapy = 675*0.8, nTherapyRand = 675*0.4, nCostMana = 0},		--level 35
	{nTherapy = 689*0.8, nTherapyRand = 689*0.4, nCostMana = 0},		--level 36
	{nTherapy = 704*0.8, nTherapyRand = 704*0.4, nCostMana = 0},		--level 37
	{nTherapy = 718*0.8, nTherapyRand = 718*0.4, nCostMana = 0},		--level 38
	{nTherapy = 732*0.8, nTherapyRand = 732*0.4, nCostMana = 0},		--level 39
	{nTherapy = 746*0.8, nTherapyRand = 746*0.4, nCostMana = 0},		--level 40
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